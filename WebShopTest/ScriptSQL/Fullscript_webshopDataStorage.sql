SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomersOrders](
	[CustomerOrderId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[OrderId] [int] NOT NULL,
 CONSTRAINT [PK_CustomersOrders] PRIMARY KEY CLUSTERED 
(
	[CustomerOrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[Date] [date] NULL,
	[Time] [time](7) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdersProducts](
	[OrderProductId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_OrdersProducts] PRIMARY KEY CLUSTERED 
(
	[OrderProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Number] [nvarchar](50) NULL,
	[Title] [nvarchar](50) NULL,
	[Price] [decimal](18, 0) NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductsCategories](
	[ProductCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_ProductsCategories] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryId], [Name], [Description]) VALUES (1, N'Category1', N'Category1 description')
INSERT [dbo].[Category] ([CategoryId], [Name], [Description]) VALUES (2, N'Category2', N'Category1 description')
INSERT [dbo].[Category] ([CategoryId], [Name], [Description]) VALUES (3, N'Category3', N'Category3 description')
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerId], [FirstName], [MiddleName], [LastName], [Address], [Email], [Phone]) VALUES (1, N'Kevin', N'Dario', N'Ricardo Sejin', N'Street 69 #50-50, Colombia', N'kevin@test.com', N'123456789')
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [MiddleName], [LastName], [Address], [Email], [Phone]) VALUES (2, N'Mateo', N'', N'Vidal', N'Av 89 #12-34', N'mateo@test.com', N'456789123')
INSERT [dbo].[Customer] ([CustomerId], [FirstName], [MiddleName], [LastName], [Address], [Email], [Phone]) VALUES (3, N'Ruben', N'', N'Espinosa', N'Stree 70 #99-99', N'ruben@test.com', N'456789999')
SET IDENTITY_INSERT [dbo].[Customer] OFF
SET IDENTITY_INSERT [dbo].[CustomersOrders] ON 

INSERT [dbo].[CustomersOrders] ([CustomerOrderId], [CustomerId], [OrderId]) VALUES (1, 1, 1)
INSERT [dbo].[CustomersOrders] ([CustomerOrderId], [CustomerId], [OrderId]) VALUES (2, 1, 2)
INSERT [dbo].[CustomersOrders] ([CustomerOrderId], [CustomerId], [OrderId]) VALUES (3, 1, 3)
SET IDENTITY_INSERT [dbo].[CustomersOrders] OFF
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderId], [Number], [Description], [Date], [Time]) VALUES (1, N'#0001', N'Smart TV Order', CAST(N'2017-11-26' AS Date), CAST(N'09:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [Number], [Description], [Date], [Time]) VALUES (2, N'#0002', N'iPhone Order', CAST(N'2017-11-26' AS Date), CAST(N'10:00:00' AS Time))
INSERT [dbo].[Order] ([OrderId], [Number], [Description], [Date], [Time]) VALUES (3, N'#0003', N'Dell Laptop', CAST(N'2017-11-26' AS Date), CAST(N'11:00:00' AS Time))
SET IDENTITY_INSERT [dbo].[Order] OFF
SET IDENTITY_INSERT [dbo].[OrdersProducts] ON 

INSERT [dbo].[OrdersProducts] ([OrderProductId], [OrderId], [ProductId]) VALUES (1, 1, 1)
INSERT [dbo].[OrdersProducts] ([OrderProductId], [OrderId], [ProductId]) VALUES (2, 1, 2)
INSERT [dbo].[OrdersProducts] ([OrderProductId], [OrderId], [ProductId]) VALUES (3, 1, 3)
SET IDENTITY_INSERT [dbo].[OrdersProducts] OFF
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ProductId], [Number], [Title], [Price], [Description]) VALUES (1, N'#0001', N'Samsung UHD 4K 58 inches', CAST(700 AS Decimal(18, 0)), N'')
INSERT [dbo].[Product] ([ProductId], [Number], [Title], [Price], [Description]) VALUES (2, N'#0002', N'iPhone X', CAST(1000 AS Decimal(18, 0)), N'')
INSERT [dbo].[Product] ([ProductId], [Number], [Title], [Price], [Description]) VALUES (3, N'#0003', N'Dell Inspiron 5400 1TB Solid State Hard disk', CAST(800 AS Decimal(18, 0)), N'')
SET IDENTITY_INSERT [dbo].[Product] OFF
SET IDENTITY_INSERT [dbo].[ProductsCategories] ON 

INSERT [dbo].[ProductsCategories] ([ProductCategoryId], [ProductId], [CategoryId]) VALUES (1, 1, 1)
INSERT [dbo].[ProductsCategories] ([ProductCategoryId], [ProductId], [CategoryId]) VALUES (2, 1, 2)
INSERT [dbo].[ProductsCategories] ([ProductCategoryId], [ProductId], [CategoryId]) VALUES (3, 1, 3)
SET IDENTITY_INSERT [dbo].[ProductsCategories] OFF
ALTER TABLE [dbo].[CustomersOrders]  WITH CHECK ADD  CONSTRAINT [FK_CustomersOrders_Customer1] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CustomersOrders] CHECK CONSTRAINT [FK_CustomersOrders_Customer1]
GO
ALTER TABLE [dbo].[CustomersOrders]  WITH CHECK ADD  CONSTRAINT [FK_CustomersOrders_Order1] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CustomersOrders] CHECK CONSTRAINT [FK_CustomersOrders_Order1]
GO
ALTER TABLE [dbo].[OrdersProducts]  WITH CHECK ADD  CONSTRAINT [FK_OrdersProducts_Order1] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrdersProducts] CHECK CONSTRAINT [FK_OrdersProducts_Order1]
GO
ALTER TABLE [dbo].[OrdersProducts]  WITH CHECK ADD  CONSTRAINT [FK_OrdersProducts_Product1] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrdersProducts] CHECK CONSTRAINT [FK_OrdersProducts_Product1]
GO
ALTER TABLE [dbo].[ProductsCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductsCategories_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductsCategories] CHECK CONSTRAINT [FK_ProductsCategories_Category]
GO
ALTER TABLE [dbo].[ProductsCategories]  WITH CHECK ADD  CONSTRAINT [FK_ProductsCategories_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([ProductId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductsCategories] CHECK CONSTRAINT [FK_ProductsCategories_Product]
GO
