-- Find the employees who work in either the Sales or Research and Development departments.
SELECT * 
FROM employee_database.general_data
WHERE Department = 'Sales' OR Department = 'Research & Development';

-- Find the employees who are in either Job Level 3 or Job Level 4.
SELECT *
FROM employee_database.general_data
WHERE JobLevel IN (3,4);

-- Classify employees into income brackets ('Low', 'Medium', 'High') based on their monthly income.(Low=20,000 and Medium= 20,000 to 70,000 ,
-- high>=70,000)
SELECT *,
CASE WHEN MonthlyIncome >= 70000 THEN 'High'
     WHEN MonthlyIncome >=20000 AND MonthlyIncome < 70000 Then 'Medium'
     ELSE 'Low' END AS income_classified
FROM employee_database.general_data;

-- Categorize employees based on their distance from home into 'Close', 'Medium', and 'Far'. (close<=7, medium 7 to 20, far>=20)
SELECT *,
CASE WHEN DistanceFromHome >= 20 THEN 'Far'
     WHEN DistanceFromHome > 7 and DistanceFromHome < 20 Then 'Medium'
     ELSE 'Close' END AS distfromhomecategory
FROM employee_database.general_data;


-- Count number of employees in 'Human Resources' and 'Other' departments.
SELECT sub.departcategory, COUNT(*) AS NumberofEmployees
FROM
(SELECT *, 
CASE WHEN Department = 'Human Resources' THEN 'Human Resources'
     ELSE 'Others' END AS departcategory
FROM employee_database.general_data) AS sub
GROUP BY sub.departcategory
ORDER BY sub.departcategory;