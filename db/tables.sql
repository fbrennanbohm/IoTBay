drop table "SHIPMENT";
drop table ACCESS_LOG;
drop table PAYMENT;
drop table PAYMENTMETHOD;
drop table ORDERITEM;
drop table "ORDER";
drop table USERCARTPRODUCTS;
drop table PRODUCT;
drop table USERS;
drop table "ROLE";

CREATE TABLE "ROLE"
    (
    "ROLEID" INT NOT NULL,
    "NAME" VARCHAR(20) NOT NULL,
    PRIMARY KEY ("ROLEID")
    );

CREATE TABLE USERS
    (
    "USERID" INT NOT NULL GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
    "ROLEID" INT NOT NULL,
    "FIRSTNAME" VARCHAR(20) NOT NULL,
    "LASTNAME" VARCHAR(20) NOT NULL,
    "EMAIL" VARCHAR(60) NOT NULL,
    "PASSWORD" VARCHAR(20) NOT NULL,
    "ADDRESS" VARCHAR(60),
    "ACTIVATED" BOOLEAN NOT NULL WITH DEFAULT TRUE,
    PRIMARY KEY ("USERID"),
    FOREIGN KEY ("ROLEID") REFERENCES ROLE(ROLEID));

CREATE TABLE ACCESS_LOG
    (
    "ID" INT NOT NULL GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
    "EMAIL" VARCHAR(60) NOT NULL,
    "LOG_IN" VARCHAR(20) NOT NULL,
     PRIMARY KEY ("ID"));

CREATE TABLE PRODUCT
    (
    "PRODUCTID" INT NOT NULL GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
    "NAME" VARCHAR(40) NOT NULL,
    "DESCRIPTION" VARCHAR(200) NOT NULL,
    "STOCKQUANTITY" INT NOT NULL,
    "PRICE" FLOAT NOT NULL,
    "IMAGEURL" VARCHAR(250) NOT NULL,
    PRIMARY KEY ("PRODUCTID")
    );

CREATE TABLE USERCARTPRODUCTS
    (
    "USERCARTPRODUCTID" INT NOT NULL GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
    "USERID" INT NOT NULL,
    "PRODUCTID" INT NOT NULL,
    "QUANTITY" INT NOT NULL,
    PRIMARY KEY (USERCARTPRODUCTID),
    FOREIGN KEY (USERID) REFERENCES USERS(USERID),
    FOREIGN KEY (PRODUCTID) REFERENCES PRODUCT(PRODUCTID)
    );

CREATE TABLE "ORDER"
    (
    "ORDERID" INT NOT NULL GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
    "USERID" INT NOT NULL,
    "ORDERNUMBER" VARCHAR(40) NOT NULL,
    "CREATEDON" DATE NOT NULL,
    "ORDERSTATUS" VARCHAR(40) NOT NULL,
    PRIMARY KEY ("ORDERID"),
    FOREIGN KEY (USERID) REFERENCES USERS(USERID)
    );

CREATE TABLE ORDERITEM
    (
    "ORDERITEMID" INT NOT NULL GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
    "ORDERID" INT NOT NULL,
    "PRODUCTID" INT NOT NULL,
    "QUANTITY" INT NOT NULL,
    "PRICEPERUNIT" FLOAT NOT NULL,
    PRIMARY KEY (ORDERITEMID),
    FOREIGN KEY (ORDERID) REFERENCES "ORDER"(ORDERID),
    FOREIGN KEY (PRODUCTID) REFERENCES PRODUCT(PRODUCTID)
    );

CREATE TABLE PAYMENTMETHOD
    (
    "PAYMENTMETHODID" INT NOT NULL GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
    "USERID" INT NOT NULL,
    "TYPE" VARCHAR(100) NOT NULL,
    "CARDNUMBER" VARCHAR(50) NOT NULL,
    "NAME" VARCHAR(200) NOT NULL,
    "VALIDUNTIL" VARCHAR(10) NOT NULL,
    "CVC" VARCHAR(10) NOT NULL,
    PRIMARY KEY (PAYMENTMETHODID),
    FOREIGN KEY (USERID) REFERENCES USERS(USERID)
    );

CREATE TABLE PAYMENT
    (
    "PAYMENTID" INT NOT NULL GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
    "ORDERID" INT NOT NULL,
    "PAYMENTMETHODID" INT NOT NULL,
    "PAIDAMOUNT" FLOAT NOT NULL,
    "DETAIL" VARCHAR(100) NOT NULL,
    PRIMARY KEY (PAYMENTID),
    FOREIGN KEY (ORDERID) REFERENCES "ORDER"(ORDERID),
    FOREIGN KEY (PAYMENTMETHODID) REFERENCES PAYMENTMETHOD(PAYMENTMETHODID)
    );

CREATE TABLE SHIPMENT
    (
    "SHIPMENTID" INT NOT NULL GENERATED ALWAYS AS IDENTITY
        (START WITH 1, INCREMENT BY 1),
    "ORDERID" INT NOT NULL,
    "SHIPMENTNUMBER" VARCHAR(40) NOT NULL,
    "USERID" INT NOT NULL,
    "PLACEDON" DATE NOT NULL,
    "METHOD" VARCHAR(20) NOT NULL,
    "ADDRESS" VARCHAR(60) NOT NULL,
    "STATUS" VARCHAR(20) NOT NULL,
    PRIMARY KEY (SHIPMENTID),
    FOREIGN KEY (ORDERID) REFERENCES "ORDER"(ORDERID),
    FOREIGN KEY (USERID) REFERENCES "USERS"(USERID)
    );
