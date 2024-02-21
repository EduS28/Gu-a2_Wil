USE coffeeshop;

-- Ejercicio 1: Selecciona todos los clientes que han realizado pedidos --

SELECT nombre_cliente, estado_pedido 
FROM pedido
INNER JOIN cliente
ON cliente.id_cliente = pedido.id_cliente;


-- Ejercicio 2: Selecciona todos los pedidos que han sido realizados entre dos fechas --
-- (dejar el espacio para escribir la fecha según conveniencia) --

SELECT * FROM pedido 
WHERE fecha_registro BETWEEN '2024-01-01' AND '2024-04-23';


/* Ejercicio 3: Selecciona a todos los clientes y ordénalos según su fecha 
de nacimiento de forma descendente. */

SELECT * FROM cliente
ORDER BY nacimiento_cliente DESC

-- Ejercicio 4: Selecciona los productos que se encuentran dentro de un pedido.

SELECT c.id_pedido, c.estado_pedido, b.nombre_producto, b.descripcion_producto, b.precio_producto 
FROM detalle_pedido a
INNER JOIN producto b ON  b.id_producto = a.id_producto
INNER JOIN pedido c ON  c.id_pedido = a.id_pedido;


-- Ejercicio 5: Selecciona el producto con el mayor precio. 

SELECT * FROM producto 
WHERE precio_producto = (SELECT MAX(precio_producto) FROM producto);


-- Ejercicio 6: Selecciona el promedio de precios de los productos ingresados.

SELECT AVG(precio_producto) 
FROM producto


/* Ejercicio 7: Haz una consulta que te permita ver la información de 
   cuantos pedidos se encuentran en estado: Pendiente, Finalizado, Entregado, Anulado */

SELECT estado_pedido, COUNT(*) AS 'Cantidad de pedidos'
FROM pedido
GROUP BY estado_pedido;


-- Ejercicio 8: Seleccionaa todos los clientes que su nombre empiece por la letra D. 

SELECT * FROM cliente
WHERE nombre_cliente LIKE 'D%';


/* Ejercicio 9: Plantear una consulta donde se calculen la cantidad de órdenes agrupadas por cliente, 
   filtradas por fecha y se ordenen los registros de mayor a menor */

SELECT a.id_pedido,  nombre_cliente, COUNT(*) AS cantidad_ordenes
FROM pedido a
INNER JOIN cliente b ON a.id_cliente = b.id_cliente
WHERE a.fecha_registro = '2024-01-01'  
GROUP BY b.nombre_cliente
ORDER BY cantidad_ordenes DESC;

-- Ejercicio 10: Haz una consulta que muestre los 3 productos más vendidos.

SELECT producto.nombre_producto, detalle_pedido.id_producto, SUM(cantidad_producto) AS 'Vendido'
FROM detalle_pedido
INNER JOIN producto ON producto.id_producto = detalle_pedido.id_producto
GROUP BY detalle_pedido.id_producto
ORDER BY 'Vendido' DESC 
LIMIT 3;

-- Ejercicio 11: Haz una consulta que muestre al cliente que más 
-- pedidos ha realizado y cuantos pedidos ha realizado.

SELECT pedido.id_cliente, cliente.nombre_cliente, COUNT(*) as cantidad_pedidos
FROM pedido
INNER JOIN cliente ON cliente.id_cliente = pedido.id_cliente
GROUP BY pedido.id_cliente
LIMIT 1;

/* Ejercicio 12: Haz una consulta que muestre la información de la tabla, 
   cliente, pedido, detalle pedido, producto. Utiliza la sentencia inner join. */
   
SELECT b.id_pedido, a.id_cliente, a.nombre_cliente, a.direccion_cliente, 
	b.estado_pedido, b.fecha_registro, c.id_detalle, d.nombre_producto, 
	c.cantidad_producto, d.precio_producto
FROM detalle_pedido c
INNER JOIN pedido b ON c.id_pedido = b.id_pedido
INNER JOIN producto d ON d.id_producto = c.id_producto
INNER JOIN cliente a ON a.id_cliente = b.id_cliente


