USE [master]
GO
/****** Object:  Database [SwiftShopFinalProject]    Script Date: 10/11/2023 9:57:21 PM ******/
CREATE DATABASE [SwiftShopFinalProject]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SwiftShopFinalProject', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SwiftShopFinalProject.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SwiftShopFinalProject_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\SwiftShopFinalProject_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SwiftShopFinalProject] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SwiftShopFinalProject].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SwiftShopFinalProject] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SwiftShopFinalProject] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SwiftShopFinalProject] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SwiftShopFinalProject] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SwiftShopFinalProject] SET ARITHABORT OFF 
GO
ALTER DATABASE [SwiftShopFinalProject] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SwiftShopFinalProject] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SwiftShopFinalProject] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SwiftShopFinalProject] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SwiftShopFinalProject] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SwiftShopFinalProject] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SwiftShopFinalProject] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SwiftShopFinalProject] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SwiftShopFinalProject] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SwiftShopFinalProject] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SwiftShopFinalProject] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SwiftShopFinalProject] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SwiftShopFinalProject] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SwiftShopFinalProject] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SwiftShopFinalProject] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SwiftShopFinalProject] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SwiftShopFinalProject] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SwiftShopFinalProject] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SwiftShopFinalProject] SET  MULTI_USER 
GO
ALTER DATABASE [SwiftShopFinalProject] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SwiftShopFinalProject] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SwiftShopFinalProject] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SwiftShopFinalProject] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SwiftShopFinalProject] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SwiftShopFinalProject] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SwiftShopFinalProject] SET QUERY_STORE = ON
GO
ALTER DATABASE [SwiftShopFinalProject] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SwiftShopFinalProject]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 10/11/2023 9:57:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 10/11/2023 9:57:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 10/11/2023 9:57:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 10/11/2023 9:57:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 10/11/2023 9:57:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 10/11/2023 9:57:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 10/11/2023 9:57:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[Address] [nvarchar](max) NULL,
	[IsAdmin] [bit] NULL,
	[Phone] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 10/11/2023 9:57:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BasketItems]    Script Date: 10/11/2023 9:57:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BasketItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_BasketItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 10/11/2023 9:57:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Brands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 10/11/2023 9:57:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 10/11/2023 9:57:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 10/11/2023 9:57:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NULL,
	[FullName] [nvarchar](20) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Address] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Note] [nvarchar](200) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductImages]    Script Date: 10/11/2023 9:57:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[ImageName] [nvarchar](max) NOT NULL,
	[PosterStatus] [bit] NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ProductImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 10/11/2023 9:57:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CategoryId] [int] NOT NULL,
	[BrandId] [int] NOT NULL,
	[SalePrice] [money] NOT NULL,
	[CostPrice] [money] NOT NULL,
	[DiscountPercent] [money] NOT NULL,
	[Rate] [int] NOT NULL,
	[Stock] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sliders]    Script Date: 10/11/2023 9:57:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sliders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NULL,
	[Desc] [nvarchar](150) NULL,
	[ImageName] [nvarchar](100) NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Sliders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StoreData]    Script Date: 10/11/2023 9:57:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StoreData](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[LogoText] [nvarchar](max) NOT NULL,
	[CompanyName] [nvarchar](max) NOT NULL,
	[WhatsappLink] [nvarchar](max) NOT NULL,
	[InstagramLink] [nvarchar](max) NOT NULL,
	[FacebookLink] [nvarchar](max) NOT NULL,
	[LinkedinLink] [nvarchar](max) NOT NULL,
	[LogoImageName] [nvarchar](max) NOT NULL,
	[LogoImageLink] [nvarchar](max) NOT NULL,
	[EmptyBasketImageName] [nvarchar](max) NOT NULL,
	[EmptyBasketImageLink] [nvarchar](max) NOT NULL,
	[AboutCompany] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_StoreData] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230913094934_ModelsCreated', N'6.0.22')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230913095309_BrandTableAdded', N'6.0.22')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230913174924_SliderTableAdded', N'6.0.22')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230914110250_UserTableUpdatee', N'6.0.22')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230915215404_ImgUrlAdded', N'6.0.22')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230916065334_ImgUrlUpdate', N'6.0.22')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230917084223_BasketItemAdded', N'6.0.22')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230918194028_StoreDataAdded', N'6.0.22')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230921054007_StoreDatasAddNewColumn', N'6.0.22')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230923101200_OrderAndOrderItemsAdded', N'6.0.22')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230924070240_OrderUserIdNullable', N'6.0.22')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230924161146_OrderItemTableChanged', N'6.0.22')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230929164547_RateAdded', N'6.0.22')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231001111737_ProductTableUpdated', N'6.0.22')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231002124842_OrderItemsUpdated', N'6.0.22')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231002163318_UpdateProducts', N'6.0.22')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231002163904_UpdateFields', N'6.0.22')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231007182636_SliderTableUpdated', N'6.0.22')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20231009181718_SliderTableChanged', N'6.0.22')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'48a3dc76-7e1e-4f32-a48b-0b89f88a6985', N'Admin', N'ADMIN', N'4648456b-575d-48a6-a4c5-8364b38a549b')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'7d1a20c7-3684-4692-a47a-dd62048bf1e9', N'Member', N'MEMBER', N'157cf635-3170-407a-b493-699acbddeaf5')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd453d7c5-1a84-4e1d-ae12-71242a61131b', N'48a3dc76-7e1e-4f32-a48b-0b89f88a6985')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'cfe68aa4-1b08-400e-bbb0-f764cdc84daf', N'7d1a20c7-3684-4692-a47a-dd62048bf1e9')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fc1cdbe0-2bf3-4a83-8eb7-c1a7e224036a', N'7d1a20c7-3684-4692-a47a-dd62048bf1e9')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [FullName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [IsAdmin], [Phone]) VALUES (N'cfe68aa4-1b08-400e-bbb0-f764cdc84daf', N'AppUser', N'Elmeddin Mirzeyev', N'elmeddin', N'ELMEDDIN', N'elmaddinshm@code.edu.az', N'ELMADDINSHM@CODE.EDU.AZ', 1, N'AQAAAAEAACcQAAAAELf2YsJIjXKDcHQmvgODgNPNRIMS20lbEdJPB7HA/2OMZ/O8jHBxCDBFfdJXL3Jh8A==', N'RFY4QRT62EC6NVSSDRVU3DZXDV45MQHX', N'0fc637e2-ad9e-4f5d-a896-a6033289fd6d', NULL, 0, 0, NULL, 1, 0, N'Sumqayit', 0, N'+994505481996')
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [FullName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [IsAdmin], [Phone]) VALUES (N'd453d7c5-1a84-4e1d-ae12-71242a61131b', N'AppUser', N'Elmeddin Mirzeyev', N'Admin', N'ADMIN', N'admin@gmail.com', N'ADMIN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEAa+JrCM+9/be4m25jIAKM/0KttD1B1f3VMYtbt72fPvfJ9uevYwl9qt1wHdahfxqw==', N'I7ICTIYMUIU4WMZ2Y7Q5FXWIJR7UFZWN', N'54a5867b-80b2-4f36-a393-f01d09815827', NULL, 0, 0, NULL, 1, 0, NULL, 1, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [Discriminator], [FullName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [IsAdmin], [Phone]) VALUES (N'fc1cdbe0-2bf3-4a83-8eb7-c1a7e224036a', N'AppUser', N'Rza Mirzeyevii', N'rza3', N'RZA3', N'elm@code.edu.az', N'ELM@CODE.EDU.AZ', 0, N'AQAAAAEAACcQAAAAEGse6tbCqv5ZWz249sOhNDmnKb97mkmWGEPEE5JyWQwVOXvGnlRr5GeqLf/XJZkShw==', N'JR6ZQXBOWSC5PUQXUYYZTHWMGB7PKGO2', N'a5b0ccf8-c111-4db3-8af8-7480bdfbd545', NULL, 0, 0, NULL, 1, 0, N'Sumqayit', 0, N'+994555555553')
GO
SET IDENTITY_INSERT [dbo].[BasketItems] ON 

INSERT [dbo].[BasketItems] ([Id], [ProductId], [UserId], [Count]) VALUES (1120, 1036, N'cfe68aa4-1b08-400e-bbb0-f764cdc84daf', 1)
SET IDENTITY_INSERT [dbo].[BasketItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([Id], [Name]) VALUES (2, N'Lenova')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (3, N'Apple')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (4, N'Samsung')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (5, N'Xiaomi')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (6, N'Huawei')
INSERT [dbo].[Brands] ([Id], [Name]) VALUES (12, N'Asus')
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name]) VALUES (4, N'Accessories')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (5, N'Notebooks')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (6, N'Watches')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (7, N'Tablets')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (8, N'TV')
INSERT [dbo].[Categories] ([Id], [Name]) VALUES (9, N'Smartphones')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Count], [ProductName]) VALUES (47, 36, 1036, 3, N'iPhone 14 Pro 128 GB')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Count], [ProductName]) VALUES (48, 37, 1036, 3, N'iPhone 14 Pro 128 GB')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Count], [ProductName]) VALUES (49, 38, 1036, 3, N'iPhone 14 Pro 128 GB')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Count], [ProductName]) VALUES (50, 39, 1036, 3, N'iPhone 14 Pro 128 GB')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Count], [ProductName]) VALUES (51, 39, 1035, 1, N'iPhone 11 128 GB White')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Count], [ProductName]) VALUES (52, 40, 1041, 1, N'Asus E410MA-212.BK128-11')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Count], [ProductName]) VALUES (53, 40, 1039, 1, N'iPhone 13 mini 128 GB')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Count], [ProductName]) VALUES (54, 40, 1040, 1, N'iPhone 15 Pro 1 TB')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Count], [ProductName]) VALUES (55, 40, 1036, 1, N'iPhone 14 Pro 128 GB')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Count], [ProductName]) VALUES (56, 41, 1036, 1, N'iPhone 14 Pro 128 GB')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Count], [ProductName]) VALUES (57, 41, 1035, 1, N'iPhone 11 128 GB White')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Count], [ProductName]) VALUES (58, 42, 1038, 1, N'iPhone 14 Pro Max 128 GB')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Count], [ProductName]) VALUES (59, 42, 1040, 1, N'iPhone 15 Pro 1 TB')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Count], [ProductName]) VALUES (60, 43, 1041, 1, N'Asus E410MA-212.BK128-11')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Count], [ProductName]) VALUES (61, 44, 1041, 1, N'Asus E410MA-212.BK128-11')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Count], [ProductName]) VALUES (62, 45, 1040, 2, N'iPhone 15 Pro 1 TB')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Count], [ProductName]) VALUES (63, 46, 1035, 3, N'iPhone 11 128 GB White')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Count], [ProductName]) VALUES (64, 47, 1036, 3, N'iPhone 14 Pro 128 GB')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Count], [ProductName]) VALUES (65, 48, 1037, 2, N'iPhone 13 128 GB Pink')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Count], [ProductName]) VALUES (66, 49, 1040, 4, N'iPhone 15 Pro 1 TB')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Count], [ProductName]) VALUES (67, 50, 1036, 1, N'iPhone 14 Pro 128 GB')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Count], [ProductName]) VALUES (68, 51, 1035, 1, N'iPhone 11 128 GB White')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Count], [ProductName]) VALUES (69, 52, 1039, 3, N'iPhone 13 mini 128 GB')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Count], [ProductName]) VALUES (70, 53, 1039, 3, N'iPhone 13 mini 128 GB')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Count], [ProductName]) VALUES (71, 54, 1039, 3, N'iPhone 13 mini 128 GB')
INSERT [dbo].[OrderItems] ([Id], [OrderId], [ProductId], [Count], [ProductName]) VALUES (72, 55, 1039, 1, N'iPhone 13 mini 128 GB')
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [UserId], [FullName], [Phone], [Address], [Email], [Note], [CreatedAt], [Status]) VALUES (36, NULL, N'Chingiz Abdullayevv', N'+994555555555', N'Sumqayit', N'elmaddinshm@code.edu.az', N'', CAST(N'2023-01-10T20:13:42.0236094' AS DateTime2), 1)
INSERT [dbo].[Orders] ([Id], [UserId], [FullName], [Phone], [Address], [Email], [Note], [CreatedAt], [Status]) VALUES (37, NULL, N'Elmeddin Mirzeyev', N'+994555555555', N'Sumqayit', N'elmeddin.mirzeyev1996@gmail.com', N'', CAST(N'2023-03-10T20:14:04.4640123' AS DateTime2), 2)
INSERT [dbo].[Orders] ([Id], [UserId], [FullName], [Phone], [Address], [Email], [Note], [CreatedAt], [Status]) VALUES (38, NULL, N'Chingiz Abdullayevv', N'+994555555555', N'Sumqayit', N'elmaddinshm@code.edu.az', N'', CAST(N'2023-04-10T20:19:56.4398724' AS DateTime2), 3)
INSERT [dbo].[Orders] ([Id], [UserId], [FullName], [Phone], [Address], [Email], [Note], [CreatedAt], [Status]) VALUES (39, NULL, N'Elmeddin Mirzeyev', N'+994555555555', N'Sumqayit', N'elmeddin.mirzeyev1996@gmail.com', N'', CAST(N'2023-04-10T20:23:13.6830818' AS DateTime2), 2)
INSERT [dbo].[Orders] ([Id], [UserId], [FullName], [Phone], [Address], [Email], [Note], [CreatedAt], [Status]) VALUES (40, N'cfe68aa4-1b08-400e-bbb0-f764cdc84daf', N'Elmeddin Mirzeyev', N'+994555555555', N'Sumqayit', N'elmeddin.mirzeyev1996@gmail.com', N'', CAST(N'2023-05-10T20:26:10.8658511' AS DateTime2), 1)
INSERT [dbo].[Orders] ([Id], [UserId], [FullName], [Phone], [Address], [Email], [Note], [CreatedAt], [Status]) VALUES (41, N'cfe68aa4-1b08-400e-bbb0-f764cdc84daf', N'Elmeddin Mirzeyev', N'+994555555555', N'Sumqayit', N'elmeddin.mirzeyev1996@gmail.com', N'', CAST(N'2023-06-10T20:31:08.5427335' AS DateTime2), 3)
INSERT [dbo].[Orders] ([Id], [UserId], [FullName], [Phone], [Address], [Email], [Note], [CreatedAt], [Status]) VALUES (42, N'cfe68aa4-1b08-400e-bbb0-f764cdc84daf', N'Chingiz Abdullayevv', N'+994555555555', N'Sumqayit', N'elmaddinshm@code.edu.az', N'', CAST(N'2023-06-10T20:36:17.4156207' AS DateTime2), 1)
INSERT [dbo].[Orders] ([Id], [UserId], [FullName], [Phone], [Address], [Email], [Note], [CreatedAt], [Status]) VALUES (43, N'cfe68aa4-1b08-400e-bbb0-f764cdc84daf', N'Elmeddin Mirzeyev', N'+994555555555', N'Sumqayit', N'elmeddin.mirzeyev1996@gmail.com', N'', CAST(N'2023-06-10T20:36:36.0539443' AS DateTime2), 3)
INSERT [dbo].[Orders] ([Id], [UserId], [FullName], [Phone], [Address], [Email], [Note], [CreatedAt], [Status]) VALUES (44, N'cfe68aa4-1b08-400e-bbb0-f764cdc84daf', N'Elmeddin Mirzeyev', N'+994555555555', N'Sumqayit', N'elmeddin.mirzeyev1996@gmail.com', N'', CAST(N'2023-07-10T20:36:37.5880884' AS DateTime2), 1)
INSERT [dbo].[Orders] ([Id], [UserId], [FullName], [Phone], [Address], [Email], [Note], [CreatedAt], [Status]) VALUES (45, N'cfe68aa4-1b08-400e-bbb0-f764cdc84daf', N'Elmeddin Mirzeyev', N'+994555555555', N'Sumqayit', N'elmeddin.mirzeyev1996@gmail.com', N'', CAST(N'2023-08-10T20:37:10.0677838' AS DateTime2), 2)
INSERT [dbo].[Orders] ([Id], [UserId], [FullName], [Phone], [Address], [Email], [Note], [CreatedAt], [Status]) VALUES (46, N'cfe68aa4-1b08-400e-bbb0-f764cdc84daf', N'Elmeddin Mirzeyev', N'+994555555555', N'Sumqayit', N'elmeddin.mirzeyev1996@gmail.com', N'', CAST(N'2023-08-10T20:37:28.2103453' AS DateTime2), 1)
INSERT [dbo].[Orders] ([Id], [UserId], [FullName], [Phone], [Address], [Email], [Note], [CreatedAt], [Status]) VALUES (47, N'cfe68aa4-1b08-400e-bbb0-f764cdc84daf', N'Elmeddin Mirzeyev', N'+994555555555', N'Sumqayit', N'elmeddin.mirzeyev1996@gmail.com', N'', CAST(N'2023-08-10T20:38:09.0633796' AS DateTime2), 3)
INSERT [dbo].[Orders] ([Id], [UserId], [FullName], [Phone], [Address], [Email], [Note], [CreatedAt], [Status]) VALUES (48, N'cfe68aa4-1b08-400e-bbb0-f764cdc84daf', N'Elmeddin Mirzeyev', N'+994555555555', N'Sumqayit', N'elmeddin.mirzeyev1996@gmail.com', N'', CAST(N'2023-08-10T20:38:27.7416907' AS DateTime2), 2)
INSERT [dbo].[Orders] ([Id], [UserId], [FullName], [Phone], [Address], [Email], [Note], [CreatedAt], [Status]) VALUES (49, N'cfe68aa4-1b08-400e-bbb0-f764cdc84daf', N'Chingiz Abdullayevv', N'+994555555555', N'Sumqayit', N'elmaddinshm@code.edu.az', N'qwerthjvcdfghn', CAST(N'2023-09-10T20:38:51.3436447' AS DateTime2), 1)
INSERT [dbo].[Orders] ([Id], [UserId], [FullName], [Phone], [Address], [Email], [Note], [CreatedAt], [Status]) VALUES (50, N'cfe68aa4-1b08-400e-bbb0-f764cdc84daf', N'Chingiz Abdullayevv', N'+994555555555', N'Sumqayit', N'elmaddinshm@code.edu.az', N'fffffffffffffffffffffffffffffffffffffffffffffffffityuwagdJHADNJSnjkncxz c,mhebjnjfdvnsjkn;skdfnvjkfnvkfdn;jdfv', CAST(N'2023-09-10T20:41:05.6636355' AS DateTime2), 2)
INSERT [dbo].[Orders] ([Id], [UserId], [FullName], [Phone], [Address], [Email], [Note], [CreatedAt], [Status]) VALUES (51, N'cfe68aa4-1b08-400e-bbb0-f764cdc84daf', N'Elmeddin Mirzeyev', N'+994555555555', N'Sumqayit', N'elmeddin.mirzeyev1996@gmail.com', N'', CAST(N'2023-10-10T20:48:11.3278398' AS DateTime2), 1)
INSERT [dbo].[Orders] ([Id], [UserId], [FullName], [Phone], [Address], [Email], [Note], [CreatedAt], [Status]) VALUES (52, N'cfe68aa4-1b08-400e-bbb0-f764cdc84daf', N'Elmeddin Mirzeyev', N'+994555555555', N'Sumqayit', N'elmeddin.mirzeyev1996@gmail.com', N'', CAST(N'2023-10-10T20:48:29.8422456' AS DateTime2), 1)
INSERT [dbo].[Orders] ([Id], [UserId], [FullName], [Phone], [Address], [Email], [Note], [CreatedAt], [Status]) VALUES (53, N'cfe68aa4-1b08-400e-bbb0-f764cdc84daf', N'Elmeddin Mirzeyev', N'+994555555555', N'Sumqayit', N'elmeddin.mirzeyev1996@gmail.com', N'', CAST(N'2023-10-10T20:48:39.8456974' AS DateTime2), 1)
INSERT [dbo].[Orders] ([Id], [UserId], [FullName], [Phone], [Address], [Email], [Note], [CreatedAt], [Status]) VALUES (54, N'cfe68aa4-1b08-400e-bbb0-f764cdc84daf', N'Elmeddin Mirzeyev', N'+994555555555', N'Sumqayit', N'elmeddin.mirzeyev1996@gmail.com', N'', CAST(N'2023-10-10T20:48:49.3816546' AS DateTime2), 1)
INSERT [dbo].[Orders] ([Id], [UserId], [FullName], [Phone], [Address], [Email], [Note], [CreatedAt], [Status]) VALUES (55, N'cfe68aa4-1b08-400e-bbb0-f764cdc84daf', N'Chingiz Abdullayevv', N'+994555555555', N'Sumqayit', N'elmaddinshm@code.edu.az', N'', CAST(N'2023-10-10T20:49:26.3670784' AS DateTime2), 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductImages] ON 

INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (90, 1035, N'b77fab64-e245-4987-8f78-d117beab6d4fiPhone 11 128 GB White.jpg', 1, N'/uploads/products/b77fab64-e245-4987-8f78-d117beab6d4fiPhone 11 128 GB White.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (91, 1035, N'8900babc-d61b-4c1a-906c-e2f6da15b43biPhone 11 128 GB White2.jpg', 0, N'/uploads/products/8900babc-d61b-4c1a-906c-e2f6da15b43biPhone 11 128 GB White2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (92, 1035, N'af834906-5ba6-4b43-9054-77eca583f902iPhone 11 128 GB White3.jpg', 0, N'/uploads/products/af834906-5ba6-4b43-9054-77eca583f902iPhone 11 128 GB White3.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (93, 1035, N'aad24995-6a4f-48dc-8e66-01da6afb2236iPhone 11 128 GB White4.png', 0, N'/uploads/products/aad24995-6a4f-48dc-8e66-01da6afb2236iPhone 11 128 GB White4.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (94, 1036, N'af70a16c-e13d-438d-9c3c-d3a92cdbefe8iPhone 14 Pro 128 GB.png', 1, N'/uploads/products/af70a16c-e13d-438d-9c3c-d3a92cdbefe8iPhone 14 Pro 128 GB.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (95, 1036, N'726d423b-e5b9-414d-95fb-344008a05ad2iPhone 14 Pro 128 GB 2.png', 0, N'/uploads/products/726d423b-e5b9-414d-95fb-344008a05ad2iPhone 14 Pro 128 GB 2.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (96, 1036, N'7fd2b2d0-9f54-4d2c-b588-d4a17548f8eeiPhone 14 Pro 128 GB 3.png', 0, N'/uploads/products/7fd2b2d0-9f54-4d2c-b588-d4a17548f8eeiPhone 14 Pro 128 GB 3.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (97, 1036, N'624b0159-31dd-4875-97aa-aae0229689e9iPhone 14 Pro 128 GB 4.png', 0, N'/uploads/products/624b0159-31dd-4875-97aa-aae0229689e9iPhone 14 Pro 128 GB 4.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (98, 1036, N'a564b6a8-f3df-4988-9987-6bfe74ede8a3iPhone 14 Pro 128 GB 6.png', 0, N'/uploads/products/a564b6a8-f3df-4988-9987-6bfe74ede8a3iPhone 14 Pro 128 GB 6.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (99, 1036, N'aaa20df9-5589-4604-bd77-9806ac7059ddiPhone 14 Pro 128 GB 7.png', 0, N'/uploads/products/aaa20df9-5589-4604-bd77-9806ac7059ddiPhone 14 Pro 128 GB 7.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (100, 1037, N'522432d2-2c7d-4ef8-8dac-7ee7d9e63d87iPhone 13 128 GB.png', 1, N'/uploads/products/522432d2-2c7d-4ef8-8dac-7ee7d9e63d87iPhone 13 128 GB.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (101, 1037, N'8b5b2f3c-dee1-4393-bd21-9d9b28f106bfiPhone 13 128 GB2.png', 0, N'/uploads/products/8b5b2f3c-dee1-4393-bd21-9d9b28f106bfiPhone 13 128 GB2.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (102, 1037, N'd58aca3d-8f29-4792-badb-1b9a439fc70ciPhone 13 128 GB3.png', 0, N'/uploads/products/d58aca3d-8f29-4792-badb-1b9a439fc70ciPhone 13 128 GB3.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (103, 1037, N'e06b332f-6f3c-45fc-9f8d-a052d709e93biPhone 13 128 GB4.png', 0, N'/uploads/products/e06b332f-6f3c-45fc-9f8d-a052d709e93biPhone 13 128 GB4.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (104, 1037, N'68c0140e-c95d-4f43-a707-b6039e1eb626tm-dg-sbp-1105-sm-1512-4.png', 0, N'/uploads/products/68c0140e-c95d-4f43-a707-b6039e1eb626tm-dg-sbp-1105-sm-1512-4.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (105, 1038, N'06b3c0f9-57f3-4976-ad1e-d6875becea1biPhone 14 Pro Max 128 GB.png', 1, N'/uploads/products/06b3c0f9-57f3-4976-ad1e-d6875becea1biPhone 14 Pro Max 128 GB.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (106, 1038, N'643f0e72-4e4f-4122-a5c3-e1a564501ea1iPhone 14 Pro Max 128 GB2.png', 0, N'/uploads/products/643f0e72-4e4f-4122-a5c3-e1a564501ea1iPhone 14 Pro Max 128 GB2.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (107, 1038, N'15b18f88-12ef-42b5-a51e-e77cab08bfa0iPhone 14 Pro Max 128 GB3.png', 0, N'/uploads/products/15b18f88-12ef-42b5-a51e-e77cab08bfa0iPhone 14 Pro Max 128 GB3.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (108, 1038, N'7807a4a4-515c-4ddf-b44c-663b63e3b477iPhone 14 Pro Max 128 GB4.png', 0, N'/uploads/products/7807a4a4-515c-4ddf-b44c-663b63e3b477iPhone 14 Pro Max 128 GB4.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (109, 1038, N'4ce924a3-6617-4a86-9afd-65f8678088efiPhone 14 Pro Max 128 GB5.png', 0, N'/uploads/products/4ce924a3-6617-4a86-9afd-65f8678088efiPhone 14 Pro Max 128 GB5.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (110, 1038, N'8f575041-c170-47a9-b6e5-4db2bd17dbcaiPhone 14 Pro Max 128 GB6.png', 0, N'/uploads/products/8f575041-c170-47a9-b6e5-4db2bd17dbcaiPhone 14 Pro Max 128 GB6.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (111, 1038, N'39e0a7c8-08ec-41aa-baff-d8dff15169fciPhone 14 Pro Max 128 GB7.png', 0, N'/uploads/products/39e0a7c8-08ec-41aa-baff-d8dff15169fciPhone 14 Pro Max 128 GB7.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (112, 1038, N'cbc324c1-5ca6-43d2-a4c4-12f998bcd34eiPhone 14 Pro Max 128 GB8.png', 0, N'/uploads/products/cbc324c1-5ca6-43d2-a4c4-12f998bcd34eiPhone 14 Pro Max 128 GB8.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (113, 1039, N'27671bc4-374d-4c4b-805f-5a98e3f818ceiPhone 13 mini 128 GB.png', 1, N'/uploads/products/27671bc4-374d-4c4b-805f-5a98e3f818ceiPhone 13 mini 128 GB.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (114, 1039, N'e8540a36-3581-46ad-bfe3-d4f3fa9844fdiPhone 13 mini 128 GB2.png', 0, N'/uploads/products/e8540a36-3581-46ad-bfe3-d4f3fa9844fdiPhone 13 mini 128 GB2.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (115, 1039, N'e0a25671-6555-4fc3-8fc9-c03fade16ff2iPhone 13 mini 128 GB3.png', 0, N'/uploads/products/e0a25671-6555-4fc3-8fc9-c03fade16ff2iPhone 13 mini 128 GB3.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (116, 1039, N'f61cce55-e8e1-434b-8142-110963011c3eiPhone 13 mini 128 GB4.png', 0, N'/uploads/products/f61cce55-e8e1-434b-8142-110963011c3eiPhone 13 mini 128 GB4.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (117, 1040, N'16040a4a-692f-479e-a5ce-a2292c75c527iPhone 15 Pro 1 TB.png', 1, N'/uploads/products/16040a4a-692f-479e-a5ce-a2292c75c527iPhone 15 Pro 1 TB.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (118, 1040, N'f514f259-97b2-45b8-9f8d-930379fc790eiPhone 15 Pro 1 TB2.png', 0, N'/uploads/products/f514f259-97b2-45b8-9f8d-930379fc790eiPhone 15 Pro 1 TB2.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (119, 1040, N'990e39fc-b3d4-4101-a5a8-65208862e1a2iPhone 15 Pro 1 TB3.png', 0, N'/uploads/products/990e39fc-b3d4-4101-a5a8-65208862e1a2iPhone 15 Pro 1 TB3.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (120, 1040, N'62d8f600-b318-4adf-bb8f-06d637b015c0iPhone 15 Pro 1 TB4.png', 0, N'/uploads/products/62d8f600-b318-4adf-bb8f-06d637b015c0iPhone 15 Pro 1 TB4.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (121, 1040, N'880264d0-51e2-4d26-9699-bb21a4b2809diPhone 15 Pro 1 TB5.png', 0, N'/uploads/products/880264d0-51e2-4d26-9699-bb21a4b2809diPhone 15 Pro 1 TB5.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (122, 1040, N'edcb766e-0f71-42ef-94a5-1458935b4352iPhone 15 Pro 1 TB6.png', 0, N'/uploads/products/edcb766e-0f71-42ef-94a5-1458935b4352iPhone 15 Pro 1 TB6.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (123, 1041, N'11ccbe6b-0c5a-4f32-b84e-55e1440039c2Asus E410MA-212.BK128-112.png', 1, N'/uploads/products/11ccbe6b-0c5a-4f32-b84e-55e1440039c2Asus E410MA-212.BK128-112.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (124, 1041, N'c551df6b-2d3e-4c5a-8e49-3790d889efe8Asus E410MA-212.BK128-11.png', 0, N'/uploads/products/c551df6b-2d3e-4c5a-8e49-3790d889efe8Asus E410MA-212.BK128-11.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (125, 1041, N'c49c41fc-cfa2-4ae4-8f30-fd9b2793b055Asus E410MA-212.BK128-113.png', 0, N'/uploads/products/c49c41fc-cfa2-4ae4-8f30-fd9b2793b055Asus E410MA-212.BK128-113.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (126, 1041, N'517ed0e8-af47-46ad-8b76-49524ba04c39Asus E410MA-212.BK128-114.png', 0, N'/uploads/products/517ed0e8-af47-46ad-8b76-49524ba04c39Asus E410MA-212.BK128-114.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (127, 1041, N'2f3318ca-8e01-46a7-a502-0347401c23d8Asus E410MA-212.BK128-116.png', 0, N'/uploads/products/2f3318ca-8e01-46a7-a502-0347401c23d8Asus E410MA-212.BK128-116.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (128, 1042, N'eb27a4af-4bd8-44b3-9228-87cc3ac65408HUAWEI MateBook D 16.png', 1, N'/uploads/products/eb27a4af-4bd8-44b3-9228-87cc3ac65408HUAWEI MateBook D 16.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (129, 1042, N'a3b44ed5-d6d0-4ad7-98de-e42c9ad30e08HUAWEI MateBook D 162.png', 0, N'/uploads/products/a3b44ed5-d6d0-4ad7-98de-e42c9ad30e08HUAWEI MateBook D 162.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (130, 1042, N'84ea2ff3-3516-40cd-ad62-1ca7462bfa00HUAWEI MateBook D 163.png', 0, N'/uploads/products/84ea2ff3-3516-40cd-ad62-1ca7462bfa00HUAWEI MateBook D 163.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (131, 1042, N'9c5cb0f7-741f-4f80-a429-ca3b8205e78aHUAWEI MateBook D 165.png', 0, N'/uploads/products/9c5cb0f7-741f-4f80-a429-ca3b8205e78aHUAWEI MateBook D 165.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (132, 1042, N'eab92576-30ca-457e-925d-b0d48accfcbfHUAWEI MateBook D 166.png', 0, N'/uploads/products/eab92576-30ca-457e-925d-b0d48accfcbfHUAWEI MateBook D 166.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (133, 1043, N'528b3df3-5a64-4db4-abfa-0ae174fe170eHuawei MateBook D 14.png', 1, N'/uploads/products/528b3df3-5a64-4db4-abfa-0ae174fe170eHuawei MateBook D 14.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (134, 1043, N'a60f7c5e-dcd8-43a2-af37-23970ca6d22cHuawei MateBook D 141.png', 0, N'/uploads/products/a60f7c5e-dcd8-43a2-af37-23970ca6d22cHuawei MateBook D 141.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (135, 1043, N'44c74cc9-c635-4998-8675-843d8000c330Huawei MateBook D 142.png', 0, N'/uploads/products/44c74cc9-c635-4998-8675-843d8000c330Huawei MateBook D 142.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (136, 1044, N'afde9928-282d-47b8-be99-97d461984bf9Lenovo Legion 5 15IAH7H.png', 1, N'/uploads/products/afde9928-282d-47b8-be99-97d461984bf9Lenovo Legion 5 15IAH7H.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (137, 1044, N'0cdba41c-6984-4276-ab76-19fe388c249fLenovo Legion 5 15IAH7H1.png', 0, N'/uploads/products/0cdba41c-6984-4276-ab76-19fe388c249fLenovo Legion 5 15IAH7H1.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (138, 1044, N'ef20f79c-54f6-497e-8d1b-392cc6634d8bLenovo Legion 5 15IAH7H2.png', 0, N'/uploads/products/ef20f79c-54f6-497e-8d1b-392cc6634d8bLenovo Legion 5 15IAH7H2.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (139, 1044, N'ec5be8b8-9bfb-4965-95e1-1723a2bbff23Lenovo Legion 5 15IAH7H3.png', 0, N'/uploads/products/ec5be8b8-9bfb-4965-95e1-1723a2bbff23Lenovo Legion 5 15IAH7H3.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (140, 1044, N'4e63a9d9-06fd-4271-b5f3-72f6400ced08Lenovo Legion 5 15IAH7H5.png', 0, N'/uploads/products/4e63a9d9-06fd-4271-b5f3-72f6400ced08Lenovo Legion 5 15IAH7H5.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (141, 1045, N'849a6bb1-665a-4df0-bcc6-9d5ad4fbe7e0ThinkPad T14S Gen 3.png', 1, N'/uploads/products/849a6bb1-665a-4df0-bcc6-9d5ad4fbe7e0ThinkPad T14S Gen 3.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (142, 1045, N'0d1b1a3b-0356-4f62-b84a-224b37b8b83dThinkPad T14S Gen 31.png', 0, N'/uploads/products/0d1b1a3b-0356-4f62-b84a-224b37b8b83dThinkPad T14S Gen 31.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (143, 1045, N'4afe2de0-5a4d-4650-a9e5-d1255d25b17aThinkPad T14S Gen 33.png', 0, N'/uploads/products/4afe2de0-5a4d-4650-a9e5-d1255d25b17aThinkPad T14S Gen 33.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (144, 1045, N'5b3f3667-968e-4e65-bfdf-99b200ba4df6ThinkPad T14S Gen 34.png', 0, N'/uploads/products/5b3f3667-968e-4e65-bfdf-99b200ba4df6ThinkPad T14S Gen 34.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (145, 1045, N'b378b768-2f50-421d-8303-23efd37c51f6ThinkPad T14S Gen 35.png', 0, N'/uploads/products/b378b768-2f50-421d-8303-23efd37c51f6ThinkPad T14S Gen 35.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (146, 1046, N'b9da96dc-3c32-426e-aba6-58c7207503bbGalaxy S23 Ultra (SM-S918B).png', 1, N'/uploads/products/b9da96dc-3c32-426e-aba6-58c7207503bbGalaxy S23 Ultra (SM-S918B).png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (147, 1046, N'badf903e-9d13-4a54-98b1-d907d2f7b710Galaxy S23 Ultra (SM-S918B)1.png', 0, N'/uploads/products/badf903e-9d13-4a54-98b1-d907d2f7b710Galaxy S23 Ultra (SM-S918B)1.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (148, 1046, N'a5dc571d-7226-44f0-a37f-03aa2859f88aGalaxy S23 Ultra (SM-S918B)3.png', 0, N'/uploads/products/a5dc571d-7226-44f0-a37f-03aa2859f88aGalaxy S23 Ultra (SM-S918B)3.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (149, 1046, N'ce19974d-0e28-4bd1-8baa-6514925fe48eGalaxy S23 Ultra (SM-S918B)5.png', 0, N'/uploads/products/ce19974d-0e28-4bd1-8baa-6514925fe48eGalaxy S23 Ultra (SM-S918B)5.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (150, 1047, N'1bcef2bd-d58e-4a64-a1ad-c7929fbee990Galaxy S22 (SM-S901B).png', 1, N'/uploads/products/1bcef2bd-d58e-4a64-a1ad-c7929fbee990Galaxy S22 (SM-S901B).png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (151, 1047, N'd53e1993-e4bb-45a1-9b5d-f177d3394230Galaxy S22 (SM-S901B)1.png', 0, N'/uploads/products/d53e1993-e4bb-45a1-9b5d-f177d3394230Galaxy S22 (SM-S901B)1.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (152, 1047, N'793c0cd7-06e3-4cb0-9663-8b0a658867b8Galaxy S22 (SM-S901B)3.png', 0, N'/uploads/products/793c0cd7-06e3-4cb0-9663-8b0a658867b8Galaxy S22 (SM-S901B)3.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (153, 1047, N'7fec3c52-db5e-452c-b8c2-568fb395858eGalaxy S22 (SM-S901B)5.png', 0, N'/uploads/products/7fec3c52-db5e-452c-b8c2-568fb395858eGalaxy S22 (SM-S901B)5.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (154, 1048, N'e04c932d-c6b0-4a77-ab6b-e2b51c4e66a7Galaxy Z Flip 5.png', 1, N'/uploads/products/e04c932d-c6b0-4a77-ab6b-e2b51c4e66a7Galaxy Z Flip 5.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (155, 1048, N'ec7c1950-5598-4fb5-864b-654a478d6b51Galaxy Z Flip 51.png', 0, N'/uploads/products/ec7c1950-5598-4fb5-864b-654a478d6b51Galaxy Z Flip 51.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (156, 1048, N'f92c495c-4379-4504-b4c0-98c944ecf644Galaxy Z Flip 52.png', 0, N'/uploads/products/f92c495c-4379-4504-b4c0-98c944ecf644Galaxy Z Flip 52.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (157, 1048, N'02564a54-aaee-4b55-9bbf-e13846b2bef1Galaxy Z Flip 54.png', 0, N'/uploads/products/02564a54-aaee-4b55-9bbf-e13846b2bef1Galaxy Z Flip 54.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (158, 1048, N'5754c9cf-9c5d-4cfd-b6de-88c1e1c64eceGalaxy Z Flip 55.png', 0, N'/uploads/products/5754c9cf-9c5d-4cfd-b6de-88c1e1c64eceGalaxy Z Flip 55.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (159, 1049, N'36017e74-6be3-4eee-825a-562e24e05f04Apple Watch Ultra 2.49mm.png', 1, N'/uploads/products/36017e74-6be3-4eee-825a-562e24e05f04Apple Watch Ultra 2.49mm.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (160, 1049, N'6284f6c6-b0f9-4ffd-92ba-5cf94c6e3a13Apple Watch Ultra 2.49mm1.png', 0, N'/uploads/products/6284f6c6-b0f9-4ffd-92ba-5cf94c6e3a13Apple Watch Ultra 2.49mm1.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (161, 1049, N'312fd8c0-7ec0-4305-a544-09851896e5a0Apple Watch Ultra 2.49mm2.png', 0, N'/uploads/products/312fd8c0-7ec0-4305-a544-09851896e5a0Apple Watch Ultra 2.49mm2.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (162, 1049, N'f29ec2b9-1ebf-4528-93f1-123cb47ef292Apple Watch Ultra 2.49mm4.png', 0, N'/uploads/products/f29ec2b9-1ebf-4528-93f1-123cb47ef292Apple Watch Ultra 2.49mm4.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (163, 1050, N'299d7eb3-7c78-4cf0-a7da-86bd107afadcApple Watch 8 41mm.png', 1, N'/uploads/products/299d7eb3-7c78-4cf0-a7da-86bd107afadcApple Watch 8 41mm.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (164, 1050, N'2470f111-89e0-414f-8ccd-bd5dc3119874Apple Watch 8 41mm1.png', 0, N'/uploads/products/2470f111-89e0-414f-8ccd-bd5dc3119874Apple Watch 8 41mm1.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (165, 1050, N'0284d9a9-e624-4f4c-a8dc-0cd1418dbacfApple Watch 8 41mm2.png', 0, N'/uploads/products/0284d9a9-e624-4f4c-a8dc-0cd1418dbacfApple Watch 8 41mm2.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (166, 1051, N'8b3307d3-eb92-4c09-933b-26c68fbc943dHUAWEI Watch GT 3 Pro.jpg', 1, N'/uploads/products/8b3307d3-eb92-4c09-933b-26c68fbc943dHUAWEI Watch GT 3 Pro.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (167, 1051, N'e796f295-b4cb-42bd-978e-658ca865e224HUAWEI Watch GT 3 Pro1.jpg', 0, N'/uploads/products/e796f295-b4cb-42bd-978e-658ca865e224HUAWEI Watch GT 3 Pro1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (168, 1051, N'7eddbf7c-f5bd-4f32-85d9-223bd564d5f3HUAWEI Watch GT 3 Pro2.png', 0, N'/uploads/products/7eddbf7c-f5bd-4f32-85d9-223bd564d5f3HUAWEI Watch GT 3 Pro2.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (169, 1051, N'80bf243c-12be-40d6-abf7-6420eb2ab6b9HUAWEI Watch GT 3 Pro3.png', 0, N'/uploads/products/80bf243c-12be-40d6-abf7-6420eb2ab6b9HUAWEI Watch GT 3 Pro3.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (170, 1051, N'56fe1aa2-af27-4ba2-96a2-0e97219c9aeaHUAWEI Watch GT 3 Pro5.png', 0, N'/uploads/products/56fe1aa2-af27-4ba2-96a2-0e97219c9aeaHUAWEI Watch GT 3 Pro5.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (171, 1052, N'82f6133f-9d98-4e6e-823e-4fc0f6f45448HUAWEI Watch GT Runner.png', 1, N'/uploads/products/82f6133f-9d98-4e6e-823e-4fc0f6f45448HUAWEI Watch GT Runner.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (172, 1052, N'0502434b-9df8-4e7c-bd40-4b87f8baf8eeHUAWEI Watch GT Runner1.png', 0, N'/uploads/products/0502434b-9df8-4e7c-bd40-4b87f8baf8eeHUAWEI Watch GT Runner1.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (173, 1052, N'9b3c9730-f002-4a8d-989d-a737b4dc2feeHUAWEI Watch GT Runner2.png', 0, N'/uploads/products/9b3c9730-f002-4a8d-989d-a737b4dc2feeHUAWEI Watch GT Runner2.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (174, 1052, N'3aa32610-b5ed-4e83-85b2-21e83cd12168HUAWEI Watch GT Runner4.png', 0, N'/uploads/products/3aa32610-b5ed-4e83-85b2-21e83cd12168HUAWEI Watch GT Runner4.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (175, 1053, N'e33082b3-2852-41ed-bd62-e02e6c5bd138Xiaomi Watch S1.png', 1, N'/uploads/products/e33082b3-2852-41ed-bd62-e02e6c5bd138Xiaomi Watch S1.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (176, 1053, N'65b73fc0-40a5-4fc8-9e3b-5e0e148b13f4Xiaomi Watch S1 1.png', 0, N'/uploads/products/65b73fc0-40a5-4fc8-9e3b-5e0e148b13f4Xiaomi Watch S1 1.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (177, 1053, N'6d4d1193-5e0c-47d0-8502-8a7067dbf04cXiaomi Watch S1 2.png', 0, N'/uploads/products/6d4d1193-5e0c-47d0-8502-8a7067dbf04cXiaomi Watch S1 2.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (178, 1053, N'e4b1274f-942e-49de-ab71-6ffd53850b61Xiaomi Watch S1 5.png', 0, N'/uploads/products/e4b1274f-942e-49de-ab71-6ffd53850b61Xiaomi Watch S1 5.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (179, 1054, N'734647a4-b877-4778-823d-f7911df2ab8cRedmi Watch 2 Lite.png', 1, N'/uploads/products/734647a4-b877-4778-823d-f7911df2ab8cRedmi Watch 2 Lite.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (180, 1054, N'658a70cb-fff4-4d5e-a329-292d73a06856Redmi Watch 2 Lite1.png', 0, N'/uploads/products/658a70cb-fff4-4d5e-a329-292d73a06856Redmi Watch 2 Lite1.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (181, 1054, N'cb5b1665-4b79-4bdf-8ef1-b8813a1affdbRedmi Watch 2 Lite2.png', 0, N'/uploads/products/cb5b1665-4b79-4bdf-8ef1-b8813a1affdbRedmi Watch 2 Lite2.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (182, 1055, N'b70f122d-e40b-4be6-98f1-af7300dff94dGalaxy Watch 6 Classic.png', 1, N'/uploads/products/b70f122d-e40b-4be6-98f1-af7300dff94dGalaxy Watch 6 Classic.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (183, 1055, N'a83b3111-06c8-4017-8e30-e91066dcd4daGalaxy Watch 6 Classic1.png', 0, N'/uploads/products/a83b3111-06c8-4017-8e30-e91066dcd4daGalaxy Watch 6 Classic1.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (184, 1055, N'5c0598ae-14f0-4c40-92a5-e5e79bfb661eGalaxy Watch 6 Classic3.png', 0, N'/uploads/products/5c0598ae-14f0-4c40-92a5-e5e79bfb661eGalaxy Watch 6 Classic3.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (185, 1056, N'cb792ce2-7c72-4fd5-8758-68bbc100e6f9Samsung Watch 4 44 mm.png', 1, N'/uploads/products/cb792ce2-7c72-4fd5-8758-68bbc100e6f9Samsung Watch 4 44 mm.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (186, 1056, N'9ab124cd-7559-4a9d-a73b-414dbcb38e37Samsung Watch 4 44 mm1.png', 0, N'/uploads/products/9ab124cd-7559-4a9d-a73b-414dbcb38e37Samsung Watch 4 44 mm1.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (187, 1056, N'69e548c9-6a9b-4527-b4a2-6767d67e432cSamsung Watch 4 44 mm2.png', 0, N'/uploads/products/69e548c9-6a9b-4527-b4a2-6767d67e432cSamsung Watch 4 44 mm2.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (188, 1056, N'8b55edd9-54f8-43b5-ae57-015d4780ccc8Samsung Watch 4 44 mm4.png', 0, N'/uploads/products/8b55edd9-54f8-43b5-ae57-015d4780ccc8Samsung Watch 4 44 mm4.png')
GO
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (189, 1057, N'ae0a6a0a-dc50-4838-9ceb-2b27b8cad3baFast Wireless Charger Duo.png', 1, N'/uploads/products/ae0a6a0a-dc50-4838-9ceb-2b27b8cad3baFast Wireless Charger Duo.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (190, 1057, N'8e4bb8ab-dcca-4a4c-95ea-86adc6304f3cFast Wireless Charger Duo1.png', 0, N'/uploads/products/8e4bb8ab-dcca-4a4c-95ea-86adc6304f3cFast Wireless Charger Duo1.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (191, 1057, N'a70c359f-7108-4f99-906d-6c836feddf3eFast Wireless Charger Duo2.png', 0, N'/uploads/products/a70c359f-7108-4f99-906d-6c836feddf3eFast Wireless Charger Duo2.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (192, 1058, N'23241bfc-59ad-442c-99d5-c9780fa3b33cMagSafe Duo Charger1.jpg', 1, N'/uploads/products/23241bfc-59ad-442c-99d5-c9780fa3b33cMagSafe Duo Charger1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (193, 1058, N'24827da3-1ca5-4ef4-8898-e3b7bf0f731aMagSafe Duo Charger.jpg', 0, N'/uploads/products/24827da3-1ca5-4ef4-8898-e3b7bf0f731aMagSafe Duo Charger.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (194, 1058, N'6afb5363-a355-471f-8c9f-e22ff71a8e58MagSafe Duo Charger2.jpg', 0, N'/uploads/products/6afb5363-a355-471f-8c9f-e22ff71a8e58MagSafe Duo Charger2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (195, 1058, N'5b837989-0cb5-4a50-a358-b012e8d7d53cMagSafe Duo Charger3.jpg', 0, N'/uploads/products/5b837989-0cb5-4a50-a358-b012e8d7d53cMagSafe Duo Charger3.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (196, 1059, N'7f526aff-0e9d-419c-aabb-037e179194d1Samsung QE85QN900CUXRU.png', 1, N'/uploads/products/7f526aff-0e9d-419c-aabb-037e179194d1Samsung QE85QN900CUXRU.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (197, 1059, N'a8d24d29-935c-4d49-bce7-ac3838023259Samsung QE85QN900CUXRU1.png', 0, N'/uploads/products/a8d24d29-935c-4d49-bce7-ac3838023259Samsung QE85QN900CUXRU1.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (198, 1059, N'8571c115-1516-48a5-97e4-6e99ad97ac59Samsung QE85QN900CUXRU2.png', 0, N'/uploads/products/8571c115-1516-48a5-97e4-6e99ad97ac59Samsung QE85QN900CUXRU2.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (199, 1060, N'12fcb912-0a07-4cad-8e35-611981d32316Samsung LED UE85AU7100UXRU.jpg', 1, N'/uploads/products/12fcb912-0a07-4cad-8e35-611981d32316Samsung LED UE85AU7100UXRU.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (200, 1060, N'ce260bbe-066b-4dfd-ae49-44a206ff7e82Samsung LED UE85AU7100UXRU1.jpg', 0, N'/uploads/products/ce260bbe-066b-4dfd-ae49-44a206ff7e82Samsung LED UE85AU7100UXRU1.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (201, 1060, N'1f8112dd-4022-4eff-b838-739e93a0aa23Samsung LED UE85AU7100UXRU2.jpg', 0, N'/uploads/products/1f8112dd-4022-4eff-b838-739e93a0aa23Samsung LED UE85AU7100UXRU2.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (202, 1061, N'50065c1d-bd18-4a1d-9db6-c314fcc05359iPad 10.9-inch 256 GB.png', 1, N'/uploads/products/50065c1d-bd18-4a1d-9db6-c314fcc05359iPad 10.9-inch 256 GB.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (203, 1061, N'0df2c682-2d4c-425f-a13b-5461067385b8iPad 10.9-inch 256 GB1.png', 0, N'/uploads/products/0df2c682-2d4c-425f-a13b-5461067385b8iPad 10.9-inch 256 GB1.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (204, 1061, N'c6be1226-f465-41cf-a5e7-ba51e2c19676iPad 10.9-inch 256 GB3.png', 0, N'/uploads/products/c6be1226-f465-41cf-a5e7-ba51e2c19676iPad 10.9-inch 256 GB3.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (205, 1062, N'6cd4c2c2-d4fa-492f-acb1-e6deb524ae39Galaxy Tab S9 FE 5G.png', 1, N'/uploads/products/6cd4c2c2-d4fa-492f-acb1-e6deb524ae39Galaxy Tab S9 FE 5G.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (206, 1062, N'3a1146b2-89a1-42a8-b4a7-db9221e1f7d5Galaxy Tab S9 FE 5G1.png', 0, N'/uploads/products/3a1146b2-89a1-42a8-b4a7-db9221e1f7d5Galaxy Tab S9 FE 5G1.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (207, 1062, N'41923334-6379-4561-9e8b-01f07753cd5eGalaxy Tab S9 FE 5G2.png', 0, N'/uploads/products/41923334-6379-4561-9e8b-01f07753cd5eGalaxy Tab S9 FE 5G2.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (208, 1063, N'c925621b-200b-422b-b55c-3ade987cf455Lenovo Tab P11 Pro.png', 1, N'/uploads/products/c925621b-200b-422b-b55c-3ade987cf455Lenovo Tab P11 Pro.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (209, 1063, N'0ea90581-6f63-45e4-9697-4eb5c5526e26Lenovo Tab P11 Pro1.png', 0, N'/uploads/products/0ea90581-6f63-45e4-9697-4eb5c5526e26Lenovo Tab P11 Pro1.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (210, 1063, N'82b4c2c3-cbda-4f9f-99fd-4b9c2108d43dLenovo Tab P11 Pro2.png', 0, N'/uploads/products/82b4c2c3-cbda-4f9f-99fd-4b9c2108d43dLenovo Tab P11 Pro2.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (211, 1064, N'5b3586bc-8530-4fe6-9384-c33ed00ee6c9Asus ROG Strix SCAR 16.png', 1, N'/uploads/products/5b3586bc-8530-4fe6-9384-c33ed00ee6c9Asus ROG Strix SCAR 16.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (212, 1064, N'42d67beb-56b0-468d-9f05-107b25fcb019Asus ROG Strix SCAR 161.png', 0, N'/uploads/products/42d67beb-56b0-468d-9f05-107b25fcb019Asus ROG Strix SCAR 161.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (213, 1064, N'2e9bc445-80b8-472b-b156-ee4236affeb0Asus ROG Strix SCAR 162.png', 0, N'/uploads/products/2e9bc445-80b8-472b-b156-ee4236affeb0Asus ROG Strix SCAR 162.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (214, 1064, N'6f3955ec-0655-4603-b9f8-a236e297f7b1Asus ROG Strix SCAR 163.png', 0, N'/uploads/products/6f3955ec-0655-4603-b9f8-a236e297f7b1Asus ROG Strix SCAR 163.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (215, 1065, N'333814f7-7297-4951-be24-117850ad5ddaTUF A15 FA507NU-LP031.jpg', 1, N'/uploads/products/333814f7-7297-4951-be24-117850ad5ddaTUF A15 FA507NU-LP031.jpg')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (216, 1065, N'119f5bdf-0c08-4a3c-97fa-0b1b0d475920TUF A15 FA507NU-LP0311.png', 0, N'/uploads/products/119f5bdf-0c08-4a3c-97fa-0b1b0d475920TUF A15 FA507NU-LP0311.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (217, 1065, N'277be396-df38-4f9c-a85a-9e1ace2aa691TUF A15 FA507NU-LP0312.png', 0, N'/uploads/products/277be396-df38-4f9c-a85a-9e1ace2aa691TUF A15 FA507NU-LP0312.png')
INSERT [dbo].[ProductImages] ([Id], [ProductId], [ImageName], [PosterStatus], [ImageUrl]) VALUES (218, 1065, N'55afa07d-21db-4f72-af4b-b5649fdaa368TUF A15 FA507NU-LP0313.png', 0, N'/uploads/products/55afa07d-21db-4f72-af4b-b5649fdaa368TUF A15 FA507NU-LP0313.png')
SET IDENTITY_INSERT [dbo].[ProductImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [Name], [Description], [CategoryId], [BrandId], [SalePrice], [CostPrice], [DiscountPercent], [Rate], [Stock]) VALUES (1035, N'iPhone 11 128 GB White', N'Processor Power: The iPhone 11 harnesses the Apple A13 Bionic chip, delivering swift and efficient performance.

Camera: It boasts a dual rear camera system, offering an excellent choice for high-quality photo and video capture.

Display: With a 6.1-inch Liquid Retina screen, it presents vibrant colors and sharp visuals.

Battery Life: Ideal for daily use, it offers long-lasting battery performance.

iOS: Running on the iOS operating system, the iPhone 11 provides an integrated experience within Apple''s ecosystem.

Storage: Featuring a spacious 128GB storage capacity, it offers ample room for photos, videos, and applications.

Color Options: You can choose from various color options to suit your style.', 9, 3, 1400.0000, 1000.0000, 10.0000, 4, 9)
INSERT [dbo].[Products] ([Id], [Name], [Description], [CategoryId], [BrandId], [SalePrice], [CostPrice], [DiscountPercent], [Rate], [Stock]) VALUES (1036, N'iPhone 14 Pro 128 GB', N'Processor Powerhouse: The iPhone 14 Pro is equipped with Apple''s cutting-edge A16 chip, delivering lightning-fast and efficient performance.

Photography Mastery: With an advanced dual rear camera system, it''s your go-to choice for capturing stunning high-quality photos and videos.

Immersive Visuals: The device boasts a captivating 6.7-inch Liquid Retina XDR display, providing vivid colors and razor-sharp visuals.

All-Day Battery Life: Ideal for your daily adventures, it offers extended battery life to keep up with your needs.

iOS Integration: Running on the iOS operating system, the iPhone 14 Pro seamlessly integrates with the Apple ecosystem.

Spacious Storage: Featuring a generous 128GB storage capacity, it provides ample room for your photos, videos, and apps.', 9, 3, 1900.0000, 1498.0000, 5.0000, 5, 3)
INSERT [dbo].[Products] ([Id], [Name], [Description], [CategoryId], [BrandId], [SalePrice], [CostPrice], [DiscountPercent], [Rate], [Stock]) VALUES (1037, N'iPhone 13 128 GB Pink', N'Impressive Performance: The iPhone 13 is powered by Apple''s A15 Bionic chip, ensuring swift and efficient performance for all your tasks.

Advanced Camera System: With its dual rear camera setup, it excels in capturing high-quality photos and videos, allowing you to unleash your creativity.

Stunning Display: Featuring a 6.1-inch Super Retina XDR display, it delivers vibrant colors and sharp visuals, making your content come to life.

Long-Lasting Battery: Designed for all-day use, it offers impressive battery life to keep you connected.

Seamless iOS Experience: Running on iOS, the iPhone 13 seamlessly integrates with the Apple ecosystem, providing a unified and convenient user experience.

Generous Storage: With a spacious 128GB storage capacity, you have plenty of room for your photos, videos, apps, and more.', 9, 3, 1600.0000, 1300.0000, 8.0000, 5, 8)
INSERT [dbo].[Products] ([Id], [Name], [Description], [CategoryId], [BrandId], [SalePrice], [CostPrice], [DiscountPercent], [Rate], [Stock]) VALUES (1038, N'iPhone 14 Pro Max 128 GB', N'Unmatched Performance: The iPhone 14 Pro Max boasts Apple''s state-of-the-art A16 chip, ensuring blazing-fast and efficient performance for all your needs.

Photography Excellence: With an advanced triple rear camera system, it excels in capturing breathtaking high-quality photos and videos, allowing you to unleash your creative potential.

Immersive Display: Featuring a stunning 6.7-inch Liquid Retina XDR display, it offers vibrant colors and razor-sharp visuals, making your content come alive.

All-Day Battery Life: Designed to last, it provides extended battery life to keep up with your busy day.

Seamless iOS Integration: Running on the iOS operating system, the iPhone 14 Pro Max seamlessly integrates with the Apple ecosystem, offering a unified and intuitive user experience.

Ample Storage: With a generous 128 GB storage capacity, you have plenty of space for your photos, videos, apps, and more.

Color Selection: Choose your style from a range of captivating color options to match your personal taste."', 9, 3, 2000.0000, 1800.0000, 0.0000, 4, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [CategoryId], [BrandId], [SalePrice], [CostPrice], [DiscountPercent], [Rate], [Stock]) VALUES (1039, N'iPhone 13 mini 128 GB', N'Compact Powerhouse: The iPhone 13 mini may be small in size but packs a punch with Apple''s A15 Bionic chip, delivering swift and efficient performance.

Pro-Grade Camera: Equipped with a dual rear camera system, it excels in capturing high-quality photos and videos, empowering your photography skills.

Crisp Display: With its 5.4-inch Super Retina XDR display, it offers vibrant colors and sharp visuals, making your content pop.

Extended Battery Life: Designed to keep up with your on-the-go lifestyle, it provides impressive battery life for your daily tasks.

Seamless iOS Experience: Running on iOS, the iPhone 13 mini seamlessly integrates with the Apple ecosystem, ensuring a smooth and unified user experience.

Generous Storage: With a roomy 128 GB storage capacity, you have ample space for your photos, videos, apps, and more.

Color Choices: Express your individuality with a variety of color options to match your unique style."', 9, 3, 1100.0000, 800.0000, 0.0000, 5, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [CategoryId], [BrandId], [SalePrice], [CostPrice], [DiscountPercent], [Rate], [Stock]) VALUES (1040, N'iPhone 15 Pro 1 TB', N'Unprecedented Performance: The iPhone 15 Pro is driven by Apple''s groundbreaking A17 chip, delivering unrivaled speed and efficiency for all your tasks.

Pro-Grade Photography: Featuring a sophisticated quad-camera system, it excels in capturing stunning high-quality photos and videos, allowing you to explore your artistic side.

Immersive Visuals: With its captivating 6.7-inch Liquid Retina XDR Pro display, it offers vivid colors and razor-sharp visuals, providing an immersive viewing experience.

All-Day Battery Life: Designed to last, it provides extended battery life to keep up with your demanding schedule.

Seamless iOS Integration: Running on iOS, the iPhone 15 Pro seamlessly integrates with the Apple ecosystem, delivering a cohesive and intuitive user experience.

Vast Storage: With an enormous 1 TB storage capacity, you have boundless space for your photos, videos, apps, and more.

Color Spectrum: Express your individuality with a wide array of color choices to match your unique style."', 9, 3, 3000.0000, 2600.0000, 5.0000, 5, 8)
INSERT [dbo].[Products] ([Id], [Name], [Description], [CategoryId], [BrandId], [SalePrice], [CostPrice], [DiscountPercent], [Rate], [Stock]) VALUES (1041, N'Asus E410MA-212.BK128-11', N'Efficient Performance: The Asus E410MA-212.BK128-11 is equipped with a capable processor, ensuring smooth and efficient performance for your everyday tasks.

Compact and Portable: With its lightweight and compact design, it''s a perfect companion for on-the-go computing needs.

Vibrant Display: Featuring a vibrant display, it delivers clear visuals and an enjoyable viewing experience.

Long Battery Life: Designed for extended use, it offers impressive battery life to keep you productive throughout the day.

Reliable Storage: With ample storage capacity, you have room for your important files, documents, and multimedia.

Versatile Connectivity: It comes with a variety of connectivity options to meet your needs.

Sleek Design: With its sleek and modern design, it''s both stylish and functional.', 5, 12, 300.0000, 250.0000, 5.0000, 4, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [CategoryId], [BrandId], [SalePrice], [CostPrice], [DiscountPercent], [Rate], [Stock]) VALUES (1042, N'HUAWEI MateBook D 16', N'Large Display: MateBook D 16 boasts a spacious 16.1-inch display, providing ample screen real estate for work and multimedia.

High Performance: Powered by AMD Ryzen processors, it delivers fast and efficient performance, making it suitable for multitasking and demanding applications.

Sleek Design: The laptop features a slim and elegant design with a metal chassis, making it both stylish and durable.

Immersive Audio: With high-quality speakers and audio technology, it offers an immersive sound experience for movies and music.

Long Battery Life: MateBook D 16 provides long-lasting battery life, allowing you to stay productive or entertained throughout the day.

Fast Connectivity: It comes with USB-C and other connectivity options for fast data transfer and device compatibility.

Fingerprint Sensor: Securely log in with the built-in fingerprint sensor for added convenience and security.', 5, 6, 1800.0000, 1500.0000, 5.0000, 5, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [CategoryId], [BrandId], [SalePrice], [CostPrice], [DiscountPercent], [Rate], [Stock]) VALUES (1043, N'Huawei MateBook D 14', N'Portable Design: MateBook D 14 is lightweight and portable, making it easy to carry wherever you go.

Solid Performance: Powered by powerful processors, it provides a smooth and responsive computing experience, ideal for multitasking.

Vivid Display: The laptop features a 14-inch Full HD display with vibrant colors and sharp visuals for an immersive viewing experience.

Long Battery Life: Enjoy extended battery life, allowing you to work or stream content without interruption.

Fast Charging: With fast charging support, you can quickly recharge the battery for added convenience.

Fingerprint Sensor: Securely unlock your laptop with the integrated fingerprint sensor for enhanced security.

Stylish Build: Its sleek and modern design makes it a stylish accessory for professionals and students alike.

Versatile Connectivity: MateBook D 14 comes with various connectivity options, including USB-C, ensuring compatibility with a wide range of devices.', 5, 6, 1100.0000, 900.0000, 10.0000, 4, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [CategoryId], [BrandId], [SalePrice], [CostPrice], [DiscountPercent], [Rate], [Stock]) VALUES (1044, N'Lenovo Legion 5 15IAH7H', N'Exceptional Gaming Performance: Equipped with powerful Intel processors and dedicated NVIDIA GeForce graphics, the Legion 5 delivers top-notch gaming performance, ensuring smooth gameplay and excellent graphics quality.

High Refresh Rate Display: The laptop features a high-refresh-rate display (typically 144Hz or 165Hz), providing a buttery-smooth gaming experience with minimal motion blur.

Ample RAM and Storage: With generous RAM and storage options, you''ll have the capacity to run demanding games and multitask with ease.

Cooling and Thermals: Lenovo''s Legion Coldfront cooling system keeps the laptop running cool, even during intense gaming sessions, helping to maintain peak performance.

Customizable RGB Keyboard: The laptop comes with a customizable RGB backlit keyboard, allowing you to personalize your gaming setup.

Build Quality: The Legion 5 is built with durability in mind, featuring a robust build quality that can withstand the rigors of gaming.

Battery Life: Despite its gaming prowess, the laptop also offers respectable battery life for everyday use, making it a versatile choice for work and play.', 5, 2, 2800.0000, 2400.0000, 0.0000, 5, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [CategoryId], [BrandId], [SalePrice], [CostPrice], [DiscountPercent], [Rate], [Stock]) VALUES (1045, N'ThinkPad T14S Gen 3', N'Sleek and Lightweight Design: The T14s Gen 3 boasts a slim and lightweight design, making it highly portable for professionals on the go. Its sleek aesthetics add a touch of style to your workspace.

Impressive Performance: Powered by the latest Intel or AMD processors, this laptop delivers fast and responsive performance, ensuring smooth multitasking and efficient workloads.
Robust Security Features: ThinkPad laptops are renowned for their security features, and the T14s Gen 3 is no exception. It includes features like a fingerprint sensor, facial recognition, and hardware-based encryption to keep your data safe.

Exceptional Keyboard: Lenovo ThinkPad keyboards are celebrated for their comfortable and responsive typing experience, making long typing sessions a breeze.

Long Battery Life: With impressive battery life, you can work throughout the day without worrying about constant recharging.

Durable Build: ThinkPads are known for their durability, and the T14s Gen 3 is built to withstand the rigors of daily business use. It''s tested against various environmental factors like extreme temperatures, vibrations, and shocks.', 9, 4, 2300.0000, 1999.0000, 0.0000, 4, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [CategoryId], [BrandId], [SalePrice], [CostPrice], [DiscountPercent], [Rate], [Stock]) VALUES (1046, N'Galaxy S23 Ultra', N'Galaxy S23 Ultra (SM-S918B)
Powerful Performance: The Galaxy S23 Ultra is powered by a high-performance processor (possibly from Samsung''s Exynos or Qualcomm Snapdragon series), ensuring seamless multitasking, smooth gaming, and fast app loading.

Stunning Display: It features a large and vibrant AMOLED display with high resolution, vivid colors, and HDR support, providing an exceptional visual experience for multimedia, gaming, and productivity.

Versatile Camera System: The smartphone boasts a versatile camera setup, including multiple high-resolution lenses, enabling you to capture stunning photos and videos in various lighting conditions. Features like optical image stabilization (OIS) and advanced AI enhancements further enhance the camera''s capabilities.

S Pen Support: The S Pen stylus offers precise control and creative possibilities, making it a valuable tool for note-taking, drawing, and multitasking.

Ample Storage: With generous internal storage options, you have plenty of space to store your photos, videos, apps, and files.

Long-Lasting Battery: The smartphone is equipped with a robust battery that provides all-day usage on a single charge, even with heavy usage.', 9, 4, 1800.0000, 1500.0000, 0.0000, 5, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [CategoryId], [BrandId], [SalePrice], [CostPrice], [DiscountPercent], [Rate], [Stock]) VALUES (1047, N'Galaxy S22 (SM-S901B)', N'Powerful Performance: The Galaxy S22 is powered by a high-performance processor (possibly from Samsung''s Exynos or Qualcomm Snapdragon series), delivering fast and efficient performance for multitasking, gaming, and more.

Vibrant Display: It features a stunning AMOLED display with vibrant colors, sharp contrast, and high resolution, providing an immersive visual experience for multimedia, gaming, and productivity.

Advanced Camera System: The smartphone boasts a versatile camera setup, including high-resolution lenses and advanced features like optical image stabilization (OIS) and AI enhancements, ensuring exceptional photo and video quality in various shooting conditions.

Sleek and Compact Design: The Galaxy S22 sports a sleek and compact design with premium materials, making it comfortable to hold and visually appealing.

Ample Storage: With ample internal storage options, you have enough space to store your photos, videos, apps, and files.

Long Battery Life: The device is equipped with a robust battery that offers all-day usage on a single charge, even with demanding tasks.', 4, 3, 900.0000, 700.0000, 3.0000, 4, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [CategoryId], [BrandId], [SalePrice], [CostPrice], [DiscountPercent], [Rate], [Stock]) VALUES (1048, N'Galaxy Z Flip 5', N'Foldable Design: The Galaxy Z Flip 5 features a foldable design, allowing the device to fold in half, making it compact and pocket-friendly when not in use.

Flexible AMOLED Display: It boasts a flexible AMOLED display that can be folded and unfolded without compromising on display quality. The display provides vibrant colors, sharp visuals, and offers a unique experience for multitasking and media consumption.

Compact Form Factor: When folded, the smartphone has a compact form factor that easily fits in your pocket or purse, making it highly portable.

Performance: The device is powered by a capable processor, ensuring smooth multitasking, app performance, and gaming.

Dual Camera System: The Galaxy Z Flip 5 features a dual-camera system that provides versatile photography options, including wide-angle and ultra-wide-angle lenses.

Long-Lasting Battery: Despite its compact size, it offers a long-lasting battery that keeps you connected throughout the day.

5G Connectivity: Enjoy the benefits of 5G connectivity for fast internet speeds and low latency, enhancing your online experience.', 9, 3, 1900.0000, 1600.0000, 5.0000, 5, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [CategoryId], [BrandId], [SalePrice], [CostPrice], [DiscountPercent], [Rate], [Stock]) VALUES (1049, N'Apple Watch Ultra 2.49mm', N'Design and Build: The Apple Watch features a sleek and stylish design with various sizes, materials, and bands to choose from. It''s known for its premium build quality.
Fitness and Health Tracking: The Apple Watch is equipped with sensors for tracking various health metrics, including heart rate, ECG, sleep patterns, and activity levels. It encourages users to stay active and provides insights into their overall well-being.
Notifications: You can receive notifications for calls, messages, emails, and app alerts directly on your wrist. This feature is particularly handy for staying connected while on the go.
 App Ecosystem: There is a wide range of apps available for the Apple Watch, from fitness and health apps to productivity and entertainment apps. You can control smart home devices, make payments, and more.
Siri Integration: The watch includes Siri, Apple''s virtual assistant, allowing you to perform tasks and get information using voice commands.
Water Resistance: Many Apple Watch models are water-resistant, making them suitable for swimming and water-based activities.
GPS and Cellular Connectivity: Some models come with built-in GPS and cellular connectivity, allowing you to use the watch independently, even without your iPhone nearby.', 6, 3, 1800.0000, 1399.0000, 10.0000, 5, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [CategoryId], [BrandId], [SalePrice], [CostPrice], [DiscountPercent], [Rate], [Stock]) VALUES (1050, N'Apple Watch 8 41mm', N'Design and Build: The Apple Watch features a sleek and stylish design with various sizes, materials, and bands to choose from. It''s known for its premium build quality.
Fitness and Health Tracking: The Apple Watch is equipped with sensors for tracking various health metrics, including heart rate, ECG, sleep patterns, and activity levels. It encourages users to stay active and provides insights into their overall well-being.
Notifications: You can receive notifications for calls, messages, emails, and app alerts directly on your wrist. This feature is particularly handy for staying connected while on the go.
 App Ecosystem: There is a wide range of apps available for the Apple Watch, from fitness and health apps to productivity and entertainment apps. You can control smart home devices, make payments, and more.
Siri Integration: The watch includes Siri, Apple''s virtual assistant, allowing you to perform tasks and get information using voice commands.
Water Resistance: Many Apple Watch models are water-resistant, making them suitable for swimming and water-based activities.
GPS and Cellular Connectivity: Some models come with built-in GPS and cellular connectivity, allowing you to use the watch independently, even without your iPhone nearby.', 6, 3, 600.0000, 400.0000, 0.0000, 4, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [CategoryId], [BrandId], [SalePrice], [CostPrice], [DiscountPercent], [Rate], [Stock]) VALUES (1051, N'HUAWEI Watch GT 3 Pro', N'1. Stylish Design: The HUAWEI Watch series features an elegant and stylish design that complements your personal style.

2. High-Quality Materials: These watches are crafted from premium materials, ensuring durability and a premium look and feel.

3. Fitness and Health Tracking: HUAWEI Watches come equipped with fitness and health tracking features, including heart rate monitoring, sleep tracking, and workout tracking. They help users stay on top of their fitness goals.

4. AMOLED Display: The watches feature vibrant AMOLED displays with high resolutions, delivering clear and colorful visuals.

5. App Ecosystem: HUAWEI Watches support a wide range of apps, from fitness and health apps to productivity and entertainment apps. You can customize your watch with apps that suit your lifestyle.

6. Water Resistance: Many models are water-resistant, making them suitable for swimming and tracking water-based activities.

7. Long Battery Life: HUAWEI Watches offer long battery life, allowing you to use them throughout the day without constant recharging.', 6, 6, 400.0000, 300.0000, 0.0000, 5, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [CategoryId], [BrandId], [SalePrice], [CostPrice], [DiscountPercent], [Rate], [Stock]) VALUES (1052, N'HUAWEI Watch GT Runner', N'1. Stylish Design: The HUAWEI Watch series features an elegant and stylish design that complements your personal style.

2. High-Quality Materials: These watches are crafted from premium materials, ensuring durability and a premium look and feel.

3. Fitness and Health Tracking: HUAWEI Watches come equipped with fitness and health tracking features, including heart rate monitoring, sleep tracking, and workout tracking. They help users stay on top of their fitness goals.

4. AMOLED Display: The watches feature vibrant AMOLED displays with high resolutions, delivering clear and colorful visuals.

5. App Ecosystem: HUAWEI Watches support a wide range of apps, from fitness and health apps to productivity and entertainment apps. You can customize your watch with apps that suit your lifestyle.

6. Water Resistance: Many models are water-resistant, making them suitable for swimming and tracking water-based activities.

7. Long Battery Life: HUAWEI Watches offer long battery life, allowing you to use them throughout the day without constant recharging.', 6, 6, 200.0000, 150.0000, 0.0000, 4, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [CategoryId], [BrandId], [SalePrice], [CostPrice], [DiscountPercent], [Rate], [Stock]) VALUES (1053, N'Xiaomi Watch S1', N'1. Stylish Design: The Xiaomi Watch S1 boasts a sleek and modern design, making it an attractive accessory for any occasion.

2. High-Quality Materials: It is crafted from premium materials, ensuring durability and a premium look and feel.

3. Fitness and Health Tracking: The watch offers a comprehensive set of fitness and health tracking features, including heart rate monitoring, sleep tracking, step counting, and more. It helps users maintain an active and healthy lifestyle.

4. AMOLED Display: Featuring a vibrant AMOLED display, it delivers clear and colorful visuals, enhancing the user experience.

5. App Ecosystem: Xiaomi Watch S1 supports a variety of apps, allowing you to customize your watch with apps that suit your lifestyle, including fitness, productivity, and entertainment apps.

6. Water Resistance: Many models are water-resistant, making them suitable for swimming and tracking water-based activities.', 6, 5, 150.0000, 120.0000, 0.0000, 4, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [CategoryId], [BrandId], [SalePrice], [CostPrice], [DiscountPercent], [Rate], [Stock]) VALUES (1054, N'Redmi Watch 2 Lite', N'1. Stylish Design: The Xiaomi Watch S1 boasts a sleek and modern design, making it an attractive accessory for any occasion.

2. High-Quality Materials: It is crafted from premium materials, ensuring durability and a premium look and feel.

3. Fitness and Health Tracking: The watch offers a comprehensive set of fitness and health tracking features, including heart rate monitoring, sleep tracking, step counting, and more. It helps users maintain an active and healthy lifestyle.

4. AMOLED Display: Featuring a vibrant AMOLED display, it delivers clear and colorful visuals, enhancing the user experience.

5. App Ecosystem: Xiaomi Watch S1 supports a variety of apps, allowing you to customize your watch with apps that suit your lifestyle, including fitness, productivity, and entertainment apps.

6. Water Resistance: Many models are water-resistant, making them suitable for swimming and tracking water-based activities.', 6, 5, 80.0000, 50.0000, 5.0000, 4, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [CategoryId], [BrandId], [SalePrice], [CostPrice], [DiscountPercent], [Rate], [Stock]) VALUES (1055, N'Galaxy Watch 6 Classic', N'1. Classic Design: The Galaxy Watch 6 Classic features a timeless and classic design with a rotating bezel, giving it a traditional watch-like appearance.

2. High-Quality Materials: It is crafted from premium materials, including stainless steel, and offers a luxurious and durable build.

3. Fitness and Health Tracking: The watch provides comprehensive fitness and health tracking features, such as heart rate monitoring, sleep tracking, blood oxygen monitoring, and workout tracking. It encourages a healthy and active lifestyle.

4. Super AMOLED Display: Featuring a vibrant Super AMOLED display, it delivers sharp and colorful visuals, making it easy to read notifications and access apps.

5. App Ecosystem: The Galaxy Watch 6 Classic supports a wide range of apps, allowing you to customize your watch with apps for fitness, productivity, entertainment, and more.

6. Water Resistance: With water resistance, it can handle being submerged in water, making it suitable for swimming and tracking water-based activities.', 6, 4, 500.0000, 400.0000, 0.0000, 4, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [CategoryId], [BrandId], [SalePrice], [CostPrice], [DiscountPercent], [Rate], [Stock]) VALUES (1056, N'Samsung Watch 4 44 mm', N'1. Classic Design: The Galaxy Watch 6 Classic features a timeless and classic design with a rotating bezel, giving it a traditional watch-like appearance.

2. High-Quality Materials: It is crafted from premium materials, including stainless steel, and offers a luxurious and durable build.

3. Fitness and Health Tracking: The watch provides comprehensive fitness and health tracking features, such as heart rate monitoring, sleep tracking, blood oxygen monitoring, and workout tracking. It encourages a healthy and active lifestyle.

4. Super AMOLED Display: Featuring a vibrant Super AMOLED display, it delivers sharp and colorful visuals, making it easy to read notifications and access apps.

5. App Ecosystem: The Galaxy Watch 6 Classic supports a wide range of apps, allowing you to customize your watch with apps for fitness, productivity, entertainment, and more.

6. Water Resistance: With water resistance, it can handle being submerged in water, making it suitable for swimming and tracking water-based activities.', 6, 4, 300.0000, 200.0000, 0.0000, 4, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [CategoryId], [BrandId], [SalePrice], [CostPrice], [DiscountPercent], [Rate], [Stock]) VALUES (1057, N'Fast Wireless Charger Duo', N'1. Dual Charging: The Fast Wireless Charger Duo is equipped with two charging pads, allowing you to charge multiple devices simultaneously. You can charge your smartphone and another compatible device, such as a smartwatch or earbuds, all in one place.

2. Fast Wireless Charging: These chargers often support fast wireless charging technology, enabling your devices to charge quickly compared to standard wireless chargers.

3. Versatile Compatibility: The charger is usually compatible with a wide range of devices, including the latest smartphones from various brands that support wireless charging. It may also work with other wireless-charging-enabled devices.

4. Sleek Design: Many Fast Wireless Charger Duo models feature a sleek and compact design, making them suitable for use at home or in the office. The design often complements the aesthetics of your devices and workspace.

5. Convenience: Wireless charging eliminates the need for cables and connectors, making it a convenient and clutter-free way to charge your devices. You can simply place your device on the charging pad, and it will start charging automatically.', 4, 4, 100.0000, 70.0000, 0.0000, 4, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [CategoryId], [BrandId], [SalePrice], [CostPrice], [DiscountPercent], [Rate], [Stock]) VALUES (1058, N'MagSafe Duo Charger', N'1. Dual Charging: The MagSafe Duo Charger is equipped with two charging pads—one for your iPhone and one for your Apple Watch. This allows you to charge both devices simultaneously in one compact unit.

2. Magnetic Alignment: MagSafe technology ensures precise alignment between the charger and your iPhone, creating a strong magnetic connection for efficient wireless charging. You can easily attach and detach your iPhone without the need for precise positioning.

3. Foldable Design: The charger features a foldable design that makes it highly portable and convenient for on-the-go use. You can fold it in half to create a compact form factor, making it easy to carry in your bag or pocket.

4. Fast Charging: The MagSafe Duo Charger supports fast wireless charging for compatible iPhones, allowing for quicker charging times compared to standard wireless chargers.', 9, 4, 200.0000, 150.0000, 0.0000, 5, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [CategoryId], [BrandId], [SalePrice], [CostPrice], [DiscountPercent], [Rate], [Stock]) VALUES (1059, N'Samsung QE85QN900CUXRU', N'1. 8K Resolution: This TV boasts an astonishing 8K resolution, delivering four times the number of pixels as 4K TVs. This results in incredibly sharp and detailed images with lifelike clarity.

2. QLED Display: It features a QLED (Quantum Dot LED) display, which offers vibrant and accurate colors, high brightness, and excellent contrast levels. QLED technology enhances the viewing experience by providing rich and dynamic visuals.

3. Large Screen Size: With an 85-inch screen size, this TV offers an immersive and cinematic viewing experience, making it ideal for movie nights, sports, and gaming.

4. Quantum Processor: The TV is powered by a powerful quantum processor, which optimizes picture quality and enhances upscaling for lower-resolution content to look better on the 8K screen.

5. HDR (High Dynamic Range): It supports various HDR formats like HDR10+ and Dolby Vision, ensuring that you can enjoy content with enhanced brightness, contrast, and a broader range of colors.', 5, 2, 12000.0000, 11000.0000, 0.0000, 5, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [CategoryId], [BrandId], [SalePrice], [CostPrice], [DiscountPercent], [Rate], [Stock]) VALUES (1060, N'Samsung LED UE85AU7100UXR', N'1. 8K Resolution: This TV boasts an astonishing 8K resolution, delivering four times the number of pixels as 4K TVs. This results in incredibly sharp and detailed images with lifelike clarity.

2. QLED Display: It features a QLED (Quantum Dot LED) display, which offers vibrant and accurate colors, high brightness, and excellent contrast levels. QLED technology enhances the viewing experience by providing rich and dynamic visuals.

3. Large Screen Size: With an 85-inch screen size, this TV offers an immersive and cinematic viewing experience, making it ideal for movie nights, sports, and gaming.

4. Quantum Processor: The TV is powered by a powerful quantum processor, which optimizes picture quality and enhances upscaling for lower-resolution content to look better on the 8K screen.', 8, 4, 3000.0000, 2700.0000, 0.0000, 4, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [CategoryId], [BrandId], [SalePrice], [CostPrice], [DiscountPercent], [Rate], [Stock]) VALUES (1061, N'iPad 10.9-inch 256 GB', N'1. Display: The iPad features a 10.9-inch Liquid Retina display with True Tone and P3 wide color support. It delivers vivid and sharp visuals, making it ideal for multimedia consumption, productivity, and creative tasks.

2. Performance: Powered by Apple''s A14 Bionic chip, the iPad offers exceptional performance, enabling smooth multitasking, fast app launches, and responsive gaming experiences.

3. Storage: With 256 GB of storage, you have ample space to store your photos, videos, apps, documents, and more. It''s suitable for users who require additional storage for their digital content.

4. Apple Pencil Support: The iPad is compatible with the Apple Pencil, allowing for precise note-taking, drawing, and creative work. It''s a valuable tool for artists, students, and professionals.', 7, 3, 1100.0000, 900.0000, 0.0000, 4, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [CategoryId], [BrandId], [SalePrice], [CostPrice], [DiscountPercent], [Rate], [Stock]) VALUES (1062, N'Galaxy Tab S9 FE 5G', N'1. Large Display: The tablet features a spacious display, typically around 12.4 inches, with a high-resolution Super AMOLED screen. It provides vibrant colors, sharp visuals, and an immersive viewing experience.

2. 5G Connectivity: The "FE" in Galaxy Tab S9 FE 5G stands for "Fan Edition," and it includes 5G connectivity, allowing for fast internet speeds and seamless online experiences when connected to a 5G network.

3. S Pen Support: The tablet is compatible with the Samsung S Pen, enabling precise note-taking, drawing, and creative work. The S Pen can be a valuable tool for students and professionals.

4. Multitasking: Samsung''s One UI and the tablet''s powerful hardware allow for efficient multitasking. You can run multiple apps simultaneously, making it suitable for productivity tasks.', 7, 4, 700.0000, 600.0000, 0.0000, 4, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [CategoryId], [BrandId], [SalePrice], [CostPrice], [DiscountPercent], [Rate], [Stock]) VALUES (1063, N'Lenovo Tab P11 Pro', N'1. Display: The tablet features an impressive 11.5-inch OLED display with a high-resolution screen, providing vibrant colors, sharp visuals, and wide viewing angles.

2. Design: The Tab P11 Pro boasts a sleek and premium design with narrow bezels, making it both stylish and portable.

3. Performance: It is powered by a capable processor, ensuring responsive performance for various tasks, from productivity to gaming.
', 4, 2, 1000.0000, 800.0000, 0.0000, 5, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [CategoryId], [BrandId], [SalePrice], [CostPrice], [DiscountPercent], [Rate], [Stock]) VALUES (1064, N'Asus ROG Strix SCAR 16', N'1. Powerful Hardware: The laptop is equipped with powerful components, including high-end processors (such as Intel Core i9 or AMD Ryzen), dedicated graphics cards (typically from NVIDIA''s GeForce RTX series), and ample RAM, ensuring smooth gaming performance and multitasking capabilities.

2. High Refresh Rate Display: It features a high-refresh-rate display, often with options for 240Hz or even 360Hz, delivering ultra-smooth gameplay with minimal motion blur.

3. High-Quality Graphics: The laptop''s dedicated graphics card, often featuring NVIDIA''s RTX series, supports real-time ray tracing and provides outstanding graphics performance for visually demanding games.

4. Mechanical Keyboards: Some models come equipped with mechanical keyboards for precise and responsive keystrokes, enhancing the gaming experience for enthusiasts.', 5, 12, 5000.0000, 4000.0000, 0.0000, 5, 10)
INSERT [dbo].[Products] ([Id], [Name], [Description], [CategoryId], [BrandId], [SalePrice], [CostPrice], [DiscountPercent], [Rate], [Stock]) VALUES (1065, N'TUF A15 FA507NU-LP031', N'1. Performance: The laptop is equipped with a powerful processor, often an AMD Ryzen CPU, which provides excellent performance for gaming, content creation, and multitasking.

2. Dedicated Graphics: It typically includes a dedicated NVIDIA GeForce GTX or RTX graphics card, ensuring smooth gaming experiences and support for ray tracing in supported titles.

3. High Refresh Rate Display: The laptop features a high-refresh-rate display, often with a 144Hz or higher refresh rate, delivering smoother gaming visuals with reduced motion blur.

4. Durability: The TUF series is known for its rugged build quality and MIL-STD-810H military-grade durability, making it resistant to everyday wear and tear.', 5, 12, 1800.0000, 1500.0000, 0.0000, 5, 10)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Sliders] ON 

INSERT [dbo].[Sliders] ([Id], [Title], [Desc], [ImageName], [ImageUrl]) VALUES (25, N'Your Style, Your Way...', N'Upgrade your home, upgrade your life. It all begins here.  Experience shopping like never before with our curated selection.', N'b8f7b904-4a95-4585-9ccb-095052c2bcc6jeff-sheldon-9dI3g8owHiI-unsplash.jpg', N'/uploads/sliders/b8f7b904-4a95-4585-9ccb-095052c2bcc6jeff-sheldon-9dI3g8owHiI-unsplash.jpg')
INSERT [dbo].[Sliders] ([Id], [Title], [Desc], [ImageName], [ImageUrl]) VALUES (26, N'Treat Yourself to Perfection', N'Discover fashion that resonates with your unique style and personality.', N'eacce901-bfe6-4355-8c29-d727c4c5d144marvin-meyer-SYTO3xs06fU-unsplash.jpg', N'/uploads/sliders/eacce901-bfe6-4355-8c29-d727c4c5d144marvin-meyer-SYTO3xs06fU-unsplash.jpg')
INSERT [dbo].[Sliders] ([Id], [Title], [Desc], [ImageName], [ImageUrl]) VALUES (27, N'Shop Smarter, Not Harder', N'Effortless shopping, endless rewards. Start your journey today.', N'776191a2-cb19-4a5c-b910-f785aabd5728thisisengineering-raeng-uyfohHiTxho-unsplash.jpg', N'/uploads/sliders/776191a2-cb19-4a5c-b910-f785aabd5728thisisengineering-raeng-uyfohHiTxho-unsplash.jpg')
SET IDENTITY_INSERT [dbo].[Sliders] OFF
GO
SET IDENTITY_INSERT [dbo].[StoreData] ON 

INSERT [dbo].[StoreData] ([Id], [Phone], [Address], [LogoText], [CompanyName], [WhatsappLink], [InstagramLink], [FacebookLink], [LinkedinLink], [LogoImageName], [LogoImageLink], [EmptyBasketImageName], [EmptyBasketImageLink], [AboutCompany]) VALUES (1, N'+994 (50) 548 19 96', N'28 MALL, Baku, Azerbaijan', N'SwiftShop', N'Swift Shop', N'https://wa.me/qr/76M4MIDXKQCYC1', N'https://www.instagram.com/elmeddinmirzeyev/', N'https://www.facebook.com/elmeddin.mirzeyev.948', N'https://www.linkedin.com/in/elmeddin-mirzeyev-0968b725b/details/skills/', N'32b90db5-baf6-44e8-b30d-ef7f6ba8b8f3logo.png', N'/uploads/store-datas/32b90db5-baf6-44e8-b30d-ef7f6ba8b8f3logo.png', N'a0bafb9b-2f47-4262-9dc5-b11d9041800eemptyCart.png', N'/uploads/store-datas/a0bafb9b-2f47-4262-9dc5-b11d9041800eemptyCart.png', N'Swift Shop is a leading electronic sales platform that has been           serving customers since its inception in 2010. Our journey began in           the vibrant city of Baku, Azerbaijan, and over the years, we''ve grown           into a trusted name in the world of e-commerce.')
SET IDENTITY_INSERT [dbo].[StoreData] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 10/11/2023 9:57:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 10/11/2023 9:57:22 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 10/11/2023 9:57:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 10/11/2023 9:57:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 10/11/2023 9:57:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 10/11/2023 9:57:22 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 10/11/2023 9:57:22 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_BasketItems_ProductId]    Script Date: 10/11/2023 9:57:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_BasketItems_ProductId] ON [dbo].[BasketItems]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_BasketItems_UserId]    Script Date: 10/11/2023 9:57:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_BasketItems_UserId] ON [dbo].[BasketItems]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderItems_OrderId]    Script Date: 10/11/2023 9:57:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderItems_OrderId] ON [dbo].[OrderItems]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_OrderItems_ProductId]    Script Date: 10/11/2023 9:57:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderItems_ProductId] ON [dbo].[OrderItems]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Orders_UserId]    Script Date: 10/11/2023 9:57:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_Orders_UserId] ON [dbo].[Orders]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_ProductImages_ProductId]    Script Date: 10/11/2023 9:57:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_ProductImages_ProductId] ON [dbo].[ProductImages]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_BrandId]    Script Date: 10/11/2023 9:57:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_BrandId] ON [dbo].[Products]
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Products_CategoryId]    Script Date: 10/11/2023 9:57:22 PM ******/
CREATE NONCLUSTERED INDEX [IX_Products_CategoryId] ON [dbo].[Products]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderItems] ADD  DEFAULT (N'') FOR [ProductName]
GO
ALTER TABLE [dbo].[ProductImages] ADD  DEFAULT (N'') FOR [ImageUrl]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [Rate]
GO
ALTER TABLE [dbo].[Products] ADD  DEFAULT ((0)) FOR [Stock]
GO
ALTER TABLE [dbo].[Sliders] ADD  DEFAULT (N'') FOR [ImageUrl]
GO
ALTER TABLE [dbo].[StoreData] ADD  DEFAULT (N'') FOR [AboutCompany]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[BasketItems]  WITH CHECK ADD  CONSTRAINT [FK_BasketItems_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BasketItems] CHECK CONSTRAINT [FK_BasketItems_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[BasketItems]  WITH CHECK ADD  CONSTRAINT [FK_BasketItems_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BasketItems] CHECK CONSTRAINT [FK_BasketItems_Products_ProductId]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Orders_OrderId]
GO
ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD  CONSTRAINT [FK_OrderItems_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderItems] CHECK CONSTRAINT [FK_OrderItems_Products_ProductId]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[ProductImages]  WITH CHECK ADD  CONSTRAINT [FK_ProductImages_Products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProductImages] CHECK CONSTRAINT [FK_ProductImages_Products_ProductId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Brands_BrandId] FOREIGN KEY([BrandId])
REFERENCES [dbo].[Brands] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Brands_BrandId]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories_CategoryId]
GO
USE [master]
GO
ALTER DATABASE [SwiftShopFinalProject] SET  READ_WRITE 
GO
