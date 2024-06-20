-- Count the number of employees are there in each age group.
-- SELECT Age, Count(EmployeeId) AS NumberOfEmployees
-- FROM employee_database.general_data
-- GROUP BY Age
-- ORDER BY Age;


-- How many male and female employees are working?
-- SELECT Gender, COUNT(Gender) AS NumberOfEmployees 
-- FROM employee_database.general_data
-- GROUP BY Gender;


-- How many employees travel for business frequently, rarely, or never? (Rename column as EmployeeCount)
 -- SELECT BusinessTravel, COUNT(EmployeeID) AS EmployeeCount
--  FROM employee_database.general_data
--  GROUP BY BusinessTravel;


-- How many employees in each education field with more than 3 JobLevels, ordered by the count of employees in ascending order?
 -- SELECT EducationField, COUNT(EmployeeID) AS NumberOfEmployees
--  FROM employee_database.general_data
--  WHERE JobLevel>3 
--  GROUP BY EducationField
--  ORDER BY COUNT(EmployeeID);


-- What is the average age of employees in each job role with 'Manager' in the title, ordered by average age in ascending order?
-- SELECT AVG(Age) AS AvgAgeOfEmployees
-- FROM employee_database.general_data
-- WHERE JobRole='Manager'
-- ORDER BY AVG(Age);  
 
 
 
 