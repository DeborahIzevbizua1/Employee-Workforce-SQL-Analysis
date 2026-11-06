-- EXPLORATORY DATA ANALYSIS --

SELECT * FROM employee_data

-- Total Employees
SELECT COUNT (*) AS Total_Employees FROM employee_data

-- First Set of Records
SELECT TOP 20 * FROM employee_data

-- Finding Duplicates
SELECT EmpID, COUNT (*) AS Duplicates FROM employee_data 
  GROUP BY EmpID
  HAVING COUNT (*) > 1

SELECT EmpID, FirstName, LastName, StartDate, ExitDate, Supervisor, ADEmail, DOB,
  COUNT (*) AS Duplicates
  FROM employee_data
  GROUP BY EmpID, FirstName, LastName, StartDate, ExitDate, Supervisor, ADEmail, DOB
  HAVING COUNT (*) > 1

  -- Missing Values
  SELECT * FROM employee_data
    WHERE ExitDate = ''

SELECT EmployeeStatus, ExitDate, TerminationDescription 
  FROM employee_data 
  WHERE ExitDate = ''
    
SELECT 
  SUM (CASE WHEN EmpID = '' THEN 1 ELSE 0 END) AS EmpID_Blank,
  SUM (CASE WHEN FirstName = '' THEN 1 ELSE 0 END) AS FirstName_Blank,
  SUM (CASE WHEN LastName = '' THEN 1 ELSE 0 END) AS LastName_Blank,
  SUM (CASE WHEN ExitDate = '' THEN 1 ELSE 0 END) AS ExitDate_Blank,
  SUM (CASE WHEN Title = '' THEN 1 ELSE 0 END) AS Title_Blank,
  SUM (CASE WHEN EmployeeStatus = '' THEN 1 ELSE 0 END) AS EmployeeStatus_Blank,
  SUM (CASE WHEN TerminationType = '' THEN 1 ELSE 0 END) AS TerminationType_Blank,
  SUM (CASE WHEN TerminationDescription = '' THEN 1 ELSE 0 END) AS TerminationDescription_Blank
FROM employee_data

-- Null Values
SELECT * FROM employee_data WHERE ExitDate IS NULL

-- Employee Classification --
-- Employee Status
SELECT EmployeeStatus, COUNT (*) AS Total_Employees 
  FROM employee_data 
  GROUP BY EmployeeStatus 
  ORDER BY Total_Employees DESC

-- Pay Zone
SELECT PayZone, COUNT (*) AS Total_Employees 
  FROM employee_data 
  GROUP BY PayZone 
  ORDER BY Total_Employees DESC

-- Employee Type
SELECT EmployeeType, COUNT (*) AS Total_Employees
  FROM employee_data
  GROUP BY EmployeeType
  ORDER BY Total_Employees DESC

  -- Gender
SELECT GenderCode, COUNT (*) AS Total_Employees
  FROM employee_data
  GROUP BY GenderCode
  ORDER BY Total_Employees DESC

-- Employee Performance
SELECT [Performance Score], COUNT (*) AS Total_Employees
  FROM employee_data
  GROUP BY [Performance Score]
  ORDER BY Total_Employees DESC

-- Department
SELECT DepartmentType, COUNT (*) AS Total_Employees
  FROM employee_data
  GROUP BY DepartmentType
  ORDER BY Total_Employees DESC

-- Business Unit
SELECT BusinessUnit, COUNT (*) AS Total_Employees
  FROM employee_data
  GROUP BY BusinessUnit
  ORDER BY Total_Employees DESC

-- Termination Type
SELECT TerminationType, COUNT (*) AS Total_Employees
  FROM employee_data
  GROUP BY TerminationType
  ORDER BY Total_Employees DESC

-- More Insights on the Blank Columns
-- Employees with no exit date
SELECT EmployeeStatus,COUNT (*) AS Total_Employees
  FROM employee_data
  WHERE ExitDate = ''
  GROUP BY EmployeeStatus
  ORDER BY Total_Employees DESC

-- Active Employees with Exit Date
SELECT COUNT (*) AS Active_Employees_with_ExitDate
    FROM employee_data
    WHERE EmployeeStatus = 'Active' AND ExitDate <> ''

-- Employees with exit date
SELECT EmployeeStatus, COUNT (*) AS Total_Employees
  FROM employee_data
  WHERE ExitDate <> '' 
  GROUP BY EmployeeStatus
  ORDER BY Total_Employees DESC

  -- Date Type
SELECT COLUMN_NAME,DATA_TYPE
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_NAME = 'employee_data'
  AND COLUMN_NAME IN ('StartDate', 'ExitDate', 'DOB', 'Performance Score')

SELECT StartDate,
  TRY_CONVERT(date, StartDate, 106) AS ConvertedStartDate
  FROM employee_data

SELECT ExitDate,
  TRY_CONVERT(date, ExitDate, 106) AS ConvertedEndDate
  FROM employee_data

SELECT DOB,
  TRY_CONVERT(date, DOB, 105) AS ConvertedDOBDate
  FROM employee_data

SELECT [Performance Score], COUNT (*) AS TE FROM employee_data
  GROUP BY [Performance Score]
  ORDER BY TE DESC

