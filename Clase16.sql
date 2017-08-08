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


UPDATE employees 
SET 
    lastName = 'Phan'
WHERE
    employeeNumber = 1056;
    
SELECT 
    *
FROM
    employees_audit;

    
-- Ejercicio 1

insert  into `employees`(`employeeNumber`,`lastName`,`firstName`,`extension`,`email`,`officeCode`,`reportsTo`,`jobTitle`) values 
(23,'Morales','Juana','sasa',NULL,'23',NULL,'Nada')
    
-- Column email cannot be null because at the time to create the table, we set it like NOT NULL
    
-- Ejercicio 2
SELECT *
FROM employees

UPDATE employees SET employeeNumber = employeeNumber - 20 -- all the employeeNumbers was subtracted 20

UPDATE employees SET employeeNumber = employeeNumber + 20 -- cannot add 20 because the other employee has exactly 20 less, 
														  -- so for a moment there are two primary keys with the same value
														  
-- Ejercicio 3
ALTER TABLE employees
DROP COLUMN age

ALTER TABLE employees
ADD age INT NOT NULL CHECK(age BETWEEN 16 AND 70) -- not funciona :(

insert  into `employees`(`employeeNumber`,`lastName`,`firstName`,`extension`,`email`,`officeCode`,`reportsTo`,`jobTitle`, `age`) values 
(24,'Mico','Sena','2121','email','21',NULL,'Nada', 15);

-- Ejercicio 4

-- the actor and film tables has their own primary keys actor_id and film_id
-- with the film_actor table, they reference their primary keys to this table so can be related the actor table with the film table

-- Ejercicio 5






