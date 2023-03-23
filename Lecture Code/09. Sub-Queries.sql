CREATE TABLE PROJECT (
    ID INTEGER PRIMARY KEY,
    EMP_ID INTEGER,
    EMP_NAME VARCHAR(255),
    STARTDATE DATETIME,
    CLIENT_ID INTEGER
);

INSERT INTO PROJECT
    (ID, EMP_ID, EMP_NAME, STARTDATE, CLIENT_ID) VALUES
    (1, 1, 'A', 2021-04-21, 3),
    (2, 2, 'B', 2021-03-12, 1),
    (3, 3, 'C', 2021-01-16, 5),
    (4, 3, 'D', 2021-04-27, 2),
    (5, 5, 'E', 2021-05-01, 4);

SELECT * FROM PROJECT;

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

SELECT * FROM EMPLOYEE;

CREATE TABLE CLIENT (
    C_ID INTEGER,
    FIRST_NAME VARCHAR(255),
    LAST_NAME VARCHAR(255),
    AGE INTEGER,
    EMAIL_ID VARCHAR(255),
    PHONE_NO INTEGER,
    CITY VARCHAR(255),
    EMP_ID INTEGER,
    FOREIGN KEY (C_ID) REFERENCES PROJECT (ID)
);

INSERT INTO CLIENT
    (C_ID, FIRST_NAME, LAST_NAME, AGE, EMAIL_ID, PHONE_NO, CITY, EMP_ID) VALUES
    (1, 'Mac', 'Rogers', 47, 'mac@gmail.com', 333, 'Kolkata', 3),
    (2, 'Max', 'Poirier', 27, 'max@gmail.com', 222, 'Kolkata', 3),
    (3, 'Peter', 'Jain', 24, 'peter@gmail.com', 111, 'Delhi', 1),
    (4, 'Sushant', 'Aggarwal', 23, 'sushant@gmail.com', 45454, 'Hyderabad', 5),
    (5, 'Pratap', 'Singh', 36, 'pratap@gmail.com', 77767, 'Mumbai', 2);
    
SELECT * FROM CLIENT;

-- SUB QUIERIES
-- WHERE Clause same table
-- Employees with age > 30
SELECT * FROM EMPLOYEE WHERE AGE IN (SELECT AGE FROM EMPLOYEE WHERE AGE > 30);
SELECT * FROM EMPLOYEE WHERE AGE > 30   -- In simple form it can be written as

-- WHERE Clause different table
-- EMP Details working in more than 1 project 
SELECT * FROM EMPLOYEE WHERE E_ID IN (
    SELECT EMP_ID FROM PROJECT GROUP BY EMP_ID HAVING COUNT(EMP_ID) > 1
);

-- Single Value subquery
-- emp details having age > avg(age)
SELECT * FROM EMPLOYEE WHERE AGE > (SELECT AVG(AGE) FROM EMPLOYEE);

-- FROM Clause - derived table
-- Select max age person whose first name has 'a'
SELECT MAX(AGE) FROM (SELECT * FROM EMPLOYEE WHERE F_NAME LIKE '%a%') AS TEMP;

-- Corelated Subqueries
-- Find 3rd oldest employee
SELECT * FROM EMPLOYEE AS E1
WHERE 3 = (
    SELECT COUNT(E2.AGE)
    FROM EMPLOYEE AS E2
    WHERE E2.AGE >= E1.AGE
);
