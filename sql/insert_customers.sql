-- This script will insert unique customers from the Retail_Transactions table into the Customers table.

-- Insert data into Customers table
INSERT INTO Customers (CustomerID, StoreLocation, PaymentMethod)
SELECT DISTINCT CustomerID, StoreLocation, PaymentMethod
FROM Retail_Transactions
WHERE CustomerID IS NOT NULL;
