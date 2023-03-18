CREATE DATABASE HOUSE;
USE HOUSE;

CREATE TABLE Customer (
    ID integer PRIMARY KEY,
    CUST_NAME VARCHAR(255),
    ADDRESS VARCHAR(255),
    GENDER CHAR(2),
    CITY VARCHAR(255),
    PINCODE integer
);

-- INSERT
-- Ways to insert the data
-- First way
INSERT INTO Customer (ID, CUST_NAME, ADDRESS, GENDER, CITY, PINCODE)
VALUES  (1251, 'Ram Kumar', 'Dilbagh Nagar', 'M', 'Jalandhar', 144002),
        (1300, 'Shayam Singh', 'Ludhiana H.O', 'M', 'Ludhiana', 141001),
        (245, 'Neelabh Shukla', 'Ashok Nagar', 'M', 'Jalandhar', 144003),
        (210, 'Barkha Singh', 'Dilbagh Nagar', 'F', 'Jalandhar', 144002),
        (500, 'Rohan Arora', 'Ludhiana H.O', 'M', 'Ludhiana', 141001);

-- Second Way
INSERT INTO Customer
VALUES  (1252, 'Ram Kumar3', 'Dilbagh Nagar', 'M', 'Jalandhar', NULL);

-- It will fill only selected values and remaning will be null
INSERT INTO Customer(ID, CUST_NAME)
VALUES (121, 'Bob');

-- UPDATE
UPDATE Customer SET ADDRESS = 'Mumbai', GENDER = 'M' WHERE ID = 121;
-- Update Multiple Rows
SET SQL_SAFE_UPDATES = 0; -- after wards make it as a 1
UPDATE Customer SET PINCODE = 110000; -- By default SQL will block this as it will think it as a virus

-- DELETE 
DELETE FROM Customer WHERE id = 121;
-- Delete table
DELETE FROM Customer;

CREATE TABLE Order_Details (
    ORDER_ID integer PRIMARY KEY,
    DELIVERY_DATE DATE,
    CUST_ID INT,
    FOREIGN KEY(CUST_ID) REFERENCE Customer(id) -- Foreign key is defined over here
    FOREIGN KEY(CUST_ID) REFERENCE Customer(id) ON DELETE CASCADE   -- This will delete the whole thing related to it
    FOREIGN KEY(CUST_ID) REFERENCE Customer(id) ON DELETE SET NULL  -- If parent is deleted the it will set null value
);

INSERT INTO Order_Details
VALUES (1, '2019-03-11', 245);

DELETE FROM Customer WHERE ID = 245;    -- This will delete the data from customer table and not from order details

DROP TABLE Order_Details;   -- This will delete the table 
