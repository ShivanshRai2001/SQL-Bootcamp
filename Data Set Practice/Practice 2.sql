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
SELECT emp_id FROM EMPLOYEE_DETAILS
UNION 
SELECT emp_id FROM EMPLOYEE_SALARY;

-- Ques.12. Write an SQL query to fetch common records between two tables.
-- Ques.13. Write an SQL query to fetch records that are present in one table but not in another table.
-- Ques.14. Write an SQL query to fetch the EmpIds that are present in both the tables –  ‘EmployeeDetails’ and ‘EmployeeSalary.
SELECT emp_id FROM EMPLOYEE_DETAILS
WHERE emp_id IN (SELECT emp_id FROM EMPLOYEE_SALARY);

-- Ques.15. Write an SQL query to fetch the EmpIds that are present in EmployeeDetails but not in EmployeeSalary.
SELECT emp_id FROM EMPLOYEE_DETAILS
WHERE emp_id NOT IN (SELECT emp_id FROM EMPLOYEE_SALARY);

-- Ques.16. Write an SQL query to fetch the employee’s full names and replace the space with ‘-’.
SELECT REPLACE(full_name, ' ', '-') FROM EMPLOYEE_DETAILS;

-- Ques.17. Write an SQL query to fetch the position of a given character(s) in a field.
SELECT INSTR(full_name, 'Snow')
FROM EMPLOYEE_DETAILS;

-- Ques.18. Write an SQL query to display both the EmpId and ManagerId together.
SELECT emp_id, manager_id FROM EMPLOYEE_DETAILS;

SELECT CONCAT(emp_id, manager_id) as NewId FROM EMPLOYEE_DETAILS;

-- Ques.19. Write a query to fetch only the first name(string before space) from the FullName column of the EmployeeDetails table.
SELECT SUBSTRING(full_name, 1, CHARINDEX(' ', full_name)) FROM EMPLOYEE_DETAILS;

-- Ques.20. Write an SQL query to uppercase the name of the employee and lowercase the city values.
SELECT UPPER(full_name), LOWER(city) FROM EMPLOYEE_DETAILS;

-- Ques.21. Write an SQL query to find the count of the total occurrences of a particular character – ‘n’ in the FullName field.
SELECT full_name, LENGTH(full_name) - LENGTH(REPLACE(full_name, 'n', ''))
FROM EMPLOYEE_DETAILS;

-- Ques.22. Write an SQL query to update the employee names by removing leading and trailing spaces.
UPDATE EMPLOYEE_DETAILS
SET full_name = LTRIM(RTRIM(full_name));

-- Ques.23. Fetch all the employees who are not working on any project.
SELECT emp_id FROM EMPLOYEE_SALARY WHERE project IS NULL;

-- Ques.24. Write an SQL query to fetch employee names having a salary greater than or equal to 5000 and less than or equal to 10000.
SELECT full_name
FROM EMPLOYEE_DETAILS
WHERE emp_id IN 
(SELECT emp_id FROM EMPLOYEE_SALARY 
 WHERE salary BETWEEN 5000 AND 10000);
 
-- Ques.25. Write an SQL query to find the current date-time.
SELECT NOW();
SELECT GETDATE();

-- Ques.26. Write an SQL query to fetch all the Employee details from the EmployeeDetails table who joined in the Year 2020.
SELECT * FROM EMPLOYEE_DETAILS
WHERE date_of_joining BETWEEN '2020-01-01' AND '2020-12-31';

-- Ques.27. Write an SQL query to fetch all employee records from the EmployeeDetails table who have a salary record in the EmployeeSalary table.
SELECT * FROM EMPLOYEE_DETAILS E
WHERE EXISTS 
(SELECT * FROM EMPLOYEE_SALARY S
 WHERE E.emp_id = S.emp_id);

-- Ques.28. Write an SQL query to fetch the project-wise count of employees sorted by project’s count in descending order.
SELECT project, COUNT(emp_id) EMP_PROJECT_COUNT
FROM EMPLOYEE_SALARY
GROUP BY project
ORDER BY EMP_PROJECT_COUNT DESC;

