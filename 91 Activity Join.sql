/*Joins - use the mkwinery database*/
use winery

/*List all records in the winery table*/
Select *
From dbo.winery

/*List all records in the regions table*/
Select *
From dbo.region

/*Now use an inner join – what records do you get?*/
Select dbo.winery.*,dbo.region.*
From dbo.winery
Inner Join
dbo.region
on dbo.winery.RegionID = dbo.region.RegionID

/*Now use a left outer join – what records do you get?*/
Select dbo.winery.*,dbo.region.*
From dbo.winery
Left Outer Join
dbo.region
on dbo.winery.RegionID = dbo.region.RegionID

/*Now use a right outer join – what records do you get?*/
Select dbo.winery.*,dbo.region.*
From dbo.winery
Right Outer Join
dbo.region
on dbo.winery.RegionID = dbo.region.RegionID

/*Now use a full outer join – what records do you get?*/
Select dbo.winery.*,dbo.region.*
From dbo.winery
Full Outer Join
dbo.region
on dbo.winery.RegionID = dbo.region.RegionID


/*Union – use the northwnd database*/
use NORTHWND

/*Use the UNION to find the cities and countries in which we have suppliers or customers.*/

SELECT CompanyName,ContactName,ContactTitle,Address,City,Region,PostalCode,Country,Phone,Fax FROM dbo.Customers
UNION
SELECT CompanyName,ContactName,ContactTitle,Address,City,Region,PostalCode,Country,Phone,Fax FROM dbo.Suppliers;

/*Use the UNION ALL statement to achieve the same thing – what is the difference between the two?*/

SELECT CompanyName,ContactName,ContactTitle,Address,City,Region,PostalCode,Country,Phone,Fax  FROM dbo.Customers
UNION All
SELECT CompanyName,ContactName,ContactTitle,Address,City,Region,PostalCode,Country,Phone,Fax  FROM dbo.Suppliers;

/*The UNION operator selects only distinct values by default. To allow duplicate values, use UNION ALL:*/

/*SubQuery - use the adventureworks database*/
use AdventureWorks2019

/*List the names of employees who have greater sick leave available than the average amount of sick leave.*/



SELECT Person.Person.FirstName,Person.Person.LastName, HumanResources.Employee.SickLeaveHours
FROM Person.Person
Inner Join
HumanResources.Employee
on Person.Person.BusinessEntityID = HumanResources.Employee.BusinessEntityID
WHERE HumanResources.Employee.SickLeaveHours >  
	(SELECT avg(HumanResources.Employee.SickLeaveHours)
 	FROM HumanResources.Employee) 