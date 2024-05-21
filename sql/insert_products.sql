-- This script will insert unique products from the Retail_Transactions table into the Products table.

-- Insert data into Products table
INSERT INTO Products (ProductID, ProductCategory, Price)
SELECT DISTINCT ProductID, ProductCategory, Price
FROM Retail_Transactions
WHERE ProductID IS NOT NULL;
