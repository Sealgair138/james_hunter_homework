
-- Q1 Find all the employees who work in the ‘Human Resources’ department.
SELECT *
FROM employees
WHERE department = 'Human Resources';

-- Q2 Get the first_name, last_name, and country of the employees who work in the ‘Legal’ department.
SELECT first_name,
last_name, country
FROM employees
WHERE department = 'Legal';

-- Q3 Count the number of employees based in Portugal.
SELECT
COUNT(country) AS Portuguese_Staff
FROM employees
WHERE country = 'Portugal';

-- Q4 Count the number of employees based in either Portugal or Spain.
SELECT 
COUNT(country) AS Portuguese_Spanish_Staff
FROM employees
Where country = 'Portugal' OR country = 'Spain';

-- Q5 Count the number of pay_details records lacking a local_account_no.
SELECT *
FROM pay_details;

SELECT
COUNT(*) AS missing_account_details
FROM pay_details
WHERE local_account_no IS NULL;

-- Q6 Get a table with employees first_name and last_name ordered alphabetically by last_name (put any NULLs last).
SELECT first_name, last_name
FROM employees
ORDER BY last_name ASC NULLS LAST;

-- Q7 How many employees have a first_name beginning with ‘F’?
SELECT
COUNT(first_name) AS staff_with_f_as_first_name
FROM employees
WHERE first_name LIKE 'F%';

-- Q8 Count the number of pension enrolled employees not based in either France or Germany.
SELECT
COUNT(*) AS not_german_or_french_pensions
FROM employees
WHERE pension_enrol = TRUE AND country NOT IN ('France', 'Germany'); 

-- Q9 Obtain a count by department of the employees who started work with the corporation in 2003.
SELECT department,
COUNT(*) AS staff_started_2003
FROM employees
WHERE start_date >= '2003-01-01' AND start_date <= '2003-12-31'
GROUP BY department;

/* Q10 Obtain a table showing department, fte_hours and the number of employees in each department who work
 each fte_hours pattern. Order the table alphabetically by department, and then in ascending order of fte_hours.*/
SELECT department, fte_hours, id,
COUNT(id)
FROM employees AS number_of_Staff_in_fte_hours
WHERE fte_hours IS NOT NULL
ORDER BY department ASC, fte_hours ASC, SUM (id); --HARD PASS

/* Q11 Obtain a table showing any departments in which there are two or more employees lacking a stored first name. Order the
 * table in descending order of the number of employees lacking a first name, and then in alphabetical order by 
 * department. */
SELECT department, first_name,
COUNT(*) AS no_first_name
FROM employees
WHERE first_name = NULL
GROUP BY first_name;
























