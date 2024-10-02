SELECT * 
FROM employee_demographics;

SELECT * 
FROM employee_salary;

DELIMITER $$

CREATE TRIGGER employee_insert
AFTER INSERT ON employee_salary
FOR EACH ROW
BEGIN
    INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$

DELIMITER ;


INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES (13, 'Starlin', 'Kornak', 'Developer', 1000000, NULL);

-- DROP TRIGGER IF EXISTS employee_insert;
DESCRIBE employee_salary;

-- EVENTS

SELECT *
FROM employee_demographics;

DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE
    FROM employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;
-- DROP EVENT IF EXISTS delete_retirees;
SHOW VARIABLES LIKE 'event%';



