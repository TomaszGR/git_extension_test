USE NorthWind
Go
-- jak znaleŸæ nazwê tabeli, zawieraj¹c¹ okreœlon¹ nazwê kolumny
select t.name as TabName, c.name as ColName
from sys.columns c 
	inner join sys.tables t on c.object_id=t.object_id
where c.name like '%price%'


USE NorthWind
Go
-- jak znaleŸæ nazwê tabeli, zawieraj¹c¹ okreœlon¹ nazwê kolumny
select c.*, c.name as ColName
from sys.columns c 
where c.name like '%price%'

USE [AdventureWorks2016]
select * from sys.tables where name like '%EMP%'


select  OBJECT_NAME(c.object_id) as TabName,c.name as ColName 
from sys.columns c 
where c.name like '%price%'

select DB_NAME() as TABLE_CATALOG,
	SCHEMA_NAME() as TABLE_SCHEMA,
	NAME as TABLE_NAME, 
	type_desc as TABLE_TYPE
from sys.tables
where NAME like 'C%'
UNION
select DB_NAME() as TABLE_CATALOG,
	SCHEMA_NAME() as TABLE_SCHEMA,
	NAME as TABLE_NAME, 
	type_desc as TABLE_TYPE 
from sys.views
where NAME like 'C%'


USE Northwind
GO
 
SELECT OBJECT_NAME(object_ID) AS TableName, * 
FROM sys.indexes
WHERE OBJECT_NAME(object_ID) = 'Orders'
----
SELECT DB_ID() as ID_bazy, 
DB_NAME() as Nazwa_bazy, 
DB_NAME(1) as NazwaBazyId1


SELECT	@@SERVICENAME as InstanceName, 
	@@VERSION as SQLServerVersion

	SELECT @@TRANCOUNT as LiczbaOtwartychTransakcji
 
BEGIN TRANSACTION  --nowa transakcja
 
SELECT @@TRANCOUNT as LiczbaOtwartychTransakcji

rollback transaction

exec sp_helpdb 'Northwind';
 
exec sp_spaceused;
exec sp_spaceused 'dbo.Orders'