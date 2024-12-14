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
    State NVARCHAR(255),
    IsNew BIT
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

CREATE TABLE dimOrderStatus (
    OrderStatusKey INT IDENTITY(1,1) PRIMARY KEY,
    OrderStatusID INT,
    StatusName NVARCHAR(255)
);

CREATE TABLE factOrders (
    OrderKey INT IDENTITY(1,1) PRIMARY KEY,
    DateKey INT,
    CustomerKey INT,
    DeliveryMethodKey INT,
    OrderStatusKey INT,
    OrderId INT,
    TotalAmount DECIMAL(18,2),
    FOREIGN KEY (DateKey) REFERENCES dimDate(DateKey),
    FOREIGN KEY (CustomerKey) REFERENCES dimCustomer(CustomerKey),
    FOREIGN KEY (OrderStatusKey) REFERENCES dimOrderStatus(OrderStatusKey),
    FOREIGN KEY (DeliveryMethodKey) REFERENCES dimDeliveryMethod(DeliveryMethodKey)
);

INSERT INTO dimCustomer (CustomerID, FirstName, LastName, Email, State)
SELECT CustomerID, FirstName, LastName, Email, State
FROM ElectronicsStore.dbo.Customers;

INSERT INTO dimOrderStatus (OrderStatusID, StatusName)
SELECT OrderStatusID, StatusName
FROM ElectronicsStore.dbo.OrderStatus;

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

INSERT INTO factOrders (DateKey, CustomerKey, DeliveryMethodKey, OrderStatusKey, TotalAmount)
SELECT 
    d.DateKey,
    c.CustomerKey,
    dm.DeliveryMethodKey,
    os.OrderStatusKey,
    o.TotalAmount
FROM 
    ElectronicsStore.dbo.Orders o
JOIN dimDate d ON o.OrderDate = d.Date
JOIN dimCustomer c ON o.CustomerID = c.CustomerID
JOIN dimDeliveryMethod dm ON o.DeliveryMethodID = dm.DeliveryMethodID
JOIN dimOrderStatus os ON o.OrderStatusID = os.OrderStatusID;