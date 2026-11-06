-- DATA CLEANING
------------------------------------------------------------------------------------------
-- Employee Data -- Data Cleaning
-------------------------------------------------------------------------------------------

SELECT * FROM employee_data_clean

-- NEW COLUMNS: DATA TYPE --
-- New Performance Score Column
UPDATE employee_data_clean
SET Performance_Score_Num = 
CASE 
  WHEN [Performance Score] = 'PIP' THEN 1
  WHEN [Performance Score] = 'Needs Improvement' THEN 2
  WHEN [Performance Score] = 'Fully Meets' THEN 3
  WHEN [Performance Score] = 'Exceeds' THEN 4
ELSE [Performance Score] END

-- Employee Rating Data Type
SELECT COLUMN_NAME, DATA_TYPE
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_NAME = 'employee_data_clean'
  AND COLUMN_NAME = 'Current Employee Rating'

ALTER TABLE employee_data_clean 
  ADD Employee_Rating_Num INT
UPDATE employee_data_clean
  SET Employee_Rating_Num =
  TRY_CONVERT(INT, [Current Employee Rating])

SELECT [Current Employee Rating], Employee_Rating_Num, COUNT (*) AS Total_Employees
  FROM employee_data_clean
  GROUP BY [Current Employee Rating], Employee_Rating_Num
  ORDER BY Employee_Rating_Num DESC

-- Date Columns Data Type
ALTER TABLE employee_data_clean
  ADD Start_Date_Clean DATE, Exit_Date_Clean DATE,DOB_Clean DATE

UPDATE employee_data_clean
  SET 
    Start_Date_Clean = TRY_CONVERT (DATE, StartDate, 106),
    Exit_Date_Clean = TRY_CONVERT (DATE, ExitDate, 106),
    DOB_Clean = TRY_CONVERT (DATE, ExitDate, 105)

SELECT * FROM employee_data_clean

ALTER TABLE employee_data_clean
  ADD Termination_Description_Clean VARCHAR

ALTER TABLE employee_data_clean
ALTER COLUMN Termination_Description_Clean VARCHAR(255);

UPDATE employee_data_clean
  SET Termination_Description_Clean =
  CASE 
    WHEN EmployeeStatus IN ('Active', 'Future Start') THEN 'Not Terminated'
    ELSE TerminationDescription END

----------------------------------------------------------------------------------------------
-- Engagement Survey Data -- Data Cleaning
----------------------------------------------------------------------------------------------
SELECT * FROM employee_engagement_survey_data

-- Duplicate
SELECT [Employee ID], COUNT (*) AS Total_Responses 
  FROM employee_engagement_survey_data
  GROUP BY [Employee ID]
  HAVING COUNT (*) > 1

-- Null/Missing Values
SELECT * FROM employee_engagement_survey_data 
  WHERE [Employee ID] = '' AND [Survey Date] = ''
SELECT * FROM employee_engagement_survey_data 
   WHERE [Employee ID] is NULL AND [Survey Date] IS NULL

 SELECT [Work-Life Balance Score],  COUNT (*) AS WLB_Count 
   FROM employee_engagement_survey_data
   GROUP BY [Work-Life Balance Score]
   ORDER BY WLB_Count DESC

SELECT [Engagement Score],  COUNT (*) AS ENG_Count 
   FROM employee_engagement_survey_data
   GROUP BY [Engagement Score]
   ORDER BY ENG_Count DESC

 SELECT [Satisfaction Score], COUNT (*) AS SAT_Count 
   FROM employee_engagement_survey_data
   GROUP BY [Satisfaction Score]
   ORDER BY SAT_Count

-- Data Type
SELECT COLUMN_NAME, DATA_TYPE
  FROM INFORMATION_SCHEMA.COLUMNS
  WHERE TABLE_NAME = 'employee_engagement_survey_data' 
  AND COLUMN_NAME IN ('Employee ID', 'Survey Date', 'Work-Life Balance Score', 'Satisfaction Score', 'Engagement Score')

-- New Table
SELECT * INTO engagement_survey_clean
  FROM employee_engagement_survey_data

ALTER TABLE engagement_survey_clean
  ADD WLB_Score_Clean INT
UPDATE engagement_survey_clean
SET WLB_Score_Clean =
TRY_CONVERT (INT,[Work-Life Balance Score]) 

ALTER TABLE engagement_survey_clean
  ADD Satisfaction_Score_NUM INT
UPDATE engagement_survey_clean
SET Satisfaction_Score_NUM =
TRY_CONVERT (INT,[Satisfaction Score]) 

ALTER TABLE engagement_survey_clean
  ADD Engagement_Score_NUM INT
UPDATE engagement_survey_clean
SET Engagement_Score_NUM =
TRY_CONVERT (INT,[Engagement Score]) 

-- Determined data and character length to know which SQL date format to use i.e either 3 or 103
-- New Survey date column
SELECT TOP 20
    [Survey Date],
    DATALENGTH([Survey Date]) AS DataLength,
    LEN([Survey Date]) AS CharacterLength
FROM engagement_survey_clean;
SELECT
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'engagement_survey_clean'
  AND COLUMN_NAME IN ('Survey Date', 'Survey_Date_Clean');
ALTER TABLE engagement_survey_clean
  ADD Survey_Date_Clean DATE
UPDATE engagement_survey_clean
SET Survey_Date_Clean =
TRY_CONVERT (date,
    NULLIF(LTRIM(RTRIM([Survey Date])), ''), 3)

------------------------------------------------------------------------------------------------------
-- Training and Development -- Data Cleaning
------------------------------------------------------------------------------------------------------
SELECT * FROM training_and_development_data

-- Null/Missing Values
SELECT * FROM training_and_development_data
  WHERE [Employee ID] IS NULL

SELECT * FROM training_and_development_data
WHERE [Training Date] IS NULL AND [Employee ID] IS NULL

  -- Duplicates
SELECT [Employee ID], COUNT (*) AS Duplicates 
  FROM training_and_development_data
  GROUP BY [Employee ID]
  HAVING COUNT (*) > 1

-- Determining data type
SELECT COLUMN_NAME, DATA_TYPE FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'training_and_development_data'
AND COLUMN_NAME IN ('Training Date', 'Training Duration(Days)', 'Training Cost')

-- New Table
SELECT * INTO training_and_dev_clean 
  FROM training_and_development_data 

-- Training Date Column -- Changing data type
ALTER TABLE training_and_dev_clean
  ADD Training_Date_Clean DATE
UPDATE training_and_dev_clean
  SET Training_Date_Clean =
      TRY_CONVERT(date, NULLIF(LTRIM(RTRIM([Training Date])), ''), 106)

-- Training Cost Column -- Changing data type
ALTER TABLE training_and_dev_clean
  ADD Training_Cost_Clean decimal(10,2)
UPDATE training_and_dev_clean
  SET Training_Cost_Clean =
      TRY_CONVERT(decimal (10,2), NULLIF(LTRIM(RTRIM([Training Cost])), ''))

-- Training Duration -- Changing data type
ALTER TABLE training_and_dev_clean
  ADD Training_Duration_Days_Clean INT
UPDATE training_and_dev_clean
  SET Training_Duration_Days_Clean =
      TRY_CONVERT (INT, NULLIF(LTRIM(RTRIM([Training Duration(Days)])), ''))