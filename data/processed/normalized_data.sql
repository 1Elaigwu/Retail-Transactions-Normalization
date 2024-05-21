-- Insert data into Customers table
INSERT INTO Customers (CustomerID, StoreLocation, PaymentMethod)
SELECT DISTINCT CustomerID, StoreLocation, PaymentMethod
FROM Retail_Transactions;

-- Insert data into Products table
INSERT INTO Products (ProductID, ProductCategory, Price)
SELECT DISTINCT ProductID, ProductCategory, Price
FROM Retail_Transactions;

-- Insert data into Transactions table
INSERT INTO Transactions (CustomerID, ProductID, Quantity, DiscountApplied, TotalAmount, TransactionDate)
SELECT CustomerID, ProductID, Quantity, DiscountApplied, TotalAmount, TransactionDate
FROM Retail_Transactions;
