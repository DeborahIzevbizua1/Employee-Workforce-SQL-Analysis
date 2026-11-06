---------------------------------------------------------------------------------------------------------
-- ANALYSIS
---------------------------------------------------------------------------------------------------------

-- What is the current workforce distribution by employee status?
SELECT EmployeeStatus, COUNT(*) AS Total_employees 
  FROM employee_data_clean
  GROUP BY EmployeeStatus
  ORDER BY Total_employees DESC

-- WHich departemnt has the highest number of employees?
SELECT DepartmentType, COUNT(*) AS Total_Employees 
  FROM employee_data_clean
  GROUP BY DepartmentType
  ORDER BY Total_Employees DESC

-- How does employee performance vary across departments?
SELECT DepartmentType, AVG(Performance_Score_Num) AS AVG_Performance, COUNT (*) AS Total_Employees
  FROM employee_data_clean
  GROUP BY DepartmentType
  ORDER BY AVG_Performance DESC

-- What is the distribution of employee performance ratings?
SELECT [Performance Score], COUNT (*) AS Total_Employees 
  FROM employee_data_clean
  GROUP BY [Performance Score]
  ORDER BY Total_Employees  DESC

-- What is the average engagement, satisfaction and work-life balance score?
SELECT AVG(Engagement_Score_NUM) AS AVG_Engagement_Score
  FROM engagement_survey_clean
SELECT AVG(Satisfaction_Score_NUM) AS AVG_Satisfaction_Score
  FROM engagement_survey_clean
SELECT AVG(WLB_Score_Clean) AS AVG_WLB_Score
  FROM engagement_survey_clean

-- How does employee engagement vary across survey periods?
SELECT YEAR(Survey_Date_Clean) AS YearlySurvey, 
  AVG(Engagement_Score_NUM) AS AVG_Engagement_Score,
  AVG(Satisfaction_Score_NUM) AS AVG_Satisfaction_Score,
  AVG(WLB_Score_Clean) AS AVG_WLB_Score
  FROM engagement_survey_clean
  GROUP BY YEAR(Survey_Date_Clean)
  ORDER BY AVG_Engagement_Score DESC

-- Which training programs are most commonly attended?
SELECT [Training Program Name], COUNT(*) AS Most_Attended 
  FROM training_and_dev_clean
  GROUP BY [Training Program Name]
  ORDER BY Most_Attended DESC

-- Which training programs have the highest average training cost?
SELECT [Training Program Name], AVG(Training_Cost_Clean) AS AVG_Training_Cost 
  FROM training_and_dev_clean
  GROUP BY [Training Program Name]
  ORDER BY AVG_Training_Cost DESC

-- Which training programs have the best training outcomes?
SELECT [Training Program Name], [Training Outcome], COUNT(*) AS Total_Employees
  FROM training_and_dev_clean
  GROUP BY [Training Program Name], [Training Outcome]
  ORDER BY [Training Program Name], Total_Employees DESC

-- Does employee performance differ between employees with high and low engagement?
SELECT
  CASE WHEN s.[Engagement Score] >= 4 THEN 'High_Engagement'
  ELSE 'Lower_Engagement' END AS Engagement_Group,
  AVG(e.Performance_Score_Num) AS AVG_Performance,
  COUNT(DISTINCT e.EmpID) AS Total_Employees
  FROM Employee_Data_Clean e
  INNER JOIN Engagement_Survey_Clean s
  ON e.EmpID = s.[Employee ID]
  GROUP BY
  CASE WHEN s.[Engagement Score] >= 4 THEN 'High_Engagement'
  ELSE 'Lower_Engagement' END
  ORDER BY AVG_Performance DESC

-- Which departments have the highest employee engagement?
SELECT e.DepartmentType, AVG(s.Engagement_Score_NUM) AS AVG_Engagement_Score
  FROM employee_data_clean e 
  INNER JOIN engagement_survey_clean s ON e.EmpID = s.[Employee ID]
  GROUP BY e.DepartmentType
  ORDER BY AVG_Engagement_Score DESC

-- Does employee status relate to engagement?
SELECT e.EmployeeStatus, AVG(s.Engagement_Score_NUM) AS AVG_Engagement
  FROM employee_data_clean e 
  INNER JOIN engagement_survey_clean s
  ON e.EmpID = s.[Employee ID]
  GROUP BY EmployeeStatus
  ORDER BY AVG_Engagement

-- How many employees have received training, by department?
SELECT e.DepartmentType, COUNT(t.[Employee ID]) AS Total_Employees FROM employee_data_clean e
  INNER JOIN training_and_dev_clean t
  ON e.EmpID = t.[Employee ID]
  GROUP BY DepartmentType
  ORDER BY Total_Employees DESC

-- How do training participation, engagement and performance relate?
SELECT t.[Training Program Name],
  COUNT(*) AS Total_Employees,
  AVG(e.Performance_Score_Num) AS AVG_Performance,  
  AVG(s.Engagement_Score_NUM) AS AVG_Engagement 
  FROM employee_data_clean e
  LEFT JOIN engagement_survey_clean s
  ON e.EmpID = s.[Employee ID]
  LEFT JOIN training_and_dev_clean t
  ON e.EmpID = t.[Employee ID]
  GROUP BY t.[Training Program Name]
  ORDER BY AVG_Performance DESC

-- Which departments have the strongest combination of performance, engagement and training participation?
SELECT e.DepartmentType, COUNT(t.[Employee ID]) AS Total_Employee_Participating,
  AVG(e.Performance_Score_Num) AS AVG_Performnace, 
  AVG(s.Satisfaction_Score_NUM) AS AVG_Satisfaction, 
  AVG(s.WLB_Score_Clean) AS AVG_WLB
  FROM employee_data_clean e
  LEFT JOIN engagement_survey_clean s
    ON e.EmpID = s.[Employee ID]
  LEFT JOIN training_and_dev_clean t
    ON e.EmpID = t.[Employee ID]
    GROUP BY e.DepartmentType
    ORDER BY Total_Employee_Participating DESC

-- Which departments receive the most training investment?
SELECT DepartmentType, COUNT([Employee ID]) AS Total_Employees, 
  SUM(t.Training_Cost_Clean) AS Total_Training_Cost, 
  AVG(t.Training_Cost_Clean) AS AVG_Training_Cost
  FROM employee_data_clean e
  INNER JOIN training_and_dev_clean t
  ON e.EmpID = t.[Employee ID]
  GROUP BY DepartmentType
  ORDER BY Total_Training_Cost DESC

SELECT * FROM employee_data_clean
SELECT * FROM engagement_survey_clean
SELECT * FROM training_and_dev_clean

-- What is the current workforce distribution by employee status?
-- WHich departemnt has the highest number of employees?
-- How does employee performance vary across departments?
-- What is the distribution of employee performance ratings?
-- What is the average engagement, satisfaction and work-life balance score?
-- How does employee engagement vary across survey periods?
-- Which training programs are most commonly attended?
-- Which training programs have the highest average training cost?
-- Which training programs have the best training outcomes?
-- Does employee performance differ between employees with high and low engagement?
-- Which departments have the highest employee engagement?
-- Does employee status relate to engagement?
-- How many employees have received training, by department?
-- How do training participation, engagement and performance relate?
-- Which departments have the strongest combination of performance, engagement and training participation?
-- Which departments receive the most training investment?


