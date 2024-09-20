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

/*Crea una tabla temporal de la tabla clientes donde solo tengas la columna nombre.*/
DROP TEMPORARY TABLE IF EXISTS clientes_nombres;
CREATE TEMPORARY TABLE clientes_nombres
SELECT nombre
FROM clientes;

TABLE clientes_nombres;

