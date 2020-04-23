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
