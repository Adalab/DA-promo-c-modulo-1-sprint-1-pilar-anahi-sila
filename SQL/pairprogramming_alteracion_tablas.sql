					/* ALTERACION DE TABLAS */

CREATE SCHEMA IF NOT EXISTS  `tienda_zapatillas`;

USE `tienda_zapatillas`;

CREATE TABLE IF NOT EXISTS zapatillas (
    id_zapatillas INT NOT NULL AUTO_INCREMENT,   
    modelo VARCHAR(45) NOT NULL,   
    color  VARCHAR(45) NOT NULL,  
    PRIMARY KEY (id_zapatillas)  
    );
    
CREATE TABLE IF NOT EXISTS clientes (
    id_clientes INT NOT NULL AUTO_INCREMENT,   
    nombre VARCHAR(45) NOT NULL,   
    numero_telefono  INT(9) NOT NULL,  
    email VARCHAR(45) NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    ciudad VARCHAR(45),
    provincia VARCHAR(45) NOT NULL,
    pais VARCHAR(45) NOT NULL,
    codigo_postal VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_clientes)  
    );
    
CREATE TABLE IF NOT EXISTS empleados (
    id_empleados INT NOT NULL AUTO_INCREMENT,   
    nombre VARCHAR(45) NOT NULL,   
    tienda VARCHAR (45) NOT NULL,  
    salario INT,
    fecha_incorporacion DATE NOT NULL,
    PRIMARY KEY (id_empleados)  
    );
    
CREATE TABLE IF NOT EXISTS facturas (
    id_facturas INT NOT NULL AUTO_INCREMENT,   
    numero_factura VARCHAR(45) NOT NULL,   
    fecha DATE NOT NULL,
    id_zapatillas INT NOT NULL,
    id_clientes INT NOT NULL,
    id_empleados INT NOT NULL,
    CONSTRAINT fk_facturas_zapatillas
		FOREIGN KEY (id_zapatillas)
	REFERENCES zapatillas (id_zapatillas)
		ON DELETE cascade ON UPDATE cascade,
	CONSTRAINT fk_facturas_empleados
		FOREIGN KEY (id_empleados)
	REFERENCES empleados (id_empleados)
		ON DELETE cascade ON UPDATE cascade,
	CONSTRAINT fk_facturas_clientes
		FOREIGN KEY (id_clientes)
	REFERENCES clientes  (id_clientes)
		ON DELETE cascade ON UPDATE cascade,
    PRIMARY KEY (id_facturas)  
);

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
 MODIFY COLUMN codigo_postal VARCHAR(5);
 
/*Tabla Facturas:
total: Creemos esa columna con un tipo de datos decimal.*/
 
ALTER TABLE facturas
 ADD COLUMN total_factura FLOAT;
 
 
 
 
 
 

 

