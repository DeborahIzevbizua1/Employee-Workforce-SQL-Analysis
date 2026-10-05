# Employee-Workforce-SQL-Analysis
SQL Server project analyzing employee workforce, engagement, performance, and training data through data cleaning, analysis, and business insights.


## Project Overview
This project analyzes employee workforce, employee engagement, and training data using SQL Server Management Studio (SSMS).
The project was developed as a practical SQL portfolio project to demonstrate the complete data analysis process, from working with raw and messy data through data profiling, cleaning, validation, exploratory analysis, SQL querying, and business insight generation.

The analysis focuses on three main areas:
- Employee workforce and performance
- Employee engagement and satisfaction
- Training participation, outcomes and cost

The project also includes a recruitment dataset that was imported and investigated but was not included in the final analysis scope.


## Business Objective
The goal of this project is to use employee-related data to answer questions that could support HR and workforce decision-making.
The analysis investigates areas such as:
- workforce distribution
- employee performance
- employee engagement
- satisfaction and work-life balance
- training participation
- training outcomes
- training costs
- relationships between employee performance, engagement and training
- differences across departments

The project is designed around the idea of moving beyond simply querying data to answering business questions using SQL.

## Project Workflow
Raw CSV Data >  Data Profiling > Data Cleaning > Data Validation > SQL Analysis > Business Insights > Power BI Visualization

## STEP 1. Data Profiling & Exploratory Data Analysis
Before cleaning the data, I investigated the structure and quality of the datasets. The profiling stage was used to identify potential data-quality issues before making changes to the data. The checks included:
- identifying columns and their data types
- checking for NULL values
- checking for blank values
- checking for duplicate records
- examining distinct values
- investigating categorical values
- checking date formats
- identifying numerical fields stored as text
- investigating possible anomalies
- checking employee identifiers
- checking relationships between tables

The raw tables were preserved so that the original state of the data could be compared with the cleaned tables.

## STEP 2. Data Cleaning
Instead of modifying the raw tables directly, cleaned copies were created. The general structure was:

Raw Table > Profiling > Cleaning > Clean Table

For example:

Employee_Data > Employee_Data_Clean

This approach preserved the original data while allowing the cleaned tables to be used for analysis.

### 1. Employee Data Cleaning:
The Employee Data table required several cleaning and transformation steps.
- Date fields: The date fields were investigated and converted into appropriate SQL Server date types where required. These included: Start Date, Exit Date, and Date of Birth. During the process, blank values in date fields were also investigated to ensure that they were not incorrectly converted into artificial dates such as 1900-01-01.
- Employee Performance: The employee performance information was investigated because some numerical values had been stored as text. Conversion to numerical values was tested using TRY_CONVERT() before incorporating the cleaned values into the analysis.
- Employee Rating: The Current Employee Rating field was also investigated because it was stored as text. The values were converted/tested as numerical values where appropriate so that the rating could be used in aggregation and analysis.
- Exit Date and Employment Status: Exit dates were investigated alongside employee status. Employees without an exit date were examined to determine their employment status, while records containing exit dates were also grouped by status.
- Termination Description: The termination description field contained missing information. A cleaned termination description was created to distinguish employees who had not been terminated from records requiring an actual termination description.
- Employee ID: Employee IDs were retained as VARCHAR. Employee IDs are identifiers rather than numerical measures, so there was no analytical reason to convert them to integers.

### 2. Engagement Survey Cleaning
The Engagement Survey table was separately profiled and cleaned before being used with the Employee Data table. The cleaning process included investigation of; Satisfaction Score, Work-Life Balance Score, Engagement-related numerical fields, Survey Date, and Employee ID.
- Numerical fields: Some numerical fields had been imported as VARCHAR. Their values were investigated and tested for conversion to numerical data types.
- Survey Date: The Survey Date was initially stored as VARCHAR.
The values were in the format: DD/MM/YY. For example: 10/10/22, 19/08/23. The date was therefore converted using SQL Server date style 3: **TRY_CONVERT(date, [Survey Date], 3).** The cleaned Survey Date was stored as a proper DATE field.

