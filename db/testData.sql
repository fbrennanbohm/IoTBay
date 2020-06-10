INSERT INTO "ROLE" (ROLEID, "NAME") VALUES
    (1, 'Customer'),
    (2, 'Staff'),
    (3, 'System Admin');

INSERT INTO USERS (roleId, firstName, lastName, email, password) VALUES
    (3, 'System', 'Admin', 'admin@iotbay.com', 'admin123'),
    (1, 'John', 'Smith', 'johnsmith@gmail.com', 'apples5678'),
    (2, 'Mary', 'Adams', 'maryadams@hotmail.com', 'banana8888'),
    (3, 'Rene', 'Cruces', 'rene.cruces@outlook.com', 'password'),
    (1, 'Ricky', 'Tran', 'rickytran@uts.edu.au', 'branch'),
    (2, 'Patrick', 'Espiritu', 'patrick.esp@uts.edu.au', 'coffee7'),
    (1, 'Mary', 'Poppins', 'mary_poppins@gmail.com', 'sugar12'),
    (3, 'Jack', 'McCreanor', 'jack.mccreanor@uts.edu.au', 'password2'),
    (2, 'Felix', 'Brennan-Bohm', 'felix.brennanbohm@uts.edu.au', 'password3'),
    (1, 'Ben', 'Duong', 'ben.duong@uts.edu.au', 'password'),
    (1, 'Jennifer', 'Smith', 'jennifer.smith@gmail.com', 'banana2'),
    (2, 'Casey', 'David', 'casey.david@gmail.com', 'password'),
    (1, 'Brendan', 'Lopez', 'brendan.l@gmail.com', 'password'),
    (2, 'Melinda', 'Stevenson', 'melinda.s@gmail.com', 'apples1'),
    (3, 'Tony', 'David', 'tony.david@gmail.com', 'daffodil'),
    (1, 'Ben', 'Jamieson', 'ben.j@gmail.com', 'orange1'),
    (2, 'Sarah', 'David', 'sarah.david@gmail.com', 'vanilla'),
    (2, 'James', 'Gates', 'james.gates@gmail.com', 'mustang'),
    (1, 'Jessica', 'Baker', 'jessica.baker@gmail.com', 'roses22'),
    (3, 'Tony', 'Stark', 'tony.stark@gmail.com', 'ironman');


