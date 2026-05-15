
SELECT * FROM Customer_T;
SELECT * FROM Order_T;
SELECT * FROM Product_T;
SELECT * FROM Orderline_T;
CREATE TABLE Product_T(
ProductID INT(8) PRIMARY KEY,
ProductDescription VARCHAR(50),
ProductFinish VARCHAR(20),
ProductStandardPrice INT);

CREATE TABLE Orderline_T(
OrderID INT(8),
ProductID INT(8),
OrderedQuantity INT(8),
PRIMARY KEY (OrderID, ProductID),
CONSTRAINT fk_order
FOREIGN KEY (OrderID)
REFERENCES Order_T(OrderID),

Constraint fk_product 
foreign key (ProductID)
references Product_T(ProductID)
);
 ALTER TABLE Customer_T
 ADD CustomerEmail VARCHAR(50);
 
 DESCRIBE Customer_T;
 
 CREATE INDEX idx_product_price
 ON Product_T(ProductStandardPrice);
 
 DESCRIBE Product_T;
 
 INSERT INTO Customer_T (CustomerID, CustomerName, CustomerCity, CustomerState, CustomerPostalCode)
 VALUES (1100,'Juliet Anang', 'East Legon' , 'Accra', 'GA100');
 
 INSERT INTO Customer_T(CustomerID, CustomerName, CustomerCity, CustomerState, CustomerPostalCode)
 VALUES (1101, 'Justin Amoah' , 'Takoradi' , 'Western', 'WR101');
 
 INSERT INTO Customer_T(CustomerID, CustomerName, CustomerCity, CustomerState, CustomerPostalCode)
 VALUES (1102, 'Emmanuel Peprah', 'Achimota' , 'Accra' , 'GA110');
  
 INSERT INTO Customer_T(CustomerID, CustomerName, CustomerCity, CustomerState, CustomerPostalCode)
 VALUES (1103, 'Kwame Eric','Mampong', 'Eastern','ER113');
 
 INSERT INTO Customer_T(CustomerID, CustomerName, CustomerCity, CustomerState, CustomerPostalCode)
 VALUES (1104, 'Julian Asamoah', 'Kumasi', 'Ashanti','AR100');
 
 
 INSERT INTO Order_T(OrderID, OrderDate, CustomerID)
 VALUES (2001,'2026-02-20', 1100);
 
  INSERT INTO Order_T
 VALUES (2002, '2026-02-25', 1101);
 
  INSERT INTO Order_T
 VALUES (2003, '2026-03-05', 1102);
 
  INSERT INTO Order_T
 VALUES (2004, '2026-04-20', 1103);
 
  INSERT INTO Order_T
 VALUES (2005, '2026-05-11', 1104);
 
 
 
 INSERT INTO Product_T(ProductID, ProductDescription, ProductFinish, ProductStandardPrice)
 VALUES (3001, 'Office Desk' , 'Cherry', 500.00);

INSERT INTO Product_T(ProductID, ProductDescription, ProductFinish, ProductStandardPrice)
 VALUES (3002, 'Bookshelf' , 'Walnut', 350.00);
 
 INSERT INTO Product_T(ProductID, ProductDescription, ProductFinish, ProductStandardPrice)
 VALUES (3003, 'Office Chair' , 'Red Oak', 250.00);
 
 INSERT INTO Product_T(ProductID, ProductDescription, ProductFinish, ProductStandardPrice)
 VALUES (3004, 'Coffee Table' , 'Natural Ash', 400.00);
 
 INSERT INTO Product_T(ProductID, ProductDescription, ProductFinish, ProductStandardPrice)
 VALUES (3005, 'Wardrobe' , 'White', 950.00);
 
 INSERT INTO Product_T(ProductID, ProductDescription, ProductFinish, ProductStandardPrice)
 VALUES (3000, 'Cherry Dining Table' , 'Cherry', 800.00);
 
 
 INSERT INTO OrderLine_T(OrderID, ProductID, OrderedQuantity)
 VALUES (2002, 3001, 5);
 
 INSERT INTO OrderLine_T(OrderID, ProductID, OrderedQuantity)
 VALUES (2001, 3002, 8);
 
 INSERT INTO OrderLine_T(OrderID, ProductID, OrderedQuantity)
 VALUES (2003, 3003, 6);
 
 INSERT INTO OrderLine_T(OrderID, ProductID, OrderedQuantity)
 VALUES (2004, 3004, 4);
 
 INSERT INTO OrderLine_T(OrderID, ProductID, OrderedQuantity)
 VALUES (2005, 3005, 12);
 
 
 SELECT CustomerName, CustomerCity, CustomerState
 FROM Customer_T
 WHERE CustomerState = 'Greater Accra'
 OR CustomerCity ='Kumasi'
 ORDER BY CustomerName;
 
 SELECT 
 MAX(ProductStandardPrice) AS "Max_Price",
min(ProductStandardPrice) AS "Min_Price",
 avg (ProductStandardPrice) AS "Avg_Price"
 FROM Product_T;
 
  
 SELECT Order_T.OrderID, Customer_T.CustomerName
 FROM Order_T
 INNER JOIN Customer_T
 ON Order_T.CustomerID = Customer_T.CustomerID;
 
 SELECT ProductID,
 SUM(OrderedQuantity) AS Total_Quantity
 FROM OrderLine_T
 GROUP BY ProductID
 HAVING SUM(OrderedQuantity) > 10;
 
 
 UPDATE Customer_T
 SET CustomerCity = 'Koforidua'
 WHERE CustomerID = 1100;
 
 DELETE FROM Order_T
 WHERE OrderDate <('2023-01-01');
SET SQL_SAFE_UPDATES = 0;
DESCRIBE Order_T;

 GRANT SELECT, insert
 ON Order_T
 TO Sales_Clerk;
 
 REVOKE DELETE
 ON Product_T
 FROM Sales_Clerk;
 


