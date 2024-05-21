-- Verify the data integrity and foreign key constraints

-- Check if Customers table has been populated correctly
SELECT COUNT(*) AS TotalCustomers FROM Customers;

-- Check if Products table has been populated correctly
SELECT COUNT(*) AS TotalProducts FROM Products;

-- Check if Transactions table has been populated correctly
SELECT COUNT(*) AS TotalTransactions FROM Transactions;

-- Check if foreign key constraints are in place
SELECT
    CASE
        WHEN NOT EXISTS (SELECT 1 FROM Transactions WHERE CustomerID NOT IN (SELECT CustomerID FROM Customers)) THEN 'Customers foreign key OK'
        ELSE 'Customers foreign key missing'
    END AS CustomerKeyCheck,
    CASE
        WHEN NOT EXISTS (SELECT 1 FROM Transactions WHERE ProductID NOT IN (SELECT ProductID FROM Products)) THEN 'Products foreign key OK'
        ELSE 'Products foreign key missing'
    END AS ProductKeyCheck;
