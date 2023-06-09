# HR_EMPLOYEE-REPORT

![](HR_DASHBOARD.png)
***

## Introduction

This is an sql and power BI project on HR employee data having 22000 rows from the year 2000 to 2020 of a named organization. This project is to analyze and derive insights to answer crutial questions and help the stakeholders in appropriate decisions regarding employees.
You can interact with the report {here](https://app.powerbi.com/groups/me/reports/e50bfcd3-ef12-4e5c-8f1a-dd10cc39df14/ReportSection?experience=power-bi)

## Problem Statements

1. What is the gender breakdown of employees in the company?
2. What is the race/ethnicity breakdown of employees in the company?
3. What is the age distribution of employees in the company?
4. How many employees work at headquarters versus remote locations?
5. What is the average length of employment for employees who have been terminated?
6. How does the gender distribution vary across departments and job titles?
7. What is the distribution of job titles across the company?
8. Which department has the highest turnover rate?
9. What is the distribution of employees across locations by state?
1o. How has the company's employee count changed over time based on hire and term dates?
11. What is the tenure distribution for each department?

## Summary Of Findings

- There are more male employees
- White race is the most dominant while Native Hawaiian and American Indian are the least dominant.
- The youngest employee is 20 years old and the oldest is 57 years old.
- 6 age groups were created (18-23, 24-33, 34-43, 44-53, 54-63, 64+). A large number of employees were between 24-33 followed by 44-53 while the smallest group was 64+.
- A large number of employees work at the headquarters versus remotely.
- The average length of employment for terminated employees is around 7 years.
- The gender distribution across departments is fairly balanced but there are generally more male than female employees.
- The Marketing department has the highest turnover rate followed by Training. The least turn over rate are in the Research and development, Support and Legal departments.
- A large number of employees come from the state of Ohio.
- The net change in employees has increased over the years.
- The average tenure for each department is about 8 years with Legal and Auditing having the highest and Services, Sales and Marketing having the lowest.

## Limitations

- Some records had negative ages and these were excluded during querying(967 records). Ages used were 18 years and above.
- Some termdates were far into the future and were not included in the analysis(1599 records). The only term dates used were those less than or equal to the current date.
