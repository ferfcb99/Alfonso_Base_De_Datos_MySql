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








