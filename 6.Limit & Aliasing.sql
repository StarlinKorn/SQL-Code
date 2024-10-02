-- Limit & Aliasing
-- Limit is just a spacify how many rows want in your output. 
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 1, 1
;

-- Aliasing 
-- Aliasing (AS) is chage the name of the colunm.
SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
;


