-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT p.ProductName AS "Product", 
       c.CategoryName AS "Category"
FROM "Product" AS p
LEFT JOIN "Category" AS c
ON p.CategoryId = c.Id
ORDER BY p.ProductName;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.Id AS "Order Id", 
s.CompanyName AS "Shipped Via"
FROM "Order" As o
LEFT JOIN "Shipper" as s
ON o.ShipVia = s.Id
WHERE OrderDate < "2012-08-09";

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT p.ProductName AS "Products in Order 10251", 
       o.Quantity AS "Quantity Ordered"
FROM "OrderDetail" as o
LEFT JOIN "Product" as p
ON o.ProductId = p.Id
WHERE o.OrderId = 10251 
ORDER BY p.ProductName;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT o.Id, c.CompanyName, e.LastName
FROM "Order" as o
INNER JOIN "Customer" as c
ON o.CustomerId = c.Id
INNER JOIN "Employee" as e
ON o.EmployeeId = e.Id;

-- STRETCH
-- Displays CategoryName and a new column called Count that shows how many products are in each category. Shows 8 records.
-- Version for the TryIt Editor:
SELECT c.CategoryName As "Category", 
       COUNT(p.CategoryID) as "Count"
FROM "Categories" as c
INNER JOIN "Products" as p
ON c.CategoryID = p.CategoryID

-- Version for the SQLite Studio db browser
-- SELECT c.CategoryName As "Category", 
--        COUNT(p.CategoryId) as "Count"
-- FROM "Category" as c
-- INNER JOIN "Product" as p
-- ON c.Id = p.CategoryId
-- GROUP BY c.CategoryName

--Display OrderID and a column called ItemCount that shows the total number of products placed on the order. Shows 196 records.
-- Version for the TryIt Editor:
SELECT o.OrderID, SUM(o.Quantity) As "ItemCount"
FROM "OrderDetails" as o
GROUP BY o.OrderID

-- The version for the SQLite Studio db browser returns > 196 records due to differences between table contents
-- The northwind.db3 file has 16818 distinct order IDs in the "OrderDetail" table, whereas there are 196 online
SELECT o.OrderId, SUM(o.Quantity) As "ItemCount"
FROM "OrderDetail" as o
GROUP BY o.OrderId
