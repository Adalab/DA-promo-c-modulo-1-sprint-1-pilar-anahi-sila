							/*CONSULTAS AVANZADAS 1 */

USE northwind;

/* 1. Productos más baratos y caros de nuestra BBDD:
Desde la división de productos nos piden conocer el precio de los productos que tienen 
el precio más alto y más bajo. Dales el alias lowestPrice y highestPrice. */

SELECT MIN(unit_price) AS lowestPrice, MAX(unit_price) AS highestPrice
FROM products;


/* 2. Conociendo el numero de productos y su precio medio:
Adicionalmente nos piden que diseñemos otra consulta para conocer el número de productos 
y el precio medio de todos ellos (en general, no por cada producto). */

SELECT COUNT(product_id) AS numero_productos, AVG(unit_price) AS precio_medio
FROM products;


/* 3. Sacad la máxima y mínima carga de los pedidos de UK:
Nuestro siguiente encargo consiste en preparar una consulta que devuelva la máxima y 
mínima cantidad de carga para un pedido (freight) enviado a Reino Unido (United Kingdom). */

SELECT MAX(freight), MIN(freight)
FROM orders
WHERE ship_country = "UK";


/* 4. Qué productos se venden por encima del precio medio:
Después de analizar los resultados de alguna de nuestras consultas anteriores, 
desde el departamento de Ventas quieren conocer qué productos en concreto se 
venden por encima del precio medio para todos los productos de la empresa, 
ya que sospechan que dicho número es demasiado elevado. 
También quieren que ordenemos los resultados por su precio de mayor a menor.
📌NOTA: para este ejercicio puedes necesitar dos consultas separadas */

SELECT AVG(unit_price)
FROM products;

SELECT product_name, unit_price
FROM products
WHERE unit_price >= 28.86
ORDER BY unit_price DESC;


/* 5. Qué productos se han descontinuado:
De cara a estudiar el histórico de la empresa nos piden una consulta para conocer 
el número de productos que se han descontinuado. 
El atributo Discontinued es un booleano: si es igual a 1 el producto ha sido descontinuado. */

SELECT product_name
FROM products
WHERE discontinued = 1;


/* 6. Detalles de los productos de la query anterior:
Adicionalmente nos piden detalles de aquellos productos no descontinuados, 
sobre todo el ProductID y ProductName. Como puede que salgan demasiados resultados, 
nos piden que los limitemos a los 10 con ID más elevado, que serán los más recientes. 
No nos pueden decir del departamento si habrá pocos o muchos resultados, 
pero lo limitamos por si acaso. */

SELECT product_id, product_name
FROM products
WHERE discontinued = 0
ORDER BY product_id DESC
LIMIT 10;
