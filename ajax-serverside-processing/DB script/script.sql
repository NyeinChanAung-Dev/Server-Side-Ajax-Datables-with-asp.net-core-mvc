USE [master]
GO
/****** Object:  Database [AjaxServerSideDb]    Script Date: 1/16/2021 4:31:31 PM ******/
CREATE DATABASE [AjaxServerSideDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AjaxServerSideDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AjaxServerSideDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AjaxServerSideDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AjaxServerSideDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AjaxServerSideDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AjaxServerSideDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AjaxServerSideDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AjaxServerSideDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AjaxServerSideDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AjaxServerSideDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AjaxServerSideDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [AjaxServerSideDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AjaxServerSideDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AjaxServerSideDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AjaxServerSideDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AjaxServerSideDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AjaxServerSideDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AjaxServerSideDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AjaxServerSideDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AjaxServerSideDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AjaxServerSideDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AjaxServerSideDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AjaxServerSideDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AjaxServerSideDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AjaxServerSideDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AjaxServerSideDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AjaxServerSideDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AjaxServerSideDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AjaxServerSideDb] SET RECOVERY FULL 
GO
ALTER DATABASE [AjaxServerSideDb] SET  MULTI_USER 
GO
ALTER DATABASE [AjaxServerSideDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AjaxServerSideDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AjaxServerSideDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AjaxServerSideDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AjaxServerSideDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AjaxServerSideDb', N'ON'
GO
ALTER DATABASE [AjaxServerSideDb] SET QUERY_STORE = OFF
GO
USE [AjaxServerSideDb]
GO
/****** Object:  Table [dbo].[ShippingTB]    Script Date: 1/16/2021 4:31:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingTB](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [nvarchar](100) NULL,
	[Country] [nvarchar](100) NULL,
	[ShipCity] [nvarchar](100) NULL,
	[ShipAddress] [nvarchar](100) NULL,
	[CompanyAgent] [nvarchar](100) NULL,
	[CompanyName] [nvarchar](100) NULL,
	[ShipDate] [datetime] NULL,
	[Status] [int] NULL,
	[Type] [int] NULL,
 CONSTRAINT [PK_ShippingTB] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ShippingTB] ON 

INSERT [dbo].[ShippingTB] ([Id], [OrderId], [Country], [ShipCity], [ShipAddress], [CompanyAgent], [CompanyName], [ShipDate], [Status], [Type]) VALUES (1, N'0004-0800', N'Philippines', N'4042 Buhler Junction', N'4042 Buhler Junction', N'Botsford and Sons', N'Botsford and Sons', CAST(N'2017-03-03T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[ShippingTB] ([Id], [OrderId], [Country], [ShipCity], [ShipAddress], [CompanyAgent], [CompanyName], [ShipDate], [Status], [Type]) VALUES (2, N'0019-9450	', N'Portugal', N'40 Trailsway Trail', N'Boehm, Kreiger and Cremin', N'Boehm, Kreiger and Cremin', N'Boehm, Kreiger and Cremin', CAST(N'2016-04-25T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[ShippingTB] ([Id], [OrderId], [Country], [ShipCity], [ShipAddress], [CompanyAgent], [CompanyName], [ShipDate], [Status], [Type]) VALUES (3, N'0012-9878', N'Myanmar', N'Yangon', N'Yangon, Hlaing', N'Test Agwnt', N'TEatset', CAST(N'2016-04-27T00:00:00.000' AS DateTime), 2, 2)
INSERT [dbo].[ShippingTB] ([Id], [OrderId], [Country], [ShipCity], [ShipAddress], [CompanyAgent], [CompanyName], [ShipDate], [Status], [Type]) VALUES (4, N'0023-0987', N'India', N'Munby', N'Munbu, Tsse', N'Ass Jhh', N'Tkjhjhjk', CAST(N'2016-08-22T00:00:00.000' AS DateTime), 4, 3)
INSERT [dbo].[ShippingTB] ([Id], [OrderId], [Country], [ShipCity], [ShipAddress], [CompanyAgent], [CompanyName], [ShipDate], [Status], [Type]) VALUES (5, N'0089-8976', N'China', N'Bejjai', N'Twtew, Tuu', N'Huybhh GGG', N'TUyehrr', CAST(N'2016-12-25T00:00:00.000' AS DateTime), 5, 2)
INSERT [dbo].[ShippingTB] ([Id], [OrderId], [Country], [ShipCity], [ShipAddress], [CompanyAgent], [CompanyName], [ShipDate], [Status], [Type]) VALUES (6, N'0078-0987', N'Thailand', N'Hhhhh', N'Terewr', N'Hfhkjdhf', N'Thhhss', CAST(N'2016-05-24T00:00:00.000' AS DateTime), 6, 2)
INSERT [dbo].[ShippingTB] ([Id], [OrderId], [Country], [ShipCity], [ShipAddress], [CompanyAgent], [CompanyName], [ShipDate], [Status], [Type]) VALUES (7, N'0012-7865', N'Myanmar', N'Mandalay', N'Mandalay, tewtwe', N'Hiyiuy', N'Yelll dhskfhkk', CAST(N'2016-05-24T00:00:00.000' AS DateTime), 7, 2)
INSERT [dbo].[ShippingTB] ([Id], [OrderId], [Country], [ShipCity], [ShipAddress], [CompanyAgent], [CompanyName], [ShipDate], [Status], [Type]) VALUES (8, N'0023-7654', N'Myanmar', N'Monywa', N'Monywa, Chaung U', N'Mbjgg NNN', N'Erewr kjkh', CAST(N'2016-05-24T00:00:00.000' AS DateTime), 5, 3)
INSERT [dbo].[ShippingTB] ([Id], [OrderId], [Country], [ShipCity], [ShipAddress], [CompanyAgent], [CompanyName], [ShipDate], [Status], [Type]) VALUES (9, N'0034-0987', N'Thailand', N'ljljl', N'ykhakjhfdb', N'dsjfll', N'hkhkhiueyr', CAST(N'2016-05-24T00:00:00.000' AS DateTime), 5, 1)
INSERT [dbo].[ShippingTB] ([Id], [OrderId], [Country], [ShipCity], [ShipAddress], [CompanyAgent], [CompanyName], [ShipDate], [Status], [Type]) VALUES (10, N'0054-0987', N'China', N'dllljhkh', N'jljfalsjfdj, hkjhk', N'ytalflhfh', N'jljnn hfhs', CAST(N'2016-05-24T00:00:00.000' AS DateTime), 4, 2)
INSERT [dbo].[ShippingTB] ([Id], [OrderId], [Country], [ShipCity], [ShipAddress], [CompanyAgent], [CompanyName], [ShipDate], [Status], [Type]) VALUES (11, N'0021-0987', N'Thailand', N'khdfksdhfk', N'hshkdfh, jjhy', N'opout djksahkj', N'hshfhksk', CAST(N'2016-05-24T00:00:00.000' AS DateTime), 5, 1)
SET IDENTITY_INSERT [dbo].[ShippingTB] OFF
USE [master]
GO
ALTER DATABASE [AjaxServerSideDb] SET  READ_WRITE 
GO
