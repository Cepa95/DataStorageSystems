CREATE DATABASE ElectronicsStore;
GO

USE ElectronicsStore;
GO

CREATE TABLE Roles (
    RoleID INT PRIMARY KEY IDENTITY(1,1),
    RoleName NVARCHAR(50)
);
GO

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100),
    Phone NVARCHAR(20),
    Street NVARCHAR(255),
    City NVARCHAR(100),
    State NVARCHAR(100),
    ZipCode NVARCHAR(20),
    RoleID INT,
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);
GO

CREATE TABLE ProductTypes (
    ProductTypeID INT PRIMARY KEY IDENTITY(1,1),
    TypeName NVARCHAR(50)
);
GO

CREATE TABLE ProductBrands (
    ProductBrandID INT PRIMARY KEY IDENTITY(1,1),
    BrandName NVARCHAR(50)
);
GO

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY IDENTITY(1,1),
    SupplierName NVARCHAR(100),
    ContactName NVARCHAR(50),
    ContactEmail NVARCHAR(100),
    ContactPhone NVARCHAR(20)
);
GO

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName NVARCHAR(50)
);
GO

CREATE TABLE DeliveryMethods (
    DeliveryMethodID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100),
    DeliveryTime NVARCHAR(50),
    Description NVARCHAR(1000),
    Price DECIMAL(10, 2)
);
GO

CREATE TABLE OrderStatus (
    OrderStatusID INT PRIMARY KEY IDENTITY(1,1),
    StatusName NVARCHAR(50)
);
GO

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(100),
    CategoryID INT,
    Price DECIMAL(10, 2),
    StockQuantity INT,
    ProductTypeID INT,
    ProductBrandID INT,
    SupplierID INT,
    PictureUrl NVARCHAR(255),
    Description NVARCHAR(1000),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID),
    FOREIGN KEY (ProductTypeID) REFERENCES ProductTypes(ProductTypeID),
    FOREIGN KEY (ProductBrandID) REFERENCES ProductBrands(ProductBrandID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);
GO

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT,
    OrderDate DATETIME,
    TotalAmount DECIMAL(10, 2),
    DeliveryMethodID INT,
    OrderStatusID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (DeliveryMethodID) REFERENCES DeliveryMethods(DeliveryMethodID),
    FOREIGN KEY (OrderStatusID) REFERENCES OrderStatus(OrderStatusID)
);
GO

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
GO

CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY IDENTITY(1,1),
    ProductID INT,
    CustomerID INT,
    Rating INT CHECK (Rating >= 1 AND Rating <= 5),
    ReviewText NVARCHAR(1000),
    ReviewDate DATETIME,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
GO
