 -- WHERE Clause (is the values is you want.)
 
SELECT *
FROM employee_salary
WHERE first_name = 'leslie'
;


SELECT *
FROM employee_salary
WHERE salary <= 50000
;

SELECT *
FROM employee_demographics
WHERE birth_date > "1980-01-01"
;

-- AND OR NOT -- Logical Operators
SELECT *
FROM employee_demographics
WHERE (first_name = 'leslie' AND age > 44) OR age > 44
;

-- LIKE Statement
-- % and _
SELECT *
FROM employee_demographics
WHERE birth_date LIKE '1989%'
;

