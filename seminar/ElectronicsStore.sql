USE [master]
GO
/****** Object:  Database [ElectronicsStore]    Script Date: 1/11/2024 3:39:23 PM ******/
CREATE DATABASE [ElectronicsStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ElectronicsStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ElectronicsStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ElectronicsStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ElectronicsStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ElectronicsStore] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ElectronicsStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ElectronicsStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ElectronicsStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ElectronicsStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ElectronicsStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ElectronicsStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [ElectronicsStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ElectronicsStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ElectronicsStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ElectronicsStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ElectronicsStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ElectronicsStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ElectronicsStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ElectronicsStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ElectronicsStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ElectronicsStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ElectronicsStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ElectronicsStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ElectronicsStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ElectronicsStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ElectronicsStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ElectronicsStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ElectronicsStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ElectronicsStore] SET RECOVERY FULL 
GO
ALTER DATABASE [ElectronicsStore] SET  MULTI_USER 
GO
ALTER DATABASE [ElectronicsStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ElectronicsStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ElectronicsStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ElectronicsStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ElectronicsStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ElectronicsStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ElectronicsStore', N'ON'
GO
ALTER DATABASE [ElectronicsStore] SET QUERY_STORE = ON
GO
ALTER DATABASE [ElectronicsStore] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ElectronicsStore]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 1/11/2024 3:39:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 1/11/2024 3:39:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NULL,
	[Street] [nvarchar](255) NULL,
	[City] [nvarchar](100) NULL,
	[State] [nvarchar](100) NULL,
	[ZipCode] [nvarchar](20) NULL,
	[RoleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeliveryMethods]    Script Date: 1/11/2024 3:39:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeliveryMethods](
	[DeliveryMethodID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[DeliveryTime] [nvarchar](50) NULL,
	[Description] [nvarchar](1000) NULL,
	[Price] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[DeliveryMethodID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 1/11/2024 3:39:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 1/11/2024 3:39:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[OrderDate] [nvarchar](50) NULL,
	[TotalAmount] [decimal](10, 2) NULL,
	[DeliveryMethodID] [int] NULL,
	[OrderStatusID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderStatus]    Script Date: 1/11/2024 3:39:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderStatus](
	[OrderStatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductBrands]    Script Date: 1/11/2024 3:39:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductBrands](
	[ProductBrandID] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductBrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 1/11/2024 3:39:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NULL,
	[CategoryID] [int] NULL,
	[Price] [decimal](10, 2) NULL,
	[StockQuantity] [int] NULL,
	[ProductTypeID] [int] NULL,
	[ProductBrandID] [int] NULL,
	[SupplierID] [int] NULL,
	[PictureUrl] [nvarchar](255) NULL,
	[Description] [nvarchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTypes]    Script Date: 1/11/2024 3:39:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTypes](
	[ProductTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 1/11/2024 3:39:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[CustomerID] [int] NULL,
	[Rating] [int] NULL,
	[ReviewText] [nvarchar](1000) NULL,
	[ReviewDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 1/11/2024 3:39:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 1/11/2024 3:39:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](100) NULL,
	[ContactName] [nvarchar](50) NULL,
	[ContactEmail] [nvarchar](100) NULL,
	[ContactPhone] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (1, N'Electronics')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (2, N'Accessories')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (3, N'Home Appliances')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (4, N'Gaming')
INSERT [dbo].[Categories] ([CategoryID], [CategoryName]) VALUES (5, N'Office Supplies')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email], [Phone], [Street], [City], [State], [ZipCode], [RoleID]) VALUES (1, N'John', N'Doe', N'john.doe@example.com', N'123-456-7890', N'123 Main St', N'Anytown', N'Anystate', N'12345', 2)
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email], [Phone], [Street], [City], [State], [ZipCode], [RoleID]) VALUES (2, N'Jane', N'Smith', N'jane.smith@example.com', N'987-654-3210', N'456 Elm St', N'Othertown', N'Otherstate', N'67890', 2)
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email], [Phone], [Street], [City], [State], [ZipCode], [RoleID]) VALUES (3, N'Alice', N'Johnson', N'alice.johnson@example.com', N'555-123-4567', N'789 Oak St', N'Sometown', N'Somestate', N'54321', 2)
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email], [Phone], [Street], [City], [State], [ZipCode], [RoleID]) VALUES (4, N'Bob', N'Brown', N'bob.brown@example.com', N'555-987-6543', N'321 Pine St', N'Yourtown', N'Yourstate', N'98765', 2)
INSERT [dbo].[Customers] ([CustomerID], [FirstName], [LastName], [Email], [Phone], [Street], [City], [State], [ZipCode], [RoleID]) VALUES (5, N'Charlie', N'Davis', N'charlie.davis@example.com', N'555-654-3210', N'654 Maple St', N'Thistown', N'Thisstate', N'87654', 2)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[DeliveryMethods] ON 

