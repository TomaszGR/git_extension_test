USE AdventureWorks2016;
GO
SELECT Name, [Color]
FROM Production.Product
WHERE EXISTS
    (SELECT * 
     FROM Production.ProductSubcategory
     WHERE ProductSubcategoryID = Production.Product.ProductSubcategoryID
        AND Name = 'Wheels')