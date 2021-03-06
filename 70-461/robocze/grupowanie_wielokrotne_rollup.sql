USE Northwind
GO
 --select * from dbo.Orders;
-- Query1
SELECT 1 as Poziom, NULL as Rok, NULL as Kw , count(OrderId) as OrderQty
FROM dbo.Orders
WHERE YEAR(OrderDate) between  1997 and 1998
union all
SELECT 2 as Poziom, YEAR(OrderDate) as Rok, NULL as Kw , count(OrderId) as OrderQty
FROM dbo.Orders
WHERE YEAR(OrderDate) between  1997 and 1998
group by YEAR(OrderDate)
union all
SELECT 3 as Poziom, YEAR(OrderDate) as Rok, datepart(q,OrderDate) as Kw , count(OrderId) as OrderQty
FROM dbo.Orders
WHERE YEAR(OrderDate) between  1997 and 1998
group by datepart(q,OrderDate),YEAR(OrderDate)
order by Rok

--======================

SELECT  YEAR(OrderDate) as Rok, datepart(q,OrderDate) as Kw , count(OrderId) as OrderQty
FROM dbo.Orders
WHERE YEAR(OrderDate) between  1997 and 1998
group by rollup (YEAR(OrderDate),datepart(q,OrderDate))

SELECT Year(Orderdate)  as Rok, DatePart(q,Orderdate)  as Q , count(OrderId) as OrderQty
FROM dbo.Orders
WHERE YEAR(OrderDate) between  1997 and 1998
GROUP BY CUBE(Year(Orderdate)  , DatePart(q,Orderdate))
order by rok


SELECT Year(Orderdate)  as Rok, DatePart(q,Orderdate)  as Q , count(OrderId) as OrderQty
FROM dbo.Orders
WHERE YEAR(OrderDate) between  1997 and 1998
GROUP BY GROUPING SETS
(
	(),
	(Year(Orderdate)) ,
	(Year(Orderdate)  , DatePart(q,Orderdate))
 
)
ORDER BY Rok, Q

SELECT Year(Orderdate)  as Rok, DatePart(q,Orderdate)  as Q , count(OrderId) as OrderQty
FROM dbo.Orders
WHERE YEAR(OrderDate) between  1997 and 1998
GROUP BY GROUPING SETS
(
	(Year(Orderdate)) ,
	(Year(Orderdate)  , DatePart(q,Orderdate))
 
)
ORDER BY Rok, Q

