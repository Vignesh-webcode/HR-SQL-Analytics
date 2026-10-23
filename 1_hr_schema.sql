-- 1. Create the HR database
CREATE DATABASE IF NOT EXISTS hr_portfolio;
USE hr_portfolio;

-- 2. Create the Employees Table
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    job_title VARCHAR(50),
    hire_date DATE,
    salary DECIMAL(10, 2),
    status VARCHAR(20) DEFAULT 'Active'
);

-- 3. Create the Performance Reviews Table
CREATE TABLE performance_reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    review_date DATE,
    performance_score INT,
    projects_completed INT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- 4. Insert Mock Employee Data
INSERT INTO employees (first_name, last_name, department, job_title, hire_date, salary, status) VALUES
('Rahul', 'Mishra', 'Engineering', 'Backend Engineer', '2023-03-15', 85000.00, 'Active'),
('Jessica', 'Taylor', 'HR', 'HR Specialist', '2024-01-10', 55000.00, 'Active'),
('Vikram', 'Singh', 'Engineering', 'Frontend Engineer', '2022-06-01', 78000.00, 'Active'),
('Sneha', 'Reddy', 'Sales', 'Account Manager', '2023-11-20', 62000.00, 'Terminated'),
('David', 'Warner', 'Engineering', 'DevOps Engineer', '2024-02-01', 90000.00, 'Active'),
('Anjali', 'Sharma', 'Sales', 'Sales Executive', '2025-05-12', 48000.00, 'Active');

-- 5. Insert Mock Performance Reviews
INSERT INTO performance_reviews (employee_id, review_date, performance_score, projects_completed) VALUES
(1, '2025-12-15', 5, 12),
(2, '2025-12-18', 4, 3),
(3, '2025-12-20', 3, 8),
(5, '2025-12-22', 5, 14),
(6, '2025-12-23', 4, 6);
