-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) first_name, last_name
FROM employees

SELECT * 
FROM title;

SELECT title, from_date, to_date
FROM title;

SELECT em.emp_no, em.first_name, em.last_name, em.birth_date, ti.title, ti.from_date, ti.to_date
INTO temp_table
FROM employees as em
JOIN title as ti ON
em.emp_no = ti.emp_no;

SELECT emp_no, first_name, last_name, title, from_date, to_date
INTO retirement_titles
FROM temp_table
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

DROP TABLE temp_table:

SELECT * from retirement_titles

SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no ASC, to_date DESC;

SELECT * FROM unique_titles;

SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY unique_titles.title
ORDER BY count DESC;

SELECT * FROM retiring_titles;

