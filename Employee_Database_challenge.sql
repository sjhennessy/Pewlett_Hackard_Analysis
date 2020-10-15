Employee_Database_challenge.sql

-- Deliverable #1a retiring_by_title
SELECT employees.emp_no,employees.first_name, employees.last_name, titles.title, 
	titles.from_date, titles.to_date
INTO retiring_by_title
FROM employees
INNER JOIN titles
ON (employees.emp_no = titles.emp_no)
WHERE (employees.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no

-- Check the table
SELECT * FROM retiring_by_title;

--Deliverable #1b unique_titles
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retiring_by_title
ORDER BY emp_no, to_date DESC;

-- Check the table
SELECT * FROM unique_titles;

--Deliverable #1c Retiring_titles
SELECT COUNT (title), title
INTO Retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT (title) DESC;

-- Check the table
SELECT * FROM Retiring_titles;

--Deliverable #2 Mentorship
SELECT DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name, e.last_name, e.birth_date, 
	de.from_date, de.to_date, 
	t.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
INNER JOIN dept_employee AS de
ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	 AND (de.to_date = '9999-01-01')
ORDER BY emp_no;

-- Check the table
SELECT * FROM mentorship_eligibility;