/* 
Crea una tabla llamada "envios" con cuatro columnas: "id" de tipo INT
como clave primaria y autoincremental, "fecha_envio" de tipo
DATETIME, "fecha_entrega" de tipo DATETIME y "codigo_producto" de
tipo VARCHAR(10). Luego, inserta siete filas en la tabla "envios" con los
siguientes datos:

Fecha Envío: '2022-01-15 08:00:00', Fecha Entrega: '2022-01-20
12:30:00', Código Producto: 'ABC123'.
Fecha Envío: '2022-02-10 10:15:00', Fecha Entrega: '2022-02-15
14:45:00', Código Producto: 'XYZ789'.
Fecha Envío: '2022-03-05 09:30:00', Fecha Entrega: '2022-03-10
13:20:00', Código Producto: 'PQR456'.
Fecha Envío: '2022-04-20 11:45:00', Fecha Entrega: '2022-04-25
15:10:00', Código Producto: 'LMN001'.
Fecha Envío: '2022-05-12 07:55:00', Fecha Entrega: '2022-05-17
10:25:00', Código Producto: 'DEF777'.
Fecha Envío: '2022-06-08 08:20:00', Fecha Entrega: '2022-06-13
12:40:00', Código Producto: 'GHI888'.
Fecha Envío: '2022-07-03 10:05:00', Fecha Entrega: '2022-07-08
14:15:00', Código Producto: 'JKL999'.
*/
DROP TABLE IF EXISTS envios;
CREATE TABLE envios (
id INT AUTO_INCREMENT PRIMARY KEY,
fecha_envio DATETIME,
fecha_entrega DATETIME,
codigo_producto VARCHAR(10)
);

INSERT INTO envios (fecha_envio, fecha_entrega, codigo_producto)
VALUES
('2022-01-15 08:00:00', '2022-01-20 12:30:00', 'ABC123'),
('2022-02-10 10:15:00', '2022-02-15 14:45:00', 'XYZ789'),
('2022-03-05 09:30:00', '2022-03-10 13:20:00', 'PQR456'),
('2022-04-20 11:45:00', '2022-04-25 15:10:00', 'LMN001'),
('2022-05-12 07:55:00', '2022-05-17 10:25:00', 'DEF777'),
('2022-06-08 08:20:00', '2022-06-13 12:40:00', 'GHI888'),
('2022-07-03 10:05:00', '2022-07-08 14:15:00', 'JKL999');

/* 
Utilizando la función DATE_ADD, calcula la fecha de entrega
programada para un envío con código de producto 'ABC123' cuando se
le añaden 5 días a la fecha de envío.
*/
SELECT DATE_ADD(fecha_envio, INTERVAL 5 DAY) AS
Fecha_Entrega_Programada
FROM envios
WHERE codigo_producto = 'ABC123';

/*
Utilizando la función ADDTIME, encuentra la hora estimada de
entrega para un envío con código de producto 'XYZ789' si se
suma 4 horas y 30 minutos a la hora de entrega.
*/
SELECT ADDTIME(fecha_entrega, '4:30:00') AS Hora_Estimada_Entrega
FROM envios
WHERE codigo_producto = 'XYZ789';

/*
SELECT ADDTIME(fecha_entrega, '4:30:00') AS Hora_Estimada_Entrega
FROM envios
WHERE codigo_producto = 'XYZ789';
*/
SELECT fecha_envio, CONVERT_TZ(fecha_envio, '+00:00', '-03:00') AS
Fecha_Envio_Argentina
FROM envios
WHERE codigo_producto = 'PQR456';

/*
Calcula la diferencia en días entre la fecha de entrega y la fecha de
envío para el envío con código de producto 'LMN001' utilizando la
función DATEDIFF.
*/
SELECT DATEDIFF(fecha_entrega, fecha_envio) AS Diferencia_Dias
FROM envios
WHERE codigo_producto = 'LMN001';

/*
Utiliza la función CURDATE para obtener la fecha actual y, a
continuación, obtener la diferencia en días entre la fecha de entrega con
código de producto 'DEF777' y la fecha actual.
*/
SELECT DATEDIFF(fecha_entrega, CURDATE()) AS Diferencia_Dias
FROM envios
WHERE codigo_producto = 'DEF777';

/*
Utilizando la función CURTIME, obtén la hora actual del sistema.
*/
SELECT CURTIME() AS Hora_Actual;

/*
Utiliza la función DATE para extraer la fecha de envío del envío con ID 3.
*/
SELECT DATE(fecha_envio) AS Fecha_Envio FROM envios WHERE id = 3;

/*
Utiliza la función DATE_ADD para calcular la fecha de entrega
programada para el envío con código de producto 'XYZ789' si se le
agregan 3 días a la fecha de envío.
*/
SELECT DATE_ADD(fecha_envio, INTERVAL 3 DAY) AS
Fecha_Entrega_Programada
FROM envios
WHERE codigo_producto = 'XYZ789';

/*
Utiliza la función DATE_FORMAT para mostrar la fecha de envío del
envío con ID 6 en el formato 'DD-MM-YYYY'.
*/
SELECT DATE_FORMAT(fecha_envio, '%d-%m-%Y') AS Fecha_Formateada
FROM envios
WHERE id = 6;

/*
Utiliza la función DATE_SUB para calcular la fecha de envío del envío
con ID 4 si se le restan 2 días.
*/
SELECT DATE_SUB(fecha_envio, INTERVAL 2 DAY) AS Nueva_Fecha_Envio
FROM envios
WHERE id = 4;

