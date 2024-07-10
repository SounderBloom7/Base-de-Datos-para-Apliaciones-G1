-- Create BD
create database ejercicioExamen;
use ejercicioExamen;

-- Crear tablas solicitadas =====================
-- Proveedor
create table proveedor
(
    idprov int not null IDENTITY (1,1),
    nombre varchar(50) not null,
    limite_credito money not null,
    CONSTRAINT pk_proveedor
    PRIMARY KEY(idprov),
    CONSTRAINT unico_nombre_proveedor
    UNIQUE(nombre)
);

-- Categoria
create table categoria(
    idcategoria int not null,
    nombre VARCHAR(50) not null,
    CONSTRAINT pk_categoria
    PRIMARY KEY(idcategoria),
    CONSTRAINT unico_nombre
    UNIQUE(nombre)
)

CREATE TABLE Producto(
    idprod int not null,
    nombre varchar(50) not null,
    precio money not null,
    existencia int not null,
    proveedor int,
    idcatego int
    constraint pk_producto
    primary key(idprod),
    constraint fk_producto_prov
    foreign key (proveedor)
    references proveedor(idprov),
    constraint fk_producto_categoria
    foreign key (idcatego)
    references categoria(idcatego)
)


-- Insertar datos en las tablas
insert into proveedor (nombre, limite_credito)
values('Coca-cola', 98777),
      ('Pecsi', 234567),
      ('Hay me Pica', 44566),
      ('Hay me Duele', 45677),
      ('Tengo Miedo', 22344);


insert into categoria
values(1, 'Lacteos'),
(2, 'Linea Blanca'),
(3, 'Dulces'),
(4, 'Vinos'),
(5, 'Abarrotes');
     

select * from proveedor

insert into producto
values(1, 'Mascara', 78.9, 20, 5,5)

insert into producto(proveedor, existencia, idcatego, precio, idprod, nombre)
values(3, 34, 5, 56.7, 2, 'Manita Rascadora')

insert into producto
values (3, 'Tonayan', 1450, 56,4 ,4),
       (4, 'Caramelo', 200, 22,1 ,3),
       (5, 'Terry', 200, 24,4 ,4);


select * from Producto
select * from Categoria
select * from proveedor

