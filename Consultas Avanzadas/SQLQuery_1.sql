SELECT * FROM Orders
WHERE EmployeeID = 1
or EmployeeID = 9
or EmployeeID = 2;

SELECT * FROM Orders
where EmployeeID in(1,9,2);

--seleccionar todas las ordenes, dividiendo la fecha de orden en año, mes y día
SELECT OrderDate as 'Fecha de Oren',
YEAR(OrderDate) as 'Año'
 FROM Orders;

SELECT OrderID, CustomerID, EmployeeID, OrderDate
FROM Orders
WHERE OrderDate BETWEEN '1996-04-01' and '1996-08-31';

-- Seleccionar todas las ordenes entre 1996 y 1998
SELECT * FROM Orders WHERE year(OrderDate) BETWEEN '1996' and '1998';

SELECT * FROM Orders WHERE year(OrderDate) in('1996', '1999');


--Seleccionar productos que comiencen con c

SELECT * FROM Products WHERE ProductName LIKE 'c%';

-- Seleccionar todos los productos que terminen con S
SELECT * FROM Products WHERE ProductName LIKE '%s';

-- Seleccionar todos los productos que el nombre del producto contenga la palabra no

SELECT * FROM Products WHERE ProductName LIKE '%no%';

-- Seleccionar todos los productos que contengan las letras a o n
SELECT * FROM Products WHERE ProductName LIKE '%a%' or ProductName LIKE '%n%';

--Seleccionar el total de ordenes hechas por cada uno de los provedores
SELECT s.CompanyName as 'Proveedor', COUNT(*) as 'Total de Ordenees'
FROM Suppliers as s
INNER JOIN Products as p
ON s.SupplierID = p.SupplierID
INNER JOIN [Order Details] as od
ON od.ProductID = p.ProductID
GROUP BY s.CompanyName;



-- Seleccionar el total de dinero vendido que he vendido por proovedor del ultimo trimestre de 1996
SELECT s.CompanyName as 'Proveedor', sum(od.UnitPrice * od.Quantity) as 'Total de Ventas $'
FROM Suppliers as s
INNER JOIN products as p
on s.SupplierID = p.SupplierID
INNER JOIN [Order Details] as od
on od.ProductID = p.ProductID
INNER JOIN Orders as o
on o.OrderID = od.OrderID
WHERE o.OrderDate BETWEEN '1996-09-01' and '1996-12-31'
GROUP BY s.CompanyName
ORDER BY 'Total de Ventas $' desc;

-- Selecccionar el total de diner vendido por categoria
SELECT sum(od.Quantity * od.UnitPrice) as 'Total de Ventas'
FROM [Order Details] as od
INNER JOIN Products as p
on od.ProductID = p.ProductID
INNER JOIN categories as c
on c.CategoryID = p.CategoryID
GROUP BY c.categoryname;



SELECT *
FROM [Order Details] as od
INNER JOIN Products as p
on od.ProductID = p.ProductID
INNER JOIN Categories as c
on c.categoryid = p.categoryid;



SELECT (emp.FirstName + ' ' + emp.LastName) as 'Nombre del Empleado', ord.ShipCountry as 'Pais de Envio', ord.CustomerID as 'Nombre del Cliente'
FROM Orders as ord
INNER JOIN Employees as emp
ON emp.EmployeeID = ord.EmployeeID;


-- Selecccionar el total de dinero vendido por categoria
SELECT cat.CategoryName as 'Categoria', SUM(ordDet.Quantity * prd.UnitPrice) as 'Dinero Vendido'
FROM [Order Details] as ordDet
INNER JOIN Products as prd
ON prd.ProductID = ordDet.ProductID
INNER JOIN Categories as cat
ON cat.CategoryID = prd.CategoryID
GROUP BY cat.CategoryName

