-- Assign a rank to each employee based on their monthly income.(Using Window Function)
SELECT EmployeeId, MonthlyIncome,
DENSE_RANK() OVER(ORDER BY MonthlyIncome) AS rankby_income
FROM employee_database.general_data;

-- Calculate the average monthly income within each department.(Using Window Function)
SELECT Department, EmployeeID, MonthlyIncome,
AVG(MonthlyIncome) OVER(PARTITION BY Department ORDER BY MonthlyIncome) AS avgmonthlyincome
FROM employee_database.general_data;

-- Calculate the third highest monthly income within each department.
SELECT Department, MAX(MonthlyIncome) as ThirdHighMonthlyIncome 
FROM 
(SELECT Department, EmployeeID, MonthlyIncome,
DENSE_RANK() OVER (PARTITION BY Department ORDER BY MonthlyIncome DESC) AS incomebyrank
FROM employee_database.general_data) sub
WHERE incomebyrank=3
GROUP BY Department;

-- Calculate the difference between each employee's monthly income and the previous employee's monthly income in the dataset.
SELECT EmployeeID, Department, MonthlyIncome,
ABS(MonthlyIncome - LAG(MonthlyIncome, 1) OVER (ORDER BY EmployeeID)) AS incomediff 
FROM employee_database.general_data;