INSERT [dbo].[DeliveryMethods] ([DeliveryMethodID], [Name], [DeliveryTime], [Description], [Price]) VALUES (1, N'Standard Shipping', N'3-5 business days', N'Delivery within 3-5 business days', CAST(5.00 AS Decimal(10, 2)))
INSERT [dbo].[DeliveryMethods] ([DeliveryMethodID], [Name], [DeliveryTime], [Description], [Price]) VALUES (2, N'Express Shipping', N'1-2 business days', N'Delivery within 1-2 business days', CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[DeliveryMethods] ([DeliveryMethodID], [Name], [DeliveryTime], [Description], [Price]) VALUES (3, N'Overnight Shipping', N'1 business day', N'Delivery within 1 business day', CAST(25.00 AS Decimal(10, 2)))
INSERT [dbo].[DeliveryMethods] ([DeliveryMethodID], [Name], [DeliveryTime], [Description], [Price]) VALUES (4, N'International Shipping', N'5-10 business days', N'Delivery within 5-10 business days', CAST(50.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[DeliveryMethods] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (1, 1, 1, 1, CAST(999.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (2, 1, 2, 1, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (3, 2, 2, 1, CAST(799.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (4, 2, 2, 1, CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (5, 3, 3, 1, CAST(1199.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (6, 3, 4, 1, CAST(1299.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (7, 4, 5, 1, CAST(1399.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (8, 4, 6, 1, CAST(399.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (9, 5, 7, 1, CAST(149.99 AS Decimal(10, 2)))
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [Quantity], [UnitPrice]) VALUES (10, 5, 8, 1, CAST(349.99 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [TotalAmount], [DeliveryMethodID], [OrderStatusID]) VALUES (1, 1, '2023-01-01', CAST(1014.99 AS Decimal(10, 2)), 1, 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [TotalAmount], [DeliveryMethodID], [OrderStatusID]) VALUES (2, 2, '2023-01-02', CAST(814.99 AS Decimal(10, 2)), 2, 2)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [TotalAmount], [DeliveryMethodID], [OrderStatusID]) VALUES (3, 3, '2023-01-03', CAST(1349.99 AS Decimal(10, 2)), 3, 3)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [TotalAmount], [DeliveryMethodID], [OrderStatusID]) VALUES (4, 4, '2023-01-04', CAST(399.99 AS Decimal(10, 2)), 4, 4)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [TotalAmount], [DeliveryMethodID], [OrderStatusID]) VALUES (5, 5, '2023-01-05', CAST(149.99 AS Decimal(10, 2)), 1, 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderStatus] ON 

INSERT [dbo].[OrderStatus] ([OrderStatusID], [StatusName]) VALUES (1, N'Pending')
INSERT [dbo].[OrderStatus] ([OrderStatusID], [StatusName]) VALUES (2, N'Shipped')
INSERT [dbo].[OrderStatus] ([OrderStatusID], [StatusName]) VALUES (3, N'Delivered')
INSERT [dbo].[OrderStatus] ([OrderStatusID], [StatusName]) VALUES (4, N'Cancelled')
SET IDENTITY_INSERT [dbo].[OrderStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductBrands] ON 

INSERT [dbo].[ProductBrands] ([ProductBrandID], [BrandName]) VALUES (1, N'Apple')
INSERT [dbo].[ProductBrands] ([ProductBrandID], [BrandName]) VALUES (2, N'Samsung')
INSERT [dbo].[ProductBrands] ([ProductBrandID], [BrandName]) VALUES (3, N'Dell')
INSERT [dbo].[ProductBrands] ([ProductBrandID], [BrandName]) VALUES (4, N'HP')
INSERT [dbo].[ProductBrands] ([ProductBrandID], [BrandName]) VALUES (5, N'Lenovo')
SET IDENTITY_INSERT [dbo].[ProductBrands] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockQuantity], [ProductTypeID], [ProductBrandID], [SupplierID], [PictureUrl], [Description]) VALUES (1, N'iPhone 13', 1, CAST(999.99 AS Decimal(10, 2)), 50, 2, 1, 1, N'https://example.com/iphone13.jpg', N'Latest Apple smartphone')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockQuantity], [ProductTypeID], [ProductBrandID], [SupplierID], [PictureUrl], [Description]) VALUES (2, N'Galaxy S21', 1, CAST(799.99 AS Decimal(10, 2)), 30, 2, 2, 1, N'https://example.com/galaxys21.jpg', N'Latest Samsung smartphone')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockQuantity], [ProductTypeID], [ProductBrandID], [SupplierID], [PictureUrl], [Description]) VALUES (3, N'Dell XPS 13', 1, CAST(1199.99 AS Decimal(10, 2)), 20, 1, 3, 2, N'https://example.com/dellxps13.jpg', N'High-performance laptop')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockQuantity], [ProductTypeID], [ProductBrandID], [SupplierID], [PictureUrl], [Description]) VALUES (4, N'HP Spectre x360', 1, CAST(1299.99 AS Decimal(10, 2)), 15, 1, 4, 2, N'https://example.com/hpspectrex360.jpg', N'Convertible laptop')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockQuantity], [ProductTypeID], [ProductBrandID], [SupplierID], [PictureUrl], [Description]) VALUES (5, N'Lenovo ThinkPad X1', 1, CAST(1399.99 AS Decimal(10, 2)), 10, 1, 5, 3, N'https://example.com/thinkpadx1.jpg', N'Business laptop')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockQuantity], [ProductTypeID], [ProductBrandID], [SupplierID], [PictureUrl], [Description]) VALUES (6, N'Apple Watch', 2, CAST(399.99 AS Decimal(10, 2)), 100, 5, 1, 1, N'https://example.com/applewatch.jpg', N'Smartwatch')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockQuantity], [ProductTypeID], [ProductBrandID], [SupplierID], [PictureUrl], [Description]) VALUES (7, N'Samsung Galaxy Buds', 2, CAST(149.99 AS Decimal(10, 2)), 200, 5, 2, 1, N'https://example.com/galaxybuds.jpg', N'Wireless earbuds')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockQuantity], [ProductTypeID], [ProductBrandID], [SupplierID], [PictureUrl], [Description]) VALUES (8, N'Sony WH-1000XM4', 2, CAST(349.99 AS Decimal(10, 2)), 50, 5, 2, 4, N'https://example.com/sonywh1000xm4.jpg', N'Noise-cancelling headphones')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockQuantity], [ProductTypeID], [ProductBrandID], [SupplierID], [PictureUrl], [Description]) VALUES (9, N'Nintendo Switch', 4, CAST(299.99 AS Decimal(10, 2)), 25, 5, 2, 4, N'https://example.com/nintendoswitch.jpg', N'Gaming console')
INSERT [dbo].[Products] ([ProductID], [ProductName], [CategoryID], [Price], [StockQuantity], [ProductTypeID], [ProductBrandID], [SupplierID], [PictureUrl], [Description]) VALUES (10, N'Logitech MX Master 3', 5, CAST(99.99 AS Decimal(10, 2)), 75, 5, 2, 5, N'https://example.com/logitechmxmaster3.jpg', N'Wireless mouse')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductTypes] ON 

