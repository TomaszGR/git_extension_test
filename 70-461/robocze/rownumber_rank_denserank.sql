
select SalesOrderId
	,totaldue
	,ROW_NUMBER() over (order by totaldue) as rownumber
 
 
from Sales.SalesOrderHeader 


select *
from Sales.SalesOrderHeader 
order by SalesOrderId

SELECT P.Name as Product, P.ListPrice, PSC.Name as Category,
 
  -- funkcja szereguj¹ca, dzia³aj¹ca w ramach partycji wartoœci atrybutu PSC.Name 
        ROW_NUMBER() OVER(PARTITION BY PSC.Name ORDER BY P.ListPrice DESC) AS PriceRank
 
FROM Production.Product P JOIN Production.ProductSubCategory PSC
    ON P.ProductSubCategoryID = PSC.ProductSubCategoryID


SELECT p.*, psc.*
FROM Production.Product P 
JOIN Production.ProductSubCategory PSC
    ON P.ProductSubCategoryID = PSC.ProductSubCategoryID


-- pobieranie tylko najdro¿szych (równie¿ ex aequo) produktów z podkategorii
with RANKED_CTE
as (
	SELECT P.Name Product, P.ListPrice, PSC.Name Category,
	     RANK() OVER(PARTITION BY PSC.Name ORDER BY P.ListPrice DESC) AS PriceRank,
	     ROW_NUMBER() OVER(PARTITION BY PSC.Name ORDER BY P.ListPrice DESC) AS ROWN
	FROM Production.Product P JOIN Production.ProductSubCategory PSC
             ON P.ProductSubCategoryID = PSC.ProductSubCategoryID
)
select * from RANKED_CTE
where PriceRank = 1



SELECT P.Name Product, P.ListPrice, PSC.Name Category
, ROW_NUMBER() OVER(PARTITION BY PSC.Name ORDER BY P.ListPrice DESC) AS ROWN
, RANK() OVER(PARTITION BY PSC.Name ORDER BY P.ListPrice DESC) AS PriceRank
FROM Production.Product P JOIN Production.ProductSubCategory PSC
        ON P.ProductSubCategoryID = PSC.ProductSubCategoryID
	order by PSC.Name

SELECT P.Name Product, P.ListPrice, PSC.Name Category
, ROW_NUMBER() OVER( ORDER BY P.ListPrice DESC) AS ROWN
, RANK() OVER( ORDER BY P.ListPrice DESC) AS PriceRank
FROM Production.Product P JOIN Production.ProductSubCategory PSC
        ON P.ProductSubCategoryID = PSC.ProductSubCategoryID
	order by ROWN


	SELECT P.Name Product, P.ListPrice, PSC.Name Category,
 
     RANK() OVER( ORDER BY P.ListPrice DESC) AS RANK_result,
     DENSE_RANK() OVER( ORDER BY P.ListPrice DESC) AS DENSE_RANK_result
 
FROM Production.Product P JOIN Production.ProductSubCategory PSC
     ON P.ProductSubCategoryID = PSC.ProductSubCategoryID
WHERE PSC.Name = 'Handlebars'