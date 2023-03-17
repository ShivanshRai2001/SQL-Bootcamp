CREATE DATABASE temp;
CREATE DATABASE IF NOT EXISTS temp; -- this is the best practice to write

USE temp; -- need to execute to choose on which DB CREATE TABLE etc commands will be executed.
-- make switching between DBs possible

CREATE TABLE student ( -- puting content inside the database
    id INT PRIMARY KEY,
    name VARCHAR(255)
);

SHOW DATABASE; -- list all the DBs in the server

SHOW TABLE; -- list tables in the selected DB

DROP DATABASE IF EXISTS temp; -- droping database
