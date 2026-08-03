create database normalization_lab;

USE normalization_lab;

 CREATE TABLE OrderData(
 	OrderID INT,
    CustomerName VARCHAR(50),
    Phone VARCHAR(15),
    Address VARCHAR(100),
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    SupplierName VARCHAR(50),
    SupplierPhone VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10,2)
);

INSERT INTO OrderData VALUES
(101,'Rahul','9876500011','Delhi','Laptop','Electronics','ABC Suppliers','9991111111',1,65000),
(102,'Rahul','9876500011','Delhi','Mouse','Electronics','ABC Suppliers','9991111111',2,700),
(103,'Rahul','9876500011','Delhi','Keyboard','Electronics','ABC Suppliers','9991111111',1,1200),
(104,'Aman','9876500022','Noida','Laptop','Electronics','ABC Suppliers','9991111111',1,65000),
(105,'Aman','9876500022','Noida','Pendrive','Accessories','XYZ Traders','9992222222',3,500),
(107,'Priya','9876500033','Lucknow','Headphones','Accessories','XYZ Traders','9992222222',1,1800),
(108,'Sneha','9876500044','Jaipur','Mouse','Electronics','ABC Suppliers','9991111111',2,700),
(109,'Sneha','9876500044','Jaipur','Keyboard','Electronics','ABC Suppliers','9991111111',1,1200),
(110,'Rohit','9876500055','Patna','Laptop','Electronics','ABC Suppliers','9991111111',1,65000),
(111,'Rohit','9876500055','Patna','Pendrive','Accessories','XYZ Traders','9992222222',2,500),
(112,'Neha','9876500066','Delhi','Headphones','Accessories','XYZ Traders','9992222222',1,1800);

select * from OrderData;

CREATE TABLE Customers(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Phone VARCHAR(15),
    Address VARCHAR(100)
);

CREATE TABLE Suppliers(
	SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(50),
    SupplierPhone VARCHAR(15)
);

