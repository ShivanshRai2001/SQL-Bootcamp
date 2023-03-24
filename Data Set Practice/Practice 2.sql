-- https://artoftesting.com/sql-queries-for-interview

CREATE TABLE EMPLOYEE_DETAILS (
    EMP_ID INTEGER,
    FULL_NAME VARCHAR(255),
    MANAGER_ID INTEGER,
    DATE_OF_JOINING DATE,
    CITY VARCHAR(255)
);

INSERT INTO EMPLOYEE_DETAILS 
    (EMP_ID, FULL_NAME, MANAGER_ID, DATE_OF_JOINING, CITY) VALUES
    (121, 'John Snow', 321, 2019-01-31, 'Toronto'),
    (321, 'Walter White', 986, 2020-01-30, 'California'),
    (421, 'Kuldeep Rana', 876, 2021-11-27, 'New Delhi');

SELECT * FROM EMPLOYEE_DETAILS;

CREATE TABLE EMPLOYEE_SALARY (
    EMP_ID INTEGER,
    PROJECT VARCHAR(255),
    SALARY INTEGER,
    VARIABLE INTEGER
);

INSERT INTO EMPLOYEE_SALARY 
    (EMP_ID, PROJECT, SALARY, VARIABLE) VALUES
    (121, 'P1', 8000, 500),
    (321, 'P2', 10000, 1000),
    (421, 'P1', 12000, 0);

SELECT * FROM EMPLOYEE_SALARY;

-- Ques.1. Write an SQL query to fetch the EmpId and FullName of all the employees working under the Manager with id – ‘986’.
SELECT EMP_ID, FULL_NAME FROM EMPLOYEE_DETAILS WHERE MANAGER_ID = 986;

-- Ques.2. Write an SQL query to fetch the different projects available from the EmployeeSalary table.
SELECT DISTINCT(project) FROM EMPLOYEE_SALARY; 

-- Ques.3. Write an SQL query to fetch the count of employees working in project ‘P1’.
SELECT COUNT(*) FROM EMPLOYEE_SALARY WHERE project = 'P1';

-- Ques.4. Write an SQL query to find the maximum, minimum, and average salary of the employees.
SELECT MAX(salary), MIN(salary), AVG(salary) FROM EMPLOYEE_SALARY;

-- Ques.5. Write an SQL query to find the employee id whose salary lies in the range of 9000 and 15000.
SELECT EMP_ID, salary FROM EMPLOYEE_SALARY WHERE salary BETWEEN 9000 AND 15000;

-- Ques.6. Write an SQL query to fetch those employees who live in Toronto and work under the manager with ManagerId – 321.
SELECT emp_id, full_name, city FROM EMPLOYEE_DETAILS WHERE CITY = 'Toronto' AND manager_id = 321;

-- Ques.7. Write an SQL query to fetch all the employees who either live in California or work under a manager with ManagerId – 321.
SELECT emp_id, full_name, city FROM EMPLOYEE_DETAILS WHERE CITY = 'California' OR manager_id = 321;

-- Ques.8. Write an SQL query to fetch all those employees who work on Projects other than P1.
SELECT emp_id, project FROM EMPLOYEE_SALARY WHERE project != 'P1';
SELECT emp_id, project FROM EMPLOYEE_SALARY WHERE NOT project = 'P1';

-- Ques.9. Write an SQL query to display the total salary of each employee adding the Salary with Variable value.
SELECT emp_id, project, salary, variable, salary + variable AS TOTAL FROM EMPLOYEE_SALARY;

-- Ques.10. Write an SQL query to fetch the employees whose name begins with any two characters, followed by a text “hn” and ends with any sequence of characters.
SELECT emp_id, full_name FROM EMPLOYEE_DETAILS WHERE full_name LIKE '__hn%';

-- Ques.11. Write an SQL query to fetch all the EmpIds which are present in either of the tables – ‘EmployeeDetails’ and ‘EmployeeSalary’.







