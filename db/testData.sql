INSERT INTO "ROLE" (ROLEID, "NAME") VALUES 
    (1, 'Customer'),
    (2, 'Staff'),
    (3, 'System Admin');

INSERT INTO USERS (roleId, firstName, lastName, email, password) VALUES
    (3, 'System', 'Admin', 'admin@iotbay.com', 'admin123'),
    (1, 'John', 'Smith', 'johnsmith@gmail.com', 'apples5678'),
    (2, 'Mary', 'Adams', 'maryadams@hotmail.com', 'banana8888');


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
        'TP-Link TL-WR940N',
        'TP-Link TL-WR940N 450Mbps Wireless Router WPS WIFI Range Extender Access Point',
        879,
        43.50,
        'https://i.ebayimg.com/images/g/pb0AAOSw1nVd0ef7/s-l1600.jpg'
    );