# Pewlett_Hackard_Analysis

## Overview of the analysis
The purpose of this analysis is to determine the number of retiring employees per title and identify employees who are eligible to participate in a mentorship program. 

## Results - Four Tables
### A Retirement Titles table was created to show employees who are born between January 1, 1952 and December 31, 1955 and the table was exported as retirement_titles.csv. This table had duplicate lines for the same employee if the employee had changed titles during their tenure at the company.
### A Unique Titles table was created with the employee number, first and last name, and most recent title. The code for the Unique Titles table eliminated duplicate entries for employees. The Unique Titles table was exported as unique_titles.csv.
### A Retiring Titles table was executed to show the number of titles filled by employees who are retiring. The Retiring Titles table was exported as retiring_titles.csv. The table is linked here (https://github.com/sjhennessy/Pewlett_Hackard_Analysis/blob/main/Module_7%20_Deliverable_1.PNG).
### A Mentorship Eligibility table was created with data that holds the current employees who were born between January 1, 1965 and December 31, 1965. These employees are eligible to participate in a mentorship program. The Mentorship Eligibility table was exported and saved as mentorship_eligibility.csv.

## Summary: Provide high-level responses to the following questions, then provide two additional queries or tables that may provide more insight into the upcoming "silver tsunami."
### How many roles will need to be filled as the "silver tsunami" begins to make an impact? 90,396 roles will need to be filled for the positions of senior engineer, senior staff, engineer, staff, technique leader, and assistant engineer. Only 2 manager roles will need to be filled. The HR department will need to start recruiting heavily to start filling the staff roles. A good method to fill roles is to offer employees a bonus if they recruit contacts to interview at Pewlett Hackard. A more substantial bonus can be awarded if the contact becomes an employee at the company.
### Are there enough qualified, retirement-ready employees in the departments to mentor the next generation of Pewlett Hackard employees? Yes, there are 1,550 employees that are eligible for the mentorship program. Assuming the 90,396 employees retire over a period of 10 years, each mentor would have 5 mentees every year for 10 years. If most of the employees start retiring in a 5-year period, then there would not be a sufficient number of mentors and the burden would be too great for the 1,550 eligible mentors.  
### I suggest expanding mentorship eligibility to employees with birthdates in 1966, 1967, and 1968 in addition to the mentors born in 1965. This would greatly expand the number of mentors and the following code was programmed in pgAdmin:
#### SELECT DISTINCT ON (emp_no) emp_no,
#### first_name, last_name, birth_date, 
#### from_date, to_date, 
#### title
#### INTO expand_mentorship
#### FROM mentorship_eligibility
#### WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
#### AND (birth_date BETWEEN '1966-01-01' AND '1968-12-31')
#### AND (to_date = '9999-01-01')
#### ORDER BY emp_no;
### Another table that would help management is to further study the senior engineer and senior staff roles to determine their retiring plans. These two roles account for 63.8% of the retiring employees. A survey could be distributed to the employees in these two roles and get more data about their planned year of retirement. This will give the HR department knowledge for number of people to hire each year. 
