/*
===============================================================
        HR ANALYTICS: WORKFORCE PERFORMANCE & EMPLOYEE INSIGHTS

                         SQL BUSINESS ANALYSIS

Author: Saad Maher

Objective:
Analyze employee workforce data using SQL to support HR
decision-making related to workforce structure, compensation,
recruitment, engagement, performance, absenteeism, and retention.
===============================================================
*/

USE hr_analytics;

/*
---------------------------------------------------------------
Business Question 1
How many employees are in the organization?
---------------------------------------------------------------
*/
SELECT COUNT(*) AS total_employees
FROM hr_dataset;

/*
---------------------------------------------------------------
Business Question 2
How are employees distributed across departments?
---------------------------------------------------------------
*/
SELECT Department, COUNT(*) AS employee_count
FROM hr_dataset
GROUP BY Department
ORDER BY employee_count DESC;

/*
---------------------------------------------------------------
Business Question 3
What is the distribution of employment status?
---------------------------------------------------------------
*/
SELECT EmploymentStatus, COUNT(*) AS employee_count
FROM hr_dataset
GROUP BY EmploymentStatus
ORDER BY employee_count DESC;

/*
---------------------------------------------------------------
Business Question 4
How are employees distributed by gender?
---------------------------------------------------------------
*/
SELECT Sex, COUNT(*) AS employee_count
FROM hr_dataset
GROUP BY Sex
ORDER BY employee_count DESC;

/*
---------------------------------------------------------------
Business Question 5
How are employees distributed by race?
---------------------------------------------------------------
*/
SELECT RaceDesc, COUNT(*) AS employee_count
FROM hr_dataset
GROUP BY RaceDesc
ORDER BY employee_count DESC;

/*
---------------------------------------------------------------
Business Question 6
Which departments have the highest average salary?
---------------------------------------------------------------
*/
SELECT Department, ROUND(AVG(Salary), 2) AS average_salary
FROM hr_dataset
GROUP BY Department
ORDER BY average_salary DESC;

/*
---------------------------------------------------------------
Business Question 7
Which positions have the highest average salary?
---------------------------------------------------------------
*/
SELECT Position, ROUND(AVG(Salary), 2) AS average_salary
FROM hr_dataset
GROUP BY Position
ORDER BY average_salary DESC
LIMIT 10;

/*
---------------------------------------------------------------
Business Question 8
What are the overall salary statistics?
---------------------------------------------------------------
*/
SELECT
    ROUND(AVG(Salary), 2) AS average_salary,
    MIN(Salary) AS minimum_salary,
    MAX(Salary) AS maximum_salary,
    ROUND(STDDEV(Salary), 2) AS salary_standard_deviation
FROM hr_dataset;

/*
---------------------------------------------------------------
Business Question 9
What is the average salary by employment status?
---------------------------------------------------------------
*/
SELECT EmploymentStatus, ROUND(AVG(Salary), 2) AS average_salary
FROM hr_dataset
GROUP BY EmploymentStatus
ORDER BY average_salary DESC;

/*
---------------------------------------------------------------
Business Question 10
What is the distribution of performance scores?
---------------------------------------------------------------
*/
SELECT PerformanceScore, COUNT(*) AS employee_count
FROM hr_dataset
GROUP BY PerformanceScore
ORDER BY employee_count DESC;

/*
---------------------------------------------------------------
Business Question 11
Which departments have the highest average satisfaction?
---------------------------------------------------------------
*/
SELECT Department, ROUND(AVG(EmpSatisfaction), 2) AS average_satisfaction
FROM hr_dataset
GROUP BY Department
ORDER BY average_satisfaction DESC;

/*
---------------------------------------------------------------
Business Question 12
Which departments have the highest average engagement?
---------------------------------------------------------------
*/
SELECT Department, ROUND(AVG(EngagementSurvey), 2) AS average_engagement
FROM hr_dataset
GROUP BY Department
ORDER BY average_engagement DESC;

/*
---------------------------------------------------------------
Business Question 13
Which departments have the most high-performing employees?
---------------------------------------------------------------
*/
SELECT Department, COUNT(*) AS high_performer_count
FROM hr_dataset
WHERE PerformanceScore = 'Exceeds'
GROUP BY Department
ORDER BY high_performer_count DESC;

/*
---------------------------------------------------------------
Business Question 14
Which recruitment sources bring the most employees?
---------------------------------------------------------------
*/
SELECT RecruitmentSource, COUNT(*) AS employee_count
FROM hr_dataset
GROUP BY RecruitmentSource
ORDER BY employee_count DESC;

/*
---------------------------------------------------------------
Business Question 15
Which recruitment sources produce the highest engagement?
---------------------------------------------------------------
*/
SELECT RecruitmentSource, ROUND(AVG(EngagementSurvey), 2) AS average_engagement
FROM hr_dataset
GROUP BY RecruitmentSource
ORDER BY average_engagement DESC;

/*
---------------------------------------------------------------
Business Question 16
Which recruitment sources produce the highest satisfaction?
---------------------------------------------------------------
*/
SELECT RecruitmentSource, ROUND(AVG(EmpSatisfaction), 2) AS average_satisfaction
FROM hr_dataset
GROUP BY RecruitmentSource
ORDER BY average_satisfaction DESC;

/*
---------------------------------------------------------------
Business Question 17
Which departments have the highest average absences?
---------------------------------------------------------------
*/
SELECT Department, ROUND(AVG(Absences), 2) AS average_absences
FROM hr_dataset
GROUP BY Department
ORDER BY average_absences DESC;

/*
---------------------------------------------------------------
Business Question 18
Which employees have the highest number of absences?
---------------------------------------------------------------
*/
SELECT Employee_Name, Department, Position, Absences
FROM hr_dataset
ORDER BY Absences DESC
LIMIT 10;

/*
---------------------------------------------------------------
Business Question 19
What are the most common termination reasons?
---------------------------------------------------------------
*/
SELECT
    `ï»¿Employee_Name` AS Employee_Name,
    Department,
    Position,
    Absences
FROM hr_dataset
ORDER BY Absences DESC
LIMIT 10;

/*
---------------------------------------------------------------
Business Question 20
Executive workforce summary
---------------------------------------------------------------
*/
SELECT
    COUNT(*) AS total_employees,
    SUM(CASE WHEN EmploymentStatus = 'Active' THEN 1 ELSE 0 END) AS active_employees,
    SUM(CASE WHEN EmploymentStatus <> 'Active' THEN 1 ELSE 0 END) AS terminated_employees,
    ROUND(AVG(Salary), 2) AS average_salary,
    ROUND(AVG(EmpSatisfaction), 2) AS average_satisfaction,
    ROUND(AVG(EngagementSurvey), 2) AS average_engagement,
    ROUND(AVG(Absences), 2) AS average_absences
FROM hr_dataset;













