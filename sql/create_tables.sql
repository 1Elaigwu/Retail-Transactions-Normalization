-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    StoreLocation VARCHAR(100),
    PaymentMethod VARCHAR(50)
);

-- Create Products table
CREATE TABLE Products (
    ProductID VARCHAR(10) PRIMARY KEY,
    ProductCategory VARCHAR(100),
    Price DECIMAL(10, 2)
);

-- Create Transactions table
CREATE TABLE Transactions (
    TransactionID SERIAL PRIMARY KEY,
    CustomerID VARCHAR(10),
    ProductID VARCHAR(10),
    Quantity INT,
    DiscountApplied DECIMAL(5, 2),
    TotalAmount DECIMAL(10, 2),
    TransactionDate TIMESTAMP,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