INSERT INTO PRODUCT ("NAME", DESCRIPTION, STOCKQUANTITY, PRICE, IMAGEURL) VALUES
    (
        'FRDM-K64F',
        'K24, K63, K64, mbed-Enabled Development Freedom Kinetis ARM® Cortex®-M4 MCU 32-Bit Embedded Evaluation Board',
        1003,
        66.39,
        'https://i.ebayimg.com/images/g/af4AAOSwljFeHaW~/s-l1600.jpg'
    ),
    (
        'Raspberry Pi 4',
        'Raspberry Pi 4 Model B 4GB Complete Starter Pack',
        534,
        144.95,
        'https://i.ebayimg.com/images/g/XGUAAOSwr9RekBmD/s-l1600.png'
    ),
    (
        'ASRock AMD Radeon RX 570',
        'ASRock AMD Radeon RX 570 PHANTOM GAMING D 4GB Graphic Video Card GDDR5 HDMI DP',
        22,
        225.95,
        'https://i.ebayimg.com/images/g/Aq8AAOSwMNheuk0I/s-l1600.jpg'
    ),
    (
        'Crucial 16GB DDR4',
        'Crucial 16GB DDR4 2666MHz PC4-21300 260pin CL19 SODIMM Laptop Memory RAM 1.2V',
        31,
        115.00,
        'https://i.ebayimg.com/images/g/vPUAAOSwIYtdEDh2/s-l1600.jpg'
    ),
    (
        'Asus NVIDIA GeForce GT710',
        'Asus NVIDIA GeForce GT710 2GB GDDR5 Low Profile Graphics Video Card HDMI DVI',
        15,
        70.50,
        'https://i.ebayimg.com/images/g/aCgAAOSw8Sdd11ZF/s-l1600.jpg'
    ),
    (
        'Gigabyte X370 Motherboard',
        'Gigabyte Gaming Desktop PC AMD AM4 X370 Gaming K7 M.2 RGB ATX Motherboard',
        25,
        165.00,
        'https://i.ebayimg.com/images/g/A4cAAOSw09ZdCtp~/s-l1600.jpg'
    ),
    (
        'AMD 2nd Gen Ryzen 5 2600',
        'AMD 2nd Gen Ryzen 5 2600 16 MB Cache 3.4 GHz AM4 12 Thread 6 Core Desktop CPU',
        6,
        220.00,
        'https://i.ebayimg.com/images/g/EIkAAOSwrT9azW2F/s-l1600.jpg'
    ),
    (
        '800W Watt Power Supply',
        '800W Watt Power Supply PSU PFC Silent Fan ATX 24-PIN PC Computer Gaming',
        17,
        52.99,
        'https://i.ebayimg.com/images/g/jCgAAOSwH-VexjfD/s-l1600.jpg'
    ),
    (
        'HDMI to USB 2.0 Video Capture Card',
        'HDMI to USB 2.0 Video Capture Card 1080P FHD Recorder Game Video Live Streaming',
        60,
        29.97,
        'https://i.ebayimg.com/images/g/n8EAAOSwaldewmZ1/s-l1600.jpg'
    ),
    (
        'MSI MPG Z490',
        'MSI MPG Z490 GAMING PLUS ATX Motherboard LGA1200 Intel 10th Gen DDR4 RGB M.2',
        10,
        365.00,
        'https://i.ebayimg.com/images/g/DFsAAOSwnpZe0JMg/s-l1600.jpg'
    ),
    (
        'LG 24MK400H-B 24" Computer Monitor',
        'LG 24MK400H-B 24" Computer Monitor 2MS Freesync Full HD VESA HDMI VGA TN LCD',
        5,
        195.00,
        'https://i.ebayimg.com/images/g/~wEAAOSwBgZb0pLm/s-l1600.jpg'
    ),
    (
        'HP EliteDisplay E232 23"',
        'HP EliteDisplay E232 23" LED Backlights Full HD (1080p) LCD Monitor',
        2,
        120.00,
        'https://i.ebayimg.com/images/g/fdEAAOSwqjBezFlM/s-l1600.jpg'
    ),
    (
        'Samsung LC27R500FHEXXY',
        'Samsung LC27R500FHEXXY 27" FHD VA FreeSync Curved Gaming Monitor',
        11,
        286.48,
        'https://i.ebayimg.com/images/g/PZUAAOSwjm5dCY0O/s-l1600.jpg'
    ),
    (
        'Nintendo Switch',
        'Nintendo Switch Console - Neon',
        150,
        619.00,
        'https://i.ebayimg.com/images/g/eV4AAOSwadhe0EJb/s-l1600.png'
    ),
    (
        'Norton Anti-Virus',
        'Norton Internet Security Standard 2020 1 device 1 Year ',
        200,
        15.99,
        'https://i.ebayimg.com/images/g/8WgAAOSwb9BaxL~h/s-l1600.jpg'
    ),
    (
        'Electrical Wire Terminal Kit',
        'Electrical Wire Terminal Kit Cutter Stripper Plier Crimper + 260PCS Connectors',
        50,
        19.99,
        'https://i.ebayimg.com/images/g/THEAAOSwUvBepn-7/s-l1600.jpg'
    ),
    (
        'HP 245 G7 Laptop',
        'Brand New HP 245 G7 Laptop 14in A4-9125 8GB RAM 256GB SSD Win10',
        4,
        647.00,
        'https://i.ebayimg.com/images/g/qoIAAOSwMUtdTlAB/s-l1600.png'
    ),
    (
        'SnowBook Laptop Notebook',
        '11.6" SnowBook Laptop Notebook Intel Atom Quad-Core 4GB/64GB Windows 10',
        16,
        229.00,
        'https://i.ebayimg.com/images/g/1ewAAOSwhttc3OjM/s-l1600.jpg'
    ),
    (
        'Lenovo Legion Y7000',
        'Lenovo Legion Y7000 (15)-Intel Core i7-9750H 16GB RAM 512GB SSD GTX 1660Ti Black',
        2,
        1999.00,
        'https://i.ebayimg.com/images/g/uWUAAOSwvfRd9BoL/s-l1600.png'
    ),
    (
        'HP ProBook 430',
        'HP ProBook 430 G7 13.3" FHD Core i5 10210U 256GB 8GB IR-CAM Win 10 Pro Laptop',
        26,
        398.99,
        'https://i.ebayimg.com/images/g/XGUAAOSwr9RekBmD/s-l1600.png'
    ),
    (
        'TP-Link TL-WR940N',
        'TP-Link TL-WR940N 450Mbps Wireless Router WPS WIFI Range Extender Access Point',
        879,
        43.50,
        'https://i.ebayimg.com/images/g/pb0AAOSw1nVd0ef7/s-l1600.jpg'
    );

