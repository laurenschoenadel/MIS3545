
-- Lauren, Emma, Andy
CREATE DATABASE eCommerceOfficeSupplies;
GO

USE eCommerceOfficeSupplies;
GO

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
GO

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
GO

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
GO

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
GO

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
select *
From customer;
select *
from Product;
select *
from SalesOrder;
select *
from SalesOrderProduct;
select *
from Address;

/* For this query we are looking for the average price by vendor of supplies*/
select Vendor, AVG(Price) as Average_Price 
from Product
group by Vendor;
/* for this query we are looking to find the First Name and last name for each customer who ordered and amt they ordered in $*/
select FirstName, LastName, TotalAmount 
from Customer join SalesOrder on customer.CustomerID = SalesOrder.CustomerID;
/* the following code is to allow our database to succesfully use an outerjoin*/
update SalesOrder
set CustomerID = '1'
where SalesOrderID =2;
/* The following query was designed to tell what prior customer has not ordered . To do this we will utilize the left outer join to show the null order*/
select customer.FirstName, customer.LastName, Customer.CustomerID, SalesOrderID, TotalAmount
from Customer left join SalesOrder on Customer.CustomerID = SalesOrder.CustomerID;

/* the following query will show products whose prices is greater than the average price of all products */
select product.Description as Product, Price
from Product
where Price > (Select AVG(Price)
				from Product);

					