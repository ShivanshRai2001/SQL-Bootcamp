CREATE DATABASE DEPATMENT;
USE DEPATMENT;

CREATE TABLE DEPT_1 (
    EMP_ID INTEGER,
    EMP_NAME VARCHAR(255),
    EMP_ROLE VARCHAR(255)
);

INSERT INTO DEPT_1
    (EMP_ID, EMP_NAME, EMP_ROLE) VALUES
    (1, 'A', 'Engineer'),
    (2, 'B', 'Salesman'),
    (3, 'C', 'Manager'),
    (4, 'D', 'Salesman'),
    (5, 'E', 'Engineer');

SELECT * FROM DEPT_1;

CREATE TABLE DEPT_2 (
    EMP_ID INTEGER,
    EMP_NAME VARCHAR(255),
    EMP_ROLE VARCHAR(255)
);

INSERT INTO DEPT_2
    (EMP_ID, EMP_NAME, EMP_ROLE) VALUES
    (3, 'C', 'Manager'),
    (6, 'F', 'Marketing'),
    (7, 'G', 'Salesman');

SELECT * FROM DEPT_2;

-- SET OPERATIONS
-- List out all the employees in the company
SELECT * FROM DEPT_1
UNION
SELECT * FROM DEPT_2;

-- List out all the employess in all departments who work as salesman
SELECT * FROM DEPT_1 WHERE EMP_ROLE = 'Salesman'
UNION
SELECT * FROM DEPT_2 WHERE EMP_ROLE = 'Salesman'

-- Intersect
-- List out all the employess who work in all the departments
SELECT * FROM DEPT_1 INNER JOIN DEPT_2 USING (EMP_ID);  -- this will increase the columns
SELECT DEPT_1.* FROM DEPT_1 INNER JOIN DEPT_2 USING (EMP_ID);

-- Minus operator
-- List out all the employess working in DEPT_1 but not in DEPT_2
SELECT DEPT_1.* FROM DEPT_1 LEFT JOIN DEPT_2 USING (EMP_ID)
WHERE DEPT_2.EMP_ID is null;
