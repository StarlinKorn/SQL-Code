-- Subqueries

SELECT * 
FROM employee_demographics
WHERE employee_id IN
				(SELECT employee_id
					FROM employee_salary
                    WHERE dept_id = 1);



SELECT first_name, last_name, 
salary,AVG(salary),
(SELECT AVG(salary)
FROM employee_salary)
FROM employee_salary
GROUP BY first_name, last_name, 
salary
;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;

SELECT AVG(avg_age), AVG(max_age), AVG(min_age),AVG(count_age)
FROM
(SELECT gender, AVG(age) AS avg_age, MAX(age) AS max_age,
MIN(age) AS min_age, COUNT(age) AS count_age
FROM employee_demographics
GROUP BY gender) AS AVG_age 
;
-- Subqueries is creating this kind of like temp table
-- or creating an own little output then the query off of it and we alway use advanced
-- calcutations


