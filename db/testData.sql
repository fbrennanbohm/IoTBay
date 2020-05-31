INSERT INTO "ROLE" (ROLEID, "NAME") VALUES 
    (1, 'Customer'),
    (2, 'Staff'),
    (3, 'System Admin');

INSERT INTO USERS (roleId, firstName, lastName, email, password) VALUES
    (3, 'System', 'Admin', 'admin@iotbay.com', 'admin123'),
    (1, 'John', 'Smith', 'johnsmith@gmail.com', 'apples5678'),
    (2, 'Mary', 'Adams', 'maryadams@hotmail.com', 'banana8888');