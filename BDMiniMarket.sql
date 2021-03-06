USE [master]
GO
/****** Object:  Database [BDMiniMarket]    Script Date: 03/09/2021 12:03:39 ******/
CREATE DATABASE [BDMiniMarket]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BDMiniMarket', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\BDMiniMarket.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BDMiniMarket_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\BDMiniMarket_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BDMiniMarket] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BDMiniMarket].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BDMiniMarket] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BDMiniMarket] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BDMiniMarket] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BDMiniMarket] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BDMiniMarket] SET ARITHABORT OFF 
GO
ALTER DATABASE [BDMiniMarket] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BDMiniMarket] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BDMiniMarket] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BDMiniMarket] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BDMiniMarket] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BDMiniMarket] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BDMiniMarket] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BDMiniMarket] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BDMiniMarket] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BDMiniMarket] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BDMiniMarket] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BDMiniMarket] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BDMiniMarket] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BDMiniMarket] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BDMiniMarket] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BDMiniMarket] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BDMiniMarket] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BDMiniMarket] SET RECOVERY FULL 
GO
ALTER DATABASE [BDMiniMarket] SET  MULTI_USER 
GO
ALTER DATABASE [BDMiniMarket] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BDMiniMarket] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BDMiniMarket] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BDMiniMarket] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BDMiniMarket] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BDMiniMarket', N'ON'
GO
ALTER DATABASE [BDMiniMarket] SET QUERY_STORE = OFF
GO
USE [BDMiniMarket]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [BDMiniMarket]
GO
/****** Object:  Table [dbo].[tbcategoriaprod]    Script Date: 03/09/2021 12:03:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbcategoriaprod](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Categoria] [nvarchar](75) NOT NULL,
 CONSTRAINT [PK_tbcategoriaprod] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbmarca]    Script Date: 03/09/2021 12:03:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbmarca](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_tbmarca] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbproducto]    Script Date: 03/09/2021 12:03:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbproducto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NombreProducto] [nvarchar](100) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnitario] [float] NOT NULL,
	[Medida] [nvarchar](10) NOT NULL,
	[IDProveedor] [int] NOT NULL,
	[IDMarca] [int] NOT NULL,
	[IDCategoriaProducto] [int] NOT NULL,
 CONSTRAINT [PK_tbproducto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbproductohistorico]    Script Date: 03/09/2021 12:03:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbproductohistorico](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[IDProducto] [int] NOT NULL,
	[Nombreprod] [nvarchar](100) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnitario] [float] NOT NULL,
	[Proveedor] [nvarchar](200) NOT NULL,
	[Marca] [nvarchar](100) NOT NULL,
	[Medida] [nvarchar](10) NOT NULL,
	[Categoriaprod] [nvarchar](75) NOT NULL,
	[Accion] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_tbproductohistorico] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbproveedor]    Script Date: 03/09/2021 12:03:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbproveedor](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](200) NOT NULL,
	[RUC] [nvarchar](13) NOT NULL,
	[Empresa] [nvarchar](100) NOT NULL,
	[Telefono] [nvarchar](10) NOT NULL,
	[Correo] [nvarchar](100) NOT NULL,
	[Direccion] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_tbproveedor] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbcategoriaprod] ON 

INSERT [dbo].[tbcategoriaprod] ([ID], [Categoria]) VALUES (1, N'Bebidas')
INSERT [dbo].[tbcategoriaprod] ([ID], [Categoria]) VALUES (2, N'Lacteos')
INSERT [dbo].[tbcategoriaprod] ([ID], [Categoria]) VALUES (3, N'Carnicos')
SET IDENTITY_INSERT [dbo].[tbcategoriaprod] OFF
GO
SET IDENTITY_INSERT [dbo].[tbmarca] ON 

INSERT [dbo].[tbmarca] ([ID], [Nombre]) VALUES (1, N'Cielo')
INSERT [dbo].[tbmarca] ([ID], [Nombre]) VALUES (2, N'Nutri')
SET IDENTITY_INSERT [dbo].[tbmarca] OFF
GO
SET IDENTITY_INSERT [dbo].[tbproducto] ON 

INSERT [dbo].[tbproducto] ([ID], [NombreProducto], [Cantidad], [PrecioUnitario], [Medida], [IDProveedor], [IDMarca], [IDCategoriaProducto]) VALUES (1, N'Agua LA MANA', 49, 1.5, N'1lt', 2, 1, 1)
INSERT [dbo].[tbproducto] ([ID], [NombreProducto], [Cantidad], [PrecioUnitario], [Medida], [IDProveedor], [IDMarca], [IDCategoriaProducto]) VALUES (2, N'Nutri Leche', 25, 1.5, N'1lt', 2, 2, 2)
SET IDENTITY_INSERT [dbo].[tbproducto] OFF
GO
SET IDENTITY_INSERT [dbo].[tbproductohistorico] ON 

INSERT [dbo].[tbproductohistorico] ([ID], [Fecha], [IDProducto], [Nombreprod], [Cantidad], [PrecioUnitario], [Proveedor], [Marca], [Medida], [Categoriaprod], [Accion]) VALUES (8, CAST(N'2021-09-02T20:02:27.910' AS DateTime), 1, N'Agua', 50, 1.5, N'Juan Montes', N'Cielo', N'1lt', N'Bebidas', N'actualizar')
SET IDENTITY_INSERT [dbo].[tbproductohistorico] OFF
GO
SET IDENTITY_INSERT [dbo].[tbproveedor] ON 

INSERT [dbo].[tbproveedor] ([ID], [Nombre], [RUC], [Empresa], [Telefono], [Correo], [Direccion]) VALUES (2, N'Juan Montes', N'1203698712001', N'Agua Cielo', N'0997804445', N'juanmontes@gmail.com', N'Quevedo')
INSERT [dbo].[tbproveedor] ([ID], [Nombre], [RUC], [Empresa], [Telefono], [Correo], [Direccion]) VALUES (3, N'Carla Jaramillo', N'1206427112001', N'Lacteos', N'0925364784', N'carlajaramillo@gmail.com', N'Mocache')
INSERT [dbo].[tbproveedor] ([ID], [Nombre], [RUC], [Empresa], [Telefono], [Correo], [Direccion]) VALUES (4, N'Isaias Leturne', N'1207896412001', N'La Res', N'0978964521', N'isaiasleturne@gmail.com', N'Guayaquil')
SET IDENTITY_INSERT [dbo].[tbproveedor] OFF
GO
/****** Object:  StoredProcedure [dbo].[SpConsultarProducto]    Script Date: 03/09/2021 12:03:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpConsultarProducto]   
    @NombreProducto nvarchar(100)  
    
AS   

    SET NOCOUNT ON;  
    SELECT * from tbproducto where NombreProducto  LIKE CONCAT( @nombreproducto, '%')
GO
USE [master]
GO
ALTER DATABASE [BDMiniMarket] SET  READ_WRITE 
GO


