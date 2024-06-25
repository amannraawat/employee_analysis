-- Find employees who have a monthly income above 5000 
WITH example AS (
SELECT employeeID, Department, MonthlyIncome, Gender
FROM employee_database.general_data
WHERE MonthlyIncome>5000)
SELECT * 
FROM example; 

-- Calculate the total monthly income for each department.
WITH incomebydepart AS (
SELECT Department, SUM(MonthlyIncome) AS totalincome
FROM employee_database.general_data
GROUP BY Department)
SELECT * 
FROM incomebydepart;