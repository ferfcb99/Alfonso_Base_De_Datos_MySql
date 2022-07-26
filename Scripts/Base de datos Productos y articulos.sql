CREATE DATABASE productos;

USE productos;

CREATE TABLE Cliente(
	no_cliente int auto_increment primary key,
    direccion_envio varchar(30) not null,
	saldo decimal(7, 2) not null,
    limite_saldo decimal(8, 2) not null,
	descuento varchar(3) not null
);

insert into Cliente(direccion_envio, saldo, limite_saldo, descuento) values("CDMX", 3000, 1599.99, "25"),
																	 ("CDMX", 5999.99, 1599.99, "30"),
                                                                     ("Guadalajara", 9000, 1599.99, "100"),
                                                                     ("Estado de méxico", 5000, 1599.99, "90"),
                                                                     ("CDMX", 3000, 6699.99, "25");
																	

Select * from Cliente;

select * from cliente where direccion_envio = "Guadalajara";
-- consultar direccion_envio del cliente con limite_saldo de 1599.99
select direccion_envio, saldo, limite_saldo from cliente where limite_saldo = 1599.99; 

-- UPDATE  TABLE_NAME
	-- SET  FIELDS
		-- WHERE CONDITION
        
-- añadir 300 a todos los saldos cuyo descuento sea menor o igual de 90
update Cliente
	SET saldo = saldo + 300
		 WHERE  descuento  <= 90;
    
UPDATE Cliente 
	SET limite_saldo = 1600;
    
UPDATE Cliente 
	set limite_saldo = 2700
		WHERE direccion_envio = "CDMX";
        



CREATE TABLE Pedido(
	id_pedido int auto_increment primary key,
    fecha_pedido date not null,
    descripcion varchar(100),
    -- char(50) - varchar(50)
    costo decimal(7,2) not null,
    no_cliente int not null,
    -- llave foranea
    foreign key(no_cliente) references Cliente(no_cliente) -- on delete cascade on update cascade 
);

 
INSERT INTO Pedido(fecha_pedido, descripcion, costo, no_cliente) VALUES(curdate(), "Articulos 1", 8888, 4),
																	   (curdate(), "Articulos 2", 8, 1),
                                                                       (curdate(), "Articulos 3", 78.65, 3),
                                                                       ("2022-02-12", "Articulos 4", 88.88, 5),
                                                                       (curdate(), "Articulos 5", 0, 2),
                                                                       (curdate(), "Articulos 6", 0.89, 1);
                                                                       
Select * from Pedido;
Select * from Articulo;



CREATE TABLE Articulo(
	no_articulo int auto_increment primary key,
    fabrica_distrib varchar(50) not null,
    existencia_articulo int not null,
    descripcion varchar(30) not null
);	

INSERT INTO Articulo(fabrica_distrib, existencia_articulo, descripcion) values ("Fabrica 1", 5000, "Juguetes"),
																			   ("Fabrica 2", 7000, "Dulces"),
                                                                               ("Fabrica 3", 1000, "Lacteos"),
                                                                               ("Fabrica 4", 500, "Pan"),
                                                                               ("Fabrica 5", 5, "Ropa"),
                                                                               ("Fabrica 6", 900, "Ropa p/niños"),
                                                                               ("Fabrica 7", 350000, "Ropa p/dama");
-- de la tabla pedido tenemos  6 registros
--  de la tabla articulo tenemos 7 registros
CREATE TABLE pedido_articulo(
	id_pedido int not null, 
    no_articulo int not null,
    -- llaves foraneas
    foreign key(id_pedido) references Pedido(id_pedido),
    foreign key(no_articulo) references Articulo(no_articulo),
    primary key(id_pedido, no_articulo)
);



INSERT INTO pedido_articulo(id_pedido, no_articulo) values(3, 7);
INSERT INTO pedido_articulo(id_pedido, no_articulo) values(3, 4);
INSERT INTO pedido_articulo(id_pedido, no_articulo) values(1, 3);
INSERT INTO pedido_articulo(id_pedido, no_articulo) values(2, 3);
INSERT INTO pedido_articulo(id_pedido, no_articulo) values(3, 1);
INSERT INTO pedido_articulo(id_pedido, no_articulo) values(4, 2);
INSERT INTO pedido_articulo(id_pedido, no_articulo) values(3, 5);

Select * from pedido_articulo;

-- delete from table_name where field = --- and field2 = --- or and field3 = --- ......................
DELETE 
	FROM pedido_articulo 
		WHERE no_articulo = 7; 
        
-- elimina todos los campos donde el id del pedido sea 3 o el no de articulo sea 3

DELETE 
	FROM pedido_articulo
		WHERE id_pedido = 3 OR no_articulo = 3; 

-- ----------------------------------------------------------------------
SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;







