
USE master;
IF DB_ID('LabDW') IS NOT NULL
  DROP DATABASE LABDW;
GO
CREATE DATABASE LabDW
GO
 
ALTER DATABASE LABDW SET RECOVERY SIMPLE WITH NO_WAIT;
GO

-- Sequence for the Customers dimension
USE LabDW;
GO


-- Drop the tables in correct order if needed
IF OBJECT_ID('dbo.InternetSales','U') IS NOT NULL
  DROP TABLE dbo.InternetSales;
GO
IF OBJECT_ID('dbo.Customers','U') IS NOT NULL
  DROP TABLE dbo.Customers;
GO
IF OBJECT_ID('dbo.Products','U') IS NOT NULL
  DROP TABLE dbo.Products;
GO
IF OBJECT_ID('dbo.Dates') IS NOT NULL
  DROP TABLE dbo.Dates;
GO


-- Customers dimension  with a PK
CREATE TABLE [dbo].[Customers](
	[CustomerDwKey] [int] IDENTITY(1,1) NOT NULL,
	[CustomerKey] [int] NOT NULL,
	[FullName] [nvarchar](150) NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
	[MaritalStatus] [nvarchar](5) NULL,
	[Gender] [nvarchar](10) NULL,
	[Education] [nvarchar](50) NULL,
	[Occupation] [nvarchar](100) NULL,
	[City] [nvarchar](30) NULL,
	[StateProvince] [nvarchar](50) NULL,
	[CountryRegion] [nvarchar](50) NULL,
	[Age]  AS (case when datediff(year,[BirthDate],getdate())<=(40) then 'Younger' when datediff(year,[BirthDate],getdate())>(50) then 'Older' else 'Middle Age' end),
	[CurrentFlag] [bit] NOT NULL,
	[ValidFrom] [date] NULL,
	[ValidTo] [date] NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerDwKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Customers] ADD  CONSTRAINT [DF__Customers__Curre__47DBAE45]  DEFAULT ((1)) FOR [CurrentFlag]
GO
-- Products dimension with a PK
CREATE TABLE dbo.Products
(
 ProductKey      INT          NOT NULL,
 ProductName     NVARCHAR(50) NULL,
 Color           NVARCHAR(15) NULL,
 Size            NVARCHAR(50) NULL,
 SubcategoryName NVARCHAR(50) NULL,
 CategoryName    NVARCHAR(50) NULL,
 CONSTRAINT PK_Products PRIMARY KEY (ProductKey)
);
GO

INSERT INTO dbo.Products
(ProductKey, ProductName, Color,
Size, SubcategoryName, CategoryName)
SELECT P.ProductKey, P.EnglishProductName, P.Color,
P.Size, S.EnglishProductSubcategoryName, C.EnglishProductCategoryName
FROM AdventureWorksDW2019.dbo.DimProduct AS P
INNER JOIN AdventureWorksDW2019.dbo.DimProductSubcategory AS S
ON P.ProductSubcategoryKey = S.ProductSubcategoryKey
INNER JOIN AdventureWorksDW2019.dbo.DimProductCategory AS C
ON S.ProductCategoryKey = C.ProductCategoryKey;


-- Dates dimension with a PK
CREATE TABLE dbo.Dates
(
 DateKey         INT          NOT NULL,
 FullDate        DATE         NOT NULL,
 MonthNumberName NVARCHAR(15) NULL,
 CalendarQuarter TINYINT      NULL,
 CalendarYear    SMALLINT     NULL,
 CONSTRAINT PK_Dates PRIMARY KEY (DateKey)
);
GO

INSERT INTO dbo.Dates
(DateKey, FullDate, MonthNumberName,
CalendarQuarter, CalendarYear)
SELECT DateKey, FullDateAlternateKey,
SUBSTRING(CONVERT(CHAR(8), FullDateAlternateKey, 112), 5, 2)
+ ' ' + EnglishMonthName,
CalendarQuarter, CalendarYear
FROM AdventureWorksDW2019.dbo.DimDate;


-- InternetSales fact table with a PK

