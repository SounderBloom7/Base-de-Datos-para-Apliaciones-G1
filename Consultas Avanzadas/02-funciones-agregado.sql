-- Funciones de agredado y agrupación 

-- Utilizar base de datos
use NORTHWND;

-- Funciones de Agregado

-- Seleccionar el numero de total de ordenes de compra

-- count(*)

select count(*) as 'Numero de ordenes' from orders;

select count(*) from Customers;

-- count(campo)

select count(region) from customers;

-- Seleccionar el maximo numero de productos pedidos
select max(Quantity) as 'Cantidad' 
from [order Details];

-- Seleccionar el minimo numero de productos pedidos
select min(Quantity) as 'Cantidad' 
from [order Details];


-- Selecionar el total de la cantidades de los productos pedidos
select sum(unitprice) from [order Details];

-- Seleccionar el total de dinero que he vendido 
select sum(Quantity * od.unitprice) as total 
from [order Details] as od
INNER JOIN products as p
on od.productid = p.productid
where p.productName = 'Aniseed Syrup';

-- Seleccionar el promedio de las ventas del producto 3

select avg(Quantity * od.unitprice) as 'Promedio de Ventas' 
from [order Details] as od
INNER JOIN products as p
on od.productid = p.productid
where p.productName = 'Aniseed Syrup';


-- Selecionar el numero de productos por categoria

select categoryid, count(*) as 'numero de productos'
from products

select categoryid, count(*) as 'Total de Productos'
from products
group by categoryid;

select count(*)
from products

-- Seleccionar el numero de productos por el nombre de la categoria

select c.categoryname, count(*) as 'Total de Productos'
from categories as c
inner join products as p
on c.categoryid = p.categoryid
where c.categoryname in ('Beverages', 'Confections')
group by c.categoryname;