INSERT INTO "ORDER" ("USERID", "ORDERNUMBER", "CREATEDON", "ORDERSTATUS")
(SELECT U.USERID, '00001', '2020-06-05', 'Unpaid'
FROM USERS U
JOIN PRODUCT P ON P.PRODUCTID = P.PRODUCTID);

UPDATE "ORDER" SET "ORDERNUMBER" = '0000' || CAST(CAST("ORDERID" AS CHAR(10)) AS VARCHAR(10));

UPDATE "ORDER" SET "ORDERNUMBER" = SUBSTR("ORDERNUMBER", CAST((LOG10(ORDERID) + 1) AS INT), 5);

INSERT INTO "ORDERITEM" ("ORDERID", "PRODUCTID", "QUANTITY", "PRICEPERUNIT")
(SELECT O.ORDERID, P.PRODUCTID, P.PRODUCTID, P.PRICE
FROM PRODUCT P
JOIN "ORDER" O ON O.ORDERID = O.ORDERID
LEFT JOIN "ORDERITEM" OI ON OI.ORDERID = O.ORDERID AND OI.PRODUCTID = P.PRODUCTID
WHERE OI.ORDERITEMID IS NULL);

INSERT INTO "SHIPMENT" ("ORDERID", "SHIPMENTNUMBER", "USERID", "PLACEDON", "METHOD", "ADDRESS", "STATUS")
(SELECT O.ORDERID, O.ORDERNUMBER, O.USERID, '2020-06-05', 'EXPRESS', '123 TEST', 'DELIVERED'
FROM "ORDER" O
LEFT JOIN "SHIPMENT" S ON S.ORDERID = O.ORDERID
WHERE S. SHIPMENTID IS NULL);

INSERT INTO "PAYMENTMETHOD" ("USERID", "TYPE", "CARDNUMBER", "NAME", "VALIDUNTIL", "CVC")
(SELECT U.USERID, 'Visa', '1234567890123456', U. FIRSTNAME || ' ' || U.LASTNAME, '2023-06-01', '123'
FROM USERS U
LEFT JOIN "PAYMENTMETHOD" P ON P.USERID = U.USERID
WHERE P.PAYMENTMETHODID IS NULL);

INSERT INTO "USERCARTPRODUCTS" ("USERID", "PRODUCTID", "QUANTITY")
(SELECT U.USERID, P.PRODUCTID, 3
FROM USERS U
LEFT JOIN "USERCARTPRODUCTS" UCP ON UCP.USERID = U.USERID
JOIN "PRODUCT" P ON P.NAME = 'FRDM-K64F'
WHERE U.EMAIL = 'rene.cruces@outlook.com' AND UCP.USERCARTPRODUCTID IS NULL);
