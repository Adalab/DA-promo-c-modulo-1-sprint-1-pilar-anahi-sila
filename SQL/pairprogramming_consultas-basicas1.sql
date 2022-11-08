USE northwind;

/* 1. Obtener una lista con los datos de las empleadas y empleados de la empresa Northwind. 
Dicha consulta tiene que tener los campos employee_id, last_name y first_name. */

SELECT employee_id, last_name, first_name
FROM employees;

/* 2. Ver aquellos productos (tabla products) cuyos precios por unidad se encuentren entre los 0 y 5 dólares, 
es decir, los productos más baratos. */

SELECT *
FROM products
WHERE unit_price <= 5.00 AND unit_price >=0;

/* 3. Conocer los datos de los productos que tengan exactamente un precio de 18, 19 o 20 dólares 
(un rango muy concreto de precios del que la empresa quiere maximizar sus ventas en un futuro). */

SELECT *
FROM products
WHERE unit_price = 18.00 OR unit_price = 19.00 OR unit_price = 20.00;

/* 4. El rango de productos que puede dar más beneficios a la empresa podría ser el de aquellos 
con un precio mayor o igual a 15 dólares, pero menor o igual que 50 dólares. 
Selecciona los datos de ese rango de productos. */

SELECT *
FROM products
WHERE unit_price >= 15 AND unit_price <= 50;

/* Otra forma de solucionarlo. 
SELECT *
FROM products
WHERE unit_price BETWEEN 15 AND 50; */

/* 5. Para comprobar si los datos en la tabla products están correctos, 
nos interesa seleccionar aquellos productos que no tengan precio, 
porque lo hayan dejado vacio al introducir los datos (NULL). */

SELECT *
FROM products
WHERE unit_price IS NULL;

/* 6. Ahora obtenen los datos de aquellos productos con un precio menor a 15 dólares, 
pero sólo aquellos que tienen un ID menor que 10 
(para tener una muestra significativa pero no tener que ver todos los productos existentes). */

SELECT *
FROM products
WHERE unit_price < 15 AND product_id < 10;

/* 7. Ahora vamos a hacer la misma consulta que en ejercicio anterior, pero haciendo uso del operador NOT. */

SELECT *
FROM products
WHERE unit_price < 15 AND NOT product_id >= 10;

/* 8. A Northwind le interesa conocer los datos de los países que hacen pedidos (orders) 
para focalizar el negocio en esas regiones y al mismo tiempo crear campañas de marketing 
para conseguir mejorar en las otras regiones. Realiza una consulta para obtener ese dato. */

SELECT ship_country, ship_region
FROM orders
WHERE ship_region <> " ";