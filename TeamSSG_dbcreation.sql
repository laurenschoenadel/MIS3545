-- Lauren, Emma, Andy
CREATE DATABASE eCommerceOfficeSupplies;
GO

USE eCommerceOfficeSupplies;
GO

-- Create the Address, Customer, Sales Order, Sales Order Product and Product tables
CREATE TABLE Address(
AddressID bigint NOT NULL PRIMARY KEY,
AddressLine varchar(MAX) NOT NULL,
City varchar(MAX) NOT NULL,
State varchar(MAX) NOT NULL,
ZipCode varchar(9) NOT NULL);

CREATE TABLE Customer(
CustomerID bigint NOT NULL PRIMARY KEY,
FirstName varchar(MAX) NOT NULL,
LastName varchar(MAX) NOT NULL,
EmailAddress varchar(MAX) NOT NULL,
PhoneNumber varchar(10) NOT NULL,
BillingAddressID bigint NOT NULL,
CONSTRAINT [FK_BillingAddressID] FOREIGN KEY (BillingAddressID) REFERENCES Address(AddressID));

CREATE TABLE SalesOrder(
SalesOrderID bigint NOT NULL PRIMARY KEY,
CustomerID bigint NOT NULL,
OrderDate date NOT NULL,
Status varchar (MAX) NOT NULL,
TotalAmount money NOT NULL,
CONSTRAINT [FK_CustomerID] FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID));

CREATE TABLE Product(
ProductID bigint NOT NULL PRIMARY KEY,
ProductType varchar (MAX) NOT NULL,
Name varchar (MAX) NOT NULL,
Vendor varchar (MAX) NOT NULL,
Description varchar (MAX) NOT NULL,
Price money NOT NULL,
Cost money NOT NULL);

CREATE TABLE SalesOrderProduct(
SalesOrderProductID bigint NOT NULL PRIMARY KEY,
SalesOrderID bigint NOT NULL,
ProductID bigint NOT NULL,
Quantity bigint NOT NULL,
CONSTRAINT [FK_SalesOrderID] FOREIGN KEY (SalesOrderID) REFERENCES SalesOrder(SalesOrderID),
CONSTRAINT [FK_ProductID] FOREIGN KEY (ProductID) REFERENCES Product(ProductID));


-- Add addresses
INSERT INTO Address(AddressID, AddressLine, City, State, ZipCode) VALUES 
(1, '161 Great Pond', 'Glastonbury', 'CT', '06033'),
(2, '34 Old Post Road', 'Walpole', 'MA', '02081'),
(3, '21 Forest Street', 'Wellesley', 'MA', '02481'),
(4, '96 Union Street', 'Walpole', 'CT', '02457'),
(5, '34 Tall Pines Drive', 'Weston', 'CT', '02986'),
(6, '48 Plympton Street', 'Walpole', 'MA', '02032'),
(7, '67 Ash Swamp Road', 'Glastonbury', 'CT', '06033'),
(8, '101 Main Street', 'Walpole', 'MA', '02081'),
(9, '45 Abott Road', 'Wellesley', 'MA', '02481'),
(10, '46 Bennidict Road', 'Porthsmith', 'NH', '04584');


-- Add Customers
INSERT INTO Customer(CustomerID, FirstName, LastName, EmailAddress, PhoneNumber, BillingAddressID) VALUES 
(1, 'Emma' , 'Sewell', 'esewell@gmail.com', 2515469442, 1),
(2, 'Lauren', 'Schoenadel', 'lschoenadel@gmail.com', 1255464478,2),
(3, 'Andy', 'Goncalves', 'agoncalves@gmail.com', 9495694371, 3),
(4, 'John', 'Smith', 'jsmith@gmail.com', 6304468851, 4),
(5, 'Patrick', 'Dunn', 'pdunn@gmail.com', 2269062721, 5),
(6, 'Kristen', 'Howard', 'khoward@gmail.com', 6719251352, 6),
(7, 'Michael', 'Scott', 'mscott@gmail.com', 5679293400, 7),
(8, 'Greg', 'Mayor', 'gmayor@gmail.com', 8904561278, 8),
(9, 'Kate', 'Manning', 'kmanning@gmail.com', 1908872347, 9),
(10, 'Ben', 'Egan', 'began@gmailcom', 5089334578,10);


-- Add Sales Order
INSERT INTO SalesOrder(SalesOrderID, CustomerID, OrderDate, Status, TotalAmount) VALUES 
(1, 1, '2018-01-01', 'Delivered', $12.00),
(2, 2, '2018-03-11', 'Shipped', $32.14),
(3, 3, '2018-01-12', 'Delivered', $44.77), 
(4, 4, '2018-03-18', 'Shipped', $5.17),
(5, 5, '2018-02-05', 'Delivered', $54.33), 
(6, 6, '2018-03-11', 'Shipped', $22.66),
(7, 7, '2018-03-03', 'Delivered', $40.99),
(8, 8, '2018-01-02', 'Delivered', $1.33),
(9, 9, '2018-03-04', 'Shipped', $56.43),
(10, 10, '2018-01-11', 'Delivered', $32.86);

-- Add Sales Order Product
INSERT INTO SalesOrderProduct(ProductID, SalesOrderID, SalesOrderProductID, Quantity) VALUES 
(1, 1, 1, 5),
(2, 2, 2, 7),
(3, 3, 3, 1), 
(4, 4, 4, 1),
(5, 5, 5, 3), 
(6, 6, 6, 2),
(7, 7, 7, 2),
(8, 8, 8, 4),
(9, 9, 9, 1),
(10,10, 10, 1);


-- Add Product
INSERT INTO Product(ProductID, ProductType, Name, Vendor, Description, Price, Cost) VALUES 
(1, 'Office Supplies', 'Emma', 'Staples', 'Stapler and Pens', $12.00, $6.00),
(2, 'Office Supplies', 'Lauren', 'Office Max', 'Binders', $32.14, $7.32 ),
(3, 'Furniture', 'Andy','Office Max', 'Lamp', $44.77, $26.11), 
(4, 'Office Supplies', 'John','Office Max', 'Paper', $5.17, $2.48),
(5, 'Furniture', 'Patrick','Staples', 'Chair', $54.33, $35.99), 
(6, 'Stationary', 'Kristen','Office Max', 'Letters', $22.66, $12.99),
(7, 'Furniture', 'Michael','Office Max', 'Chair', $40.99, $28.00), 
(8, 'Office Supplies', 'Greg','Staples', 'Highlighter', $1.33, $0.24),
(9, 'Furniture', 'Kate','Office Max', 'Chair', $56.43, $38.88),
(10,'Office Supplies', 'Ben','Staples', 'Pencils and Markers', $32.86, $16.44);

GO
