CREATE DATABASE OFFICE;
USE OFFICE;

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
    (ID, FIRST_NAME, LAST_NAME, AGE, EMAIL_ID, PHONE_NO, CITY, EMP_ID) VALUES
    (1, 'Mac', 'Rogers', 47, 'mac@gmail.com', 333, 'Kolkata', 3),
    (2, 'Max', 'Poirier', 27, 'max@gmail.com', 222, 'Kolkata', 3),
    (3, 'Peter', 'Jain', 24, 'peter@gmail.com', 111, 'Delhi', 1),
    (4, 'Sushant', 'Aggarwal', 23, 'sushant@gmail.com', 45454, 'Hyderabad', 5),
    (5, 'Pratap', 'Singh', 36, 'pratap@gmail.com', 77767, 'Mumbai', 2);

-- INNER JION
-- Enlist all the employees ID's, name along with the project allocated to them
SELECT e.E_ID, e.F_NAME, e.L_NAME, p.ID, p.EMP_NAME FROM EMPLOYEE as e
INNER JOIN PROJECT as p ON e.E_ID = p.EMP_ID;

-- Fetch out all the employee ID's and their contact detail who have been working
-- from jaipur with the clients name working in hydrabad
SELECT e.E_ID, e.EMAIL_ID, e.PHONE_NO, c.FIRST_NAME, c.LAST_NAME FROM EMPLOYEE as e
INNER JOIN CLIENT as c ON e.E_ID = c.EMP_ID WHERE e.CITY = 'Jaipur' AND c.CITY = 'Hyderabad';

-- LEFT JOIN
-- Fetch out each project allocated to each employss.
SELECT * FROM EMPLOYEE as e
LEFT JOIN PROJECT as p ON e.E_ID = p.EMP_ID;

-- RIGHT JOIN
-- List out all the projects along with the employee's name and their respective allocated email ID
SELECT p.ID, p.EMP_NAME, e.F_NAME, e.L_NAME, e.EMAIL_ID FROM EMPLOYEE as e
RIGHT JOIN PROJECT as p
ON e.E_ID = p.EMP_ID;

-- CROSS JOIN
-- List out all the combinations possible for the employss's name and projects that can exist.
SELECT e.F_NAME, e.L_NAME, p.ID, p.EMP_NAME FROM EMPLOYEE as e
CROSS JOIN PROJECT as p;

-- We can join without using join keyword
SELECT e.E_ID, e.F_NAME, e.L_NAME, p.ID, p.EMP_NAME FROM EMPLOYEE as e,
PROJECT as p WHERE e.E_ID = p.EMP_ID;
