-- Joins
-- Joins is allow you to combine tow tables or more together if they have a common colunm.

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

SELECT emp1.employee_id, age, occupation
FROM employee_demographics AS emp1
INNER JOIN employee_salary AS emp2
	ON emp1.employee_id = emp2.employee_id
;

-- Outer Joins

SELECT *
FROM employee_demographics AS emp1
RIGHT JOIN employee_salary AS emp2
	ON emp1.employee_id = emp2.employee_id
;

-- Seft Join

SELECT
emp2.employee_id AS emp_name,
emp2.first_name AS first_name_emp,
emp2.last_name AS first_name_emp,
emp1.age AS age_sal,
emp1.gender,
emp1.birth_date AS birth_date_sal,
emp2.occupation,
emp2.salary AS salary,
emp2.dept_id,
pd.department_name,
pd.department_id
FROM employee_salary emp2
LEFT JOIN employee_demographics emp1
	ON emp2.employee_id  = emp1.employee_id
LEFT JOIN parks_departments pd
	ON emp2.dept_id = pd.department_id
;

-- Joining multiple table together

SELECT *
FROM employee_demographics AS dem 
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments pd
	ON sal.dept_id = pd.department_id
;

SELECT *
FROM parks_departments
;

SELECT *
FROM employee_demographics emp1
RIGHT JOIN employee_salary emp2
	ON emp1.employee_id = emp2.employee_id
INNER JOIN parks_departments parks
	ON emp2.dept_id = parks.department_id
    ;

