-- Assign a rank to each employee based on their monthly income.(Using Window Function)
SELECT EmployeeId, MonthlyIncome,
DENSE_RANK() OVER(ORDER BY MonthlyIncome) AS rankby_income
FROM employee_database.general_data;

-- Calculate the average monthly income within each department.(Using Window Function)
SELECT Department,
AVG(MonthlyIncome) OVER(PARTITION BY Department ORDER BY MonthlyIncome) AS avgincomebydepart
FROM employee_database.general_data;