CREATE TABLE Products(
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails(
	OrderID INT,
    ProductID INT, 
    Quantity INT,
    PRIMARY KEY(OrderID, ProductID),
    foreign key(OrderID) references Orders(OrderID),
    foreign key(ProductID) references Products(ProductID)
);
    
INSERT INTO Customers VALUES
(1,'Rahul','9876500011','Delhi'),
(2,'Aman','9876500022','Noida'),
(3,'Priya','9876500033','Lucknow'),
(4,'Sneha','9876500044','Jaipur'),
(5,'Rohit','9876500055','Patna'),
(6,'Neha','9876500066','Delhi');


INSERT INTO Suppliers VALUES
(1,'ABC Suppliers','9991111111'),
(2,'XYZ Traders','9992222222');

INSERT INTO Products VALUES
(1,'Laptop','Electronics',65000,1),
(2,'Mouse','Electronics',700,1),
(3,'Keyboard','Electronics',1200,1),
(4,'Pendrive','Accessories',500,2),
(5,'Headphones','Accessories',1800,2);

INSERT INTO Orders VALUES
(101,1),
(102,1),
(103,1),
(104,2),
(105,2),
(107,3),
(108,4),
(109,4),
(110,5),
(111,5),
(112,6);

INSERT INTO OrderDetails VALUES
(101,1,1),
(102,2,2),
(103,3,1),
(104,1,1),
(105,4,3),
(107,5,1),
(108,2,2),
(109,3,1),
(110,1,1),
(111,4,2),
(112,5,1);

select o.OrderID, c.* from Orders as o inner join Customers as c on o.CustomerID = c.CustomerID;

select c.CustomerName, p.ProductName from Customers as c 
inner join Orders as o on c.CustomerID = o.CustomerID 
inner join OrderDetails as od on o.OrderID = od.OrderID 
inner join Products as p on od.ProductID = p.ProductID;

select c.CustomerName, p.ProductName, od.Quantity from Customers as c 
inner join Orders as o on c.CustomerID = o.CustomerID 
inner join OrderDetails as od on o.OrderID = od.OrderID 
inner join Products as p on od.ProductID = p.ProductID;

select c.CustomerName, p.ProductName, p.Price from Customers as c 
inner join Orders as o on c.CustomerID = o.CustomerID 
inner join OrderDetails as od on o.OrderID = od.OrderID 
inner join Products as p on od.ProductID = p.ProductID;

select p.ProductName, sum(p.Price) as Total_Bill from Customers as c 
inner join Orders as o on c.CustomerID = o.CustomerID 
inner join OrderDetails as od on o.OrderID = od.OrderID 
inner join Products as p on od.ProductID = p.ProductID
group by p.ProductID ;

drop table Customers;
drop table Orders;
drop table Suppliers;
drop table Products;
drop table OrderDetails;

INSERT INTO Customers VALUES
(101,'Amit Sharma','9876543210','Delhi'),
(102,'Priya Singh','9876543211','Mumbai'),
(103,'Rahul Verma','9876543212','Delhi'),
(104,'Sneha Gupta','9876543213','Pune'),
(105,'Arjun Mehta','9876543214','Bangalore'),
(106,'Neha Kapoor','9876543215','Delhi'),
(107,'Rohan Das','9876543216','Kolkata'),
(108,'Simran Kaur','9876543217','Chandigarh'),
(109,'Anjali Roy','9876543218','Mumbai'),
(110,'Vikas Yadav','9876543219','Lucknow'),
(111,'Karan Malhotra','9876543220','Delhi'),
(112,'Pooja Jain','9876543221','Jaipur'),
(113,'Harsh Kumar','9876543222','Delhi'),
(114,'Nikita Sharma','9876543223','Mumbai');

INSERT INTO Suppliers VALUES
(1,'TechWorld','9991111111'),
(2,'HomeEssentials','9991111112'),
(3,'FashionHub','9991111113'),
(4,'FreshFoods','9991111114'),
(5,'OfficeMart','9991111115'),
(6,'Global Suppliers','9991111116'),
(7,'Future Electronics','9991111117'),
(8,'Dream Traders','9991111118');

INSERT INTO Products VALUES
(201,'Laptop','Electronics',55000,1),
(202,'Mouse','Electronics',800,1),
(203,'Keyboard','Electronics',1500,1),
(204,'Office Chair','Furniture',6500,2),
(205,'Dining Table','Furniture',12000,2),
(206,'T-Shirt','Clothing',700,3),
(207,'Jeans','Clothing',1500,3),
(208,'Rice Bag','Groceries',1800,4),
(209,'Cooking Oil','Groceries',1800,4),
(210,'Notebook','Stationery',120,5),
(211,'Printer','Electronics',12000,5),
(212,'Monitor','Electronics',15000,7),
(213,'Headphones','Electronics',2500,7),
(214,'Bookshelf','Furniture',6500,2),
(215,'Pen Drive','Electronics',800,1);

INSERT INTO Orders VALUES
(1001,101),
(1002,102),
(1003,101),
(1004,103),
(1005,104),
(1006,105),
(1007,106),
(1008,107),
(1009,108),
(1010,109),
(1011,105),
(1012,110);

INSERT INTO OrderDetails VALUES
(1001,201,1),
(1001,202,2),
(1002,203,1),
(1002,206,3),
(1003,204,1),
(1003,203,5),
(1004,205,1),
(1004,207,2),
(1005,208,4),
(1005,209,3),
(1006,201,1),
(1006,213,2),
(1007,202,4),
(1007,211,1),
(1008,203,2),
(1009,212,1),
(1009,206,2),
(1010,207,3),
(1010,208,2),
(1011,201,1),
(1011,205,1),
(1012,202,3),
(1012,209,4);

select * from Products;

select p.ProductName, s.SupplierName from Products as p 
left join Suppliers as s on p.SupplierID = s.SupplierID;  

select o.OrderID as OID, c.CustomerID as CID, c.CustomerName as Customer, c.Phone, 
c.Address, p.ProductID as PID, p.ProductName as Product, p.Category, p.Price, od.Quantity, 
(p.Price * od.Quantity) as Total_Amount, s.SupplierName as Supplier, s.SupplierPhone from Orders o 
inner join Customers c on o.CustomerID = c.CustomerID 
inner join OrderDetails od on o.OrderID = od.OrderID
inner join Products p on od.ProductID = p.ProductID
inner join Suppliers s on p.SupplierID = s.SupplierID
order by o.OrderID;

select p.ProductName as Product, p.Price, s.SupplierName as Supplier from Products as p 
inner join Suppliers as s on p.SupplierID = s.SupplierID; 

select p.ProductName as Product, s.SupplierName as Supplier from Products as p
inner join Suppliers as s on p.SupplierID = s.SupplierID where p.Category = "Electronics";

select distinct c.CustomerName as Customer, o.OrderID from Orders as o 
inner join Customers as c on o.CustomerID = o.CustomerID;

select od.OrderID, p.ProductName, od.Quantity, p.Price from OrderDetails as od
inner join Products as p on od.ProductID = p.ProductID;

select c.CustomerName, p.ProductName, od.Quantity from OrderDetails as od
inner join Products as p on od.ProductID = p.ProductID
inner join Orders as o on od.OrderID = o.OrderID
inner join Customers as c on o.CustomerID = c.CustomerID;

select p.ProductName, s.SupplierName from Products as p 
inner join Suppliers as s on p.SupplierID = s.SupplierID
where p.Price > 1000;

select c.CustomerName, p.ProductName, od.Quantity from OrderDetails as od
inner join Products as p on od.ProductID = p.ProductID
inner join Orders as o on od.OrderID = o.OrderID
inner join Customers as c on o.CustomerID = c.CustomerID
where c.CustomerName like "A%";

select p.ProductName, s.SupplierName from Products as p 
inner join Suppliers as s on p.SupplierID = s.SupplierID
where s.SupplierName like "%Tech%";

select p.ProductName, s.SupplierName from Products as p 
inner join Suppliers as s on p.SupplierID = s.SupplierID
where p.Price between 500 and 3000
order by p.Price desc;

select c.CustomerName, o.OrderID from Customers as c
inner join Orders as o on c.CustomerID = o.CustomerID
where c.Address like "%Delhi%";

select p.ProductName, od.Quantity from Products as p
inner join OrderDetails as od on p.ProductID = od.ProductID
where od.Quantity > 5;

select s.SupplierName, p.ProductName, p.Category from Suppliers as s
inner join Products as p on s.SupplierID = p.SupplierID
where p.Category in ("Electronics", "Furniture");

select c.CustomerName, p.ProductName, od.Quantity, c.Address from OrderDetails as od
inner join Products as p on od.ProductID = p.ProductID
inner join Orders as o on od.OrderID = o.OrderID
inner join Customers as c on o.CustomerID = c.CustomerID
where c.Address not like "%Mumbai%";

select c.CustomerName, s.SupplierName,  p.ProductName, od.Quantity, p.Price from Customers as c
inner join Orders o on c.CustomerID = o.CustomerID
inner join OrderDetails od on o.OrderID = od.OrderID
inner join Products p on od.ProductID = p.ProductID
inner join Suppliers as s on p.SupplierID = s.SupplierID
order by p.Price desc limit 5;

select c.CustomerName, sum(od.Quantity) as Total_Quantity from Customers as c
inner join Orders o on c.CustomerID = o.CustomerID
inner join OrderDetails od on o.OrderID = od.OrderID
group by c.CustomerName
order by Total_Quantity desc limit 1;

select p.* from Products p
where p.price > (select avg(Price) from Products);

select p.* from Products p
where p.price = (select max(price) from Products);

select distinct CustomerName from Customers 
where CustomerID in (select CustomerID from Orders);

select distinct ProductID, ProductName from Products 
where ProductID not in (select ProductID from OrderDetails);

select SupplierName from Suppliers
where SupplierID in (
	select SupplierID from Products 
	where Price > ( select avg(Price) from Products )
);

SELECT SupplierID,
       SupplierName
FROM Suppliers
WHERE SupplierID NOT IN (
    SELECT SupplierID
    FROM Products
    WHERE ProductID IN (
        SELECT ProductID
        FROM OrderDetails
    )
);

SELECT ProductID,
       ProductName,
       Price
FROM Products
WHERE Price = (
    SELECT MAX(Price)
    FROM Products
    WHERE Price < (
        SELECT MAX(Price)
        FROM Products
    )
);

SELECT ProductID,
       ProductName,
       Category,
       Price
FROM Products
WHERE Price > ALL (
    SELECT Price
    FROM Products
    WHERE Category = 'Stationery'
);

SELECT UPPER(CustomerName) AS CustomerName
FROM Customers;

SELECT LOWER(CustomerName) AS CustomerName
FROM Customers;

SELECT CustomerName, LENGTH(CustomerName) AS NameLength
FROM Customers;

SELECT CONCAT(CustomerName, ' - ', Address) AS Customer_Details
FROM Customers;

SELECT LEFT(CustomerName, 4) AS First4Chars
FROM Customers;

SELECT REPLACE(CustomerName, 'a', '*') AS ModifiedName
FROM Customers;

SELECT TRIM('             Database Systems              ') AS TrimmedText;

SELECT UPPER(CustomerName) AS CustomerName, LOWER(Address) AS City
FROM Customers;

SELECT LEFT(ProductName, 3) AS First3Letters
FROM Products;

SELECT ProductID, ProductName FROM Products 
WHERE LENGTH(ProductName) > 8;

SELECT CONCAT(CustomerName, ' (', Address, ')') AS CustomerDetails
FROM Customers;

SELECT REPLACE(ProductName, ' ', '_') AS ProductName
FROM Products;

SELECT CustomerName, Address, LENGTH(Address) AS CityLength FROM Customers;

SELECT CustomerName, 
CONCAT(SUBSTRING(CustomerName,1,1), SUBSTRING(CustomerName, LOCATE(' ', CustomerName)+1, 1)) 
AS Initials FROM Customers;

SELECT CONCAT(c.CustomerName, ' Purchased ', p.ProductName) AS PurchaseDetails FROM Customers c 
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID;

SELECT LEFT(ProductName,5) AS First5Letters
FROM Products;

SELECT UPPER(ProductName) AS ProductName
FROM Products;

SELECT SupplierName, LENGTH(SupplierName) AS TotalCharacters
FROM Suppliers;

SELECT TRIM(CustomerName) AS CustomerName
FROM Customers;

SELECT CONCAT(CustomerName, ' - ', Address) AS Customer_Details
FROM Customers;

SELECT c.CustomerID, c.CustomerName, SUM(p.Price * od.Quantity) AS TotalAmountSpent
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY c.CustomerID, c.CustomerName;

SELECT c.CustomerID, c.CustomerName, COUNT(o.OrderID) AS TotalOrders
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName
HAVING COUNT(o.OrderID) > 2;

SELECT s.SupplierID, s.SupplierName, AVG(p.Price) AS AveragePrice
FROM Suppliers s JOIN Products p ON s.SupplierID = p.SupplierID
GROUP BY s.SupplierID, s.SupplierName;

SELECT ProductID, ProductName, Category, Price 
FROM Products ORDER BY Price DESC LIMIT 5;

SELECT ProductID, ProductName, Price FROM Products 
WHERE ProductID NOT IN ( SELECT ProductID FROM OrderDetails );

SELECT s.SupplierID, s.SupplierName, COUNT(p.ProductID) AS Total_Products_Supplied
FROM Suppliers s LEFT JOIN Products p ON s.SupplierID = p.SupplierID
GROUP BY s.SupplierID, s.SupplierName;

SELECT c.CustomerID, c.CustomerName, COUNT(DISTINCT p.SupplierID) AS TotalSuppliers
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY c.CustomerID, c.CustomerName HAVING COUNT(DISTINCT p.SupplierID) > 1;

SELECT p.ProductID, p.ProductName, SUM(od.Quantity) AS TotalQuantity
FROM Products p JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY p.ProductID, p.ProductName ORDER BY TotalQuantity DESC LIMIT 1;

SELECT LEFT(ProductName, 3) AS First3Chars FROM Products
WHERE Price > ( SELECT AVG(Price) FROM Products );

SELECT UPPER(c.CustomerName) AS CustomerName, SUM(p.Price * od.Quantity) AS TotalPurchaseAmount
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
GROUP BY c.CustomerID, c.CustomerName;

