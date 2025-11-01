CREATE TABLE IF NOT EXISTS Employee (
emp_id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50),
salary DECIMAL(10,2),
dept VARCHAR(50)
);

INSERT INTO Employee (name, salary, dept) VALUES
('Aditya',50000,'IT'),
('Tejas',45000,'HR'),
('Raj',40000,'Finance');

SELECT * FROM Employee;

-- Simulated Stored Procedure: IncreaseSalaryByDept

-- Variables (You manually replace these values each time)
-- :dept_name = department name
-- :percent_increase = percentage to increase

BEGIN TRANSACTION;

UPDATE Employee
SET salary = salary + (salary * 0.10)  -- 0.10 = 10% increase
WHERE dept = 'IT';                     -- change 'IT' to any department

COMMIT;

SELECT * FROM Employee;

CREATE VIEW IF NOT EXISTS TotalSalaryByDept AS
SELECT dept, SUM(salary) AS total_salary
FROM Employee
GROUP BY dept;


SELECT * FROM TotalSalaryByDept;

-- Example using parameter placeholders
UPDATE Employee
SET salary = salary + (salary * :percent / 100)
WHERE dept = :dept_name;

SELECT * FROM Employee;

SELECT * FROM TotalSalaryByDept;

