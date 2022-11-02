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