-- This script will insert all transactions from the Retail_Transactions table into the Transactions table.

-- Insert data into Transactions table
INSERT INTO Transactions (CustomerID, ProductID, Quantity, DiscountApplied, TotalAmount, TransactionDate)
SELECT CustomerID, ProductID, Quantity, DiscountApplied, TotalAmount, TransactionDate
FROM Retail_Transactions;
