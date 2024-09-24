USE mi_bd;

/* Cláusula Table */

TABLE productos;

TABLE productos
LIMIT 15;

TABLE productos
ORDER BY precio ASC
LIMIT 10;

TABLE productos
ORDER BY precio DESC
LIMIT 10;

/* TABLAS TEMPORALES */

CREATE TEMPORARY TABLE nombre_tabla_Temporal(Id INT, nombre VARCHAR(50), edad INT);

/* Utiliza TABLE para consultar la tabla productos de manera simple, ordenando los productos de forma descendente por precio y solo 10 filas. */
TABLE productos
ORDER BY precio DESC
LIMIT 10;

/* Crea una tabla temporal de los empleados donde unifiques su nombre y apellido en una sola columna. */

TABLE empleados;
DROP TEMPORARY TABLE IF EXISTS nombres_apellidos;
CREATE TEMPORARY TABLE nombres_apellidos 
SELECT CONCAT(nombre, " - ", apellido) AS n
FROM empleados;
TABLE nombres_apellidos;

/* Crea una tabla temporal de la tabla clientes donde solo tengas la columna nombre. */
DROP TEMPORARY TABLE IF EXISTS clientes_nombres;
CREATE TEMPORARY TABLE clientes_nombres
SELECT nombre
FROM clientes;

TABLE clientes_nombres;

/* Realiza la unión entre las tablas temporales de empleados y clientes usando TABLE.*/
TABLE nombres_apellidos UNION TABLE clientes_nombres;

/* Crea una tabla temporal escuela primaria que tenga las siguientes columnas: id(int), 
nombre(varchar), apellido(varchar), edad(int) y grado(int). Y que tenga los siguientes valores: */
DROP TEMPORARY TABLE IF EXISTS primaria;
CREATE TEMPORARY TABLE primaria
(id int, nombre varchar(30), apellido varchar(30), edad int, grado int);

INSERT INTO primaria (id, nombre, apellido, edad, grado) VALUES
(1, 'Alejandro', 'González', 11, 5),
(2, 'Isabella', 'López', 10, 4),
(3, 'Lucas', 'Martínez', 11, 5),
(4, 'Sofía', 'Rodríguez', 10, 4),
(5, 'Mateo', 'Pérez', 12, 6),
(6, 'Valentina', 'Fernández', 12, 6),
(7, 'Diego', 'Torres', 10, 4),
(8, 'Martina', 'Gómez', 11, 5),
(9, 'Joaquín', 'Hernández', 10, 4),
(10, 'Valeria', 'Díaz', 11, 5);
TABLE primaria;


/* Ejercicios  Subconsultas All y Any */
/* Encuentra los empleados que ganan más que el salario promedio de los 
empleados del departamento de "Recursos Humanos". */
TABLE empleados;
TABLE departamentos;

SELECT nombre, apellido, departamento_id FROM empleados
WHERE salario > (
	SELECT AVG(em.salario) FROM empleados AS em
	INNER JOIN departamentos AS de
	ON de.id = em.id
	where de.nombre = "Recursos Humanos" /* 3360 */
);

/* Encuentra los productos que tienen un precio superior al precio de al 
menos uno de los productos vendidos al cliente con nombre "Ana Lopez". */
TABLE ventas;
TABLE productos;
TABLE clientes;

SELECT nombre FROM productos;

SELECT v.precio_unitario FROM ventas AS v
JOIN clientes AS c
ON v.cliente_id = c.id
WHERE c.nombre = "Ana Lopez";


SELECT nombre, apellido, departamento_id FROM empleados
WHERE salario > (
	SELECT AVG(em.salario) FROM empleados AS em
	INNER JOIN departamentos AS de
	ON de.id = em.id
	where de.nombre = "Recursos Humanos" /* 3360 */
);


