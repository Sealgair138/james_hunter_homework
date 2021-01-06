-- MVP
-- Q1 Are there any pay_details records lacking both a local_account_no and iban number?
SELECT *
FROM pay_details
WHERE iban IS NULL AND local_account_no IS NULL
ORDER BY id;

-- NO RESULTS

-- MVP
-- Q2 Get a table of employees first_name, last_name and country,
-- ordered alphabetically first by country and then by last_name (put any NULLs last).

SELECT
	first_name,
	last_name,
	country
FROM employees
ORDER BY 
	country ASC NULLS LAST,
	last_name ASC NULLS LAST;

-- MVP
-- Q3 Find the details of the top ten highest paid employees in the corporation.
SELECT
	*
FROM employees
ORDER BY salary DESC NULLS LAST
LIMIT 10;

-- MVP
-- Q4 Find the first_name, last_name and salary of the lowest paid employee in Hungary.
SELECT
	first_name,
	last_name,
	salary,
	country
FROM employees
WHERE country = 'Hungary'
ORDER BY salary DESC
LIMIT 1;

-- MVP
-- Q5 Find all the details of any employees with a ‘yahoo’ email address?
SELECT
	*
FROM employees
WHERE email LIKE '%yahoo%';

-- MVP
-- Q6 Provide a breakdown of the numbers of employees enrolled, not enrolled,
-- and with unknown enrollment status in the corporation pension scheme.
SELECT 
  pension_enrol AS enrolled, 
  COUNT(id) AS num_employees
FROM employees
GROUP BY pension_enrol;

-- MVP
-- Q7
-- What is the maximum salary among those employees in the ‘Engineering’ department who work 1.0 full-time equivalent hours (fte_hours)?
SELECT 
	MAX(salary)
FROM employees
WHERE department = 'Engineering' AND fte_hours = 1.0;

-- MVP
-- Q8
-- Get a table of country, number of employees in that country, and the average salary of employees in 
-- that country for any countries in which more than 30 employees are based. Order the table by average salary descending.
SELECT 
	country, 
	count(id) AS employees, 
 	AVG(salary) AS avg_salary
FROM employees
GROUP BY country
HAVING COUNT(id) > 30
ORDER BY avg_salary DESC ;

-- MVP
-- Q9
-- Return a table containing each employees first_name, last_name, full-time equivalent hours 
-- (fte_hours), salary, and a new column effective_yearly_salary which should contain fte_hours multiplied by salary.
SELECT 
  	first_name,
  	last_name,
  	fte_hours,
  	salary,
  	fte_hours * salary AS effective_yearly_salary
FROM employees;

-- MVP
-- Q10
-- Find the first name and last name of all employees who lack a local_tax_code.
SELECT 
  	first_name, 
  	last_name
FROM employees AS emp 
	INNER JOIN pay_details AS payd
ON emp.pay_detail_id = payd.id
WHERE payd.local_tax_code IS NULL;

-- MVP
-- Q11
-- The expected_profit of an employee is defined as (48 * 35 * charge_cost - salary) * fte_hours, 
-- where charge_cost depends upon the team to which the employee belongs. Get a table showing expected_profit for each employee.

-- MVP
-- Q12
-- Return a table of those employee first_names shared by more than one employee, together with a count of the number of 
-- times each first_name occurs. Omit employees without a stored first_name from the table. Order the table descending by count, 
-- and then alphabetically by first_name.


























