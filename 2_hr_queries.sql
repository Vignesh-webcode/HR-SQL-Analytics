USE hr_portfolio;

-- ========================================================
-- SECTION 1: DATA VERIFICATION CHECKS
-- ========================================================
SELECT * FROM employees;
SELECT * FROM performance_reviews;

-- ========================================================
-- SECTION 2: BUSINESS INSIGHT QUERIES
-- ========================================================

-- Problem 1: Department Payroll and Staffing Breakdown
-- Business Goal: Finance needs to see total headcount and salary spending per department.
SELECT 
    department,
    COUNT(employee_id) AS total_employees,
    SUM(salary) AS total_payroll,
    ROUND(AVG(salary), 2) AS average_salary
FROM employees
WHERE status = 'Active'
GROUP BY department
ORDER BY total_payroll DESC;

-- Problem 2: High Performer Recognition (VIP Employees)
-- Business Goal: Find top workers with a score of 4 or 5 who finished over 5 projects for bonus allocation.
SELECT 
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    e.department,
    e.job_title,
    p.performance_score,
    p.projects_completed
FROM employees e
JOIN performance_reviews p ON e.employee_id = p.employee_id
WHERE p.performance_score >= 4 AND p.projects_completed > 5
ORDER BY p.projects_completed DESC;

-- ========================================================
-- SECTION 3: ADVANCED DEVELOPER OBJECTS
-- ========================================================

-- View: Master Employee Performance Dashboard
-- Creates a saved virtual table combining department profiles with active scores.
CREATE OR REPLACE VIEW view_employee_performance_summary AS
SELECT 
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    e.department,
    e.job_title,
    e.salary,
    e.status,
    IFNULL(p.performance_score, 'No Review') AS last_score,
    IFNULL(p.projects_completed, 0) AS total_projects
FROM employees e
LEFT JOIN performance_reviews p ON e.employee_id = p.employee_id;

-- Test the View
SELECT * FROM view_employee_performance_summary WHERE status = 'Active';

-- Stored Procedure: Filter Performance by Department
-- Reusable tool to quickly check performance records for a specific department.
DELIMITER //

CREATE PROCEDURE GetPerformanceByDepartment(IN input_dept VARCHAR(50))
BEGIN
    SELECT 
        employee_name,
        job_title,
        last_score,
        total_projects
    FROM view_employee_performance_summary
    WHERE department = input_dept;
END //

DELIMITER ;

-- Test the Stored Procedure
CALL GetPerformanceByDepartment('Engineering');