CREATE TABLE [dbo].[InternetSales](
	[InternetSalesKey] [int] IDENTITY(1,1) NOT NULL,
	[CustomerDwKey] [int] NULL,
	[ProductKey] [int] NULL,
	[DateKey] [int] NULL,
	[OrderQuantity] [smallint] NULL,
	[SalesAmount] [money] NULL,
	[UnitPrice] [money] NULL,
	[DiscountAmount] [float] NULL,
 CONSTRAINT [PK_InternetSales] PRIMARY KEY CLUSTERED 
(
	[InternetSalesKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- Create the schema stg to stage all needed source tables
CREATE SCHEMA stg AUTHORIZATION dbo;
GO
-- Drop the tables if needed
IF OBJECT_ID('stg.Person','U') IS NOT NULL
  DROP TABLE stg.Person;
GO

IF OBJECT_ID('stg.Customer','U') IS NOT NULL
  DROP TABLE stg.Customer;
GO

IF OBJECT_ID('stg.CustomerInformation','U') IS NOT NULL
  DROP TABLE stg.CustomerInformation;
GO
-- Create stage tables

CREATE TABLE stg.Person
(
 BusinessEntityID INT          NULL,
 PersonType       NCHAR(2)     NULL,
 Title            NVARCHAR(8)  NULL,
 FirstName        NVARCHAR(50) NULL,
 MiddleName       NVARCHAR(50) NULL,
 LastName         NVARCHAR(50) NULL,
 Suffix           NVARCHAR(10) NULL,
 ModifiedDate     DATETIME     NULL
);

USE [LabDW]
GO

INSERT INTO [stg].[Person]
           ([BusinessEntityID]
           ,[PersonType]
           ,[Title]
           ,[FirstName]
           ,[MiddleName]
           ,[LastName]
           ,[Suffix]
           ,[ModifiedDate])
    SELECT [BusinessEntityID]
      ,[PersonType]
       ,[Title]
      ,[FirstName]
      ,[MiddleName]
      ,[LastName]
      ,[Suffix]
       ,[ModifiedDate]
  FROM [AdventureWorks2019].[Person].[Person];


CREATE TABLE stg.Customer
(
 CustomerID    INT          NULL,
 PersonID      INT          NULL,
 StoreID       INT          NULL,
 TerritoryID   INT          NULL,
 AccountNumber NVARCHAR(20) NULL,
 ModifiedDate  DATETIME     NULL,
);



INSERT INTO [stg].[Customer]
           ([CustomerID]
           ,[PersonID]
           ,[StoreID]
           ,[TerritoryID]
           ,[AccountNumber]
           ,[ModifiedDate])
    SELECT [CustomerID]
      ,[PersonID]
      ,[StoreID]
      ,[TerritoryID]
      ,[AccountNumber]
      ,[ModifiedDate]
	  FROM [AdventureWorks2019].[Sales].[Customer]


CREATE TABLE stg.CustomerInformation 
(
 PersonID          INT NULL,
 EnglishEducation  NVARCHAR(30) NULL,
 EnglishOccupation NVARCHAR(50) NULL,
 BirthDate         DATE NULL,
 Gender            NCHAR(5) NULL,
 MaritalStatus     NCHAR(5) NULL,
 EmailAddress      NVARCHAR(50) NULL
);


CREATE TABLE dbo.UpdateCustomers
(
CustomerKey INT NOT NULL,
FullName NVARCHAR(150) NULL,
EmailAddress NVARCHAR(50) NULL,
BirthDate DATE NULL,
MaritalStatus NCHAR(5) NULL,
Gender NCHAR(5) NULL,
Education NVARCHAR(40) NULL,
Occupation NVARCHAR(100) NULL,
City NVARCHAR(30) NULL,
StateProvince NVARCHAR(50) NULL,
CountryRegion NVARCHAR(50) NULL
);


/****** Object:  Table [dbo].[ETLHistory]    Script Date: 16.11.2021. 00:58:41 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ETLHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LastDateInserted] [date] NOT NULL,
	[RunTime] [datetime] NULL,
 CONSTRAINT [PK_ETLHistory_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ETLHistory] ADD  CONSTRAINT [DFT_ETLHistory_StartTime]  DEFAULT (getdate()) FOR [LastDateInserted]
GO


INSERT INTO [dbo].[ETLHistory]
           ([LastDateInserted]
           ,[RunTime])
     VALUES
           ('1950-01-01', null)

CREATE TABLE [dbo].[CustomerNew](
	[CustomerDwKey] [int] IDENTITY(1,1) NOT NULL,
	[CustomerKey] [int] NOT NULL,
	[FullName] [nvarchar](150) NULL,
	[EmailAddress] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
	[MaritalStatus] [nchar](1) NULL,
	[Gender] [nchar](10) NULL,
	[Education] [nvarchar](40) NULL,
	[Occupation] [nvarchar](100) NULL,
	[City] [nvarchar](30) NULL,
	[StateProvince] [nvarchar](50) NULL,
	[CountryRegion] [nvarchar](50) NULL,
	[Age]  AS (case when datediff(year,[BirthDate],getdate())<=(40) then 'Youn-ger' when datediff(year,[BirthDate],getdate())>(50) then 'Older' else 'Middle Age' end)
	
 CONSTRAINT [PK_CustomerNew] PRIMARY KEY CLUSTERED 
(
	[CustomerDwKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT INTO dbo.CustomerNew
( CustomerKey, FullName,
EmailAddress, Birthdate, MaritalStatus,
Gender, Education, Occupation,
City, StateProvince, CountryRegion)
SELECT
C.CustomerKey,
C.FirstName + ' ' + C.LastName AS FullName,
C.EmailAddress, C.BirthDate, C.MaritalStatus,
C.Gender, C.EnglishEducation, C.EnglishOccupation,
G.City, G.StateProvinceName, G.EnglishCountryRegionName
FROM AdventureWorksDW2019.dbo.DimCustomer AS C
INNER JOIN AdventureWorksDW2019.dbo.DimGeography AS G
ON C.GeographyKey = G.GeographyKey;
GO

