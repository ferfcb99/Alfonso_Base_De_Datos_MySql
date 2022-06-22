CREATE DATABASE relaciones;

USE relaciones;

CREATE TABLE Huesped(
	no_reservacion int auto_increment,
    nombre varchar(30) not null,
    apellido varchar(20) not null,
    tiempo_estancia int not null,
    PRIMARY KEY(no_reservacion) -- not null, unique
);



insert into huesped(nombre, apellido, tiempo_estancia) values("Juan", "Perez", 24);
insert into huesped(nombre, apellido, tiempo_estancia) values("Bere", "perez", 12);
insert into huesped(nombre, apellido, tiempo_estancia) values("Fernando", "Suarez", 5);
insert into huesped(nombre, apellido, tiempo_estancia) values("Alfonso", "Lopez", 6);
insert into huesped(nombre, apellido, tiempo_estancia) values("Juan", "Valverde", 7);

select * from Huesped;
select apellido from huesped;
select apellido, nombre from huesped;
select apellido, nombre from huesped where apellido = 'Lopez';


CREATE TABLE Habitacion(
	no_habitacion int auto_increment primary key,
    cantidad_camas int not null,
    -- chica, mediana, grande
    tipo varchar(7) not null,
    costo decimal(5,3) not null, -- 99.999 
    -- llave foranea
    no_reservacion int not null,
    FOREIGN KEY(no_reservacion) references Huesped(no_reservacion)
);


insert into Habitacion(cantidad_camas, tipo, costo, no_reservacion) values(2, 'Mediana', 69.99, 3);
insert into Habitacion(cantidad_camas, tipo, costo, no_reservacion) values(1, 'Chica', 49.99, 2);
insert into Habitacion(cantidad_camas, tipo, costo, no_reservacion) values(1, 'Chica', 49.99, 1);
insert into Habitacion(cantidad_camas, tipo, costo, no_reservacion) values(1, 'Chica', 49.99, 5);
insert into Habitacion(cantidad_camas, tipo, costo, no_reservacion) values(3, 'Grande', 99.999, 4);


select * from Habitacion;

-- visualizar tablas
describe huesped;
describe habitacion;



CREATE TABLE Serie(
	tipo_codigo varchar(100) primary key
);

INSERT INTO Serie(tipo_codigo) VALUES('123456789');
INSERT INTO Serie(tipo_codigo) VALUES('qwertyuik');

CREATE TABLE Auto(
	tipo_codigo varchar(100) primary key,
    color varchar(20) not null,
    modelo varchar(20) not null,
    marca varchar(20) not null,
    foreign key(tipo_codigo) references Serie(tipo_codigo)
);

INSERT INTO Auto(tipo_codigo, color, modelo, marca) values("123456789", "Azul", "BBA", "Ford");


CREATE TABLE Producto(
	codigo_barras varchar(20) primary key,
    marca varchar(50) not null,
    tipo varchar(50) not null,
    nombre varchar(50) not null
);

CREATE TABLE Pedido(
	no_pedido int auto_increment primary key,
    costo decimal(3,2) not null,
    fecha date not null,
    nombre_cliente varchar(50)
);
INSERT INTO Pedido(costo, fecha, nombre_cliente) values(9.99, "2022-06-21", "Saul"),
													   (4.99, "2022-06-20", "Bere"),
													   (1.49, "2022-05-21", "Saul");
SELECT * FROM Pedido;
                                                       
INSERT INTO Pedido(costo, fecha, nombre_cliente) values(5, CURDATE(), "Lizeth"); -- CURRENT DATE 

-- crud


CREATE TABLE Producto_Pedido(
	codigo_barras varchar(20),
    no_pedido int,
    FOREIGN KEY(codigo_barras) references Producto(codigo_barras),
    foreign key(no_pedido) references Pedido(no_pedido)
);


















