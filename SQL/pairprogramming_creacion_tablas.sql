                      /* CREACION DE TABLAS */
	
/* Realizamos la creación de la base de datos de la  'tienda_zapatillas'.
Tambien la seleccionamos para hacer uso de ella. */

CREATE SCHEMA IF NOT EXISTS  `tienda_zapatillas`;

USE `tienda_zapatillas`;

/*Tabla Zapatillas: tiene 3 columnas: 
id_zapatilla: es una clave primaria de tipo int, autoincremental y no nula.
modelo: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.
color: es una cadena de caracteres de longitud máxima de 45 caracteres, no nula.*/

CREATE TABLE IF NOT EXISTS zapatillas (
    id_zapatillas INT NOT NULL AUTO_INCREMENT,   
    modelo VARCHAR(45) NOT NULL,   
    color  VARCHAR(45) NOT NULL,  
    PRIMARY KEY (id_zapatillas)  
    );
    
    
/*Tabla Clientes: 
id_cliente: clave primaria de tipo int, autoincremental y no nula.
nombre: cadena de caracteres de longitud máxima de 45 caracteres, no nula.
numero_telefono: integer de longitud máxima de 9 caracteres, no nula.
email: cadena de caracteres de longitud máxima de 45 caracteres, no nula.
direccion: cadena de caracteres de longitud máxima de 45 caracteres, no nula.
ciudad: cadena de caracteres de longitud máxima de 45 caracteres, puede ser nula.
provincia:cadena de caracteres de longitud máxima de 45 caracteres, no nula.
pais:cadena de caracteres de longitud máxima de 45 caracteres, no nula.
codigo_postal:cadena de caracteres de longitud máxima de 45 caracteres, no nula.*/   
    
   
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
    
    
/* Tabla Empleados: 
id_empleado: clave primaria de tipo int, autoincremental y no nula.
nombre: cadena de caracteres de longitud máxima de 45 caracteres, no nula.
tienda: cadena de caracteres de longitud máxima de 45 caracteres, no nula.
salario: es int, puede ser nula.
fecha_incorporacion: es una columna de tipo date, no nula.*/
    
       
CREATE TABLE IF NOT EXISTS empleados (
    id_empleados INT NOT NULL AUTO_INCREMENT,   
    nombre VARCHAR(45) NOT NULL,   
    tienda VARCHAR (45) NOT NULL,  
    salario INT,
    fecha_incorporacion DATE NOT NULL,
    PRIMARY KEY (id_empleados)  
    );
    
/* Tabla Facturas: 
id_factura: clave primaria de tipo int, autoincremental y no nula.
numero_factura: cadena de caracteres de longitud máxima de 45 caracteres, no nula.
fecha: columna de tipo date, no nula.
id_zapatilla: clave foránea de tipo int, no nula
id_empleado: clave foránea de tipo int, no nula.
id_cliente: clave foránea de tipo int, no nula.*/
    
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