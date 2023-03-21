CREATE DATABASE HOUSE;
USE HOUSE;

CREATE TABLE Customer (
    ID integer PRIMARY KEY, -- Primary key is defined ower here
    CUST_NAME VARCHAR(255) UNIQUE,  -- Unique is used to have unique value
    ADDRESS VARCHAR(255),
    GENDER CHAR(2),
    CITY VARCHAR(255),
    PINCODE integer
    BALANCE INT
    CONSTRAINT ACC_BALANCE_CHK CHECK(BALANCE > 1000)
    ORDER_NO INT NOT NULL DEFAULT 1;
);

INSERT INTO Customer (ID, CUST_NAME, ADDRESS, GENDER, CITY, PINCODE, BALANCE, ORDER_NO)
VALUES  (1251, 'Ram Kumar', 'Dilbagh Nagar', 'M', 'Jalandhar', 144002, 10000),  -- Here it will take default value as 1 for not providing order no
        (1300, 'Shayam Singh', 'Ludhiana H.O', 'M', 'Ludhiana', 141001, 20000),
        (245, 'Neelabh Shukla', 'Ashok Nagar', 'M', 'Jalandhar', 144003, 45000),
        (210, 'Barkha Singh', 'Dilbagh Nagar', 'F', 'Jalandhar', 144002, 20130),
        (500, 'Rohan Arora', 'Ludhiana H.O', 'M', 'Ludhiana', 141001, 50000);

INSERT INTO Customer
VALUES  (1252, 'Ram Kumar3', 'Dilbagh Nagar', 'M', 'Jalandhar', NULL, 50000);   -- It has to be unique name
        (1252, 'Satyam Singh', 'Dilbagh Nagar', 'M', 'Jalandhar', 144003, 100); -- This condition is not possible as per check condition

CREATE TABLE Order_Details (
    ORDER_ID integer PRIMARY KEY,
    DELIVERY_DATE DATE,
    CUST_ID INT,
    FOREIGN KEY(CUST_ID) REFERENCES Customer(id) -- Foreign key is defined over here
);

INSERT INTO Order_Details
VALUES (1, '2019-03-11', 245);

DELETE FFROM Customer WHERE ID = 245;

DROP TABLE Order_Details;   -- This will delete the table 
