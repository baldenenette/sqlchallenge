-- 1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT emp.emp_no, emp.last_name, emp.first_name, emp.gender, sal.salary
FROM employees AS emp
	LEFT JOIN salaries AS sal ON sal.emp_no = emp.emp_no
	
-- 2. List employees who were hired in 1986.
SELECT emp.last_name, emp.first_name, emp.gender,emp.hire_date
FROM employees AS emp 
WHERE emp.hire_date LIKE '1986%';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT dept.dept_no, dept.dept_name, ma.emp_no, emp.last_name, emp.first_name, ma.from_date, ma.to_date
FROM departments AS dept
INNER JOIN dept_manager AS ma ON
ma.dept_no = dept.dept_no
INNER JOIN employees AS emp ON
emp.emp_no = ma.emp_no;

-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT empl.emp_no, empl.last_name, empl.first_name, dp.dept_name
FROM employees AS empl
INNER JOIN dept_emp AS d ON
empl.emp_no = d.emp_no
INNER JOIN departments AS dp ON
dp.dept_no = d.dept_no;


-- 5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' 
OR departments.dept_name = 'Development';


-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
