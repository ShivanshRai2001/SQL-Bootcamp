CREATE DATABASE temp;

USE temp;

CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

INSERT INTO student VALUES(1, 'Ankit');

SELECT * FROM student; -- See the entire table
