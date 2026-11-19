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




