# Employee-Workforce-SQL-Analysis
SQL Server project analyzing employee workforce, engagement, performance, and training data through data cleaning, analysis, and business insights.
## Employee Workforce, Engagement & Training Analysis
### Project Overview
This project analyzes employee workforce, employee engagement, and training data using SQL Server Management Studio (SSMS).
The project was developed as a practical SQL portfolio project to demonstrate the complete data analysis process, from working with raw and messy data through data profiling, cleaning, validation, exploratory analysis, SQL querying, and business insight generation.

The analysis focuses on three main areas:
- Employee workforce and performance
- Employee engagement and satisfaction
- Training participation, outcomes and cost

The project also includes a recruitment dataset that was imported and investigated but was not included in the final analysis scope.

### Business Objective
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

### Project Workflow
Raw CSV Data
      ↓
Data Profiling / EDA
      ↓
Data Cleaning
      ↓
Data Validation
      ↓
SQL Analysis
      ↓
Business Insights
      ↓
Power BI Visualization

### 1. Data Profiling & Exploratory Data Analysis
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

### 2. Data Cleaning
Instead of modifying the raw tables directly, cleaned copies were created. The general structure was:

Raw Table
   ↓
Profiling
   ↓
Cleaning
   ↓
Clean Table

For example:

Employee_Data
      ↓
Employee_Data_Clean

This approach preserved the original data while allowing the cleaned tables to be used for analysis.









