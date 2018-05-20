use Northwind;
go

DBCC FREEPROCCACHE;
DBCC DROPCLEANBUFFERS;
CHECKPOINT;
go

exec sp_executesql N'select * from dbo.Orders where customerid = @custid',
	N'@Custid char(5)', N'ERNSH';

EXEC sp_executesql
  N'SELECT * FROM dbo.Orders WHERE CustomerID = @CustID',
  N'@CustID CHAR(5)', N'ERNSH';


  EXEC sp_executesql
  N'SELECT * FROM dbo.Orders WHERE CustomerID = @CustID',
  N'@CustID CHAR(5)', N'ERNSH'
 
EXEC sp_executesql
  N'SELECT * FROM dbo.Orders WHERE CustomerID = @CustID',
  N'@CustID CHAR(5)', N'FRANK'
 
SELECT qt.TEXT as SQL_Query, usecounts, size_in_bytes ,
	cacheobjtype, objtype
FROM sys.dm_exec_cached_plans p 
	CROSS APPLY sys.dm_exec_sql_text(p.plan_handle) qt
WHERE   qt.TEXT like '%Orders%' 
	and qt.TEXT not like '%dm_exec%'

	(@CustID CHAR(5))
	SELECT * FROM dbo.Orders WHERE CustomerID = @CustID



	DBCC DROPCLEANBUFFERS; -- czyszczenie pamiêci podrêcznej
 
SET STATISTICS IO ON
 
SELECT * FROM dbo.Orders WHERE CustomerID = 'FRANK'  
GO
 
SELECT * FROM dbo.Orders WHERE CustomerID = 'FRANK'  
GO