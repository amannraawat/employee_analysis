-- What is the monthly income and job satisfaction level of each employee?(Using General_data and employee_survey_data)
SELECT GD.EmployeeID, GD.MonthlyIncome, ESD.JobSatisfaction
FROM employee_database.general_data GD
JOIN employee_database.employee_survey_data ESD
ON GD.EmployeeID = ESD.EmployeeID;

-- How many employees are there in each job role with their respective job satisfaction levels?
SELECT GD.JobRole, COUNT(GD.EmployeeID) AS NumberOfEmployees, ESD.JobSatisfaction
FROM employee_database.general_data GD
JOIN employee_database.employee_survey_data ESD
ON GD.EmployeeID = ESD.EmployeeID
GROUP BY GD.JobRole, ESD.JobSatisfaction;

-- Get the gender and work-life balance level for each employee, including those without any survey data.
SELECT GD.EmployeeID, GD.Gender, ESD.WorkLifeBalance
FROM employee_database.general_data GD
LEFT JOIN employee_database.employee_survey_data ESD
ON GD.EmployeeID = ESD.EmployeeID;

-- Get the job role, work-life balance, and performance rating of employees, only for those with data in all tables.
SELECT GD.EmployeeID, GD.JobRole, ESD.WorkLifeBalance, MSD.PerformanceRating
FROM employee_database.general_data GD
JOIN employee_database.employee_survey_data ESD
ON GD.EmployeeID = ESD.EmployeeID
JOIN employee_database.manager_survey_data MSD
ON GD.EmployeeID = MSD.EmployeeID;

--  Find the employee ID who has a monthly income above the average monthly income.
SELECT EmployeeID, MonthlyIncome
FROM employee_database.general_data
GROUP BY EmployeeID, MonthlyIncome
HAVING MonthlyIncome > (SELECT AVG(MonthlyIncome) FROM employee_database.general_data);

-- Find the employee ID who lives closer than the average distance from home.
SELECT EmployeeID
FROM employee_database.general_data
WHERE DistanceFromHome < (SELECT AVG(DistanceFromHome) FROM employee_database.general_data);
 