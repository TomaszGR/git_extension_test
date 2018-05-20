SELECT SalesOrderID, OrderDate, TotalDue, st.Name AS TerritoryName,   
	(  
      -- podzapytanie w SELECT – œrednia dla wszystkich zleceñ
	     SELECT AVG(TotalDue)  	     
		 FROM [Sales].[SalesOrderHeader]
	) AS AVG_TotalDue
FROM [Sales].[SalesOrderHeader] soh 
     inner join [Sales].[SalesTerritory] st 
	 ON soh.TerritoryID = st.TerritoryID
WHERE st.CountryRegionCode = 'GB' 
	and OrderDate between '2004-06-01' and '2004-06-30'  
      and  TotalDue >= 
          ( -- podzapytanie w filtracji w WHERE
             SELECT AVG(TotalDue) AS  AVG_TotalDue             
			 FROM [Sales].[SalesOrderHeader] )


SELECT SalesOrderID, OrderDate, CustomerID 
FROM [Sales].[SalesOrderHeader] soh 
WHERE CustomerID IN (
							 -- podzapytanie z podzapytania w WHERE
						SELECT CustomerID	
						FROM (		
							SELECT TOP 3 CustomerID , SUM(TotalDue) as TotalSales		
							FROM  [Sales].[SalesOrderHeader] soh 		
							GROUP BY CustomerID		
						ORDER BY TotalSales DESC 	) 
	AS WektorIdentyfikatorowKlientow)

SELECT * FROM [Sales].[SalesOrderHeader] soh 

with s1 as (
	select top 3 CustomerID, sum(TotalDue) as suma
	FROM [Sales].[SalesOrderHeader] 
	group by CustomerID
	order by sum(TotalDue) desc
	)
,s2 as (
select s1.customerID
	, s1.suma 
	, s2.TotalDue
	, RANK() over( partition by s1.customerID order by TotalDue desc) as ranking
from s1
inner join [Sales].[SalesOrderHeader] as s2
	on s2.CustomerID = s1.CustomerID)
select * from s2 where ranking <4;

