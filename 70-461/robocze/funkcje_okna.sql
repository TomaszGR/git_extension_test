USE Northwind;
 
--Tradycyjne u¿ywanie funkcji agreguj¹cych z GROUP BY 
select OrderID , SUM(UnitPrice*Quantity) as TotWartosc
from dbo.[Order Details]
Group by OrderID;

select OrderID 
,UnitPrice
,Quantity
, SUM(UnitPrice*Quantity) over ( partition by OrderID ) as TotWartosc
from dbo.[Order Details]

USE AdventureWorks2016
GO
 
select SalesOrderId, ProductID, SalesOrderDetailId as DetailId, LineTotal ,
 
-- okreœlamy okna – wszystkie elementy danego zamówienia – PARTITION BY 
-- oraz ramkê. Dla ka¿dego elementu bêd¹ to wiersze od pocz¹tku przedzia³u 
-- do current row, bior¹c pod uwagê wartoœæ sortowan¹ SalesOrderDetailId
 
SUM(LineTotal) OVER(partition by SalesOrderId order by SalesOrderDetailId) as RunningSUM,
COUNT(LineTotal) OVER(partition by SalesOrderId order by SalesOrderDetailId) as QtyFrameEl,
RANK () OVER(partition by SalesOrderId order by SalesOrderDetailId) as QtyFrameEl,

-- w SQL Server 2005-2008 R2 brak mo¿liwoœci stosowania ORDER BY w OVER() 
-- w przypadku uzycia z funkcjami agreguj¹cymi np. SUM, AVG, MAX, MIN etc
-- mogliœmy wyznaczyæ agregat tylko w ramach ca³ej partycji np. TotalValue
 
	SUM(LineTotal) OVER(partition by SalesOrderId ) as TotalValue,
	COUNT(LineTotal) OVER(partition by SalesOrderId ) as QtyWindowEl
 
from Sales.SalesOrderDetail 
where SalesOrderId IN (43666,43664)

select LineTotal, SalesOrderId, SalesOrderDetailId from Sales.SalesOrderDetail 
where SalesOrderId IN (43666,43664)

select SalesOrderId, ProductID, OrderQty, 
 
SUM(OrderQty) OVER(partition by SalesOrderId order by OrderQty) as RunningQty,
COUNT(OrderQty) OVER(partition by SalesOrderId order by OrderQty) as QtyFrameElements
 
from Sales.SalesOrderDetail 
where SalesOrderId IN (43666,43664)