/*
Utiliza la función DATEDIFF para calcular la diferencia en días entre la
fecha de envío y la fecha de entrega programada para el envío con
código de producto 'PQR456'.
*/
SELECT DATEDIFF(fecha_entrega, fecha_envio) AS Diferencia_Dias
FROM envios
WHERE codigo_producto = 'PQR456';

/*
Utiliza la función DAY para obtener el día del mes en que se realizó el
envío con ID 2.
*/
SELECT DAY(fecha_envio) AS Dia_del_mes
FROM envios
WHERE id = 2;

/*
Utiliza la función DAYNAME para obtener el nombre del día de la semana
en que se entregará el envío con código de producto 'DEF777'.
*/
SET lc_time_names = 'es_AR';
SELECT DAYNAME(fecha_entrega) AS Dia_Semana
FROM envios WHERE codigo_producto = 'DEF777';

/*
Utiliza la función DAYOFMONTH para obtener el día del mes en que se
entregará el envío con código de producto 'GHI888'.
*/
SELECT DAYOFMONTH(fecha_entrega) AS Dia_Mes
FROM envios WHERE codigo_producto = 'GHI888';

/*
Utiliza la función PERIOD_ADD para agregar un período de 3 meses al
año-mes '2022-07'.
*/
SELECT PERIOD_ADD('202207', 3) AS Nuevo_Periodo;

/*
Utiliza la función PERIOD_DIFF para calcular el número de meses entre
los períodos '2022-03' y '2022-12'.
*/
SELECT PERIOD_DIFF(202212, 202203) AS Meses_Diferencia;
/*
Utiliza la función QUARTER para obtener el trimestre de la fecha de
entrega del envío con código de producto 'PQR456'.
*/
SELECT QUARTER(fecha_entrega) AS Trimestre
FROM envios
WHERE codigo_producto = 'PQR456';

/*
Utiliza la función SEC_TO_TIME para convertir 3665 segundos en
formato 'hh:mm:ss'.
*/
SELECT SEC_TO_TIME(3665) AS Hora_Minuto_Segundo;

/*
Utiliza la función SECOND para obtener los segundos de la hora de
envío del envío con ID 2.
*/
SELECT SECOND(fecha_envio) AS Segundos_Envio FROM envios WHERE id =
2;

/*
Utiliza la función STR_TO_DATE para convertir la cadena '2022()08()15'
en una fecha.
*/
SELECT STR_TO_DATE('2022()08()15', '%Y()%m()%d') AS Nueva_Fecha;
/*
Utiliza la función SUBDATE (o DATE_SUB) para restar 5 días a la fecha
de entrega del envío con código de producto 'GHI888'.
*/
SELECT DATE_SUB(fecha_entrega, INTERVAL 5 DAY) AS
Nueva_Fecha_Entrega
FROM envios
WHERE codigo_producto = 'GHI888';

/*
Utiliza la función SUBTIME para restar 2 horas y 15 minutos a la hora de
envío del envío con ID 7.
*/
SELECT SUBTIME(fecha_envio, '02:15:00') AS Nueva_Hora_Envio
FROM envios
WHERE id = 7;

/*
Utiliza la función TIME para extraer la porción de tiempo de la fecha de
envío del envío con ID 1.
*/
SELECT TIME(fecha_envio) AS Hora_Envio
FROM envios
WHERE id = 1;

/*
Utiliza la función TIME_FORMAT para formatear la hora de envío del
envío con ID 2 en 'hh:mm:ss'.
*/
SELECT TIME_FORMAT(fecha_envio, '%H:%i:%s') AS Hora_Formateada
FROM envios
WHERE id = 2;

/*
Utiliza la función TIME_TO_SEC para convertir la hora de envío del envío
con ID 3 en segundos.
*/
SELECT TIME_TO_SEC(TIME(fecha_envio)) AS Segundos_Envio
FROM envios
WHERE id = 3;

/*
Utiliza la función TIMEDIFF para calcular la diferencia de horas entre las
fechas de envío y entrega del envío con ID 4.
*/
SELECT TIMEDIFF(fecha_entrega, fecha_envio) AS Diferencia_Tiempo
FROM envios
WHERE id = 4;

/*
Utiliza la función SYSDATE para obtener la hora exacta en la que se
ejecuta la función en la consulta. Para comprobar esto invoca SYSDATE,
luego la función SLEEP durante 5 segundos y luego vuelve a invocar la
función SYSDATE, y verifica la diferencia entre ambas invocaciones con
TIMEDIFF.
*/
SELECT TIMEDIFF(hora_final, hora_inicial) AS diferencia_de_hora FROM
( SELECT
SYSDATE() AS hora_inicial,
SLEEP(5),
SYSDATE() AS hora_final) t;

/*
Crea una consulta que utilice la función TIMESTAMP para obtener todos
los valores de fecha_envio sumandole 12 horas.
*/
SELECT TIMESTAMP(fecha_envio, '12:00:00') AS fecha_y_hora_modificada
FROM envios;

/*
Utiliza la función TIMESTAMPADD para agregar 3 horas a la fecha de
entrega del envío con código de producto 'XYZ789'.
*/
SELECT TIMESTAMPADD(HOUR, 3, fecha_entrega) AS Nueva_Fecha_Entrega
FROM envios
WHERE codigo_producto = 'XYZ789';