-- Ques.29. Write a query to fetch employee names and salary records. Display the employee details even if the salary record is not present for the employee.
SELECT E.full_name, S.salary
FROM  EMPLOYEE_DETAILS E
LEFT JOIN
EMPLOYEE_SALARY s
ON E.emp_id = S.emp_id;

-- Ques.30. Write an SQL query to join 3 tables.
SELECT e.emp_id, e.full_name, e.manager_id, e.date_of_joining, e.city, p.EMP_ID, p.PROJECT, p.SALARY, p.VARIABLE FROM EMPLOYEE_DETAILS AS e
INNER JOIN
EMPLOYEE_SALARY as p on e.EMP_ID = p.EMP_ID;

-- Ques. 31. Write an SQL query to fetch all the Employees who are also managers from the EmployeeDetails table.
SELECT DISTINCT E.full_name
FROM EMPLOYEE_DETAILS AS E
INNER JOIN EMPLOYEE_DETAILS AS M
ON E.EMP_ID = M.MANAGER_ID;

-- Ques.32. Write an SQL query to fetch duplicate records from EmployeeDetails (without considering the primary key – EmpId).
SELECT full_name, manager_id, date_of_joining, city, COUNT(*)
FROM EMPLOYEE_DETAILS
GROUP BY full_name, manager_id, date_of_joining, city
HAVING COUNT(*) > 1;

-- Ques.33. Write an SQL query to remove duplicates from a table without using a temporary table.
DELETE E1 FROM EMPLOYEE_DETAILS E1
INNER JOIN EMPLOYEE_DETAILS E2
WHERE E1.emp_id > E2.emp_id
AND E1.full_name = E2.full_name
AND E1.manager_id = E2.manager_id
AND E1.date_of_joining = E2.date_of_joining
AND E1.city = E2.city;

-- Ques.34. Write an SQL query to fetch only odd rows from the table.
SELECT * FROM EMPLOYEE_DETAILS
WHERE MOD(emp_id, 2) <> 0;

SELECT E.emp_id, E.project, E.salary
FROM (
    SELECT *, Row_Number() OVER(ORDER BY emp_id) AS RowNumber
    FROM EMPLOYEE_SALARY
) E
WHERE E.RowNumber % 2 = 1;


-- Ques.35. Write an SQL query to fetch only even rows from the table.
SELECT * FROM EMPLOYEE_DETAILS
WHERE MOD(emp_id, 2) = 0;

SELECT E.emp_id, E.project, E.salary
FROM (
    SELECT *, Row_Number() OVER(ORDER BY emp_id) AS RowNumber
    FROM EMPLOYEE_SALARY
) E
WHERE E.RowNumber % 2 = 0;

-- Ques.36. Write an SQL query to create a new table with data and structure copied from another table.
CREATE TABLE NEW_TABLE
SELECT * FROM EMPLOYEE_SALARY;

-- Ques.37. Write an SQL query to create an empty table with the same structure as some other table.
CREATE TABLE NEW_TABLE 
SELECT * FROM EMPLOYEE_SALARY where 1=0;

-- Ques.38. Write an SQL query to fetch top n records.
SELECT *
FROM EMPLOYEE_SALARY
ORDER BY salary DESC LIMIT 2;

-- Ques.39. Write an SQL query to find the nth highest salary from a table.
SELECT emp_id, project, MAX(salary), variable FROM EMPLOYEE_SALARY;

SELECT emp_id, salary FROM EMPLOYEE_SALARY
ORDER BY salary DESC LIMIT 2-1,1;

-- Ques.40. Write SQL query to find the 3rd highest salary from a table without using the TOP/limit keyword.
SELECT emp_id, salary FROM EMPLOYEE_SALARY AS Emp1
WHERE 3-1 = (
                SELECT COUNT( DISTINCT ( Emp2.salary ) )
                FROM EMPLOYEE_SALARY AS Emp2
                WHERE Emp2.salary > Emp1.salary
            )