INSERT [dbo].[ProductTypes] ([ProductTypeID], [TypeName]) VALUES (1, N'Laptop')
INSERT [dbo].[ProductTypes] ([ProductTypeID], [TypeName]) VALUES (2, N'Smartphone')
INSERT [dbo].[ProductTypes] ([ProductTypeID], [TypeName]) VALUES (3, N'Tablet')
INSERT [dbo].[ProductTypes] ([ProductTypeID], [TypeName]) VALUES (4, N'Desktop')
INSERT [dbo].[ProductTypes] ([ProductTypeID], [TypeName]) VALUES (5, N'Accessory')
SET IDENTITY_INSERT [dbo].[ProductTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Reviews] ON 

INSERT [dbo].[Reviews] ([ReviewID], [ProductID], [CustomerID], [Rating], [ReviewText], [ReviewDate]) VALUES (1, 1, 1, 5, N'Great phone!', CAST(N'2023-01-03T00:00:00.000' AS DateTime))
INSERT [dbo].[Reviews] ([ReviewID], [ProductID], [CustomerID], [Rating], [ReviewText], [ReviewDate]) VALUES (2, 2, 2, 4, N'Good value for money.', CAST(N'2023-01-04T00:00:00.000' AS DateTime))
INSERT [dbo].[Reviews] ([ReviewID], [ProductID], [CustomerID], [Rating], [ReviewText], [ReviewDate]) VALUES (3, 3, 3, 5, N'Excellent laptop!', CAST(N'2023-01-05T00:00:00.000' AS DateTime))
INSERT [dbo].[Reviews] ([ReviewID], [ProductID], [CustomerID], [Rating], [ReviewText], [ReviewDate]) VALUES (4, 4, 4, 4, N'Very versatile.', CAST(N'2023-01-06T00:00:00.000' AS DateTime))
INSERT [dbo].[Reviews] ([ReviewID], [ProductID], [CustomerID], [Rating], [ReviewText], [ReviewDate]) VALUES (5, 5, 5, 5, N'Perfect for business use.', CAST(N'2023-01-07T00:00:00.000' AS DateTime))
INSERT [dbo].[Reviews] ([ReviewID], [ProductID], [CustomerID], [Rating], [ReviewText], [ReviewDate]) VALUES (6, 6, 1, 4, N'Nice smartwatch.', CAST(N'2023-01-08T00:00:00.000' AS DateTime))
INSERT [dbo].[Reviews] ([ReviewID], [ProductID], [CustomerID], [Rating], [ReviewText], [ReviewDate]) VALUES (7, 7, 2, 3, N'Decent earbuds.', CAST(N'2023-01-09T00:00:00.000' AS DateTime))
INSERT [dbo].[Reviews] ([ReviewID], [ProductID], [CustomerID], [Rating], [ReviewText], [ReviewDate]) VALUES (8, 8, 3, 5, N'Amazing headphones!', CAST(N'2023-01-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Reviews] ([ReviewID], [ProductID], [CustomerID], [Rating], [ReviewText], [ReviewDate]) VALUES (9, 9, 4, 5, N'Fun gaming console.', CAST(N'2023-01-11T00:00:00.000' AS DateTime))
INSERT [dbo].[Reviews] ([ReviewID], [ProductID], [CustomerID], [Rating], [ReviewText], [ReviewDate]) VALUES (10, 10, 5, 4, N'Great mouse for work.', CAST(N'2023-01-12T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Reviews] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[Roles] ([RoleID], [RoleName]) VALUES (2, N'Customer')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Suppliers] ON 

INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [ContactName], [ContactEmail], [ContactPhone]) VALUES (1, N'Tech Supplies Inc.', N'Alice Johnson', N'alice.johnson@techsupplies.com', N'555-123-4567')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [ContactName], [ContactEmail], [ContactPhone]) VALUES (2, N'Gadget World', N'Bob Brown', N'bob.brown@gadgetworld.com', N'555-987-6543')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [ContactName], [ContactEmail], [ContactPhone]) VALUES (3, N'Electro Goods', N'Charlie Davis', N'charlie.davis@electrogoods.com', N'555-654-3210')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [ContactName], [ContactEmail], [ContactPhone]) VALUES (4, N'Device Hub', N'David Evans', N'david.evans@devicehub.com', N'555-321-6547')
INSERT [dbo].[Suppliers] ([SupplierID], [SupplierName], [ContactName], [ContactEmail], [ContactPhone]) VALUES (5, N'Tech Warehouse', N'Eve Foster', N'eve.foster@techwarehouse.com', N'555-789-1234')
SET IDENTITY_INSERT [dbo].[Suppliers] OFF
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([DeliveryMethodID])
REFERENCES [dbo].[DeliveryMethods] ([DeliveryMethodID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([OrderStatusID])
REFERENCES [dbo].[OrderStatus] ([OrderStatusID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductTypes] ([ProductTypeID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([ProductBrandID])
REFERENCES [dbo].[ProductBrands] ([ProductBrandID])
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD CHECK  (([Rating]>=(1) AND [Rating]<=(5)))
GO
USE [master]
GO
ALTER DATABASE [ElectronicsStore] SET  READ_WRITE 
GO
