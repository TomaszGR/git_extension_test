
SET STATISTICS IO, TIME ON 
DBCC DROPCLEANBUFFERS; 
DBCC FREEPROCCACHE; 

GO

--prosty join============
select o.CustomerID, o.OrderID, o.OrderDate, o.ShipCountry  from [dbo].[Orders] o
inner join (
	SELECT  max([OrderID]) as [OrderID] , [CustomerID] 
	FROM [dbo].[Orders]
	Group by CustomerID) as maxid on maxid.[OrderID] = o.[OrderID]; 

/*
DBCC DROPCLEANBUFFERS; 
DBCC FREEPROCCACHE; 
GO
--with================
with s1 as (
	SELECT  max([OrderID]) as [OrderID], [CustomerID] 
	FROM [dbo].[Orders]
	Group by CustomerID )
select s1.CustomerID, s1.OrderID, OrderDate, ShipCountry from s1
inner join [dbo].[Orders] as o on o.OrderID= s1.OrderID;
*/
DBCC DROPCLEANBUFFERS; 
DBCC FREEPROCCACHE; 
GO
-- podzapytanie skorelowane
select o.CustomerID, o.OrderID, o.OrderDate, o.ShipCountry  
from [dbo].[Orders] o
where o.orderid = (
	SELECT  max([OrderID])
	FROM [dbo].[Orders] as maxid
	WHERE maxid.CustomerID  = o.CustomerID ); 


SELECT /* UDF */ CustomerId, OrderId, ShipCountry
FROM dbo.Orders as o1
WHERE  OrderID =  dbo.GetMax(CustomerId);