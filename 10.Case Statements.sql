-- Case Statements

SELECT first_name,last_name,age,
CASE 
	WHEN age <= 30 THEN 'Younger'
    WHEN age BETWEEN 31 AND 50 THEN 'Old'
    WHEN age >= 50 THEN "On Death's Door"
END AS Age_Braket
FROM employee_demographics;

-- Pay Increase and Bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% bonus

SELECT first_name, last_name,occupation,salary,
CASE
	WHEN salary < 50000 THEN salary * 1.05
    WHEN salary > 50000 THEN salary * 1.07
END AS New_Salary,
CASE
	WHEN dept_id = 6 THEN salary * 0.10
END AS Bonus
FROM employee_salary;


SELECT *
FROM employee_salary;

SELECT *
FROM parks_departments;

-- We Case to add some logic and some you know labelingor even do calculation  
-- like we did right here with the salary --------
