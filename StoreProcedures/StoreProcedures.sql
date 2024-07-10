-- Store Procedures
Create proc sp_1
as
BEGIN
    --declaracion de variables
    Declare @n int
    Declare @i int

    set @n = 5;
    set @i = 1;

    print('El valor de n es: '+ cast(@n as varchar))
    print('El valor de i es: '+ cast(@i as varchar))
END

GO
create database prueba_sp;
use prueba_sp;

exec sp_1;

-- Ejecutar 10 veces sp_1 solamente si el sentinela es 1

GO
create proc sp_2
as
BEGIN
    Declare @n as int = 10, @i int = 1;
    WHILE @i<=@n
    BEGIN
        PRINT(@i);
        set @i+=1;
    END;
END;

GO
exec sp_2;

GO
create proc sp_4
@n INT
as
BEGIN
    if @n>0
    BEGIN
        Declare @i int = 1;
        WHILE @i<=@n
        BEGIN
            PRINT(@i);
            set @i+=1;
        END
    END ELSE BEGIN
    print 'El valor de n debe ser mayor a 0'
    END
END

GO
exec sp_4 -15;

GO
create proc sp_7
@n INT
as
BEGIN
    if @n>0
    BEGIN
        Declare @i int = 1, @c int = 0;
        WHILE @i<=@n
        BEGIN
            set @c+=@i;
            set @i+=1;
        END
        PRINT('La suma acumulada es '+cast(@c as varchar));
    END ELSE BEGIN
    print 'El valor de n debe ser mayor a 0'
    END
END

GO
exec sp_7 5;

use prueba_sp;


--Seleccionar de NORTHWIND todas las ordenes de compra para un año determinado
SELECT * FROM ORDERS WHERE year(OrderDate) = 1996


GO
create or ALTER proc Proc_orderYear
@year INT
as
BEGIN
    SELECT * FROM ORDERS WHERE DATEPART(YEAR, OrderDate) = @year
END

GO
exec Proc_orderYear 1996;


GO
create proc Total_Ventas_perCliente_enRango
    @yearInicio INT, 
    @yearFin INT
AS
BEGIN
    SELECT c.companyname as 'Cliente', SUM(det.UnitPrice * det.Quantity) as 'Total de Ventas', datepart(YEAR, ord.OrderDate) as 'Año'
    FROM Orders as ord
    INNER JOIN [Order Details] as det
    ON ord.OrderID = det.OrderID
    inner join customers as c
    on c.customerid = ord.customerid
    where DATEPART(year, OrderDate) between @yearInicio and @yearFin
    GROUP BY c.companyname, datepart(YEAR, ord.OrderDate)
    order by 'Total de Ventas' desc
END

GO
exec Total_Ventas_perCliente_enRango 1995, 1996;

















-- Parametro Salida
GO
Create or ALTER PROCEDURE calcular_area
@radio float,
@area float OUTPUT
AS
BEGIN
    set @area = PI() * @radio * @radio
END
GO

DECLARE @resp float
exec calcular_area @radio = 22.3, @area = @resp output
print 'El area es: '+cast(@resp as varchar)
go


create or alter proc sp_obtener_datosempleado
@numeroEmpleado int,
@fullname varchar(20) OUTPUT
AS
BEGIN
    SELECT @fullname=CONCAT(FirstName, ' ', LastName)
    from Employees
    Where EmployeeID = @numeroEmpleado
END;
go

declare @outpt varchar(20)
exec sp_obtener_datosempleado2 42, @fullname = @outpt output
print @outpt;
GO

create or alter proc sp_obtener_datosempleado2
@numeroEmpleado int,
@fullname varchar(20) OUTPUT
AS
BEGIN
    DECLARE @i VARCHAR(20);
    SELECT @i=CONCAT(FirstName, ' ', LastName)
    from Employees
    Where EmployeeID = @numeroEmpleado

    IF @i!=''
    BEGIN
        set @fullname = @i;
    END
    ELSE
    BEGIN
        set @fullname = 'No hay nada';
    END
END
go

