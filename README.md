# Retail Transactions Normalization

This project demonstrates the normalization of a sales database to the Third Normal Form (3NF) to ensure efficient storage and minimize data redundancy.

## Project Structure

- `Retail_Transactions`: The original dataset containing 100,000 rows of retail transactions.
- `Customers`: A table containing unique customer data.
- `Products`: A table containing unique product data.
- `Transactions`: A table containing transaction data, referencing `Customers` and `Products`.

## Schema Design

### Customers Table

```sql
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    StoreLocation VARCHAR(100),
    PaymentMethod VARCHAR(50)
);
```

### Products Table

```sql
CREATE TABLE Products (
    ProductID VARCHAR(10) PRIMARY KEY,
    ProductCategory VARCHAR(100),
    Price DECIMAL(10, 2)
);
```

### Transactions Table

```sql
CREATE TABLE Transactions (
    TransactionID SERIAL PRIMARY KEY,
    CustomerID INT,
    ProductID VARCHAR(10),
    Quantity INT,
    DiscountApplied DECIMAL(5, 2),
    TotalAmount DECIMAL(10, 2),
    TransactionDate TIMESTAMP,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
```

## Normalization Process

The original `Retail_Transactions` table was normalized into three tables: `Customers`, `Products`, and `Transactions`.

### Step 1: Create Normalized Tables

- Created `Customers`, `Products`, and `Transactions` tables as per the schema design.

### Step 2: Insert Data

- Inserted unique customer data into the `Customers` table.

```sql
INSERT INTO Customers (CustomerID, StoreLocation, PaymentMethod)
SELECT DISTINCT CustomerID, StoreLocation, PaymentMethod FROM Retail_Transactions;
```

- Inserted unique product data into the `Products` table.

```sql
INSERT INTO Products (ProductID, ProductCategory, Price)
SELECT DISTINCT ProductID, ProductCategory, Price FROM Retail_Transactions;

```

- Inserted transaction data into the `Transactions` table.

```sql
INSERT INTO Transactions (CustomerID, ProductID, Quantity, DiscountApplied, TotalAmount, TransactionDate)
SELECT CustomerID, ProductID, Quantity, DiscountApplied, TotalAmount, TransactionDate FROM Retail_Transactions;
```

## Data Verification and Indexing

Verified the integrity of the normalized data:

```sql
SELECT * FROM Transactions
WHERE CustomerID NOT IN (SELECT CustomerID FROM Customers)
   OR ProductID NOT IN (SELECT ProductID FROM Products);
```

Added indexes to frequently queried columns to improve performance:

```sql
CREATE INDEX idx_customers_customerid ON Customers(CustomerID);
```

```sql
CREATE INDEX idx_products_productid ON Products(ProductID);
```

```sql
CREATE INDEX idx_transactions_customerid ON Transactions(CustomerID);
```

```sql
CREATE INDEX idx_transactions_productid ON Transactions(ProductID);
```

## Results

After normalization, the following data distribution was observed:

- `Retail_Transactions` contained 100,000 rows.
- `Customers` table contained 95,215 unique customer records.
- `Products` table contained 99,985 unique product records.
- `Transactions` table preserved all 100,000 original transaction records.

This indicates a successful normalization process, achieving efficient storage and minimizing data redundancy.

## Conclusion

The project successfully normalized the `Retail_Transactions` database into the Third Normal Form (3NF). The new schema improves data integrity, reduces redundancy, and ensures efficient storage.
