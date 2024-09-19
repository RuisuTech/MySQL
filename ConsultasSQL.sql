SHOW DATABASES;

CREATE DATABASE mi_bd;

CREATE DATABASE mi_bd_2;
DROP DATABASE mi_bd_2;

USE mi_bd;

CREATE TABLE empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    edad INT,
    salario DECIMAL(10, 2),
    fecha_contratacion DATE
);

SELECT * FROM empleados;

UPDATE empleados SET salario = 2700.00 WHERE nombre = 'Juan';
DELETE FROM empleados WHERE nombre = 'Juan';

SELECT nombre, salario FROM empleados WHERE edad > 25;