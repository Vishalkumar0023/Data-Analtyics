CREATE TABLE IF NOT EXISTS employee2 (
	employee_id INT PRIMARY KEY,
	first_name VARCHAR(20) NOT NULL ,
	last_name VARCHAR(20) NOT NULL,
	email VARCHAR(120) NOT NULL UNIQUE,
	department VARCHAR(20),
	salary NUMERIC(10,2),
	joining_date DATE,
	age INT
);


DROP TABLE employee2;
COPY employee2 (
	employee_id, first_name, last_name, email, department, salary, joining_date, age
)
FROM '/Users/vishalmahto/Desktop/Da/All Excel Practice Files/employee_data.csv'
DELIMITER','
CSV HEADER;

SHOW datestyle;

SET datestyle = 'ISO, DMY';
SELECT * FROM employee2;

CREATE TABLE employee3(
	employee_id INT PRIMARY KEY,
	first_name VARCHAR(20) NOT NULL ,
	last_name VARCHAR(20) NOT NULL,
	email VARCHAR(50),
	department VARCHAR(20),
	salary NUMERIC(10,2),
	joining_date DATE,
	age INT
);

ALTER TABLE employee3
ALTER COLUMN email TYPE VARCHAR(120);


SELECT
    column_name,
    data_type,
    character_maximum_length
FROM information_schema.columns
WHERE table_name = 'employee3';

SET datestyle = 'ISO, DMY';
ALTER DATABASE company_hr
SET datestyle = 'ISO, DMY'
WHERE table = 'employee3';

ALTER DATABASE company_hr
SET datestyle = 'ISO, DMY';

SELECT * FROM employee2 ORDER BY employee_id;


SELECT first_name ,last_name, department
from employee2
WHERE department IN ('Finance','Marketing','IT');

SELECT * FROM employee2 ORDER BY employee_id;

SELECT *
from employee2
WHERE email ='null';

SELECT COUNT(DISTINCT department) AS department_count
FROM employee2;













CREATE TABLE students_2023 (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    course VARCHAR(50)
);

INSERT INTO students_2023 (student_id, student_name, course) VALUES
(1, 'Aarav Sharma', 'Computer Science'),
(2, 'Ishita Verma', 'Mechanical Engineering'),
(3, 'Kabir Patel', 'Electronics'),
(4, 'Ananya Desai', 'Civil Engineering'),
(5, 'Rahul Gupta', 'Computer Science');



SELECT * FROM students_2023;

CREATE TABLE students_2024 (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    course VARCHAR(50)
);


INSERT INTO students_2024 (student_id, student_name, course) VALUES
(3, 'Kabir Patel', 'Electronics'), -- Same as students_2023
(4, 'Ananya Desai', 'Civil Engineering'), -- Same as students_2023
(6, 'Meera Rao', 'Computer Science'),
(7, 'Vikram Singh', 'Mathematics'),
(8, 'Sanya Kapoor', 'Physics');

SELECT * FROM students_2024;



--- UNION 
SELECT student_name,course
FROM students_2023
UNION
SELECT student_name,course
FROM students_2024;

--- UNION ALL
SELECT student_name,course
FROM students_2023
UNION ALL
SELECT student_name,course
FROM students_2024;

--- INTERSECT 
SELECT student_name,course
FROM students_2023
INTERSECT
SELECT student_name,course
FROM students_2024;

-- EXCEPT
SELECT student_name,course
FROM students_2023
EXCEPT
SELECT student_name,course
FROM students_2024;



--- Aggregate function perform calculation on a set of value and return a single value

-- COUNT(),MAX(),AVG(),MIN(),SUM()


--- STRING FUNCTION 


SELECT * from products;


-- Get all the categories in Uppercase

SELECT UPPER(category) AS Catergory_Capital
FROM products;

-- Get all the categories in Lowercase

SELECT LOWER(category) AS Catergory_Capital
FROM products;



-- Join Product_name adn category text with hypen.
SELECT CONCAT(product_name,'-',category) As product_details
FROM products;

-- Extract the first 5 characters from product_name
SELECT SUBSTRING(product_name, 1,5) AS short_name
FROM products;

-- Count length
SELECT product_name, LENGTH(product_name) AS COUNT_OF_CHAR
FROM products;


--Remove leading and trailing spaces from string
 SELECT LENGTH(TRIM('  Monitor    ')) AS Trimmed_Text;
 SELECT LENGTH('  Monitor    ') AS Trimmed_Text;


-- Replace the word "phone" with "device" in product names
SELECT REPLACE(product_name, 'phone','device') AS updated
FROM products;


-- Get the first 3 characters from category

SELECT RIGHT(category, 3) AS Catergory_Capital
FROM products;

