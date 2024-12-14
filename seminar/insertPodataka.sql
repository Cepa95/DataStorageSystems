INSERT INTO OrderStatus (StatusName) VALUES ('Pending'), ('Shipped'), ('Delivered'), ('Cancelled');
GO

INSERT INTO Roles (RoleName) VALUES ('Admin'), ('Customer');
GO

INSERT INTO Customers (FirstName, LastName, Email, Phone, Street, City, State, ZipCode, RoleID) 
VALUES 
('John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Main St', 'Anytown', 'Anystate', '12345', 2),
('Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', '456 Elm St', 'Othertown', 'Otherstate', '67890', 2),
('Alice', 'Johnson', 'alice.johnson@example.com', '555-123-4567', '789 Oak St', 'Sometown', 'Somestate', '54321', 2),
('Bob', 'Brown', 'bob.brown@example.com', '555-987-6543', '321 Pine St', 'Yourtown', 'Yourstate', '98765', 2),
('Charlie', 'Davis', 'charlie.davis@example.com', '555-654-3210', '654 Maple St', 'Thistown', 'Thisstate', '87654', 2);
GO

INSERT INTO ProductTypes (TypeName) VALUES ('Laptop'), ('Smartphone'), ('Tablet'), ('Desktop'), ('Accessory');
GO

INSERT INTO ProductBrands (BrandName) VALUES ('Apple'), ('Samsung'), ('Dell'), ('HP'), ('Lenovo');
GO

INSERT INTO Suppliers (SupplierName, ContactName, ContactEmail, ContactPhone) 
VALUES 
('Tech Supplies Inc.', 'Alice Johnson', 'alice.johnson@techsupplies.com', '555-123-4567'),
('Gadget World', 'Bob Brown', 'bob.brown@gadgetworld.com', '555-987-6543'),
('Electro Goods', 'Charlie Davis', 'charlie.davis@electrogoods.com', '555-654-3210'),
('Device Hub', 'David Evans', 'david.evans@devicehub.com', '555-321-6547'),
('Tech Warehouse', 'Eve Foster', 'eve.foster@techwarehouse.com', '555-789-1234');
GO

INSERT INTO Categories (CategoryName) VALUES ('Electronics'), ('Accessories'), ('Home Appliances'), ('Gaming'), ('Office Supplies');
GO

INSERT INTO DeliveryMethods (Name, DeliveryTime, Description, Price) 
VALUES 
('Standard Shipping', '3-5 business days', 'Delivery within 3-5 business days', 5.00),
('Express Shipping', '1-2 business days', 'Delivery within 1-2 business days', 15.00),
('Overnight Shipping', '1 business day', 'Delivery within 1 business day', 25.00),
('International Shipping', '5-10 business days', 'Delivery within 5-10 business days', 50.00);
GO

INSERT INTO Products (ProductName, CategoryID, Price, StockQuantity, ProductTypeID, ProductBrandID, SupplierID, PictureUrl, Description) 
VALUES 
('iPhone 13', 1, 999.99, 50, 2, 1, 1, 'https://example.com/iphone13.jpg', 'Latest Apple smartphone'),
('Galaxy S21', 1, 799.99, 30, 2, 2, 1, 'https://example.com/galaxys21.jpg', 'Latest Samsung smartphone'),
('Dell XPS 13', 1, 1199.99, 20, 1, 3, 2, 'https://example.com/dellxps13.jpg', 'High-performance laptop'),
('HP Spectre x360', 1, 1299.99, 15, 1, 4, 2, 'https://example.com/hpspectrex360.jpg', 'Convertible laptop'),
('Lenovo ThinkPad X1', 1, 1399.99, 10, 1, 5, 3, 'https://example.com/thinkpadx1.jpg', 'Business laptop'),
('Apple Watch', 2, 399.99, 100, 5, 1, 1, 'https://example.com/applewatch.jpg', 'Smartwatch'),
('Samsung Galaxy Buds', 2, 149.99, 200, 5, 2, 1, 'https://example.com/galaxybuds.jpg', 'Wireless earbuds'),
('Sony WH-1000XM4', 2, 349.99, 50, 5, 2, 4, 'https://example.com/sonywh1000xm4.jpg', 'Noise-cancelling headphones'),
('Nintendo Switch', 4, 299.99, 25, 5, 2, 4, 'https://example.com/nintendoswitch.jpg', 'Gaming console'),
('Logitech MX Master 3', 5, 99.99, 75, 5, 2, 5, 'https://example.com/logitechmxmaster3.jpg', 'Wireless mouse');
GO

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, DeliveryMethodID, OrderStatusID) 
VALUES 
(1, '2023-01-01', 1014.99, 1, 1),
(2, '2023-01-02', 814.99, 2, 2),
(3, '2023-01-03', 1349.99, 3, 3),
(4, '2023-01-04', 399.99, 4, 4),
(5, '2023-01-06', 149.99, 1, 1);
GO

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice) 
VALUES 
(1, 1, 1, 999.99),
(1, 2, 1, 15.00),
(2, 2, 1, 799.99),
(2, 2, 1, 15.00),
(3, 3, 1, 1199.99),
(3, 4, 1, 1299.99),
(4, 5, 1, 1399.99),
(4, 6, 1, 399.99),
(5, 7, 1, 149.99),
(5, 8, 1, 349.99);
GO

INSERT INTO Reviews (ProductID, CustomerID, Rating, ReviewText, ReviewDate) 
VALUES 
(1, 1, 5, 'Great phone!', '2023-01-03'),
(2, 2, 4, 'Good value for money.', '2023-01-04'),
(3, 3, 5, 'Excellent laptop!', '2023-01-05'),
(4, 4, 4, 'Very versatile.', '2023-01-06'),
(5, 5, 5, 'Perfect for business use.', '2023-01-07'),
(6, 1, 4, 'Nice smartwatch.', '2023-01-08'),
(7, 2, 3, 'Decent earbuds.', '2023-01-09'),
(8, 3, 5, 'Amazing headphones!', '2023-01-10'),
(9, 4, 5, 'Fun gaming console.', '2023-01-11'),
(10, 5, 4, 'Great mouse for work.', '2023-01-12');
GO