-- Temporary Table

CREATE TEMPORARY TABLE temp_table
(fist_name varchar(50),
last_name varchar(50),
salary varchar(100),
adress varchar(200)
);
SELECT *
FROM temp_table;


INSERT INTO temp_table
VALUE('Starlin', 'Korn', '50000', 'RMUTI Dormitory');

SELECT *
FROM temp_table;

SELECT *
FROM employee_salary;

CREATE TEMPORARY TABLE sal_over_50k
SELECT *
FROM employee_salary
WHERE salary >= 50000
;

SELECT *
FROM sal_over_50k;

