-- https://www.edureka.co/blog/interview-questions/sql-query-interview-questions

CREATE TABLE EMPLOYEE_INFO (
    EMP_ID INTEGER,
	EMP_FNAME VARCHAR(255),
	EMP_LNAME VARCHAR(255),
	DEPARTMENT VARCHAR(255),
	PROJECT VARCHAR(255),
	EMP_ADDRESS VARCHAR(255),
	DOB DATETIME,
	GENDER CHAR
);

INSERT INTO EMPLOYEE_INFO
	(EMP_ID, EMP_FNAME, EMP_LNAME, DEPARTMENT, PROJECT, EMP_ADDRESS, DOB, GENDER) VALUES
	(1, 'Sanjay', 'Mehra', 'HR', 'P1', 'Hydrabad (HYD)', '01/12/1976', 'M'),
	(2, 'Ananya', 'Mishra', 'Admin', 'P2', 'Delhi (DEL)', '02/05/1968', 'F'),
	(3, 'Rohan', 'Diwan', '	Account', 'P3', 'Mumbai (BOM)', '01/01/1980', 'M'),
	(4, 'Sonia', 'Kulkarni', 'HR', 'P1', 'Hydrabad (HYD)', '02/05/1992', 'F'),
	(5, 'Ankit', 'Kapoor', 'Admin', 'P2', 'Delhi (DEL)', '03/07/1994', 'M');

SELECT * FROM EMPLOYEE_INFO;

CREATE TABLE EMPLOYEE_POSITION (
	EMP_ID INTEGER,
	EMP_POSITION VARCHAR(255),
	DATE_OF_JOINING DATETIME,
	SALARY INTEGER
);

INSERT INTO EMPLOYEE_POSITION
	(EMP_ID, EMP_POSITION, DATE_OF_JOINING, SALARY) VALUES
	(1, 'Manager', '01/05/2022', 500000),
	(2, 'Executive', '02/05/2022', 75000),
	(3, 'Manager', '01/05/2022', 90000),
	(2, 'Lead', '02/05/2022', 85000),
	(1, 'Executive', '01/05/2022', 300000);

SELECT * FROM EMPLOYEE_POSITION;

-- Q1. Write a query to fetch the EmpFname from the EmployeeInfo table in upper case and use the ALIAS name as EmpNam
SELECT UPPER(emp_fname) AS EMP_NAME FROM EMPLOYEE_INFO;

-- Q2. Write a query to fetch the number of employees working in the department ‘HR’.
SELECT COUNT(*) FROM EMPLOYEE_INFO WHERE department = 'HR';

-- Q4. Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.
SELECT SUBSTRING(emp_lname, 1, 4) FROM EMPLOYEE_INFO;

-- Q5. Write a query to fetch only the place name(string before brackets) from the Address column of EmployeeInfo table.
SELECT MID(emp_address, 0, LOCATE('(',emp_address)) FROM EMPLOYEE_INFO;

SELECT SUBSTRING(emp_address, 0, CHARINDEX('(', emp_address)) FROM EMPLOYEE_INFO;

-- Q6. Write a query to create a new table which consists of data and structure copied from the other table.
SELECT * INTO NewTable FROM EMPLOYEE_INFO WHERE 1 = 0;

CREATE TABLE NewTable AS SELECT * FROM EMPLOYEE_INFO;
SELECT * FROM NewTable;

-- Q7. Write q query to find all the employees whose salary is between 50000 to 100000.
SELECT * FROM EMPLOYEE_POSITION
WHERE salary BETWEEN 50000 AND 100000;

-- Q8. Write a query to find the names of employees that begin with ‘S’
SELECT * FROM EMPLOYEE_INFO
WHERE emp_fname LIKE 'S%';

-- Q9. Write a query to fetch top N records.
SELECT * FROM EMPLOYEE_POSITION ORDER BY salary DESC LIMIT 4;

-- Q10. Write a query to retrieve the EmpFname and EmpLname in a single column as “FullName”. The first name and the last name must be separated with space.
SELECT CONCAT(emp_fname, ' ', emp_lname) AS 'FullName' FROM EMPLOYEE_INFO;

-- Q11. Write a query find number of employees whose DOB is between 02/05/1970 to 31/12/1975 and are grouped according to gender
SELECT COUNT(*), gender FROM EMPLOYEE_INFO WHERE dob BETWEEN 02/05/1970 AND 31/12/1975 GROUP BY gender;

-- Q12. Write a query to fetch all the records from the EmployeeInfo table ordered by EmpLname in descending order and Department in the ascending order.
SELECT * FROM EMPLOYEE_INFO ORDER BY emp_fname DESC, department ASC;

-- Q13. Write a query to fetch details of employees whose EmpLname ends with an alphabet ‘A’ and contains five alphabets.
SELECT * FROM EMPLOYEE_INFO WHERE emp_lname LIKE '____a';

-- Q14. Write a query to fetch details of all employees excluding the employees with first names, “Sanjay” and “Sonia” from the EmployeeInfo table.
SELECT * FROM EMPLOYEE_INFO WHERE emp_fname NOT IN ('Sanjay', 'Sonia');

-- Q15. Write a query to fetch details of employees with the address as “DELHI(DEL)”.
SELECT * FROM EMPLOYEE_INFO WHERE emp_address LIKE 'Delhi (DEL)';

-- Q16. Write a query to fetch all employees who also hold the managerial position.
SELECT E.emp_fname, E.emp_lname, P.emp_position
FROM EMPLOYEE_INFO AS E
INNER JOIN
EMPLOYEE_POSITION AS P
ON E.emp_id = P.EMP_ID AND P.EMP_POSITION in ('Manager');

-- Q17. Write a query to fetch the department-wise count of employees sorted by department’s count in ascending order.
SELECT department, COUNT(emp_id) AS EMP_DEPT_COUNT
FROM EMPLOYEE_INFO GROUP BY department
ORDER BY EMP_DEPT_COUNT ASC;

-- Q18. Write a query to calculate the even and odd records from a table.





















