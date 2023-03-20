CREATE DATABASE ORG;    -- A database is created named as ORG
SHOW DATABASE;  -- Show all the databases available
USE ORG;    -- use this specific database

-- Creating the table of worker
CREATE TABLE Worker (
    WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT(15),
    JOINING_DATE DATETIME,
    DEPARTMENT SHAR(25),
);

-- Inserting the value inside the worker table
INSERT INTO Worker
    (WORKER_ID, FIRST_NAME, LAST_NAME, JOINING_DATE, DEPARTMENT) VALUES
    (001, 'Monika', 'Arora', 100000, '14-02-20 09.00.00', 'HR'),
    (002, 'Nikharika', 'Verma', 80000, '14-06-11 09.00.00', 'Admin'),
    (003, 'Vishal', 'Singhal', 300000, '14-02-20 09.00.00', 'HR'),
    (004, 'Amitabh', 'Singh', 500000, '14-02-20 09.00.00', 'Admin'),
    (005, 'Vivek', 'Bhati', 500000, '14-06-11 09.00.00', 'Admin'),
    (006, 'Vishal', 'Diwan', 200000, '14-06-11 09.00.00', 'Account'),
    (007, 'Satish', 'Kumar', 75000, '14-01-20 09.00.00', 'Account'),
    (008, 'Geetika', 'Chauhan', 90000, '14-04-11 09.00.00', 'Admin'),
    (009, 'Ronak', 'Patel', NULL, '14-04-11 09.00.00', 'Employee');

SELECT * FROM Worker;   -- Show all the thing in table above
SELECT FIRST_NAME, SALARY FROM Worker;   -- Shows the selected things in the table above

-- DUAL Table
SELECT 44 + 11  -- It will give 55 but in a dummy table this show that select can be used without from
SELECT now();   -- Gives the server time

-- WHERE reduces rows based on given condition
SELECT * FROM Worker WHERE SALARY > 80000;
SELECT * FROM Worker WHERE DEPARTMENT = 'HR';

-- BETWEEN to give result in a range
SELECT * FROM Worker WHERE SALARY BETWEEN 80000 AND 300000;

-- IN reduce or condition
SELECT * FROM Worker WHERE DEPARTMENT = 'HR' OR DEPARTMENT = 'Admin';
SELECT * FROM Worker WHERE DEPARTMENT IN('HR', 'Admin');    -- Better to use
SELECT * FROM Worker WHERE DEPARTMENT NOT IN('HR', 'Admin');    -- accept this it will give

-- NULL it will give the null value
SELECT * FROM Worker WHERE SALARY is NULL;

-- Pattern Searching / Wildcard
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%i%';
SELECT * FROM Worker WHERE FIRST_NAME LIKE '_i%';   -- i should be at second position

-- Sorting using ORDER BY
SELECT * FROM Worker ORDER BY SALARY;
SELECT * FROM Worker ORDER BY SALARY DESC;  -- To get answer in descending order

-- Distinct Value
SELECT DISTINCT DEPARTMENT FROM Worker; -- It will gives only types of department

-- Data Grouping
SELECT DEPARTMENT FROM Worker GROUP BY DEPARTMENT;  -- It will work as default Distinct value
SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM Worker GROUP BY DEPARTMENT;    -- Agregation is needed (It will give each department count)
-- Avg Salary per department
SELECT DEPARTMENT, AVG(SALARY) FROM Worker GROUP BY DEPARTMENT;
-- MIN salary per department
SELECT DEPARTMENT, MIN(SALARY) FROM Worker GROUP BY DEPARTMENT;
-- MAX salary per department
SELECT DEPARTMENT, MAX(SALARY) FROM Worker GROUP BY DEPARTMENT;
-- Total per department
SELECT DEPARTMENT, SUM(SALARY) FROM Worker GROUP BY DEPARTMENT;

-- GROUP BY using HAVING it will work as a condition
SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM Worker GROUP BY DEPARTMENT HAVING COUNT(DEPARTMENT) > 2;

-- This is to create another table of bonus provided with FOREIGN KEY
CREATE TABLE Bonus (
    WORKER_REF_ID INT,
    BONUS_AMOUNT INT(10),
    BOUNUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
        REFERENCE Worker(WORKER_ID)
        ON DELETE CASCADE
);

-- Inserting values in the bonus table
INSERT INTO Bonus
    (WORKER_REF_ID, BONUS_AMOUNT, BOUNUS_DATE) VALUES 
        (001, 5000, '16-02-20'),
        (002, 3000, '16-06-11'),
        (003, 4000, '16-02-20'),
        (001, 4500, '16-02-20'),
        (002, 3500, '16-06-11');

-- This is to create another table of bonus provided with FOREGIN KEY
CREATE TABLE Title (
    WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID)
        REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

-- Inserting values in the title table
INSERT INTO Title
    (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES 
        (001, 'Manager', '2016-02-20 00:00:00'),
        (002, 'Executive', '2016-06-11 00:00:00'),
        (008, 'Executive', '2016-06-11 00:00:00'),
        (005, 'Manager', '2016-06-11 00:00:00'),
        (004, 'Asst. Manager', '2016-06-11 00:00:00'),
        (007, 'Executive', '2016-06-11 00:00:00'),
        (006, 'Lead', '2016-06-11 00:00:00'),
        (003, 'Lead', '2016-06-11 00:00:00');