### 3. Training & Development Cleaning
The Training & Development table was also separately investigated and cleaned. The main data-type issues identified were:
- Training Date: Training dates were stored in a format such as; 21-Sep-22, 19-Jul-23. The values were converted into proper SQL Server date values.
- Training Duration: Training duration was converted from text to a numerical field so that it could be used for calculations and comparisons.
- Training Cost: Training cost was converted to a decimal/numeric data type because the values included decimal amounts. This allowed total and average training costs to be calculated accurately.

## STEP 3. Data Validation
After cleaning, the cleaned tables were checked again to ensure that the transformations had produced usable data. Validation included:
- checking converted data types
- checking for remaining invalid values
- checking NULL and blank values
- checking employee IDs
- checking duplicate employee records
- checking employee IDs across tables
- checking whether records could be successfully joined
- confirming that cleaned date fields contained valid dates
- confirming that numerical fields could be used in calculations

The validation stage was important because successful execution of a SQL query does not necessarily mean the resulting data is correct.

## STEP 4. SQL Analysis
The cleaned Employee, Engagement and Training tables were used to answer stakeholder-focused questions. The analysis was divided into single-table, two-table and three-table analysis.

1. **Workforce Analysis**
- What is the current workforce distribution by employee status?
- WHich departemnt has the highest number of employees?
- How does employee performance vary across departments?
- What is the distribution of employee performance ratings?
2. **Employee Engagement Analysis**
- What is the average engagement, satisfaction and work-life balance score?
- How does employee engagement vary across survey periods?
3. **Training Analysis**
- Which training programs are most commonly attended?
- Which training programs have the highest average training cost?
- Which training programs have the best training outcomes?
4. **Employee + Engagement Analysis**
- Does employee performance differ between employees with high and low engagement?
- Which departments have the highest employee engagement?
- Does employee status relate to engagement?
5.**Employee + Training Analysis**
- How many employees have received training, by department?
- Which departments receive the most training investment?
6. **Three-Table Analysis**
- How do training participation, engagement and performance relate?
- Which departments have the strongest combination of performance, engagement and training participation?

## Key Insights
The analysis produced several findings relating to workforce composition, employee engagement, performance and training.

## Power BI Dashboard
The cleaned SQL tables were connected to Power BI to create visual representations of the analysis. The Power BI report focuses on:
- workforce overview
- employee performance
- employee engagement
- training participation
- training costs
- departmental comparisons
- relationships between employee performance, engagement and training

## Key Skills Demonstrated
This project demonstrates practical experience with:

**SQL**
- SELECT
- WHERE
- GROUP BY
- ORDER BY
- COUNT
- COUNT DISTINCT
- AVG
- SUM
- CASE
- INNER JOIN
- LEFT JOIN
- TRY_CONVERT
- ALTER TABLE
- UPDATE
- data validation
- data profiling
- exploratory data analysis
- multi-table analysis

**Data Cleaning**
- identifying incorrect data types
- converting text to dates
- converting text to numerical values
- handling blank values
- investigating NULL values
- checking duplicates
- validating identifiers
- creating analysis-ready tables

**Data Analysis**
- descriptive analysis
- workforce analysis
- engagement analysis
- training analysis
- cross-table analysis
- stakeholder-focused questioning
- business insight generation
- Visualization
- Power BI
- KPI development
- dashboard design
- communicating analytical findings

## Conclusion
This project demonstrates how SQL can be used beyond simple querying to perform a complete data analysis workflow. Starting with raw employee-related datasets, I profiled the data, identified data-quality and formatting issues, created cleaned tables, validated the transformations, analyzed relationships across employee, engagement and training data, and translated the findings into business-focused insights. The cleaned data was then connected to Power BI for visualization and reporting.
