USE mi_bd;

SHOW TABLES;

SELECT * FROM empleados;
SELECT * FROM ventas;
SELECT * FROM departamentos;
SELECT * FROM productos;
SELECT * FROM clientes;

/* Ejercicios JOIN Parte 1 */

/* Encuentra el nombre y apellido de los empleados junto con la cantidad total de ventas que han realizado. */

SELECT empleados.nombre, empleados.apellido, ventas.monto_total
FROM empleados
JOIN ventas
ON  empleados.id = ventas.id;

/* Calcula el monto total vendido a cada cliente y muestra el nombre del cliente, su dirección y el monto total. */

SELECT clientes.nombre, clientes.direccion, ventas.monto_total
FROM clientes
JOIN ventas
on clientes.id = ventas.id;

/* Encuentra los productos vendidos por cada empleado en el departamento de 
"Ventas" y muestra el nombre del empleado junto con el nombre de los productos que han vendido. */

SELECT empleados.nombre AS Nombre, ventas.cantidad AS Cantidad,  productos.nombre AS Productos
FROM empleados
INNER JOIN ventas
ON empleados.id = ventas.id
INNER JOIN productos
ON empleados.id = productos.id;

/* Encuentra el nombre del cliente, el nombre del producto y la cantidad 
comprada de productos con un precio superior a $500. */

SELECT clientes.nombre, productos.nombre, ventas.cantidad
FROM clientes
INNER JOIN productos
ON clientes.id = productos.id
INNER JOIN ventas
ON clientes.id = ventas.id
WHERE ventas.precio_unitario > 500;

/* Ejercicios JOIN Parte 2 */

/* Calcula la cantidad de ventas por departamento, incluso si el departamento no tiene ventas. */
SELECT departamentos.nombre, COUNT(ventas.id)
FROM ventas
RIGHT JOIN empleados
ON empleados.id = ventas.empleado_id
INNER JOIN departamentos
ON departamentos.id = empleados.departamento_id
GROUP BY departamentos.id;

/* Encuentra el nombre y la dirección de los clientes que han comprado más de 3 productos y 
muestra la cantidad de productos comprados. */

SELECT clientes.nombre, productos.nombre, SUM(ventas.cantidad)
FROM ventas
INNER JOIN clientes
ON clientes.id = ventas.cliente_id
INNER JOIN productos
ON productos.id = ventas.producto_id
GROUP BY clientes.nombre, productos.nombre
HAVING SUM(ventas.cantidad) > 3;

/* Calcula el monto total de ventas realizadas por cada departamento y 
muestra el nombre del departamento junto con el monto total de ventas. */

SELECT departamentos.nombre, SUM(ventas.monto_total)
FROM ventas
INNER JOIN empleados 
ON empleados.id = ventas.empleado_id
INNER JOIN departamentos 
ON departamentos.id = empleados.departamento_id
GROUP BY departamentos.id;
