CREATE TABLE EMPLOYEE (
    E_ID INTEGER,
    F_NAME VARCHAR(255),
    L_NAME VARCHAR(255),
    AGE INTEGER,
    EMAIL_ID VARCHAR(255),
    PHONE_NO INTEGER,
    CITY VARCHAR(255),
    FOREIGN KEY (E_ID) REFERENCES PROJECT (ID)
);

INSERT INTO EMPLOYEE
    (E_ID, F_NAME, L_NAME, AGE, EMAIL_ID, PHONE_NO, CITY) VALUES
    (1, 'Aman', 'Proto', 32, 'aman@gmail.com', 898, 'Delhi'),
    (2, 'Yagya', 'Narayan', 44, 'yagya@gmail.com', 222, 'Palam'),
    (3, 'Rahul', 'BD', 22, 'rahul@gmail.com', 444, 'Kolkata'),
    (4, 'Jatin', 'Hermit', 31, 'jatin@gmail.com', 666, 'Raipur'),
    (5, 'PK', 'Pandey', 21, 'pk@gmail.com', 555, 'Jaipur');

-- VIEW
SELECT * FROM EMPLOYEE;

-- Creating a view
CREATE VIEW CUSTOM_VIEW AS SELECT F_NAME, AGE FROM EMPLOYEE;

-- Viewing from view
SELECT * FROM CUSTOM_VIEW;

-- Altering the view
ALTER VIEW CUSTOM_VIEW AS SELECT F_NAME, L_NAME, AGE FROM EMPLOYEE;

-- Droping the view
DROP VIEW IF EXISTS CUSTOM_VIEW;
