SELECT DISTINCT (em.emp_no), em.first_name, em.last_name, em.birth_date, ti.title, ti.from_date, ti.to_date
INTO temp_table
FROM employees as em
JOIN title as ti 
ON em.emp_no = ti.emp_no;

SELECT *
FROM temp_table

SELECT emp_no, first_name, last_name, title, from_date, to_date
INTO retirement_titles
FROM temp_table
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT *
FROM retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title
INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

SELECT * FROM unique_titles;

SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY unique_titles.title
ORDER BY count DESC;

SELECT * FROM retiring_titles;


SELECT DISTINCT ON (emp_no) employees.emp_no, first_name, last_name, birth_date, dept_emp.from_date, dept_emp.to_date, title
INTO mentor
FROM employees
JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
JOIN title ON employees.emp_no = title.emp_no
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31' AND dept_emp.to_date = '9999-01-01')
ORDER BY emp_no;

SELECT * FROM mentor













