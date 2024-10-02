-- String Functions

SELECT LENGTH('skyfall'); -- ==> 7

SELECT first_name, LENGTH(first_name) -- stalin ==> 6
FROM employee_demographics
ORDER BY 2
;
SELECT UPPER('stalin korn') AS Upper; -- a --> A
SELECT LOWER('STALIN KORN') AS Lower; -- A --> a

SELECT first_name, UPPER(first_name) -- a --> A
FROM employee_demographics;

SELECT first_name, UPPER(first_name), -- a --> A
LTRIM('           stalin             '), -- stalin
RTRIM('           stalin             ')  --              stalin
FROM employee_demographics;



SELECT first_name, 
LEFT(first_name,4), -- 4 letter of first_name start to left
RIGHT(first_name,3), -- 3 letter of first_name start to right
SUBSTRING(first_name,3,2), -- > find the position letter
birth_date,
SUBSTRING(birth_date,6,2) AS birth_Month -- >find Month
FROM employee_demographics;

SELECT first_name,
REPLACE(first_name,'a','x') -- Mark --> Mxrk
FROM employee_demographics;

SELECT LOCATE('L','stalin'); -- 4

SELECT first_name,
LOCATE('an',first_name) AS Find_AN -- Ann Andy
FROM employee_demographics;

SELECT first_name,last_name,
CONCAT(first_name,' ',last_name) AS Full_Name
FROM employee_demographics;