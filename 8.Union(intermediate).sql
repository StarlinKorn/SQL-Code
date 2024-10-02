-- Unions 

SELECT first_name,last_name
FROM employee_demographics
UNION ALL
SELECT first_name,last_name
FROM employee_salary
ORDER BY first_name;


SELECT first_name,last_name, 
age AS age_or_salary,
'Old Man' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'male'
UNION
SELECT first_name,last_name, 
age AS age_or_salary,
'Old Lady' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'female'
UNION  
SELECT first_name, last_name, salary AS age_or_salary,
'Highly Paid Employee' AS Label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name;
-- we using union to select statements all combined or combining the row to find the values.