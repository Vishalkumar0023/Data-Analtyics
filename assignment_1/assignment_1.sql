-- Task 1. Create a database named company_hr.

-- Inside this database, create a table named employees with these columns:


CREATE TABLE employees (
	employee_id SERIAL PRIMARY KEY,
	employee_name VARCHAR(80) NOT NULL,
	email VARCHAR(120) NOT NULL UNIQUE,
	department VARCHAR(40),
	job_title VARCHAR(60),
	hire_date DATE,
	salary	INTEGER,
	employment_status VARCHAR(20)
);


-- Part 2 – Insert Employee Data (15 marks)
-- Task 2. Insert the following 12 employee records.


INSERT INTO employees (employee_name, email, department, job_title, hire_date, salary, employment_status)
VALUES 
    ('Aarav Mehta', 'aarav.mehta@company.com', 'Engineering', 'Backend Developer', '2022-01-10', 65000, 'Active'),
    ('Priya Sharma', 'priya.sharma@company.com', 'HR', 'Recruiter', '2021-06-15', 52000, 'Active'),
    ('Kabir Khan', 'kabir.khan@company.com', 'Sales', 'Sales Executive', '2023-03-20', 45000, 'Active'),
    ('Neha Verma', 'neha.verma@company.com', 'Engineering', 'Data Analyst', '2020-11-05', 72000, 'Active'),
    ('Rohan Gupta', 'rohan.gupta@company.com', 'Finance', 'Accountant', '2019-08-12', 61000, 'Active'),
    ('Isha Patel', 'isha.patel@company.com', 'Marketing', 'Content Strategist', '2022-09-01', 55000, 'Active'),
    ('Arjun Rao', 'arjun.rao@company.com', 'Engineering', 'QA Engineer', '2024-02-19', 48000, 'Active'),
    ('Simran Kaur', 'simran.kaur@company.com', 'HR', 'HR Executive', '2023-07-11', 43000, 'Active'),
    ('Dev Malhotra', 'dev.malhotra@company.com', 'Sales', 'Sales Manager', '2018-04-23', 88000, 'Active'),
    ('Ananya Das', 'ananya.das@company.com', 'Finance', 'Financial Analyst', '2021-12-01', 68000, 'Active'),
    ('Kunal Singh', 'kunal.singh@company.com', 'Engineering', 'Intern', '2025-01-06', 18000, 'Intern'),
    ('Test User', 'test.user@company.com', 'QA', 'Test Record', '2026-01-01', 10000, 'Test');

-- Part 3 – Retrieve and Verify Data (10 marks)
-- Display all employee records.	

SELECT * FROM employees;

-- Display only employee name, department and salary.
SELECT employee_name, department, salary FROM employees;

-- Display employees in descending order of salary.
SELECT * FROM employees ORDER BY salary DESC;

-- Display employees belonging to the Engineering department.
SELECT * FROM employees
WHERE department ='Engineering';

--Find employees whose salary is between ₹40,000 and ₹70,000.
SELECT * FROM employees
WHERE salary <= 70000 AND salary>=40000;

-- Display employees hired after January 1, 2022.
SELECT * FROM employees
WHERE hire_date>'2022-01-01';


-- Display the employee with the highest salary.
SELECT * FROM employees
	WHERE salary = (SELECT MAX(salary) FROM employees);
	

-- Part 4 – Update Employee Records (20 marks)
-- Task 4. HR has requested the following changes:

-- Increase the salary of every Engineering employee by 8%.

UPDATE employees
SET salary = salary + (0.08*salary)
WHERE department = 'Engineering';


-- Change Kabir Khan's department from Sales to Business Development.
UPDATE employees
SET department = 'Business Development'
WHERE employee_name = 'Kabir Khan';

SELECT * FROM employees ORDER BY employee_id ASC;

-- Change Kunal Singh's job title to Junior Data Analyst.
UPDATE employees
SET job_title = 'Junior Data Analyst'
WHERE employee_name = 'Kunal Singh';

-- Update Kunal Singh's salary to ₹25,000.
UPDATE employees
SET salary = 25000
WHERE employee_name = 'Kunal Singh';


-- Change Simran Kaur's employment status to On Leave.

UPDATE employees
SET employment_status = 'On Leave'
WHERE employee_name = 'Simran Kaur';


SELECT * FROM employees ORDER BY employee_id ASC;



-- Correct Aarav Mehta's job title to Java Backend Developer.

UPDATE employees
SET job_title = 'Java Backend Developer'
WHERE employee_id=1;

--Part 5 – Delete Records and Columns (10 marks)
-- Delete the employee whose email belongs to Test User.
DELETE FROM employees
WHERE email LIKE '%test%';

-- Delete an employee using their employee ID.

DELETE FROM employees
WHERE employee_id = 3;

-- Add a temporary column named temporary_note.

SELECT *,
       'Temporary Note' AS temporary_note
FROM employees;

-- Insert a temporary note for one employee.
SELECT *,'Excellent Performance' AS temporary_note
FROM employees
WHERE employee_id = 1;

--- Remove the temporary_note column from the employees table.
--- temporary note created by as so no need to remove


-- Part 6 – Alter Table and Data Types (20 marks)
-- Task 6. HR has changed its database requirements.

---Change the salary datatype from INTEGER to NUMERIC(10,2)
ALTER TABLE employees
ALTER COLUMN salary TYPE Numeric(10,2);

--- Increase the job_title column's maximum length from 60 to 100 characters.

ALTER TABLE employees
ALTER COLUMN job_title TYPE VARCHAR(100);

--- Add a new column named work_mode with datatype VARCHAR(20).
ALTER TABLE employees
ADD COLUMN work_mode VARCHAR(20);

-- Update Aarav's work mode to Hybrid.
UPDATE employees
SET work_mode = 'Hybrid'
WHERE employee_name LIKE '%Aarav%';

-- Update Neha's work mode to Remote.
UPDATE employees
SET work_mode = 'Remote'
WHERE employee_name LIKE '%Neha%';

-- Add a column named joining_bonus with datatype NUMERIC(10,2).
ALTER TABLE employees
ADD COLUMN joining_bonus NUMERIC(10,2);

--- Update the joining bonus of three employees.
UPDATE employees
SET joining_bonus = 2000.00
WHERE employee_id <=4;




--- 1. Display the final table structure and verify the changes.

SELECT * FROM employees order by employee_id asc;









