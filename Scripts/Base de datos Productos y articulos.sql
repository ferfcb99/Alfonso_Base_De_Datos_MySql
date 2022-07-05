CREATE DATABASE productos;

USE productos;

CREATE TABLE Cliente(
	no_cliente int auto_increment primary key,
    direccion_envio varchar(30) not null,
	saldo decimal(7, 2) not null,
    limite_saldo decimal(8, 2) not null,
	descuento varchar(3) not null
);

CREATE TABLE Pedido(
	id_pedido int auto_increment primary key,
    fecha_pedido date not null,
    descripcion varchar(100),
    costo decimal(7,2) not null,
    no_cliente int not null,
    -- llave foranea
    foreign key(no_cliente) references Cliente(no_cliente)
);

CREATE TABLE Articulo(
	no_articulo int auto_increment primary key,
    fabrica_distrib varchar(50) not null,
    existencia_articulo int not null,
    descripcion varchar(30) not null
);	










