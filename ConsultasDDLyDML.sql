/* DIA 1 */
CREATE DATABASE mi_bd;

USE mi_bd;

CREATE TABLE empleados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    edad INT,
    salario DECIMAL(10, 2),
    fecha_contratacion DATE
);

/* DIA 2 */
ALTER TABLE empleados
MODIFY COLUMN edad INT NOT NULL;

ALTER TABLE empleados
MODIFY COLUMN salario INT DEFAULT 0;

ALTER TABLE empleados
ADD COLUMN departamento VARCHAR(50);

ALTER TABLE empleados
ADD COLUMN correo_electronico VARCHAR(100);

ALTER TABLE empleados DROP COLUMN fecha_contratacion;

ALTER TABLE empleados
ADD COLUMN fecha_contratacion DATE DEFAULT (CURRENT_DATE);

CREATE TABLE departamentos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

ALTER TABLE empleados
ADD COLUMN departamento_id INT;

ALTER TABLE empleados
ADD FOREIGN KEY (departamento_id) REFERENCES departamentos(id);

ALTER TABLE empleados DROP COLUMN departamento;

INSERT INTO departamentos (nombre)
VALUES ('Ventas');

INSERT INTO departamentos (nombre)
VALUES ('Recursos Humanos');

INSERT INTO empleados (
        nombre,
        apellido,
        edad,
        salario,
        correo_electronico,
        departamento_id
    )
VALUES (
        'Ana',
        'Rodríguez',
        28,
        3000.00,
        'anarodriguez@mail.com',
        1
    );

INSERT INTO empleados (
        nombre,
        apellido,
        edad,
        salario,
        correo_electronico,
        departamento_id
    )
VALUES (
        'Carlos',
        'López',
        32,
        3200.50,
        'carloslopez@mail',
        2
    );

INSERT INTO empleados (
        nombre,
        apellido,
        edad,
        salario,
        correo_electronico,
        departamento_id
    )
VALUES (
        'Laura',
        'Pérez',
        26,
        2800.75,
        'lauraperez@mail.com',
        1
    );

INSERT INTO empleados (
        nombre,
        apellido,
        edad,
        salario,
        correo_electronico,
        departamento_id
    )
VALUES (
        'Martín',
        'González',
        30,
        3100.25,
        'martingonzalez@mail.com',
        2
    );

UPDATE empleados
SET salario = salario * 1.1
WHERE nombre = 'Ana';

INSERT INTO departamentos (nombre)
VALUES ('Contabilidad');

UPDATE empleados
SET departamento_id = 3
WHERE nombre = 'Carlos';

DELETE FROM empleados
WHERE nombre = 'Laura';

SELECT *
FROM empleados;

SELECT *
FROM departamentos;

CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    direccion VARCHAR(100)
);

CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    precio DECIMAL(10, 2)
);

CREATE TABLE ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    producto_id INT,
    cliente_id INT,
    cantidad INT,
    precio_unitario DECIMAL(10, 2),
    monto_total DECIMAL(10, 2),
    empleado_id INT
);

ALTER TABLE ventas
ADD FOREIGN KEY (producto_id) REFERENCES productos(id),
    ADD FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    ADD FOREIGN KEY (empleado_id) REFERENCES empleados(id);

INSERT INTO clientes (nombre, direccion)
VALUES ('Juan Pérez', 'Libertad 3215, Mar del Plata,');

INSERT INTO productos (nombre, precio)
VALUES ('Laptop', 1200.00);

ALTER TABLE ventas
MODIFY monto_total DECIMAL(10, 2) GENERATED ALWAYS AS (cantidad * precio_unitario) STORED;

INSERT INTO ventas (
        producto_id,
        cliente_id,
        cantidad,
        precio_unitario,
        empleado_id
    )
VALUES (1, 1, 2, 1350.00, 1);

SELECT *
FROM ventas;