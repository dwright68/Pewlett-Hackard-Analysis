SELECT e.emp_no, e.first_name, e.last_name,
       t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
-- INTO unique_titles
INTO nameyourtable
FROM retirement_titles as rt
ORDER BY to_date DESC;

 -- make retirement titles table
SELECT e.emp_no, e.first_name, e.last_name,
       t.title, t.from_date, t.to_date
INTO retirement_titles
FROM employees AS e
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no ASC;

-- Use Distinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
ORDER BY emp_no ASC, to_date DESC;


-- Number of employees to retire by title
SELECT COUNT(ut.title)
-- INTO reitring_titles
FROM unique_titles as ut
GROUP BY title
ORDER BY COUNT(title) DESC;


-- Mentor eligibilty 
SELECT DISTINCT ON (e.emp_no)e.emp_no, 
       e.first_name, 
       e.last_name, 
       e.birth_date,
       de.from_date,
       de.to_date,
       t.title
FROM employees AS e
-- INTO mentors
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '1/1/9999') AND 
(e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no