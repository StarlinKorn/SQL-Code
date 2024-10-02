-- Window Functions

SELECT gender, AVG(salary) AS avg_salary
FROM employee_demographics dem
RIGHT JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
;

SELECT gender,sal.first_name, sal.last_name,salary,
AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem
RIGHT JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

SELECT gender,sal.first_name, sal.last_name,salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY sal.employee_id) AS Rolling_Total
FROM employee_demographics dem
RIGHT JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

SELECT sal.employee_id, sal.first_name, sal.last_name,gender,salary,
ROW_NUMBER() OVER( PARTITION BY gender ORDER BY salary DESC) AS RoWW_Number,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS Rank_Number,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS Dense_Rank_Number
FROM employee_demographics dem
RIGHT JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;