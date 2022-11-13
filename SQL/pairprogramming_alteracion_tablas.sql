					/* ALTERACION DE TABLAS */

USE `tienda_zapatillas`;


/* Tabla Zapatillas: debemos incluir:
marca: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
talla: es un entero, no nulo.*/ 

ALTER TABLE zapatillas
 ADD COLUMN marca VARCHAR (45) NOT NULL,
 ADD COLUMN talla INT NOT NULL;
 
/* Tabla Empleados
salario: puede que el salario de nuestros empleados tenga decimales, por lo que le cambiaremos el tipo a decimal.*/

ALTER TABLE empleados
 ADD COLUMN salario INT NOT NULL;
 
 ALTER TABLE empleados
 MODIFY COLUMN salario FLOAT;
 
/*Tabla Clientes
pais: es una columna que no hará falta. La eliminaremos.
codigo_postal: es un string, pero cambiaremos el tipo a entero de longitud 5. */
 
ALTER TABLE clientes
 DROP COLUMN pais;
 
 ALTER TABLE clientes 
 MODIFY COLUMN codigo_postal INT;#Sabemos que deberia ser un INT(5) pero no nos permite colocar INT con longitud
										
 
/*Tabla Facturas:
total: Creemos esa columna con un tipo de datos decimal.*/
 
ALTER TABLE facturas
 ADD COLUMN total_factura FLOAT;
 
 

 
 
 

 

