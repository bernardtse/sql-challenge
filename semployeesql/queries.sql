-- 1. List the employee number, last name, first name, sex, and salary of each employee.
-- First Name is listed BEFORE Last Name.

SELECT e.emp_no AS "Employee Number", e.first_name AS "First Name", e.last_name AS "Last Name", e.sex AS "Sex", s.salary AS "Salary"
FROM employees e
LEFT JOIN salaries s
ON e.emp_no = s.emp_no
ORDER BY e.emp_no;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
-- Reference: https://www.postgresql.org/docs/8.1/functions-datetime.html

SELECT e.first_name AS "First Name", e.last_name AS "Last Name", e.hire_date AS "Hire Date"
FROM employees e
WHERE EXTRACT(YEAR FROM e.hire_date) = 1986
ORDER BY hire_date; 

-- 3. List the manager of each department along with their department number, department name, employee number, last name, and first name.
-- First Name is listed BEFORE Last Name.
-- Department information is listed BEFORE managers' (employee) information.

SELECT dm.dept_no AS "Department Number", d.dept_name AS "Department Name", dm.emp_no AS "Employee Number", e.first_name AS "First Name", e.last_name as "Last Name"
FROM dept_manager dm
LEFT JOIN departments d
ON dm.dept_no = d.dept_no
LEFT JOIN employees e
ON dm.emp_no = e.emp_no
ORDER BY dm.dept_no;

-- 4. List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
-- First Name is listed BEFORE Last Name.
-- Employee information is listed BEFORE department information.

SELECT de.emp_no as "Employee Number", e.first_name AS "First Name", e.last_name AS "Last Name", de.dept_no AS "Department Number", d.dept_name AS "Department Name"
FROM dept_emp de
LEFT JOIN departments d
ON de.dept_no = d.dept_no
LEFT JOIN employees e
ON de.emp_no = e.emp_no
ORDER BY de.emp_no;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT e.first_name AS "First Name", e.last_name AS "Last Name", e.sex AS "Sex"
FROM employees e
WHERE LOWER(e.first_name) = 'hercules' AND LOWER(e.last_name) LIKE 'b%';

-- 6. List each employee in the Sales department, including their employee number, last name, and first name.
-- First Name is listed BEFORE Last Name

SELECT e.emp_no AS "Employee Number", e.first_name AS "First Name", e.last_name AS "Last Name"
FROM employees e
INNER JOIN dept_emp de
ON e.emp_no = de.emp_no
INNER JOIN departments d
ON de.dept_no = d.dept_no
WHERE LOWER(d.dept_name) = 'sales'
ORDER BY e.emp_no;

-- alternative method
-- First Name is listed BEFORE Last Name

SELECT e.emp_no AS "Employee Number", e.first_name AS "First Name", e.last_name AS "Last Name"
FROM employees e
WHERE e.emp_no IN
	(SELECT de.emp_no
	 FROM dept_emp de
	 WHERE de.dept_no IN
		(SELECT d.dept_no
		 FROM departments d
		 WHERE LOWER(d.dept_name) = 'sales'))
ORDER BY e.emp_no;


-- 7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
-- First Name is listed BEFORE Last Name

SELECT e.emp_no AS "Employee Number", e.first_name AS "First Name", e.last_name AS "Last Name", d.dept_name AS "Department Name"
FROM employees e
INNER JOIN dept_emp de
ON e.emp_no = de.emp_no
INNER JOIN departments d
ON de.dept_no = d.dept_no
WHERE LOWER(d.dept_name) = 'sales' OR LOWER(d.dept_name) = 'development'
ORDER BY e.emp_no;


-- 8. List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT e.last_name AS "Last Name", COUNT(e.last_name) AS "Count"
FROM employees e
GROUP BY e.last_name
ORDER BY "Count" DESC