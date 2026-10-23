
HR Talent Management and Employee Performance Analysis (SQL):


Project Overview:

This project applies SQL development and data analytics skills to a Human Resources scenario. It focuses on evaluating department payroll costs, identifying high-performing employees for bonuses, and using Views and Stored Procedures to automate workforce reporting.

Database Architecture:

The analysis is built on a 2-table schema containing:
• employees: Workforce demographics, hire dates, salaries, and current employment status.
• performance_reviews: Evaluation dates, 1-to-5 star performance rankings, and project completion counters.

Advanced Database Features (Inside 2_hr_queries.sql)

The project implements optimization features to analyze human resource data:
1. Payroll Optimization: Uses grouping aggregates to map headcount and budget footprints across departments.
2. High-Performer Tracking: Filters workforce data using conditional rules to identify candidates for compensation adjustments.
3. Database View (view_employee_performance_summary): Combines personnel directories and review histories into an automated master grid.
4. Stored Procedure (GetPerformanceByDepartment): A parameter-driven query tool that lets managers review performance data for any specific department instantly.

Key Insights and Recommendations:

• Department Expenditures: Engineering carries the highest payroll footprint, making workforce optimization in this sector critical for budgeting.
• Resource Allocation: High-velocity performers are clearly visible through project completion metrics, allowing leadership to make data-backed promotion choices.

How to Deploy and Run:

1. Execute 1_hr_schema.sql in MySQL Workbench to set up the tables and load the initial records.
2. Run 2_hr_queries.sql to calculate the business metrics, launch the view, and generate the stored procedure.
