CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

CREATE TABLE dimCustomer (
    CustomerKey INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT,
    FirstName NVARCHAR(255),
    LastName NVARCHAR(255),
    Email NVARCHAR(255),
    State NVARCHAR(255)
);

CREATE TABLE dimProduct (
    ProductKey INT IDENTITY(1,1) PRIMARY KEY,
    ProductID INT,
    ProductName NVARCHAR(255)
);

CREATE TABLE dimDeliveryMethod (
    DeliveryMethodKey INT IDENTITY(1,1) PRIMARY KEY,
    DeliveryMethodID INT,
    DeliveryMethodName NVARCHAR(255)
);

CREATE TABLE dimDate (
    DateKey INT IDENTITY(1,1) PRIMARY KEY,
    Date DATE NOT NULL,
    Year INT,
    Quarter INT,
    Month INT,
    Day INT
);

CREATE TABLE factOrders (
    SalesKey INT IDENTITY(1,1) PRIMARY KEY,
    DateKey INT,
    CustomerKey INT,
    ProductKey INT,
    DeliveryMethodKey INT,
    TotalAmount DECIMAL(18,2),
    FOREIGN KEY (DateKey) REFERENCES dimDate(DateKey),
    FOREIGN KEY (CustomerKey) REFERENCES dimCustomer(CustomerKey),
    FOREIGN KEY (ProductKey) REFERENCES dimProduct(ProductKey),
    FOREIGN KEY (DeliveryMethodKey) REFERENCES dimDeliveryMethod(DeliveryMethodKey)
);

INSERT INTO dimCustomer (CustomerID, FirstName, LastName, Email, State)
SELECT CustomerID, FirstName, LastName, Email, State
FROM ElectronicsStore.dbo.Customers;

INSERT INTO dimProduct (ProductID, ProductName)
SELECT ProductID, ProductName
FROM ElectronicsStore.dbo.Products;

INSERT INTO dimDeliveryMethod (DeliveryMethodID, DeliveryMethodName)
SELECT DeliveryMethodID, Name
FROM ElectronicsStore.dbo.DeliveryMethods;

DECLARE @StartDate DATE = '2022-01-01';
DECLARE @EndDate DATE = '2025-12-31';

WHILE @StartDate <= @EndDate
BEGIN
    INSERT INTO dimDate (Date, Year, Quarter, Month, Day)
    VALUES (
        @StartDate,
        YEAR(@StartDate),
        DATEPART(QUARTER, @StartDate),
        MONTH(@StartDate),
        DAY(@StartDate)
    );

    SET @StartDate = DATEADD(DAY, 1, @StartDate);
END;

INSERT INTO factOrders (DateKey, CustomerKey, ProductKey, DeliveryMethodKey, TotalAmount)
SELECT 
    d.DateKey,
    c.CustomerKey,
    p.ProductKey,
    dm.DeliveryMethodKey,
    o.TotalAmount
FROM 
    ElectronicsStore.dbo.Orders o
JOIN ElectronicsStore.dbo.OrderDetails od ON o.OrderID = od.OrderID
JOIN dimDate d ON o.OrderDate = d.Date
JOIN dimCustomer c ON o.CustomerID = c.CustomerID
JOIN dimProduct p ON od.ProductID = p.ProductID
JOIN dimDeliveryMethod dm ON o.DeliveryMethodID = dm.DeliveryMethodID;