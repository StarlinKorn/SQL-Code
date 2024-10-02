-- Group By ( The values is not the same)

SELECT *
FROM employee_demographics;

SELECT gender, AVG(age), MAX(age), MIN(age),COUNT(age)
FROM employee_demographics
GROUP BY gender -- 1 values but select avarage, min, max, it okay.
;

SELECT occupation
FROM employee_salary
GROUP BY occupation -- Office Manager
;

SELECT occupation, salary
FROM employee_salary
GROUP BY occupation, salary -- 2 Values is not the same 
;

-- ORDER BY
-- Order By is the sort result set in either ascending or descending order.
SELECT *
FROM employee_demographics
ORDER BY gender, age DESC
;
