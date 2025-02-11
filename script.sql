USE [Net1711_231_7_JewelryAuction]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/1/2024 2:22:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[CustomerId] [int] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Role] [nvarchar](50) NULL,
 CONSTRAINT [PK_Account_1] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuctionResult]    Script Date: 7/1/2024 2:22:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuctionResult](
	[AuctionResultID] [int] IDENTITY(1,1) NOT NULL,
	[AuctionID] [int] NULL,
	[BidderID] [int] NULL,
	[Amount] [decimal](10, 2) NULL,
	[TransactionTime] [datetime] NULL,
	[FinalPrice] [decimal](10, 2) NULL,
 CONSTRAINT [PK__AuctionR__0809D9B8B381206D] PRIMARY KEY CLUSTERED 
(
	[AuctionResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuctionSection]    Script Date: 7/1/2024 2:22:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuctionSection](
	[AuctionID] [int] IDENTITY(1,1) NOT NULL,
	[JewelryID] [int] NULL,
	[StartTime] [datetime] NULL,
	[EndTime] [datetime] NULL,
	[Status] [nvarchar](50) NULL,
	[Discription] [nvarchar](255) NULL,
	[InitialPrice] [decimal](10, 2) NULL,
	[BidderID] [int] NULL,
	[RequestDetailID] [int] NULL,
 CONSTRAINT [PK__AuctionS__51004A2C80ACB0A4] PRIMARY KEY CLUSTERED 
(
	[AuctionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bidder]    Script Date: 7/1/2024 2:22:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bidder](
	[BidderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[CurrentBidPrice] [decimal](10, 2) NULL,
 CONSTRAINT [PK__Bidder__3D8E533967D3D93E] PRIMARY KEY CLUSTERED 
(
	[BidderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 7/1/2024 2:22:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Discription] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
 CONSTRAINT [PK__Company__2D971C4CFE59F539] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 7/1/2024 2:22:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](255) NULL,
	[Phone] [nvarchar](50) NULL,
	[CompanyID] [int] NULL,
	[Email] [nvarchar](255) NULL,
 CONSTRAINT [PK__Customer__A4AE64B80469A703] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jewelry]    Script Date: 7/1/2024 2:22:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jewelry](
	[JewelryID] [int] IDENTITY(1,1) NOT NULL,
	[JewelryName] [nvarchar](255) NULL,
	[Discription] [nvarchar](255) NULL,
 CONSTRAINT [PK__Jewelry__807031F531E7F224] PRIMARY KEY CLUSTERED 
(
	[JewelryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 7/1/2024 2:22:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[AuctionResultID] [int] NULL,
	[PaymentMethod] [nvarchar](50) NULL,
	[TotalPrice] [decimal](10, 2) NULL,
	[PaymentTime] [datetime] NULL,
	[CustomerID] [int] NULL,
	[FinalPrice] [decimal](10, 2) NULL,
	[JewelryID] [int] NULL,
	[Fees] [decimal](10, 2) NULL,
	[Percent] [decimal](5, 2) NULL,
	[PaymentStatus] [nvarchar](50) NULL,
 CONSTRAINT [PK__Payment__9B556A58D44CC238] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestAuction]    Script Date: 7/1/2024 2:22:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestAuction](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[JewelryID] [int] NULL,
 CONSTRAINT [PK__RequestA__33A8519A0F6C26E2] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RequestAuctionDetails]    Script Date: 7/1/2024 2:22:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestAuctionDetails](
	[RequestDetailID] [int] IDENTITY(1,1) NOT NULL,
	[RequestID] [int] NULL,
	[CustomerID] [int] NULL,
	[JewelryID] [int] NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](10, 2) NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK__RequestA__DC528B7041C53479] PRIMARY KEY CLUSTERED 
(
	[RequestDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([CustomerId], [Username], [Password], [Role]) VALUES (1, N'1', N'123', N'Admin')
INSERT [dbo].[Account] ([CustomerId], [Username], [Password], [Role]) VALUES (2, N'2', N'123', N'Manager')
INSERT [dbo].[Account] ([CustomerId], [Username], [Password], [Role]) VALUES (3, N'3', N'123', N'Customer')
GO
SET IDENTITY_INSERT [dbo].[AuctionResult] ON 

INSERT [dbo].[AuctionResult] ([AuctionResultID], [AuctionID], [BidderID], [Amount], [TransactionTime], [FinalPrice]) VALUES (1, 1, 1, CAST(900.00 AS Decimal(10, 2)), CAST(N'2024-08-01T12:01:00.000' AS DateTime), CAST(800.00 AS Decimal(10, 2)))
INSERT [dbo].[AuctionResult] ([AuctionResultID], [AuctionID], [BidderID], [Amount], [TransactionTime], [FinalPrice]) VALUES (2, 2, 2, CAST(1600.00 AS Decimal(10, 2)), CAST(N'2024-08-02T16:01:00.000' AS DateTime), CAST(1500.00 AS Decimal(10, 2)))
INSERT [dbo].[AuctionResult] ([AuctionResultID], [AuctionID], [BidderID], [Amount], [TransactionTime], [FinalPrice]) VALUES (3, 3, 3, CAST(1000.00 AS Decimal(10, 2)), CAST(N'2024-08-03T11:01:00.000' AS DateTime), CAST(800.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[AuctionResult] OFF
GO
SET IDENTITY_INSERT [dbo].[AuctionSection] ON 

INSERT [dbo].[AuctionSection] ([AuctionID], [JewelryID], [StartTime], [EndTime], [Status], [Discription], [InitialPrice], [BidderID], [RequestDetailID]) VALUES (1, 1, CAST(N'2024-07-31T13:00:00.000' AS DateTime), CAST(N'2024-08-27T15:00:00.000' AS DateTime), N'Active', N'Auction for Diamond Ring', CAST(100.00 AS Decimal(10, 2)), 1, 1)
INSERT [dbo].[AuctionSection] ([AuctionID], [JewelryID], [StartTime], [EndTime], [Status], [Discription], [InitialPrice], [BidderID], [RequestDetailID]) VALUES (2, 2, CAST(N'2024-08-02T07:00:00.000' AS DateTime), CAST(N'2024-08-02T09:00:00.000' AS DateTime), N'Active', N'Auction for Gold Necklace', CAST(1200.00 AS Decimal(10, 2)), 2, 2)
INSERT [dbo].[AuctionSection] ([AuctionID], [JewelryID], [StartTime], [EndTime], [Status], [Discription], [InitialPrice], [BidderID], [RequestDetailID]) VALUES (3, 3, CAST(N'2024-08-03T09:00:00.000' AS DateTime), CAST(N'2024-08-03T11:00:00.000' AS DateTime), N'Active', N'Auction for Silver Bracelet', CAST(600.00 AS Decimal(10, 2)), 3, 3)
SET IDENTITY_INSERT [dbo].[AuctionSection] OFF
GO
SET IDENTITY_INSERT [dbo].[Bidder] ON 

INSERT [dbo].[Bidder] ([BidderID], [CustomerID], [CurrentBidPrice]) VALUES (1, 1, CAST(300.00 AS Decimal(10, 2)))
INSERT [dbo].[Bidder] ([BidderID], [CustomerID], [CurrentBidPrice]) VALUES (2, 2, CAST(750.00 AS Decimal(10, 2)))
INSERT [dbo].[Bidder] ([BidderID], [CustomerID], [CurrentBidPrice]) VALUES (3, 3, CAST(30000.00 AS Decimal(10, 2)))
INSERT [dbo].[Bidder] ([BidderID], [CustomerID], [CurrentBidPrice]) VALUES (4, 3, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[Bidder] ([BidderID], [CustomerID], [CurrentBidPrice]) VALUES (5, 3, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[Bidder] ([BidderID], [CustomerID], [CurrentBidPrice]) VALUES (6, 3, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[Bidder] ([BidderID], [CustomerID], [CurrentBidPrice]) VALUES (7, 3, CAST(1000.00 AS Decimal(10, 2)))
INSERT [dbo].[Bidder] ([BidderID], [CustomerID], [CurrentBidPrice]) VALUES (8, 3, CAST(100000.00 AS Decimal(10, 2)))
INSERT [dbo].[Bidder] ([BidderID], [CustomerID], [CurrentBidPrice]) VALUES (9, 3, CAST(100000.00 AS Decimal(10, 2)))
INSERT [dbo].[Bidder] ([BidderID], [CustomerID], [CurrentBidPrice]) VALUES (10, 3, CAST(100000.00 AS Decimal(10, 2)))
INSERT [dbo].[Bidder] ([BidderID], [CustomerID], [CurrentBidPrice]) VALUES (11, 3, CAST(100000.00 AS Decimal(10, 2)))
INSERT [dbo].[Bidder] ([BidderID], [CustomerID], [CurrentBidPrice]) VALUES (12, 3, CAST(100000.00 AS Decimal(10, 2)))
INSERT [dbo].[Bidder] ([BidderID], [CustomerID], [CurrentBidPrice]) VALUES (13, 3, CAST(100000.00 AS Decimal(10, 2)))
INSERT [dbo].[Bidder] ([BidderID], [CustomerID], [CurrentBidPrice]) VALUES (14, 3, CAST(111110.00 AS Decimal(10, 2)))
INSERT [dbo].[Bidder] ([BidderID], [CustomerID], [CurrentBidPrice]) VALUES (15, 3, CAST(111110.00 AS Decimal(10, 2)))
INSERT [dbo].[Bidder] ([BidderID], [CustomerID], [CurrentBidPrice]) VALUES (16, 1, CAST(100000.00 AS Decimal(10, 2)))
INSERT [dbo].[Bidder] ([BidderID], [CustomerID], [CurrentBidPrice]) VALUES (17, 1, CAST(1000000.00 AS Decimal(10, 2)))
INSERT [dbo].[Bidder] ([BidderID], [CustomerID], [CurrentBidPrice]) VALUES (18, 1, CAST(1000000.00 AS Decimal(10, 2)))
INSERT [dbo].[Bidder] ([BidderID], [CustomerID], [CurrentBidPrice]) VALUES (19, 1, CAST(10000300.00 AS Decimal(10, 2)))
INSERT [dbo].[Bidder] ([BidderID], [CustomerID], [CurrentBidPrice]) VALUES (20, 2, CAST(10000300.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Bidder] OFF
GO
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([CompanyID], [CompanyName], [Address], [Discription], [Email]) VALUES (1, N'Company A', N'123 Main St, City A', N'Description of Company A', N'companyA@example.com')
INSERT [dbo].[Company] ([CompanyID], [CompanyName], [Address], [Discription], [Email]) VALUES (2, N'Company B', N'456 Elm St, City B', N'Description of Company B', N'companyB@example.com')
INSERT [dbo].[Company] ([CompanyID], [CompanyName], [Address], [Discription], [Email]) VALUES (3, N'Company C', N'789 Oak St, City C', N'Description of Company C', N'companyC@example.com')
INSERT [dbo].[Company] ([CompanyID], [CompanyName], [Address], [Discription], [Email]) VALUES (4, N'string', NULL, NULL, NULL)
INSERT [dbo].[Company] ([CompanyID], [CompanyName], [Address], [Discription], [Email]) VALUES (5, N'string', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Company] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Phone], [CompanyID], [Email]) VALUES (1, N'John Doe', N'123-456-7890', 1, N'john.doe@example.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Phone], [CompanyID], [Email]) VALUES (2, N'Jane Smith', N'987-654-3210', 2, N'jane.smith@example.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Phone], [CompanyID], [Email]) VALUES (3, N'Michael Johnson', N'555-123-4567', 1, N'michael.johnson@example.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Phone], [CompanyID], [Email]) VALUES (7, N'Lưu Đức Tùng 123', N'0972074620', 4, N'tungld2k2@hotmail.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Phone], [CompanyID], [Email]) VALUES (8, N'eqwe', N'eqwe', 4, N'uewqeqweser@example.com')
INSERT [dbo].[Customer] ([CustomerID], [CustomerName], [Phone], [CompanyID], [Email]) VALUES (9, N'eqwe', N'eqwe', 5, N'uewqeqweser@example.com')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Jewelry] ON 

INSERT [dbo].[Jewelry] ([JewelryID], [JewelryName], [Discription]) VALUES (1, N'Diamond Ring', N'Beautiful diamond ring')
INSERT [dbo].[Jewelry] ([JewelryID], [JewelryName], [Discription]) VALUES (2, N'Gold Necklace', N'Elegant gold necklace')
INSERT [dbo].[Jewelry] ([JewelryID], [JewelryName], [Discription]) VALUES (3, N'Silver Bracelet', N'Stylish silver bracelet')
INSERT [dbo].[Jewelry] ([JewelryID], [JewelryName], [Discription]) VALUES (4, N'eqweqwe', N'eqweqwe')
INSERT [dbo].[Jewelry] ([JewelryID], [JewelryName], [Discription]) VALUES (5, N'eqweqwe', N'eqweqwe')
INSERT [dbo].[Jewelry] ([JewelryID], [JewelryName], [Discription]) VALUES (6, N'eqweqwe', N'eqweqwe')
INSERT [dbo].[Jewelry] ([JewelryID], [JewelryName], [Discription]) VALUES (7, N'eqweqwe', N'eqweqwe')
INSERT [dbo].[Jewelry] ([JewelryID], [JewelryName], [Discription]) VALUES (8, N'eqweqwe', N'eqweqwe')
INSERT [dbo].[Jewelry] ([JewelryID], [JewelryName], [Discription]) VALUES (9, N'eqweqwe', N'eqweqwe')
INSERT [dbo].[Jewelry] ([JewelryID], [JewelryName], [Discription]) VALUES (1004, N'abc', N'qưeqweqw')
INSERT [dbo].[Jewelry] ([JewelryID], [JewelryName], [Discription]) VALUES (1005, N'abc', N'qưeqweqw')
INSERT [dbo].[Jewelry] ([JewelryID], [JewelryName], [Discription]) VALUES (1006, N'abc', N'qưeqweqw')
INSERT [dbo].[Jewelry] ([JewelryID], [JewelryName], [Discription]) VALUES (1007, N'eqwewq', N'qưeqwe')
INSERT [dbo].[Jewelry] ([JewelryID], [JewelryName], [Discription]) VALUES (1008, N'tungld', N'eqweqw')
INSERT [dbo].[Jewelry] ([JewelryID], [JewelryName], [Discription]) VALUES (1009, N'abc', NULL)
INSERT [dbo].[Jewelry] ([JewelryID], [JewelryName], [Discription]) VALUES (1011, N'Diamond tungld', N'streqweqweqweing')
INSERT [dbo].[Jewelry] ([JewelryID], [JewelryName], [Discription]) VALUES (1012, N'Diamon  1233123', N'eqweqw')
INSERT [dbo].[Jewelry] ([JewelryID], [JewelryName], [Discription]) VALUES (1013, N'Diamon  1233123', N'eqweqw')
INSERT [dbo].[Jewelry] ([JewelryID], [JewelryName], [Discription]) VALUES (1014, N'ewqeqw tungld', N'tungld')
INSERT [dbo].[Jewelry] ([JewelryID], [JewelryName], [Discription]) VALUES (1015, N'eqwe', N'eqwe')
INSERT [dbo].[Jewelry] ([JewelryID], [JewelryName], [Discription]) VALUES (1016, N'Diamon  1233123 tungld', N'eqweqweqweqw tung')
SET IDENTITY_INSERT [dbo].[Jewelry] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([PaymentID], [AuctionResultID], [PaymentMethod], [TotalPrice], [PaymentTime], [CustomerID], [FinalPrice], [JewelryID], [Fees], [Percent], [PaymentStatus]) VALUES (1, 1, N'Credit Card', CAST(900.00 AS Decimal(10, 2)), CAST(N'2024-08-01T12:02:00.000' AS DateTime), 1, CAST(800.00 AS Decimal(10, 2)), 1, CAST(20.00 AS Decimal(10, 2)), CAST(2.50 AS Decimal(5, 2)), N'Paid')
INSERT [dbo].[Payment] ([PaymentID], [AuctionResultID], [PaymentMethod], [TotalPrice], [PaymentTime], [CustomerID], [FinalPrice], [JewelryID], [Fees], [Percent], [PaymentStatus]) VALUES (2, 2, N'PayPal', CAST(1600.00 AS Decimal(10, 2)), CAST(N'2024-08-02T16:02:00.000' AS DateTime), 2, CAST(1500.00 AS Decimal(10, 2)), 2, CAST(50.00 AS Decimal(10, 2)), CAST(3.00 AS Decimal(5, 2)), N'Paid')
INSERT [dbo].[Payment] ([PaymentID], [AuctionResultID], [PaymentMethod], [TotalPrice], [PaymentTime], [CustomerID], [FinalPrice], [JewelryID], [Fees], [Percent], [PaymentStatus]) VALUES (3, 3, N'Bank Transfer', CAST(1000.00 AS Decimal(10, 2)), CAST(N'2024-08-03T11:02:00.000' AS DateTime), 3, CAST(800.00 AS Decimal(10, 2)), 3, CAST(30.00 AS Decimal(10, 2)), CAST(3.50 AS Decimal(5, 2)), N'Paid')
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[RequestAuction] ON 

INSERT [dbo].[RequestAuction] ([RequestID], [CustomerID], [JewelryID]) VALUES (1, 1, 1)
INSERT [dbo].[RequestAuction] ([RequestID], [CustomerID], [JewelryID]) VALUES (2, 2, 2)
INSERT [dbo].[RequestAuction] ([RequestID], [CustomerID], [JewelryID]) VALUES (3, 3, 3)
INSERT [dbo].[RequestAuction] ([RequestID], [CustomerID], [JewelryID]) VALUES (4, 1, 4)
INSERT [dbo].[RequestAuction] ([RequestID], [CustomerID], [JewelryID]) VALUES (5, 1, 5)
INSERT [dbo].[RequestAuction] ([RequestID], [CustomerID], [JewelryID]) VALUES (6, 1, 6)
INSERT [dbo].[RequestAuction] ([RequestID], [CustomerID], [JewelryID]) VALUES (7, 1, 7)
INSERT [dbo].[RequestAuction] ([RequestID], [CustomerID], [JewelryID]) VALUES (8, 1, 8)
INSERT [dbo].[RequestAuction] ([RequestID], [CustomerID], [JewelryID]) VALUES (9, 1, 9)
INSERT [dbo].[RequestAuction] ([RequestID], [CustomerID], [JewelryID]) VALUES (1004, 2, 1004)
INSERT [dbo].[RequestAuction] ([RequestID], [CustomerID], [JewelryID]) VALUES (1005, 2, 1005)
INSERT [dbo].[RequestAuction] ([RequestID], [CustomerID], [JewelryID]) VALUES (1006, 2, 1006)
INSERT [dbo].[RequestAuction] ([RequestID], [CustomerID], [JewelryID]) VALUES (1007, 1, 1007)
INSERT [dbo].[RequestAuction] ([RequestID], [CustomerID], [JewelryID]) VALUES (1008, 2, 1008)
INSERT [dbo].[RequestAuction] ([RequestID], [CustomerID], [JewelryID]) VALUES (1009, 2, 1009)
INSERT [dbo].[RequestAuction] ([RequestID], [CustomerID], [JewelryID]) VALUES (1011, 1, 1011)
INSERT [dbo].[RequestAuction] ([RequestID], [CustomerID], [JewelryID]) VALUES (1012, 2, 1012)
INSERT [dbo].[RequestAuction] ([RequestID], [CustomerID], [JewelryID]) VALUES (1013, 2, 1013)
INSERT [dbo].[RequestAuction] ([RequestID], [CustomerID], [JewelryID]) VALUES (1014, 2, 1014)
INSERT [dbo].[RequestAuction] ([RequestID], [CustomerID], [JewelryID]) VALUES (1015, 1, 1015)
INSERT [dbo].[RequestAuction] ([RequestID], [CustomerID], [JewelryID]) VALUES (1016, 2, 1016)
SET IDENTITY_INSERT [dbo].[RequestAuction] OFF
GO
SET IDENTITY_INSERT [dbo].[RequestAuctionDetails] ON 

INSERT [dbo].[RequestAuctionDetails] ([RequestDetailID], [RequestID], [CustomerID], [JewelryID], [Quantity], [Price], [Status]) VALUES (1, 1, 1, 1, 1, CAST(1000.00 AS Decimal(10, 2)), N'Pending')
INSERT [dbo].[RequestAuctionDetails] ([RequestDetailID], [RequestID], [CustomerID], [JewelryID], [Quantity], [Price], [Status]) VALUES (2, 2, 2, 2, 2, CAST(1500.00 AS Decimal(10, 2)), N'Pending')
INSERT [dbo].[RequestAuctionDetails] ([RequestDetailID], [RequestID], [CustomerID], [JewelryID], [Quantity], [Price], [Status]) VALUES (3, 3, 3, 3, 3, CAST(800.00 AS Decimal(10, 2)), N'Pending')
INSERT [dbo].[RequestAuctionDetails] ([RequestDetailID], [RequestID], [CustomerID], [JewelryID], [Quantity], [Price], [Status]) VALUES (4, 1014, 2, 1014, 2, CAST(10000.00 AS Decimal(10, 2)), N'Pending')
INSERT [dbo].[RequestAuctionDetails] ([RequestDetailID], [RequestID], [CustomerID], [JewelryID], [Quantity], [Price], [Status]) VALUES (5, 1015, 1, 1015, 2, CAST(111111.00 AS Decimal(10, 2)), N'Pending')
INSERT [dbo].[RequestAuctionDetails] ([RequestDetailID], [RequestID], [CustomerID], [JewelryID], [Quantity], [Price], [Status]) VALUES (6, 1016, 2, 1016, 1, CAST(10000.00 AS Decimal(10, 2)), N'Pending')
SET IDENTITY_INSERT [dbo].[RequestAuctionDetails] OFF
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Customer]
GO
ALTER TABLE [dbo].[AuctionResult]  WITH CHECK ADD  CONSTRAINT [FK__AuctionRe__Aucti__4E88ABD4] FOREIGN KEY([AuctionID])
REFERENCES [dbo].[AuctionSection] ([AuctionID])
GO
ALTER TABLE [dbo].[AuctionResult] CHECK CONSTRAINT [FK__AuctionRe__Aucti__4E88ABD4]
GO
ALTER TABLE [dbo].[AuctionResult]  WITH CHECK ADD  CONSTRAINT [FK__AuctionRe__Bidde__4F7CD00D] FOREIGN KEY([BidderID])
REFERENCES [dbo].[Bidder] ([BidderID])
GO
ALTER TABLE [dbo].[AuctionResult] CHECK CONSTRAINT [FK__AuctionRe__Bidde__4F7CD00D]
GO
ALTER TABLE [dbo].[AuctionSection]  WITH CHECK ADD  CONSTRAINT [FK__AuctionSe__Bidde__4AB81AF0] FOREIGN KEY([BidderID])
REFERENCES [dbo].[Bidder] ([BidderID])
GO
ALTER TABLE [dbo].[AuctionSection] CHECK CONSTRAINT [FK__AuctionSe__Bidde__4AB81AF0]
GO
ALTER TABLE [dbo].[AuctionSection]  WITH CHECK ADD  CONSTRAINT [FK__AuctionSe__Jewel__49C3F6B7] FOREIGN KEY([JewelryID])
REFERENCES [dbo].[Jewelry] ([JewelryID])
GO
ALTER TABLE [dbo].[AuctionSection] CHECK CONSTRAINT [FK__AuctionSe__Jewel__49C3F6B7]
GO
ALTER TABLE [dbo].[AuctionSection]  WITH CHECK ADD  CONSTRAINT [FK__AuctionSe__Reque__4BAC3F29] FOREIGN KEY([RequestDetailID])
REFERENCES [dbo].[RequestAuctionDetails] ([RequestDetailID])
GO
ALTER TABLE [dbo].[AuctionSection] CHECK CONSTRAINT [FK__AuctionSe__Reque__4BAC3F29]
GO
ALTER TABLE [dbo].[Bidder]  WITH CHECK ADD  CONSTRAINT [FK__Bidder__Customer__3E52440B] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Bidder] CHECK CONSTRAINT [FK__Bidder__Customer__3E52440B]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK__Customer__Compan__398D8EEE] FOREIGN KEY([CompanyID])
REFERENCES [dbo].[Company] ([CompanyID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK__Customer__Compan__398D8EEE]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK__Payment__Auction__52593CB8] FOREIGN KEY([AuctionResultID])
REFERENCES [dbo].[AuctionResult] ([AuctionResultID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK__Payment__Auction__52593CB8]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK__Payment__Custome__534D60F1] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK__Payment__Custome__534D60F1]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK__Payment__Jewelry__5441852A] FOREIGN KEY([JewelryID])
REFERENCES [dbo].[Jewelry] ([JewelryID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK__Payment__Jewelry__5441852A]
GO
ALTER TABLE [dbo].[RequestAuction]  WITH CHECK ADD  CONSTRAINT [FK__RequestAu__Custo__412EB0B6] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[RequestAuction] CHECK CONSTRAINT [FK__RequestAu__Custo__412EB0B6]
GO
ALTER TABLE [dbo].[RequestAuction]  WITH CHECK ADD  CONSTRAINT [FK__RequestAu__Jewel__4222D4EF] FOREIGN KEY([JewelryID])
REFERENCES [dbo].[Jewelry] ([JewelryID])
GO
ALTER TABLE [dbo].[RequestAuction] CHECK CONSTRAINT [FK__RequestAu__Jewel__4222D4EF]
GO
ALTER TABLE [dbo].[RequestAuctionDetails]  WITH CHECK ADD  CONSTRAINT [FK__RequestAu__Custo__45F365D3] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[RequestAuctionDetails] CHECK CONSTRAINT [FK__RequestAu__Custo__45F365D3]
GO
ALTER TABLE [dbo].[RequestAuctionDetails]  WITH CHECK ADD  CONSTRAINT [FK__RequestAu__Jewel__46E78A0C] FOREIGN KEY([JewelryID])
REFERENCES [dbo].[Jewelry] ([JewelryID])
GO
ALTER TABLE [dbo].[RequestAuctionDetails] CHECK CONSTRAINT [FK__RequestAu__Jewel__46E78A0C]
GO
ALTER TABLE [dbo].[RequestAuctionDetails]  WITH CHECK ADD  CONSTRAINT [FK__RequestAu__Reque__44FF419A] FOREIGN KEY([RequestID])
REFERENCES [dbo].[RequestAuction] ([RequestID])
GO
ALTER TABLE [dbo].[RequestAuctionDetails] CHECK CONSTRAINT [FK__RequestAu__Reque__44FF419A]
GO
