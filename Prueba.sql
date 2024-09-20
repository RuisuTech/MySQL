use mi_bd;
select * from empleados;
select * from departamentos;
select * from ventas;
select * from productos;
select * from clientes;

select empleados.nombre, empleados.edad, departamentos.nombre FROM empleados join departamentos on empleados.departamento_id = departamentos.id;
SELECT * FROM empleados, departamentos WHERE empleados.departamento_id = departamentos.id;
SELECT ventas.*, empleados.nombre, empleados.apellido 
FROM ventas 
join empleados 
on ventas.empleado_id = empleados.id;

SELECT ventas.*, productos.nombre
FROM ventas
JOIN productos
ON ventas.producto_id = productos.id;

SELECT ventas.*, clientes.nombre
FROM ventas
JOIN clientes
ON ventas.cliente_id = clientes.id;

select ventas.*, empleados.nombre, empleados.apellido
FROM ventas
JOIN empleados
ON ventas.empleado_id = empleados.id;

select ventas.*, empleados.nombre, clientes.nombre
from ventas
join empleados
on ventas.empleado_id = empleados.id
join clientes
on ventas.cliente_id = clientes.id;

select empleados.nombre, departamentos.nombre, max(empleados.salario)
from empleados
join departamentos
on empleados.departamento_id = departamentos.id
group by empleados.nombre, departamentos.nombre;


/*Crea una tabla temporal de la tabla clientes donde solo tengas la columna nombre.*/
DROP TEMPORARY TABLE IF EXISTS clientes_nombres;
CREATE TEMPORARY TABLE clientes_nombres
SELECT nombre
FROM clientes;

TABLE clientes_nombres;