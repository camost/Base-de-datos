CREATE TABLE `employees` (
  `employeeNumber` int(11) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `officeCode` varchar(10) NOT NULL,
  `reportsTo` int(11) DEFAULT NULL,
  `jobTitle` varchar(50) NOT NULL,
  PRIMARY KEY (`employeeNumber`)
);
insert  into `employees`(`employeeNumber`,`lastName`,`firstName`,`extension`,`email`,`officeCode`,`reportsTo`,`jobTitle`) values 
(1002,'Murphy','Diane','x5800','dmurphy@classicmodelcars.com','1',NULL,'President'),
(1056,'Patterson','Mary','x4611','mpatterso@classicmodelcars.com','1',1002,'VP Sales'),
(1076,'Firrelli','Jeff','x9273','jfirrelli@classicmodelcars.com','1',1002,'VP Marketing');

CREATE TABLE employees_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employeeNumber INT NOT NULL,
    lastname VARCHAR(50) NOT NULL,
    changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL
);

DELIMITER $$
CREATE TRIGGER before_employee_update 
    BEFORE UPDATE ON employees
    FOR EACH ROW 
BEGIN
    INSERT INTO employees_audit
    SET action = 'update',
     employeeNumber = OLD.employeeNumber,
        lastname = OLD.lastname,
        changedat = NOW(); 
END$$
DELIMITER ;



UPDATE employees 
SET 
    lastName = 'Phan'
WHERE
    employeeNumber = 1056;
    
SELECT * FROM employees_audit;

 
-- Ej 1: Insert a new employee to , but with an null email. Explain what happens.
INSERT INTO sakila.employees
(employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle)
VALUES(0, 'Sosa', 'Camilo', '5105', NULL, '1', 1002, 'Terminator');
-- No se puede crear un empleado con email nulo porque cuando creamos la tabla pusimos `email` varchar(100) NOT NULL
-- Por lo tanto no se puede setear como nulo el valor del email


-- Ej 2:Run the first the query
UPDATE employees set employeeNumber = employeeNumber - 20;

-- What did happen? Explain.
-- Le quito a cada empleado, en employeeNumbre 20 de su valor original 
SELECT * FROM employees;

-- Then run this other
UPDATE employees set employeeNumber = employeeNumber + 20;

-- El mensaje que me devuelve es: SQL Error [1062] [23000]: Duplicate entry '1056' for key 'PRIMARY'
-- Lo que pasa es que un empleado (Phan) tiene justo 20 menos que otro (Firrelli) entonces cuando quiere sumarle 20 
-- a employeeNumber (de Phan) se vuelven los dos empleados con el mismo employeeNumber (Firrelli y Phan). Como es la primary key 
-- no se puede repetir entonces te devuelve ese error.

-- Ej 3: Add a age column to the table employee where and it can only accept values from 16 up to 70 years old.
ALTER TABLE employees
	ADD `age` INT NOT NULL CHECK (age >=16 AND age <=70);



-- Ej 4: Describe the referential integrity between tables film, actor and film_actor in sakila db.
	