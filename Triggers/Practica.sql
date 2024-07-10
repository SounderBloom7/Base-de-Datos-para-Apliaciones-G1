create database pruebacargadinamica;

use pruebacargadinamica;

-- CREAR TABLA pruebacargadinamica EN pruebacargadinamica
select top 0 EmployeeID,FirstName,LastName, [Address], HomePhone, Country
into pruebacargadinamica.dbo.empleado
from NORTHWND.dbo.Employees

-- INSERTAR DATOS DE NORTHWIND
insert into empleado
select firstname, lastname, [address], homephone, country
from NORTHWND.dbo.Employees

-- CREAR TABLA dim_empleado
create table dim_empleado(
    idEmpleado int not null IDENTITY(1,1),
    nombreCompleto VARCHAR(50) not null,
    direccion varchar(50),
    telefono varchar(50),
    salario money,
    PRIMARY KEY(idEmpleado)
);

-- CREAR TRIGGER QUE SE EJECUTA AL CREAR REGISTRO EN empleado
create TRIGGER autoInsersionDimEmpleado
ON empleado -- El trigger es de la tabla empleado
AFTER INSERT -- El momento en que se ejecuta (Despues de insertar)
AS
BEGIN
    INSERT INTO dim_empleado (nombreCompleto, direccion, telefono, salario)
    SELECT FirstName + ' ' + LastName, [Address], HomePhone, 100.0
    FROM inserted;
END;

DELETE FROM empleado;

DELETE FROM dim_empleado;