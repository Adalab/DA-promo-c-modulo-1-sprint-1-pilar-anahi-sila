									/* INSERCION DE DATOS */

USE tienda_zapatillas;

/* Insertamos datos en las diferentes tablas.*/

INSERT INTO zapatillas (id_zapatillas, modelo, color, marca, talla)
VALUES (1,'XQYUN', 'Negro','Nike', 42);

INSERT INTO zapatillas (id_zapatillas, modelo, color, marca, talla)
VALUES (2, 'UOPMN', 'Rosas', 'Nike', 39), (3,'OPNYT', 'Verdes', 'Adidas', 35);

INSERT INTO empleados ( id_empleados, nombre, tienda, salario, fecha_incorporacion)
VALUES (1, 'Laura','Alcobendas', 25987, '2010-09-03' ), (2, 'Maria','Sevilla', NULL, '2001-04-11' ), (3,'Ester','Oviedo', 30165.98 , '2000-11-29' );

INSERT INTO clientes (id_clientes, nombre, numero_telefono, email, direccion, ciudad, provincia, codigo_postal)
VALUES (1, 'Monica', 1234567289, 'monica@email.com', 'Calle Felicidad', 'Móstoles', 'Madrid', '28176'), 
(2, 'Lorena', 289345678, 'lorena@email.com','Calle Alegria', 'Barcelona', 'Barcelona', '12346'), 
(3, 'Carmen', 298463759, 'carmen@email.com', 'Calle del Color', 'Vigo','Pontevedra', '23456');

INSERT INTO facturas (id_facturas, numero_factura, fecha, id_zapatillas, id_clientes, id_empleados, total_factura)
VALUES (1, '123', '2001-12-11',1,2,1,54.98),
(2,'1234','2005-05-23',1,1,3,89.91), 
(3, '12345','2015-09-18',2,3,3,76.23);

/*Tabla zapatillas:
En nuestra tienda no vendemos zapatillas Rosas. En realidad esas zapatillas son amarillas.*/

UPDATE zapatillas
SET color = 'Amarillo'
WHERE id_zapatillas = 2;


/* Tabla empleados:
Laura se ha cambiado de ciudad y ya no vive en Alcobendas, ahora vive en A Coruña.*/

UPDATE empleados
SET tienda = 'A Coruña'
WHERE id_empleados = 1;


/*Tabla clientes:
El Numero de telefono de Monica esta mal. En realidad su número es: 123456728*/

UPDATE clientes
SET numero_telefono = 123456728
WHERE id_clientes = 1;


/* Tabla facturas:
El total de la factura de la zapatilla cuyo id es 2 es incorrecto. En realidad es: 89,91.*/

UPDATE facturas
SET total_factura = 89.91
WHERE id_zapatillas = 2;



