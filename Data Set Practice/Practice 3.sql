-- https://tutorial.techaltum.com/sql-queries-for-practice.html

CREATE TABLE EMPLOYEE (
	EMP_ID INTEGER PRIMARY KEY,
	EMP_NAME VARCHAR(255),
	DEPARTMENT VARCHAR(255),
	CONTACT_NO INTEGER,
	EMAIL_ID VARCHAR(255),
	EMP_HEAD_ID INTEGER
);

INSERT INTO EMPLOYEE
	(EMP_ID, EMP_NAME, DEPARTMENT, CONTACT_NO, EMAIL_ID, EMP_HEAD_ID) VALUES
	(101, 'Isha', 'E - 101', 1234567890, 'isha@gmail.com', 105),
	(102, 'Priya', 'E - 102', 1234567890, 'priya@gmail.com', 103),
	(103, 'Neha', 'E - 103', 1234567890, 'neha@gmail.com', 101),
	(104, 'Rahul', 'E - 104', 1234567890, 'rahul@gmail.com', 105),
	(105, 'Abhishek', 'E - 105', 1234567890, 'abhishek@gmail.com', 102);

SELECT * FROM EMPLOYEE;

CREATE TABLE EMPLOYEE_DEPT (
	DEPT_ID VARCHAR(255),
	DEPT_NAME VARCHAR(255),
	DEPT_OFF VARCHAR(255),
	DEPT_HEAD INTEGER
);

INSERT INTO EMPLOYEE_DEPT
	(DEPT_ID, DEPT_NAME, DEPT_OFF, DEPT_HEAD) VALUES
	('E - 101', 'HR', 'Monday', 105),
	('E - 102', 'Development', 'Tuesday', 101),
	('E - 103', 'House Keeping', 'Saturday', 103),
	('E - 104', 'Sales', 'Sunday', 104),
	('E - 105', 'Purchage', 'Tuesday', 104);

SELECT * FROM EMPLOYEE_DEPT;

CREATE TABLE 
