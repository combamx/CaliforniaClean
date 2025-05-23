USE [california]
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPaneCount' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vListProjects'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vListProjects'
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_DiagramPane1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vListProjects'
GO
ALTER TABLE [dbo].[WorkOrdersOvertime] DROP CONSTRAINT [FK_WorkOrdersOvertime_WorkOrders]
GO
ALTER TABLE [dbo].[WorkOrdersOvertime] DROP CONSTRAINT [FK_WorkOrdersOvertime_Projects]
GO
ALTER TABLE [dbo].[WorkOrdersAssigned] DROP CONSTRAINT [FK_WorkOrdersAssigned_Workers]
GO
ALTER TABLE [dbo].[WorkOrdersAssigned] DROP CONSTRAINT [FK_WorkOrdersAssigned_Providers]
GO
ALTER TABLE [dbo].[WorkOrders] DROP CONSTRAINT [FK_WorkOrders_Workers]
GO
ALTER TABLE [dbo].[WorkOrders] DROP CONSTRAINT [FK_WorkOrders_TypesOrderWork]
GO
ALTER TABLE [dbo].[WorkOrders] DROP CONSTRAINT [FK_WorkOrders_StatusWorkorders]
GO
ALTER TABLE [dbo].[WorkOrders] DROP CONSTRAINT [FK_WorkOrders_StatusDate]
GO
ALTER TABLE [dbo].[WorkOrders] DROP CONSTRAINT [FK_WorkOrders_Providers]
GO
ALTER TABLE [dbo].[WorkOrders] DROP CONSTRAINT [FK_WorkOrders_Projects]
GO
ALTER TABLE [dbo].[WorkOrders] DROP CONSTRAINT [FK_WorkOrders_Customers]
GO
ALTER TABLE [dbo].[Workers] DROP CONSTRAINT [FK_Workers_Sellers]
GO
ALTER TABLE [dbo].[Projects] DROP CONSTRAINT [FK_Projects_TypesProject]
GO
ALTER TABLE [dbo].[Projects] DROP CONSTRAINT [FK_Projects_StatusProjects]
GO
ALTER TABLE [dbo].[Projects] DROP CONSTRAINT [FK_Projects_Providers]
GO
ALTER TABLE [dbo].[Projects] DROP CONSTRAINT [FK_Projects_Customers]
GO
ALTER TABLE [dbo].[Projects] DROP CONSTRAINT [FK_Projects_Buildings]
GO
ALTER TABLE [dbo].[PrintOrdenWorks] DROP CONSTRAINT [FK_PrintOrdenWorks_WorkOrders]
GO
ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [FK_Documents_WorkOrders]
GO
ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [FK_Documents_TypeDocumentProjects]
GO
ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [FK_Documents_Projects]
GO
ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [FK_Documents_ChangeOrders]
GO
ALTER TABLE [dbo].[CommentsWO] DROP CONSTRAINT [FK_CommentsWO_WorkOrders]
GO
ALTER TABLE [dbo].[ChangeOrders] DROP CONSTRAINT [FK_ChangeOrders_WorkOrders]
GO
ALTER TABLE [dbo].[ChangeOrders] DROP CONSTRAINT [FK_ChangeOrders_Projects]
GO
/****** Object:  Table [dbo].[WorkOrdersOvertime]    Script Date: 25/02/2023 12:07:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkOrdersOvertime]') AND type in (N'U'))
DROP TABLE [dbo].[WorkOrdersOvertime]
GO
/****** Object:  Table [dbo].[WorkOrdersAssigned]    Script Date: 25/02/2023 12:07:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkOrdersAssigned]') AND type in (N'U'))
DROP TABLE [dbo].[WorkOrdersAssigned]
GO
/****** Object:  Table [dbo].[WorkOrders]    Script Date: 25/02/2023 12:07:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[WorkOrders]') AND type in (N'U'))
DROP TABLE [dbo].[WorkOrders]
GO
/****** Object:  Table [dbo].[Workers]    Script Date: 25/02/2023 12:07:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Workers]') AND type in (N'U'))
DROP TABLE [dbo].[Workers]
GO
/****** Object:  Table [dbo].[TypesOrderWork]    Script Date: 25/02/2023 12:07:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TypesOrderWork]') AND type in (N'U'))
DROP TABLE [dbo].[TypesOrderWork]
GO
/****** Object:  Table [dbo].[TypeDocumentProjects]    Script Date: 25/02/2023 12:07:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TypeDocumentProjects]') AND type in (N'U'))
DROP TABLE [dbo].[TypeDocumentProjects]
GO
/****** Object:  Table [dbo].[StatusWorkOrders]    Script Date: 25/02/2023 12:07:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StatusWorkOrders]') AND type in (N'U'))
DROP TABLE [dbo].[StatusWorkOrders]
GO
/****** Object:  Table [dbo].[StatusDate]    Script Date: 25/02/2023 12:07:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StatusDate]') AND type in (N'U'))
DROP TABLE [dbo].[StatusDate]
GO
/****** Object:  Table [dbo].[Providers]    Script Date: 25/02/2023 12:07:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Providers]') AND type in (N'U'))
DROP TABLE [dbo].[Providers]
GO
/****** Object:  Table [dbo].[PrintOrdenWorks]    Script Date: 25/02/2023 12:07:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PrintOrdenWorks]') AND type in (N'U'))
DROP TABLE [dbo].[PrintOrdenWorks]
GO
/****** Object:  Table [dbo].[Documents]    Script Date: 25/02/2023 12:07:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Documents]') AND type in (N'U'))
DROP TABLE [dbo].[Documents]
GO
/****** Object:  Table [dbo].[CommentsWO]    Script Date: 25/02/2023 12:07:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CommentsWO]') AND type in (N'U'))
DROP TABLE [dbo].[CommentsWO]
GO
/****** Object:  Table [dbo].[ChangeOrders]    Script Date: 25/02/2023 12:07:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ChangeOrders]') AND type in (N'U'))
DROP TABLE [dbo].[ChangeOrders]
GO
/****** Object:  View [dbo].[vListProjects]    Script Date: 25/02/2023 12:07:18 p. m. ******/
DROP VIEW [dbo].[vListProjects]
GO
/****** Object:  Table [dbo].[StatusProjects]    Script Date: 25/02/2023 12:07:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[StatusProjects]') AND type in (N'U'))
DROP TABLE [dbo].[StatusProjects]
GO
/****** Object:  Table [dbo].[Buildings]    Script Date: 25/02/2023 12:07:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Buildings]') AND type in (N'U'))
DROP TABLE [dbo].[Buildings]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 25/02/2023 12:07:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customers]') AND type in (N'U'))
DROP TABLE [dbo].[Customers]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 25/02/2023 12:07:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Projects]') AND type in (N'U'))
DROP TABLE [dbo].[Projects]
GO
/****** Object:  Table [dbo].[TypesProject]    Script Date: 25/02/2023 12:07:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TypesProject]') AND type in (N'U'))
DROP TABLE [dbo].[TypesProject]
GO
/****** Object:  Table [dbo].[Sellers]    Script Date: 25/02/2023 12:07:18 p. m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sellers]') AND type in (N'U'))
DROP TABLE [dbo].[Sellers]
GO
/****** Object:  Table [dbo].[Sellers]    Script Date: 25/02/2023 12:07:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sellers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Sellers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypesProject]    Script Date: 25/02/2023 12:07:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypesProject](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypesProject] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 25/02/2023 12:07:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[ID] [int] NOT NULL,
	[ProjectName] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NULL,
	[Description] [nvarchar](100) NULL,
	[DateProject] [date] NULL,
	[Amount] [money] NULL,
	[RetentionsProject] [float] NULL,
	[Retentions] [money] NULL,
	[SellerProject] [float] NULL,
	[Selle] [money] NULL,
	[IDCustomer] [int] NOT NULL,
	[IDSeller] [int] NULL,
	[IDProvide] [int] NULL,
	[IDTypeProject] [int] NULL,
	[IDTypeBuilding] [int] NULL,
	[AmountProvide] [money] NULL,
	[Inclusion] [nvarchar](max) NULL,
	[OCIP] [nvarchar](50) NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 25/02/2023 12:07:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](100) NULL,
	[City] [nvarchar](50) NULL,
	[Zip] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Status] [bit] NOT NULL,
	[Email] [nvarchar](100) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Buildings]    Script Date: 25/02/2023 12:07:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Buildings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[IDTypeProject] [tinyint] NOT NULL,
	[Order] [tinyint] NOT NULL,
 CONSTRAINT [PK_Buildings] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusProjects]    Script Date: 25/02/2023 12:07:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusProjects](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_StatusProjects] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vListProjects]    Script Date: 25/02/2023 12:07:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW [dbo].[vListProjects]
AS
SELECT        
	p.ID, 
	p.ProjectName, 
	p.Address, 
	p.City, 
	p.Description, 
	p.DateProject, 
	FORMAT(p.Amount, 'C') AS Amount, 
	p.RetentionsProject, 
	FORMAT(p.Retentions, 'C') as Retentions, 
	p.SellerProject, 
	FORMAT(p.Selle, 'C') AS Selle, 
	c.CompanyName, 
	s.Name as NameSelle, 
	t.Description AS TypeProjectDescription, 
	b.Description AS TypeBuildingDescription, 
	FORMAT(p.AmountProvide, 'C') AS AmountProvide, 
	p.Inclusion, 
	p.OCIP, 
	sp.Description AS Status
FROM            dbo.Projects AS p INNER JOIN
                         dbo.Customers AS c ON c.ID = p.IDCustomer LEFT OUTER JOIN
                         dbo.Sellers AS s ON s.ID = p.IDSeller LEFT OUTER JOIN
                         dbo.TypesProject AS t ON t.ID = p.IDTypeProject LEFT OUTER JOIN
                         dbo.Buildings AS b ON b.ID = p.IDTypeBuilding LEFT OUTER JOIN
                         dbo.StatusProjects AS sp ON sp.ID = p.Status

GO
/****** Object:  Table [dbo].[ChangeOrders]    Script Date: 25/02/2023 12:07:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChangeOrders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Clave] [int] NOT NULL,
	[DateChange] [date] NOT NULL,
	[Amount] [money] NOT NULL,
	[IDStatusCO] [int] NOT NULL,
	[IDWorkOrder] [int] NOT NULL,
	[IDProject] [int] NOT NULL,
	[Description] [nvarchar](1) NULL,
	[User] [nvarchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_ChangeOrder] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommentsWO]    Script Date: 25/02/2023 12:07:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommentsWO](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[IDWorkOrder] [int] NOT NULL,
 CONSTRAINT [PK_ComentarioWO] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Documents]    Script Date: 25/02/2023 12:07:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Documents](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](100) NOT NULL,
	[Url] [nvarchar](100) NOT NULL,
	[IDCustomer] [int] NOT NULL,
	[IDProvide] [int] NOT NULL,
	[IDProject] [int] NOT NULL,
	[IDWorkOrder] [int] NOT NULL,
	[IDChangeOrden] [int] NOT NULL,
	[Expiration] [nvarchar](50) NOT NULL,
	[Type] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Documents] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrintOrdenWorks]    Script Date: 25/02/2023 12:07:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrintOrdenWorks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDWorkOrder] [int] NOT NULL,
	[Compania] [nvarchar](50) NOT NULL,
	[Project] [nvarchar](50) NOT NULL,
	[DatePrint] [date] NOT NULL,
	[Hour] [nvarchar](50) NOT NULL,
	[Contact] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[Assigned] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](600) NULL,
	[Change] [nvarchar](200) NULL,
 CONSTRAINT [PK_PrintOrdenWorks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Providers]    Script Date: 25/02/2023 12:07:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Providers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Zip] [int] NULL,
	[Phone] [nvarchar](50) NULL,
	[Status] [tinyint] NOT NULL,
 CONSTRAINT [PK_Providers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusDate]    Script Date: 25/02/2023 12:07:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusDate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[TextColor] [nvarchar](50) NOT NULL,
	[BackColor] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_StatusDate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StatusWorkOrders]    Script Date: 25/02/2023 12:07:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StatusWorkOrders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[TextColor] [nvarchar](50) NOT NULL,
	[BackColor] [nvarchar](50) NOT NULL,
	[Filter] [nvarchar](50) NOT NULL,
	[Order] [tinyint] NOT NULL,
 CONSTRAINT [PK_StatusWorkorders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeDocumentProjects]    Script Date: 25/02/2023 12:07:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeDocumentProjects](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
	[IDTypeProject] [int] NOT NULL,
 CONSTRAINT [PK_TypeDocumentProjects] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypesOrderWork]    Script Date: 25/02/2023 12:07:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypesOrderWork](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TypesOrderWork] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Workers]    Script Date: 25/02/2023 12:07:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Workers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](100) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_Workers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkOrders]    Script Date: 25/02/2023 12:07:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkOrders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Clave] [int] NOT NULL,
	[IDProject] [int] NOT NULL,
	[IDCustomer] [int] NOT NULL,
	[Contact] [nvarchar](100) NULL,
	[Address] [nvarchar](100) NULL,
	[City] [nvarchar](100) NULL,
	[Phone] [nvarchar](100) NULL,
	[IDAssigned] [int] NOT NULL,
	[IDProvider] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[DateOrder] [date] NOT NULL,
	[DateEnd] [date] NOT NULL,
	[IDType] [int] NOT NULL,
	[IDStatusWO] [int] NOT NULL,
	[IDStatusCalendario] [int] NOT NULL,
	[IDStatus] [int] NOT NULL,
 CONSTRAINT [PK_WorkOrders] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkOrdersAssigned]    Script Date: 25/02/2023 12:07:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkOrdersAssigned](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Clave] [int] NOT NULL,
	[DateAssigned] [date] NOT NULL,
	[IDWorker] [int] NOT NULL,
	[IDProveedor] [int] NOT NULL,
	[Order] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Document] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_WorkOrdersAssigned] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkOrdersOvertime]    Script Date: 25/02/2023 12:07:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkOrdersOvertime](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DateOrder] [date] NOT NULL,
	[BeginTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[People] [tinyint] NOT NULL,
	[TotalHrsPeople] [tinyint] NOT NULL,
	[TotalHrsGroup] [tinyint] NOT NULL,
	[AmountHrs] [tinyint] NOT NULL,
	[IDProject] [int] NOT NULL,
	[IDWorkOder] [int] NOT NULL,
 CONSTRAINT [PK_WorkOrdersOvertime] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Buildings] ON 

INSERT [dbo].[Buildings] ([ID], [Description], [IDTypeProject], [Order]) VALUES (1, N'HOSPITAL', 2, 0)
INSERT [dbo].[Buildings] ([ID], [Description], [IDTypeProject], [Order]) VALUES (2, N'SCHOOL', 2, 0)
INSERT [dbo].[Buildings] ([ID], [Description], [IDTypeProject], [Order]) VALUES (3, N'GOVERNMENT OFFICE', 2, 0)
INSERT [dbo].[Buildings] ([ID], [Description], [IDTypeProject], [Order]) VALUES (4, N'COMMUNITY CENTER', 2, 0)
INSERT [dbo].[Buildings] ([ID], [Description], [IDTypeProject], [Order]) VALUES (5, N'CELLAR', 2, 0)
INSERT [dbo].[Buildings] ([ID], [Description], [IDTypeProject], [Order]) VALUES (6, N'HOME', 2, 0)
INSERT [dbo].[Buildings] ([ID], [Description], [IDTypeProject], [Order]) VALUES (7, N'OTHER', 2, 99)
INSERT [dbo].[Buildings] ([ID], [Description], [IDTypeProject], [Order]) VALUES (8, N'COFFEE', 1, 0)
INSERT [dbo].[Buildings] ([ID], [Description], [IDTypeProject], [Order]) VALUES (9, N'HOTEL', 1, 0)
INSERT [dbo].[Buildings] ([ID], [Description], [IDTypeProject], [Order]) VALUES (10, N'MALL', 1, 0)
INSERT [dbo].[Buildings] ([ID], [Description], [IDTypeProject], [Order]) VALUES (11, N'STORE', 1, 0)
INSERT [dbo].[Buildings] ([ID], [Description], [IDTypeProject], [Order]) VALUES (12, N'OFFICE', 1, 0)
INSERT [dbo].[Buildings] ([ID], [Description], [IDTypeProject], [Order]) VALUES (13, N'CELLAR', 1, 0)
INSERT [dbo].[Buildings] ([ID], [Description], [IDTypeProject], [Order]) VALUES (14, N'APARTMENTS', 1, 0)
INSERT [dbo].[Buildings] ([ID], [Description], [IDTypeProject], [Order]) VALUES (15, N'BUILDING', 1, 0)
INSERT [dbo].[Buildings] ([ID], [Description], [IDTypeProject], [Order]) VALUES (16, N'HOME', 1, 0)
INSERT [dbo].[Buildings] ([ID], [Description], [IDTypeProject], [Order]) VALUES (17, N'RESTAURANT', 1, 0)
INSERT [dbo].[Buildings] ([ID], [Description], [IDTypeProject], [Order]) VALUES (18, N'PARKING', 1, 0)
INSERT [dbo].[Buildings] ([ID], [Description], [IDTypeProject], [Order]) VALUES (19, N'OTHER', 1, 99)
INSERT [dbo].[Buildings] ([ID], [Description], [IDTypeProject], [Order]) VALUES (20, N'HOSPITAL', 1, 0)
INSERT [dbo].[Buildings] ([ID], [Description], [IDTypeProject], [Order]) VALUES (21, N'LIBRARY', 1, 0)
INSERT [dbo].[Buildings] ([ID], [Description], [IDTypeProject], [Order]) VALUES (22, N'LIBRARY', 2, 0)
INSERT [dbo].[Buildings] ([ID], [Description], [IDTypeProject], [Order]) VALUES (23, N'APARTMENTS', 2, 0)
INSERT [dbo].[Buildings] ([ID], [Description], [IDTypeProject], [Order]) VALUES (24, N'HOTEL', 2, 0)
INSERT [dbo].[Buildings] ([ID], [Description], [IDTypeProject], [Order]) VALUES (27, N'PRISON', 2, 0)
INSERT [dbo].[Buildings] ([ID], [Description], [IDTypeProject], [Order]) VALUES (28, N'SCHOOL', 1, 0)
SET IDENTITY_INSERT [dbo].[Buildings] OFF
GO
SET IDENTITY_INSERT [dbo].[ChangeOrders] ON 

INSERT [dbo].[ChangeOrders] ([ID], [Clave], [DateChange], [Amount], [IDStatusCO], [IDWorkOrder], [IDProject], [Description], [User], [Status]) VALUES (1, 1, CAST(N'2019-07-22' AS Date), 0.0000, 5, 5, 18, NULL, N'NULL', 0)
INSERT [dbo].[ChangeOrders] ([ID], [Clave], [DateChange], [Amount], [IDStatusCO], [IDWorkOrder], [IDProject], [Description], [User], [Status]) VALUES (2, 1, CAST(N'2019-07-22' AS Date), 0.0000, 5, 6, 18, NULL, N'NULL', 0)
INSERT [dbo].[ChangeOrders] ([ID], [Clave], [DateChange], [Amount], [IDStatusCO], [IDWorkOrder], [IDProject], [Description], [User], [Status]) VALUES (3, 2, CAST(N'2019-07-22' AS Date), 0.0000, 5, 6, 18, NULL, N'NULL', 0)
INSERT [dbo].[ChangeOrders] ([ID], [Clave], [DateChange], [Amount], [IDStatusCO], [IDWorkOrder], [IDProject], [Description], [User], [Status]) VALUES (4, 1, CAST(N'2019-07-23' AS Date), 0.0000, 5, 7, 24, NULL, N'NULL', 0)
INSERT [dbo].[ChangeOrders] ([ID], [Clave], [DateChange], [Amount], [IDStatusCO], [IDWorkOrder], [IDProject], [Description], [User], [Status]) VALUES (5, 1, CAST(N'2019-07-23' AS Date), 0.0000, 5, 9, 28, NULL, N'NULL', 0)
INSERT [dbo].[ChangeOrders] ([ID], [Clave], [DateChange], [Amount], [IDStatusCO], [IDWorkOrder], [IDProject], [Description], [User], [Status]) VALUES (6, 1, CAST(N'2019-07-23' AS Date), 0.0000, 5, 10, 11, NULL, N'NULL', 0)
INSERT [dbo].[ChangeOrders] ([ID], [Clave], [DateChange], [Amount], [IDStatusCO], [IDWorkOrder], [IDProject], [Description], [User], [Status]) VALUES (7, 1, CAST(N'2019-07-23' AS Date), 0.0000, 7, 12, 33, NULL, N'NULL', 0)
INSERT [dbo].[ChangeOrders] ([ID], [Clave], [DateChange], [Amount], [IDStatusCO], [IDWorkOrder], [IDProject], [Description], [User], [Status]) VALUES (8, 1, CAST(N'2019-07-24' AS Date), 545.6000, 8, 13, 45, NULL, N'NULL', 0)
INSERT [dbo].[ChangeOrders] ([ID], [Clave], [DateChange], [Amount], [IDStatusCO], [IDWorkOrder], [IDProject], [Description], [User], [Status]) VALUES (9, 2, CAST(N'2019-07-24' AS Date), 545.6000, 8, 13, 45, NULL, N'NULL', 0)
INSERT [dbo].[ChangeOrders] ([ID], [Clave], [DateChange], [Amount], [IDStatusCO], [IDWorkOrder], [IDProject], [Description], [User], [Status]) VALUES (10, 1, CAST(N'2019-07-24' AS Date), 545.6000, 8, 14, 45, NULL, N'NULL', 0)
INSERT [dbo].[ChangeOrders] ([ID], [Clave], [DateChange], [Amount], [IDStatusCO], [IDWorkOrder], [IDProject], [Description], [User], [Status]) VALUES (11, 3, CAST(N'2019-07-24' AS Date), 545.6000, 8, 13, 45, NULL, N'NULL', 1)
INSERT [dbo].[ChangeOrders] ([ID], [Clave], [DateChange], [Amount], [IDStatusCO], [IDWorkOrder], [IDProject], [Description], [User], [Status]) VALUES (12, 1, CAST(N'2019-07-24' AS Date), 13750.0000, 8, 15, 46, NULL, N'NULL', 1)
INSERT [dbo].[ChangeOrders] ([ID], [Clave], [DateChange], [Amount], [IDStatusCO], [IDWorkOrder], [IDProject], [Description], [User], [Status]) VALUES (13, 1, CAST(N'2019-07-24' AS Date), 1339.7500, 8, 16, 47, NULL, N'NULL', 1)
INSERT [dbo].[ChangeOrders] ([ID], [Clave], [DateChange], [Amount], [IDStatusCO], [IDWorkOrder], [IDProject], [Description], [User], [Status]) VALUES (14, 1, CAST(N'2019-07-24' AS Date), 1296.0000, 8, 17, 47, NULL, N'NULL', 1)
INSERT [dbo].[ChangeOrders] ([ID], [Clave], [DateChange], [Amount], [IDStatusCO], [IDWorkOrder], [IDProject], [Description], [User], [Status]) VALUES (15, 1, CAST(N'2019-07-24' AS Date), 3840.0000, 8, 18, 48, NULL, N'NULL', 1)
INSERT [dbo].[ChangeOrders] ([ID], [Clave], [DateChange], [Amount], [IDStatusCO], [IDWorkOrder], [IDProject], [Description], [User], [Status]) VALUES (16, 1, CAST(N'2019-07-25' AS Date), 1500.0000, 8, 19, 49, NULL, N'NULL', 1)
INSERT [dbo].[ChangeOrders] ([ID], [Clave], [DateChange], [Amount], [IDStatusCO], [IDWorkOrder], [IDProject], [Description], [User], [Status]) VALUES (17, 1, CAST(N'2019-07-25' AS Date), 2505.0000, 8, 20, 50, NULL, N'NULL', 1)
INSERT [dbo].[ChangeOrders] ([ID], [Clave], [DateChange], [Amount], [IDStatusCO], [IDWorkOrder], [IDProject], [Description], [User], [Status]) VALUES (18, 1, CAST(N'2019-07-26' AS Date), 1242.0000, 8, 21, 103, NULL, N'NULL', 1)
INSERT [dbo].[ChangeOrders] ([ID], [Clave], [DateChange], [Amount], [IDStatusCO], [IDWorkOrder], [IDProject], [Description], [User], [Status]) VALUES (19, 1, CAST(N'2019-07-26' AS Date), 1500.0000, 8, 22, 66, NULL, N'NULL', 1)
INSERT [dbo].[ChangeOrders] ([ID], [Clave], [DateChange], [Amount], [IDStatusCO], [IDWorkOrder], [IDProject], [Description], [User], [Status]) VALUES (20, 1, CAST(N'2019-07-26' AS Date), 5950.0000, 8, 24, 46, NULL, N'NULL', 1)
INSERT [dbo].[ChangeOrders] ([ID], [Clave], [DateChange], [Amount], [IDStatusCO], [IDWorkOrder], [IDProject], [Description], [User], [Status]) VALUES (21, 1, CAST(N'2019-07-26' AS Date), 1221.0000, 8, 25, 46, NULL, N'NULL', 1)
INSERT [dbo].[ChangeOrders] ([ID], [Clave], [DateChange], [Amount], [IDStatusCO], [IDWorkOrder], [IDProject], [Description], [User], [Status]) VALUES (22, 1, CAST(N'2019-07-26' AS Date), 713.0000, 8, 26, 99, NULL, N'NULL', 1)
INSERT [dbo].[ChangeOrders] ([ID], [Clave], [DateChange], [Amount], [IDStatusCO], [IDWorkOrder], [IDProject], [Description], [User], [Status]) VALUES (23, 1, CAST(N'2019-07-26' AS Date), 2200.0000, 8, 27, 99, NULL, N'NULL', 1)
INSERT [dbo].[ChangeOrders] ([ID], [Clave], [DateChange], [Amount], [IDStatusCO], [IDWorkOrder], [IDProject], [Description], [User], [Status]) VALUES (24, 1, CAST(N'2019-07-26' AS Date), 1609.0000, 8, 28, 67, NULL, N'NULL', 1)
INSERT [dbo].[ChangeOrders] ([ID], [Clave], [DateChange], [Amount], [IDStatusCO], [IDWorkOrder], [IDProject], [Description], [User], [Status]) VALUES (25, 1, CAST(N'2019-07-26' AS Date), 1725.0000, 8, 29, 57, NULL, N'NULL', 1)
SET IDENTITY_INSERT [dbo].[ChangeOrders] OFF
GO
SET IDENTITY_INSERT [dbo].[CommentsWO] ON 

INSERT [dbo].[CommentsWO] ([ID], [Description], [IDWorkOrder]) VALUES (1, N'FIRST 3 MODELS TO SHOW CUSTOMER', 1)
INSERT [dbo].[CommentsWO] ([ID], [Description], [IDWorkOrder]) VALUES (2, N'THIS WO 
CLEAN DATES 7/16 & 7/18 EMERGENCY CLEANING', 5)
SET IDENTITY_INSERT [dbo].[CommentsWO] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (1, N'ABBEYSIDE', N'1485 BAYSHORE BLVD #121 SAN FRANCISCO CA 94124', N'SAN FRANCISCO', NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (2, N'ADRIAN CONSTRUCTION', N'511 GALAXY WAY MODESTO, CA 95356', NULL, NULL, N'(209) 679-33-45', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (3, N'ALLEGHENY DESIGN MANAGEMENT INC', N'1154 PARKS INDUSTRIAL DR VANDERGRIFT, PA 15690-9666', NULL, NULL, N'(724) 845-73-36', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (4, N'L&D CONSTRUCTION CO. INC.', N'255 W JULIAN ST #200 SAN JOSE CA', NULL, NULL, N'(408) 292-01-28', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (5, N'ALTA ENGINEERING GROUP', N'1485 BAYSHORE BLVD SAN FRANCISCO CA', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (6, N'AMERICAN RIVER CONSTRUCTION, INC', N'PO BOX 100', N'EL DORADO CA ', N'95623', N'(530) 621-03-60', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (7, N'ANDERSON BURTON', N'121 NEVADA ST ARROYO GRANDE CA', NULL, NULL, N'(805) 481-50-96', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (8, N'ACT COMMERCIAL CONSTRUCTION', N'350 MCDONNELL ST LEWISVILLE TX 75057', NULL, NULL, N'(972) 436-11-44', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (9, N'AGABAYANI CONSTRUCTION CORPORATION', N'88 DIXON COURT DALY CITY CA', NULL, NULL, N'(650) 994-93-80', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (10, N'AHARONI & STEELE, INC', N'491 LAURELWOOS RD SANTA CLARA CA', NULL, NULL, N'(408) 451-95-85', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (11, N'ALSTON CONSTRUCTION', N'8775 FOLSOM BLVD #201 SACRAMENTO CA', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (12, N'ASHWOOD CONSTRUCTION, INC', N'5755 KINGS CANYON RD FRESNO CA', NULL, NULL, N'(559) 553-72-40', 0, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (13, N'1 STOP MAINTENANCE', N'CHURCH ST STATION, P.O. BOX 985NEW YORK, NY 10008-985', N'Off 866-470-2630', N'860-267-0710', N'866-470-2630', 1, N'donna@1stopmaintenance.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (14, N'10GEN', N'MONGODB555 UNIVERSITY AVEPALO ALTO CA 94301', N'650.440.4474', N'7413', N'650-440-4474 x 7413', 1, N'hilary.phillips@10gen.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (15, N'7-ELEVEN CORP', N'ONE ARTS PLAZA1722 ROUTH STREET', N'Dallas', N'75201', N'(916) 803-0777', 1, N'paula.quigley2@7-11.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (16, N'AAR, INC', N'ERNIE WEBSTERP.O. BOX 854WOODBRIDGE CA 95258', N'O:209.365.7171', N'7824', NULL, 1, N'eragareg@hbveg.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (17, N'ACON BUILDERS CONSTRUCTION INC', N'280 MARTIN AVE., SUITE 5SANTA CLARA CA 95050OFF: 408.980.1388', N'FAX:', N'1387', N'408.980.1388', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (18, N'ACTION URGENT CARE', N'1375 BLOSSOM HILL RD. SUITE #49SAN JOSE, CA 95118', NULL, NULL, NULL, 1, N'Tiffany.h@actionurgentcare.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (19, N'ADRIAN CONSTRUCTION', N'511 GALAXY WAYMODESTO, CA 95356OFFICE: 209.679.3345FAX: 209.838.2747', NULL, NULL, NULL, 1, N'd.adrian@adrianconstructioninc.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (20, N'ADRIENNE VILLAGE APARTMENTS', N'31755 ALVARADO BLVDUNION CITY CA0:510.471.5485', NULL, NULL, N'(510) 471-5485', 1, N'adriennevillage@yahoo.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (21, N'AGBAYANI CONSTRUCTION CORPORATION', N'88 DIXON COURTDALY CITY, CA 94014TEL: 650.994.9380FAX: 415.665.9470', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (22, N'ALEGIS CONSTRUCTION', N'11095 SW INDUSTRIAL WAY SUITE BTUALATIN, OR 97062OFF: 503-427-6065', N'FAX:', N'503-427-6066', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (23, N'ALEXANDER KARSAKOU', N'P:415.0730.', NULL, N'5334', N'415.730.5334', 1, N'akorsar@yahoo.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (24, N'ALL WEST', N'JEFFREY JOHNSON', NULL, NULL, N'801-232-6522', 1, N'JHJOHNSON@ALLWEST.NET')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (25, N'ALLEGHENY DESIGN MANAGEMENT, INC.', N'1154 PARKS INDUSTRIAL DRIVEVANDERGRIFT, PA 15690-9666O 729.845.7336F 729.845.9889', NULL, NULL, NULL, 1, N'mcrooks@alleghenydesignmgmt.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (26, N'ALLGIRE GENERAL CONTRACTOR INC', N'3278 GREY HAWK COURTCARLSBAN CA 92010OFFICE- 760.477.8455FAX-760.477.8461', NULL, NULL, N'(760) 477-8455', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (27, N'AMCAL', N'30141 AGOURA ROAD SUIT # 100AGOURA HILL, CA 91301', N'P.', N'818-706-0694', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (28, N'AMERICAN CASTING COMPANY', N'51 FALLON ROADHOLLISTER, CA 95023 USAO: 831 637 5641 F: 831 636 8390', NULL, NULL, NULL, 1, N'khough@americancastingco.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (29, N'AMERICAN NATIONAL FACILITIES MANAGEMENT (ANFM)', N'3415 WEST CHESTER PIKE, SUITE 301NEWTOWN SQUARE, PA 19073OFF: 866.652.8799FAX: 610.353.0674', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (30, N'ANAGO', N'1460 KOLL CIRCLE, SUITE B', N'San Jose', N'95136', N'408-564-3559', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (31, N'ANCOR CONCEIVE CONSTRUCTION', N'831 JAMES STSYRACUSE NY 13203OFF: 315.233.1300', N'Fax:', N'1315', N'315.233.1300', 1, N'cgraf@ancorinc.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (32, N'APPLE AMERICAN GROUP', N'6200 OAK TREE BLVD. SUITE #250INDEPENDENCE, OHIO 44131', NULL, NULL, N'(216) 525-2775', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (33, N'APPLEGATE JOUNSTON', N'1016 12TH STMODESTO, CA 95354OFF:209.538.4449', N'FAX:209.538.4447', N'95354', N'209.538.4449', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (34, N'APRICOT LANE', N'353 B ST.', N'Hayward', NULL, NULL, 1, N'scheslock@att.net')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (35, N'ARBOR COVE SENIOR COMMONS', N'84 BLACKBURNSANTA CRUZ, CA 95060', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (36, N'ARNTZ BUILDERS INC', N'949 WASHINGTON STSAN FRANCISCO CA', N'OFF:415.525.', N'3683', N'415-252-3683', 1, N'christian@arntzbuilders.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (37, N'ASCENT BUILDERS, INC.', N'1400 S. STREETSACRAMENTO, CA 95811', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (38, N'ASHWOOD CONSTRUCTION, INC', N'5755 E. KINGS CANYON RD. STE.110 FRESNO, CA 93727', N'(559) 253-72-44', NULL, N'(559) 253-7240', 1, N'anunez@ashwoodco.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (39, N'AUSONIO INC.', N'11420A COMMERCIAL PARKWAYCASTROVILLE, CA 95012OF: 831.633.3371FX: 831.633.3389', NULL, NULL, N'831-633-3371', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (40, N'AVILA BROS. INC. DBA AVILA CONSTRUCTION COMPANY', N'12 THOMAS OWENS WAY, #200MONTEREY, CA 93940PH: (831) 372-5580FX:  (831)372-5584', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (41, N'BALI CONSTRUCTION', N'1508 3RD AVENUE WALNUT CREEK, CA 94597', NULL, NULL, N'(925) 478-8182', 1, N'Ap@bali-construction.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (42, N'BARHAM, INC. DBA BZ CONSTRUCTION', N'2204 FAIRVIEW DRIVE', N'Ceres', N'95307', N'(209) 531-1252', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (43, N'BARRON BUILDERS', N'2346 CALLE DE MUNDOSANTA CLARA, CA 95054O 650.964.4493F 650.964.4349', NULL, NULL, NULL, 1, N'info@barronbuilders.com, Hwolfe@barronbuilders.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (44, N'BARSTO CONSTRUCTION', N'1601 IRON ST SUITE #200KANSAS CITY O:816.421.5677F:816.421.8417', NULL, NULL, NULL, 1, N'dogrady@barstoconstruction.com, ddavis@barstoconstruction.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (45, N'BASE BUILDERS, INC.', N'1660 S. AMPHLETT BLVD. SUITE 208 SAN MATEO, CA 94402', NULL, NULL, N'(650) 389-6922', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (46, N'BAY AREA BUILDERS', N'318 MARTIN AVESANTA CLARA CA 95050408.648.4500', N'408.855.', N'8694', N'408.648.4500', 1, N'crussell@ba-builders.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (47, N'BCM CONSTRUCTION COMPANY, INC.', N'2990 HIGHWAY 32, SUITE 100CHICO, CA 95973O: 530.342.1772F: 530.342.1768', NULL, NULL, NULL, 1, N'ap@bcmconstruction.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (48, N'BEALS MARTIN & ASSOCIATES, INC.', N'2596 BAY RD.REDWOOD CITY, CA 94063O: 650.364.8141F: 650.367.7645', NULL, NULL, N'650-364-8141', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (49, N'BEN  DENICE', N'4541 COMSTOCK RD.HOLLISTER, CA 95023', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (50, N'BLACH CONSTRUCTION', N'469 EL CAMINO REAL, SUITE #100SANTA CLARA CA 95050O:408.244.7100', N'F:408.244.', N'2220', N'408.244.7100', 1, N'brian.azzopardi@blach.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (51, N'BODDY', N'8855 FM 1556ROYCITY TX 75189P:972.636.3100', N'F:972.636.3102', NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (52, N'BOGC INC', N'5610 SCOTTS VALLEY DRSCOTT VALLEY, CA 95066OFF:831.515.3730', N'FAX:831.401.', N'3179', N'831.515.3730', 1, N'RICH@BOGCINC.COM')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (53, N'BOYET', N'45 CLAYTON AVE', N'Sa', N'n Jose', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (54, N'BRENDA', N'4094 CRANFORD CITR', N'Sa', N'n Jose', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (55, N'BRIAN KIM', N'3700 WILSHIRE BLVD SUIT #427LOS ANGUELES, CA 90010OFF:213.3680204', N'FAX:213.368.', N'0205', N'213.368.0204', 1, N'78bhkim@gmail.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (56, N'BRINKMANN CONSTRUCTORS', N'3800 LEWISTON STREETSUITE 400AURORA, CO 80011', NULL, NULL, N'(303) 657-9700', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (57, N'BRITE SOLUTION, INC.', N'BRANDOMPO BOX 1390CORDOVA, TN 38088', N'Fax:', N'901-266-3343', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (58, N'BROWARD BUILDERS, INC', NULL, NULL, NULL, NULL, 1, N'lyndsay@browardbuilders.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (59, N'BUILTECH SERVICES, LLC', N'1834 WALDEN OFFICE SQUARE – 350        SCHAUMBURG, IL 60173', NULL, NULL, N'(847) 895-3700', 1, N'ghoward@builtechinc.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (60, N'BULLARD, INC.', N'3132 AUBURN BLVD.SACRAMENTO, CA 95821PH: 916.485.4370FX: 916.485.4388', NULL, NULL, NULL, 1, N'Wendy@bullardinc.net')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (61, N'BURLINGAME ELEMENTARY SCHOOL DISTRICT', N'1825 TROUSDALE DRIVE', N'Burlingame', N'94010', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (62, N'C.W. DRIVER', N'2248 N FIRST STREETSAN JOSE, CA 95131T: 408.678.2224 F:408.954.8193', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (63, N'CALIFORNIA PARK APARTMENTS', N'2301 PARK BLVDPALO ALTO CA 94306P 650.321.2730F 650.321.2938', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (64, N'CAMPBELL DEVELOPMENT', N'23026 N 16TH LANEPHOENIX, AZ 85027OFF: 623.434.8500', N'FAX:', N'9020', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (65, N'CAMPBELL UNION SCHOOL DISTRICT', N'240 HARRIS AVECAMPBELL, CA 95008', N'Off:', N'7044', N'408.209.8715', 1, N'dwilliams@campbellusd.org')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (66, N'CANNON CONSTRUCTION NORTH, INC.', N'301 HOWARD STREET, SUITE 130SAN FRANCISCO CA 94105OFFICE: (415) 546-5500', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (67, N'CANYON CONTRACTING CORP', N'2821 SKYE RDWASHOUGAL WA 98671OFF: 360-837-2204', N'FAX:', N'2205', NULL, 1, N'CANYONCONTRACTING@MSN.COM')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (68, N'CARTER-KELLY, INC.', N'P.O. BOX 1477PLACERVILLE, CA 95667P: 530.621.0950F: 530.621.2344', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (69, N'CASTLEMONT ARMS', N'1120 WEST OLIVE AVENUE APT. 112', N'Sunnyvale', N'94086', N'(408) 736-2128', 1, N'manager@castlemontarms.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (70, N'CASTRO VALLEY USD', N'PO BOX', NULL, N'2146', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (71, N'CATLIN', N'615 KENTUCKY STPETALUMA CA 94539', N'510.760.', N'1081', N'510.760.1081', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (72, N'CCN GROUP INC.', N'29910 MURRIETA HOT SPRINGS RD G206MURRIETA CA 92563OFFICE: 800 506-8760, EXT 802', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (73, N'CDX BUILDERS, INC.', N'1595 FAIRFAX AVENUESAN FRANCISCO, CA 94124OFF: 415-285-6688', N'Fax:', N'415-285-6788', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (74, N'CEDARS ENTERPRISES', N'18757 TURFWAY PARKYORBA LINDA, CA 92886OFF: 714-685-0775', N'Fax:', N'714-695-9771', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (75, N'CJR BUILDERS, INC.', N'650 NORTH ROSE DR., #154PLACENTIA, CA 92870O 714.572.2600F 714.572.1727', NULL, NULL, NULL, 1, N'debbie.bartle@cjrbuilders.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (76, N'CLARK/SULLIVAN CONSTRUCTION', N'2024 OPPORTUNITY DRIVE, SUITE 150ROSEVILLE, CA. 95678PH: 916-338-7707 FX: 916-338-7701', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (77, N'CLEAN NET OF BAY AREA', N'333 HEGENBERGER DR., STE #806OAKLAND, CA 94621', NULL, NULL, N'(510) 635-5001', 1, N'accountingba@cleannetusa.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (78, N'CM CORP.', N'27075 CABOT ROAD #114LAGUNA HILLS, CA 92653', NULL, NULL, N'(949) 305-8888', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (79, N'COBE CONSTRUCTION, INC.', N'498 SALMAR AVE.CAMPBELL, CA 95008P 408.371.3400F 408.371.3401', NULL, NULL, NULL, 1, N'Francesca@Cobeinc.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (80, N'COLIN CONSTRUCTION COMPANY', N'111 MARGARET LANEGRASS VALLEY CA 95945O:530.272.3357F:530.272.4581', NULL, NULL, NULL, 1, N'ashleyt@colincc.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (81, N'COMMERCIAL JANITORIAL', N'2524 NORTH 24TH STPHOENIX, AZ 85067(OFF) 800.893.4080', N'(Fax)480.247.', N'5174', N'602.570.6828', 1, N'ryan@commercialjanitorial.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (82, N'CONNOR & GASKINS UNLIMITED', N'1998 TRADE CENTER WAY, SUITE 2NAPLES, FL 34109', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (83, N'CONSTRUCTION ONE, INC', N'101 E. TOWN STREET, SUITE 401COLUMBUS, OHIO 43215OFF: 614-235-0057FX: 614-237-6769', NULL, NULL, N'614-235-0057', 1, N'lmomeyer@constructionone.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (84, N'COOPER CHASE CONSTRUCTION', N'1740 N GATEWAY BLVD', N'FRESNO', N'93727', N'(559) 255-7009', 1, N'orosas@cooperchase.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (85, N'CORE GENERAL CONTRACTORS', N'470 S. MARKET STREETSAN JOSE, CA 95113OFFICE: 408-292-7841 FAX: 408-292-9826', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (86, N'CREATIVE DODIES', N'1295 1ST GILROY, CA 95020', NULL, NULL, N'650.950.400', 1, N'CREATIVRBODIES42@YMAIL.COM')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (87, N'CRW INDUSTRIES, INC.', N'5346 SCOTTS VALLEY DR STE ESCOTTS VALLEY, CA, 95066 UNITED STATES', NULL, NULL, N'(831) 426-0743', 1, N'adminjoy@crwindustries.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (88, N'CT BRAYTON & SONS, INC.', N'P.O. BOX 95/ 1804 JACKSONESCALON, CA 95320PHONE: 209.838.7388FAX: 209.838.3960', NULL, NULL, NULL, 1, N'Boconnor@ctbrayton.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (89, N'CUPERTINO LIVE+WORK', NULL, NULL, NULL, NULL, 1, N'cheslockstan@gmail.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (90, N'CWS CONSTRUCTION GROUP INC.', N'94 SAN BENITO WAY', N'Novato', N'94945', N'(415) 599-5585', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (91, N'D&H CONSTRUCTION', N'2107 KEARNEY STREETEL CERRITO, CA 94530OFF: 510.237.7883FX: 510.237.7884', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (92, N'D SQUARE & AU AUTHUM KI JV', N'107 W SAHUARO STTUCSON AZ 85705O:520.748.9371F:520.748.9372', NULL, NULL, N'(520) 748-9371', 1, N'kimp@dsquarellc.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (93, N'D.G. GRANADE, INC.', N'4420 BUSINESS DRIVESHINGLE SPRINGS, CA 95682P 530.677.7484F 530.677.7550', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (94, N'D.L. FALK CONSTRUCTION', N'3526 INVESTMENT BLVD.HAYWARD, CA 94545O: 510-887-6500', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (95, N'DAVID A. NICE BUILDERS, INC.', N'4571 WARE CREEK RDWILLIAMSBURG, VIRGINIA 23188OFF: 757-566-3032', N'FAX:', N'757-566-4686', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (96, N'DEACON CONSTRUCTION, LLC', N'7745 GREENBACK LN, SUITE 250CITRUS HEIGHTS, CA 95610T:916.969.0900', N'F:916.729.', N'0900', N'916.969.0900', 1, N'maggie.kunkel@deacon.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (97, N'DHC', N'4195 CHINO HILLS PARWAYS, SUIT 626CHINO HILL, CA 91709OFF: 909.592.7068', N'Fax:', N'7424', N'909.592.7068', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (98, N'DIEDE CONSTRUCTION, INC.', N'PO BOX 1007WOODBRIGE, CA 95258P: 209.464.3352F: 209.368.0600', NULL, NULL, N'(209) 464-3352', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (99, N'DILBECK & SONS, INC.', N'P.O. BOX 6088SALINAS, CA 93912', NULL, NULL, N'(831) 422-8213', 1, NULL)
GO
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (100, N'DIVCON INC.', N'P.O. BOX 695', N'Clovis', N'93613', N'(559) 490-0205', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (101, N'DLB CONSTRUCTION, INC.', N'51 E CAMPBELL AVE', N'Campbell', N'95009', N'408-370-9292', 1, N'dennis@dlbconst.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (102, N'DOME CONSTRUCTION', N'393 EAST GRAND AVESOUTH SAN FRANCISCO CA 94080P: 650-416-5600', N'F:', N'650-416-5602', N'650-416-5600', 1, N'wlin@domeconst.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (103, N'DR HELEN BAE', N'HELEN BAE1363 KEENAN WAY', N'San Jose', N'95125', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (104, N'DRP BUILDERS, INC.', N'P.O. BOX 1208MORGAN HILL, CA 95038', NULL, NULL, N'(408) 683-4221', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (105, N'DRYDEN CONSTRUCTION, INC', N'349 EARHART WAY', N'Livermore', N'94551', N'(925) 243-8750', 1, N'katrina.lee@drydenconstructioninc.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (106, N'DUNCAN  GOVAN', N'3991 LA PLAYA COURTLOOMIS, CA 95650CELL:650.796.9082', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (107, N'E.A DAVIDOVITS & CO., INC', N'555 PRICE AVE SUITE #200', N'REDWOOD CITY', N'94063', N'(650) 366-6068', 1, N'ACCOUNTING@DAVIDOVITS.COM')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (108, N'EAST SIDE UNION HIGH SCHOOL DISTRICT (ESUHSD)', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (109, N'ECKINGER', N'2340 SHEPLAR CHURCH AVECANTON, OH 44705P:330.453.2566', N'F:330.453.', N'0647', N'330.453.2566', 1, N'KELLY@ECKINGER.COM')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (110, N'ECO SUN SYSTEMS LLC', N'425 S. MCCLINTOCK DR #4TEMPLE AZ 85281OFF: 480.247.3315', N'FAX:', N'4246', NULL, 1, N'Frank@ecosunsystems.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (111, N'ELAN PROPERTY MANAGEMENT', N'800 N 1ST STREET', N'San Jose', N'95112', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (112, N'ELDER-JONES, INC.', N'1120 E. 80TH STREETBLOOMINGTON, MN 55420PHONE: (952) 345-6030', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (113, N'ELENA  MIDDLETON', N'605 VERNON WAY', N'Burlingame', N'94010', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (114, N'ELENA CORTES', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (115, N'ELLIS CONTRACTING, INC.', N'4010 MORENA BLVD., SUITE 210SAN DIEGO, CA 92117', NULL, NULL, N'(858) 581-1160', 1, N'tiffany@elliscontracting.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (116, N'EMJ CORPORATION', N'2400 DEL PASO ROAD, SUIT #200SACRAMENTO, CA 95834916.285.0008 OFF', N'916.285.0009', NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (117, N'ENDVRCORP', N'50 OAK COURT SUITE 230DANVILLE, CA 94526', NULL, NULL, N'(925) 208-2121', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (118, N'ENVISION CONSTRUCTION & DESIGN, INC.', N'6711 SIERRA CT STE # DDUBLIN, CA 94568P: 925-560-9906', N'F:', N'925-560-9907', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (119, N'EPI CONSTRUCTION, INC.', N'12345 VENTURA BLVD # HSTUDIO CITY CA 91604O:818.760.9100 X 240', N'F:818.760.', N'9162', N'818-760-9100', 1, N'bmaine@epiconst.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (120, N'ERIKA', N'ERIKA SERVANTES260 S SUNNYVALE ST', N'Sun', N'nyvale', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (121, N'ESI-EXPRESS', N'3330 E. LOUISE DRIVE SUITE 300MERIDIAN, IDAHO 83642O 208.362.3040 F 208.362.3113', NULL, NULL, N'208-362-3040', 1, N'info@esiconstruction.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (122, N'ESSEX PROPERTY TRUST, INC.', N'21860 BURBANK BLVD, SUITE 250-NORTHWOODLAND HILLS, CA 91367PHONE 818.227.2105FAX 818.887.7836', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (123, N'ETERNAL CONSTRUCTION, INC', N'1660 ROLLINS RDBURLINGAME CA 84010O 650.692.6638F 650.6926686', NULL, NULL, NULL, 1, N'jackng@enternalconst.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (124, N'EXPRESS SET FIXTURES', N'1086 W. SOUTH JORDAN PKWY, SUITE 101SOUTH JORDAN, UT 84095PH: 801-878-3574FX: 801-878-3573', NULL, NULL, NULL, 1, N'accounting@express-set.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (125, N'EXTRON ELECTRONICS', N'2480 N. FIRST STREET, SUITE 150SAN JOSE, CA 95131', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (126, N'F&H CONSTRUCTION INC', N'1115 E. LOCKEFORD STLODI CA 95241', N'O:209.391.', N'3738', N'209-931-3738', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (127, N'FAIRFIELD DEVELOPMENT L.P.', N'5510 MOREHOUSE DR STE 200', N'San Diego', N'921213722', N'8584572123', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (128, N'FINELINE CONSTRUCTION', N'15 BRUSH PLACESAN FRANCISCO CA 94103PH: 415-512-7677FX: 415-512-7688', NULL, NULL, N'415-512-7677', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (129, N'FIREBAUGH - LAS DELTAS UNIFIED SCHOOL DISTRICT', N'1976 MORRIS KYLE DRIVEFIREBAUGH, CA 93622PH: 559.659.1476FX: 559.659.2355', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (130, N'FISHER DEVELOPMENT, INC.', N'601 CALIFORNIA STREET, SUITE 300SAN FRANCISCO, CA 94108PHONE: 415.228.3060', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (131, N'FORZA CONSTRUCTION, INC', N'25243 AVENUE TIBBITTSVALENCIA CA 91335O:661.775.3785', N'F:661.554.', N'0200', N'661-775-3785', 1, N'cdeceuster@forzaconstructioninc.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (132, N'FRANKLIN ELEMENTARY SCHOOL', N'2385 TROUSDALE DR.', N'Burlingame', N'94010', N'(408) 316-5086', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (133, N'FRANS CONSTRUCTION, INC', N'2364 N. CORSEY WAYEAGLE, ID 83616OFF: 208-938-7960', N'FAX:', N'208-939-8960', N'208-938-7960', 1, N'bpene@fransconstruction.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (134, N'FRITZ SWENSON', N'5887 WINFIELD BLVDSAN JOSE CA 95123OFF: 408.578.5298', N'FAX:', N'3203', N'408-375-2780', 1, N'derek@swensonconst.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (135, N'G.E CHEN CONSTRUCTION, INC.', N'340 W 23RD AVENUESAN MATEO, CA 94403', N'O:', N'650-377-0102', N'650-377-0102', 1, N'myrta@geconstruction.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (136, N'GALLS, LLC', N'1340 RUSSELL CAVE ROADLEXINGTON, KY 40505PHONE: (859) 266-7227', NULL, NULL, NULL, 1, N'Jarvis-Pam@galls.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (137, N'GARFIELD PARK VILLAGE', N'721 BAY STREET', N'Santa Cruz', N'95060', N'(831) 423-3411', 1, N'gapv@cchnc.org')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (138, N'GENEY/GASSIOT, INC.', N'5521 W. FOURTH STREETRENO, NV 89523P 775.747.2200F 775.747.2227', NULL, NULL, NULL, 1, N'MGONDA@GENEYGASSIOT.COM')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (139, N'GGD, INC.', N'475 GATE 5 ROADSUITE 200SAUSALITO, CA 94965', NULL, NULL, N'(415) 339-1488', 1, N'Fran@ggd-inc.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (140, N'GIDEL & KOCAL CONSTRUCTION CO INC.', N'574 DIVISION STREET', N'Campbell', N'95008', N'(408) 370-0280', 1, N'payables@gidelkocal.com,kacevedo@gidelkocal.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (141, N'GIGI LA BOUFF', N'24569 HUTCHINSON RD', N'Los Gatos', N'408-348-0490', NULL, 1, N'gigi@labouff.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (142, N'GILBANE BUILDING', N'1798 TECHNOLOGY DR SUITE 120,', N'San Jose', N'95110', N'408- 660-4400', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (143, N'GLEN MAR CONSTRUCTION, INC.', N'15800 SE 135TH AVENUECLACKAMAS, OR 97015P (503) 650-1720F (503) 650-1902', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (144, N'GLUCK BUILDING COMPANY', N'26901 AGOURA ROAD, SUITE 100CALABASAS, CA  91301PH: 818.880.8220   FAX:  818.880.8422', NULL, NULL, NULL, 1, N'Accounting@gluckbuilding.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (145, N'GO GREEN CONSTRUCTION', N'3471 BABCCK BLVD. STE. 205 PITTSBURG, PA', N'Pittsburg', N'15237', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (146, N'GRACEFUL LIFE CORP', N'45401 RESEACH AVEOFFICE # 227', N'Fremont', N'94539', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (147, N'GRAY WEST CONSTRUCTION, INC', N'421 E CERRITOS AVEANAHEIM, CA 92805PH: 714. 491.1317FX: 714. 333.9721', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (148, N'GRB SERVICE SYSTEMS, INC., DBA SOUTHWESTERN SERVICES', N'2901 SUFFOLK DR., SUITE 100FORTH WORTH, TX 76133-1152', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (149, N'GREG P', N'P.O. BOX 1805GILROY, CA 95021OFF: 408.847.4622', N'FAX:', N'4655', N'408-847-4622', 1, N'greg@premierbuilders-ca.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (150, N'GREGG HOFFMAN', N'325 MARTINI RUN RD', N'Hollister', N'831-802-5451', N'831-902-5451', 1, N'Gregg@redbeard.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (151, N'GREYSTAR, LP', N'450 SANSOME STREET, SUITE 500 | SAN FRANCISCO, CA 94111PH: 415.489.3912', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (152, N'GRIFFIN & SONS CONSTRUCTION, INC.', N'P.O. BOX 620864WOODSIDE, CA 94062P 650.851.9317', NULL, NULL, NULL, 1, N'kevin@griffincon.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (153, N'GROUP ONE CONSTRUCTION', N'GROUP ONE CONSTRUCTION, INC.1050 DELL AVENUECAMPBELL, CA 95008O: 408-378-8900', N'F:', N'408-378-8901', NULL, 1, N'info@grouponeconstructioninc.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (154, N'GUERRA CONSTRUCTION GROUP', N'984 MEMOREX DRIVE', N'Santa Clara', N'95050', NULL, 1, N'accounting@guerraco.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (155, N'GUZMAN CONSTRUCTION GROUP INC.', N'2270 PALOU AVE.', N'San Francisco', N'94124', N'(415) 821-2522', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (156, N'HA BUILDERS, INC.', N'14796 WILD COLT PLACE', N'Jamul', N'91935', N'(619) 669-1183', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (157, N'HANNA DESIGN GROUP, INC.', N'650 E. ALGONQUIN ROAD #405SCHAUMBURG, IL 60173P: 847.719.0370', NULL, N'0393', N'(713) 628-5593', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (158, N'HANSEN-RICE CONSTRUCTION', N'1717 E. CHISHOLM DRIVENAMPA, ID 83687P: 208.465.0200F: 208.465.0272', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (159, N'HARRIS BUILDERS, INC.', N'18736 BLOSS AVE.HILMAR, CA 95324PH 209.667.0738F (209) 667-0738', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (160, N'HARVEY GENERAL CONTRACTORS', N'9455 RIDGEHAVEN COURT SUITE# 200', N'San Diego', N'92123', N'(858) 769-4000', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (161, N'HEADWATERS CONSTRUCTION INC', N'50 FULLERTON COURT #203SACRAMENTO CA 95825O: 916.564.8899F: 916.564.8896', NULL, NULL, N'916-564-8899', 1, N'candise@headwaterscompanies.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (162, N'HEARN CONSTRUCTION, INC.', N'536 DAVIS STREETVACAVILLE CA 95688PH:  707-4465467', N'FAX:', N'707-447-8576', N'707-4465467', 1, N'jamieh@hearnconstruction.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (163, N'HEARTLAND RETAIL CONSTRUCTION, INC.', N'4956 MEMCO LANE- SUITE ARACINE, WI 53404P: 262.681.8200F: 262.681.8207', NULL, NULL, N'262-681-8200', 1, N'sjones@heartlandretail.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (164, N'HELMER & SON"S, INC.', N'910 HOWELL MOUNTAIN ROAD NORTHP.O. BOX 868ANGWIN, CA 94508', NULL, NULL, N'(707) 965-2425', 1, N'heather@helmers.net')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (165, N'HENRY MEYER', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (166, N'HERMAN STEWART CONSTRUCTION', N'4550 FORBED BLVD #200LANHAM, MD 20706OFF: 301-731-8401', N'FAX:', N'610-706-0581', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (167, N'HILBERS INC', N'1210 STABLER LANEYUBA CITY, CA 95993O:530.673.2947', N'F:530.674.', N'4141', N'530-673-2947', 1, N'TIPPY@HILBERSINC.COM')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (168, N'HN CAPITAL, LLC', N'6340 SOUTH 3000 EAST, STE # 300SALT LAKE CITY, UT 84121(801) 277-1011 OFFICE(801) 274-3876 FAX', NULL, NULL, NULL, 1, N'ryan@hn-capital.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (169, N'HOLT CONSTRUCTION', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (170, N'HOLT CONSTRUCTION, INC', N'808 CHERRY ST SUITE #120CHICO CA 95928O:530.899.1011F:530.896.1011', NULL, NULL, NULL, 1, N'jtubbs@holtconstructioninc.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (171, N'HORIZON RETAIL CONSTRUCTION, INC.', N'1500 HORIZON DRSTURTEVANT, WI 53177P: 262.638.6000F: 262.638.6015', NULL, NULL, N'262-865-8273', 1, N'MelissaB@horizonretail.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (172, N'HUNNER ASSOCIATES', N'1247 LOS TRANCOS ROADPORTOLA VALLEY, CA 94028', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (173, N'ICI INVESTMENT CONCEPTS, INC.', N'1667 EAST LINCOLN AVE.', N'Orange', N'96825', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (174, N'IMPORT.IO CORP', N'20 SOUTH SANTA CRUZ AVENUE, SUITE 102LOS GATOS, CALIFORNIA 95030UNITED STATES OF AMERICA', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (175, N'INTEGRA CONSTRUCTION SERVICES, INC.', N'4122 MOHR AVENUE SUITE DPLEASANTON, CA 94566OFF: (925) 398-8290', NULL, NULL, NULL, 1, N'issac@integra-csi.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (176, N'INTERNATIONAL SCHOOL OF THE PENINSULA', N'151 LAURAN LANE PALO ALTO CA 94303', N'Palo Alto', NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (177, N'IOMLAN CONSTRUCTION SERVICES, INC.', N'1670 FULKERTH RDTURLOCK, CAP 209.664.9960F 209.664.9979', NULL, NULL, NULL, 1, N'sjohnston@iomlan.net')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (178, N'IRONWOOD COMMERCIAL BUILDERS, INC.', N'3953 INDUSTRIAL WAY SUITE ECONCORD, CA 94520', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (179, N'J.H. BRYANT, JR., INC.', N'11401 WHITE ROCK RD', N'Rancho Cordova', N'95742', N'9168527833', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (180, N'J.I. GARCIA CONSTRUCTION', N'4717 EAST HEGDES AVENUE', N'Fresno', N'94520', NULL, 1, N'Karena@jigarcia.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (181, N'JA CARPENTRY', N'150 ENGLISH STREET', N'Hackensack', N'07601', N'(201) 498-1477', 1, N'Accounts@jacarpentryinc.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (182, N'JACOB CONSTRUCTION & DESIGN, INC', N'2436 BROAD ST STE B', N'San Luis Obispo', N'934015702', N'8054606940', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (183, N'JAM GENERAL CONTRACTORS, INC.', N'349 #D LINCOLN AVENUESAN JOSE, CA. 95126PHONE: (408)622-4875', NULL, NULL, NULL, 1, N'jamgci@aol.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (184, N'JAY PETERSON', N'710 COROLINA AVE', N'Sannyvale', N'94085', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (185, N'JDS BUILDERS GROUP, INC.', N'7 EAST MAIN STWINTERS CA 95694P(530)795-0213', N'F(530)', N'795-5662', N'530-795-0231', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (186, N'JEFFERSON ELEMENTARY SCHOOL DISTRICT', N'101 LINCOLN AVENUE DALY CITY, CA 94015 O 650.991.1000   F 650.992.2265', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (187, N'JEFFERSON R. POLLICITA MIDDLE SCHOOL', N'550 E MARKET STREET', N'Daily City', N'94014', NULL, 1, N'bheath@jeffersonesd.org')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (188, N'JEN SNYDER', N'1177 DELYN WAYSAN JOSE CA', N'OFF:206.250.', N'1120', N'206.250.1120', 1, N'ENRYO@YAHOO.COM')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (189, N'JENN MARQUARDT', N'242 PINE WOOD LNLOS GATOS CA 95032', N'408.605.', N'3464', NULL, 1, N'jenn@mafconstructioninc.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (190, N'JERRY  CLAIRE', N'584 DOROTHY AVE.', N'San Jose', N'95125', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (191, N'JIKOJI ZEN CENTER', N'12100 SKYLINE BLVD.', N'Los Gatos', N'95003', N'(408) 741-9562', 1, N'Jikojizenretreat@gmail.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (192, N'JM STITT', N'3165 PALISADES DR.', N'Corona', N'92880', N'(951) 271-3440', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (193, N'JME CONSTRUCTION, INC.', N'P.O. BOX 1363 CUPERTINO, CA 95015', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (194, N'JONATHON GREEN', N'9477 BERKLEY GLEN WAY', N'Elk Grove', N'95624', N'916-212-1399', 1, N'jonmgreen@comcast.net')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (195, N'JOSEPH  B. VANBELLEGHEM', N'1045 LAURIE AVE.', N'San Jose', N'95125', N'(480) 330-5686', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (196, N'JOSEPH J. ALBANESE, INC.', N'851 MARTIN AVENUESANTA CLARA, CA 95050PHONE: 408.200.4183', NULL, NULL, NULL, 1, N'soledad@calcocleaning.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (197, N'JOVAN CONSTRUCTION', N'5862 LAS POSITAS RD. LIVERMORE, CA. 94551O: 925-223-8487', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (198, N'JTS CONSTRUCTION', N'7001 MC DIVITT DRIVEBAKERSFIELD, CA 93313O: 661.835.9270', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (199, N'JUV INC', N'7901 OAKPORT STREET, SUITE 2700,OAKLAND, CA 94621-2060', N'F:510.836.', N'1301', N'510-836-1300', 1, N'david@juvinc.com')
GO
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (200, N'KAREN  YU-SHANG FANN', N'1520 CONDOR DR', N'Sunnyvale', N'94087', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (201, N'KAREN ACOSTA', N'4717 EAST HEDGES AVE.', N'Fresno', N'93703', N'(559) 276-7726', 1, N'karena@jigarcia.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (202, N'KARI [COSENTINO] LOCHHEAD, GSD', N'2370 FRESNO STREETSANTA CRUZ, CA 95062(408) 203-9376', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (203, N'KARIM MALEK', N'130 BROOKWOOD RDWOODSIDE CA 94062', N'C:', N'2353', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (204, N'KCD CONSTRUCTION', N'KATHY HANSENP.O. BOX 370548MONTARA CA 94037', N'650.740.1715', NULL, NULL, 1, N'kurk@kdcconstruction.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (205, N'KDC CONSTRUCTION', N'KATHY HANSEN1442 E. LINCON AVE #334ORANGE, CA 92865OFFICE- 916.362.5460 FAX- 916.362.5461', NULL, NULL, N'(916) 362-5460', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (206, N'KENT CONSTRUCTION', N'8505 CHURCH ST. #12GILROY, CA 95020O: 408.846.5550 X 28F: 408.846.5660', NULL, NULL, N'408-846-5550', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (207, N'KEVIN', N'4175 NORMANDALE DRSAN JOSE CA, 95118', N'408.518.', N'2018', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (208, N'KING REM & CONSTRUCTION', N'2455 NAGLEE RD., STE 114TRACY, CA 95304O: 209.836.5552', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (209, N'KITCHELL', N'255 WEST JULIAN STREET SUITE 400SAN JOSE CA 95110', N'Office:', N'408-280-7889', N'408-280-7889', 1, N'jwelch@kitchell.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (210, N'KLASSEN CORPORATION', N'2021 WESTWIND DR.', N'Bakersfield', N'93301', N'(661) 489-4954', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (211, N'KNAPPER MANAGEMENT SERVICES LLC KMS', NULL, NULL, NULL, NULL, 1, N'oknapper3@gmail.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (212, N'KPRS, INC', N'2850 SATURN STREET', N'Brea', N'92821', N'(714) 672-0800', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (213, N'KRAMER PROJECT DEVELOPMENT COMPANY, INC', N'4040 MOORPARK AVE # 128', N'SAN JOSE', N'95117', N'(408) 246-6327', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (214, N'L&L CONSTRUCTION, L.L.C.', N'5601 HUETTNER DR.', N'Norman', N'73069', N'(405) 360-2775', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (215, N'L&L RETAIL CONSTRUCTION, LLC', N'5601 HUETTNER DRNORMAN OK 73069OFF: 405.360.2775FAX: 405.360.8897', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (216, N'LAKEVIEW CONSTUCTION, INC.', N'10505 CORPORATE DRIVE, SUITE 200', N'Pleasant Pairie', N'53158', N'(262) 867-3336', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (217, N'LAMAR CONSTRUCTION, INC.', N'4444 SCOTTS VALLEY DRIVE SUITE 1SCOTTS VALLEY, CA 95066', NULL, NULL, N'(408) 374-9084', 1, N'accounting@lamar-construction.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (218, N'LANDMARK CONSTRUCTION', N'5948 KING ROADLOOMIS, CA 95650PH: 916.663.1953FX: 916.663.1867', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (219, N'LEED MECHANICAL', N'11300 TRADE CENTER DR., SUITE BRANCHO CORDOVA, CA 95742O 916.851.8617', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (220, N'LEWIS C. NELSON AND SONS, INC.', N'3400 MCCALL AVENUE, SUITE 100SELMA, CA 93662PHONES: 559.896.1443FAX: 559.898.8609', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (221, N'LINDSAY COMPANIES', N'499 MIDDLEFIELDS RD.PALO ALTO, CA 94301OFF: 719-448-0500', NULL, NULL, NULL, 1, N'manager@meadowoodapartments.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (222, N'LOS GATOS-SARATOGA UNION HIGH SCHOOL DISTRICT', N'17421 FARLEY ROAD WEST', N'Los Gatos', NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (223, N'LPS CONTRACTING INCORPORATED', N'1440 S CLEARVIEW AVE # 102MESA, AZ 85209FAX # 480-641-0300', N'Off #', N'480-641-6600', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (224, N'LUXE DESIGN SOURCE, INC', N'4900 HOPYARD RD. STE.100', N'Pleasanton', N'94588', N'(925) 356-1057', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (225, N'MADRID EQUIPMENT RENTAL, INC.', N'202 W MINTHORN ST.,LAKE ELSINORE CA 92530O 951.674-6241 | F 951.245.5709', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (226, N'MANAGEMENT RESOURCE SYSTEMS, INC.', N'1907 BAKER ROAD', N'High Point', N'27263', N'(336) 289-2576', 1, N'kcolson@mrs1977.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (227, N'MARIA CORTEZ', N'MARIA CORTES', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (228, N'MARIN COMMUNIRY COLLEGE DISTRICT', N'MARIN COMMUNITY COLLEGE DISTRICT1800 IGNACIO BLVD', N'Novato', N'94949', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (229, N'MARK SCOTT CONSTRUCTION, INC.', N'2835 CONTRA COSTA BLVDPLEASENT HILL CA 94523P: 925-944-0502', N'F:', N'925-944-5033', N'925-944-0502', 1, N'ap@msconstruction.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (230, N'MARK WILSON CONSTRUCTION, INC.', N'5799 E CLINTON AVE, FRESNO, CA 93727OF: (559) 348-0421FX:  (559) 348-0471', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (231, N'MARKET CONTRACTORS', N'10250 NE MARX STREER', N'Portland', N'97220', N'503-255-0977', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (232, N'MARKET ONE BUILDERS, INC.', N'1200 R STREET, SUITE 150SACRAMENTO, CA 95811', NULL, NULL, N'(916) 928-7474', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (233, N'MARKO CONSTRUCTION GROUP', N'3675 E. JENSEN AVE.', N'Fresno', N'93725', N'(559) 222-7888', 1, N'Lross@markoconstrcution.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (234, N'MARSH CREEK LLC', N'1150 BUSINESS  PARK DR. SUITE 106DIXON, CA 95620OFFICE: (707) 693-1270FAX: (707) 693-1279', NULL, NULL, NULL, 1, N'ap@marshcreekllc.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (235, N'MARTINEZ CONSTRUCTION SERVICES', N'PO BOX 540756MERRITT ISLAND, FL 32954P: 321-349-2000F: 321-349-3710', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (236, N'MC CONSTRUCTION, INC.', N'38012 N. LINDA DRCAVE CREEK, AZ 85331OFF: 840-367-8600', N'FAX:', N'480-367-8625', NULL, 1, N'MHKESTER@HOTMAIL')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (237, N'MCBIRNEY CONSTRUCTION', N'DAVEP.O BOX. 21294SAN JOSE CA 95151', N'OFF:629.9288', N'7997', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (238, N'MEDINAS CONSTRUCTION"', N'1856 PACIFIC AVE., #9', N'SAN FRANCISCO', N'94109', N'(408) 204-1819', 1, N'MEDINASCONSTRUCTION@GMAIL.COM')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (239, N'MEEHLEIS MODULAR BUILDING, INC.', N'1303 E. LODI AVENUELODI, CA 95240O: 209.334.4637F: 209.334.4726', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (240, N'MENEMSHA CONSTRUCTION SOLUTIONS', N'169 LIBBEY PARKWAYWEYMOUTH, MA 02189P:781-337-9012', N'F:', N'775-383-8090', N'781-337-9012', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (241, N'MERGED BUILDERS', N'25 TAYLOR ST', N'San Francisco', N'94102', N'(415) 530-2732', 1, N'AP@uabuildersgroup.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (242, N'METRO CONSTRUCTION MANAGEMENT', N'710 W. MAIN STREET, STE. FBLUE SPRINGS, MO 64015OFFICE 816-988-7903FAX 816-988-7904', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (243, N'MIKE HINSON CONSTRUCTION, INC', N'P.O. BOX 2665APTOS CA 95001-2665CELL:831.662.3834', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (244, N'MILLENNIUM CONSTRUCTION GROUP', N'2888 CONCORD BLVD.CONCORD, CA 94519', NULL, NULL, N'(925) 676-0119', 1, N'Sheri@millcongroup.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (245, N'MILLER LIZA', N'156 VICKSBURG ST', N'San Francisco CA 94114', N'415-710-0268', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (246, N'MITCHELL GENERAL CONTRACTORS, INC.', N'52 TESLA', N'Irvine', N'92618', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (247, N'MKD REALTY', N'NRS CONSTRUCTION1152 NEWHALL STSAN JOSE CA 95126CELL:408.806.7911', N'Fax:408.296.', N'7808', N'408-806-7911', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (248, N'MODERN SPACES, INC.', N'809 CALIFORNIA DRIVE, BURLINGAME, CA 94010.', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (249, N'MOOREFIELD CONSTRUCTION, INC.', N'4080 TRUXEL ROAD, SUITE #200SACRAMENTO, CA 95834PH: 916.614.7888FX: 916.419.8870', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (250, N'MOSAIC SOLUTION', N'750 N ORLEANS, STE 600CHICAGO, IL 60654-4420312.216.5265', NULL, NULL, NULL, 1, N'AccountsPayable@mosaic.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (251, N'MOUNT HERMON CHRISTIAN CONFERENCE CENTER', N'37 CONFERENCE DIVEMT HERMON, CA 95041PH: (831) 335-4466', NULL, NULL, NULL, 1, N'dale.pollock@mounthermon.org')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (252, N'MPI AMERICA LLC', N'1836 SE TENINO STREETPORTLAND, OR97202PHONE: 360.513.5355ALTERNATIVE: 971.506.8832', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (253, N'MS COMMERCIAL', N'760 BOWDOIN STSTANFORD, CA 94305CELL: 925.212.8209', N'FAX:', N'7306', NULL, 1, N'MBARHAM@MSCONSTRUCTION.COM')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (254, N'MURRAY BUILDING, INC.', N'1181 BROADWAY,SONOMA, CA 95476CELL: 7079399001', NULL, NULL, NULL, 1, N'claudia@murraybuildinginc.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (255, N'MYRA FLORES', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (256, N'NATIONAL RETAIL & COMMERCIAL CONTRACTOR,', N'NATIONAL RETAIL & COMMERCIAL C. INC18601 LBJ FRWY, SUIT # 610MESQUITE, TEXAS 75150OFF: 972.613.2874', N'FAX:', N'8216', N'910-200-2767', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (257, N'NORDBY', N'1550 AIRPORT BLVD. STE. 101SANTA ROSA, CA 95403OFF: 707.526.4500', N'FAX:', N'4035', NULL, 1, N'allisonbroaddus@nordby.net')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (258, N'NORTH MONTEREY COUNTY USD', N'8142 MOSS LANDING RD.MOSS LANDING, CA 95039O: 831-633-3343F: 831-633-5189', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (259, N'NOVA BUILDERS GROUP INC', N'501 STOCKTON AVESAN JOSE CA 95126OFF:650.427.0624', N'FAX:888.609.', N'3570', NULL, 1, N'KATHLEEN@NOVABUILDERSGROUP.COM')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (260, N'NOVO CONSTRUCTION, INC.', N'608 FOLSOM STREETSAN FRANCISCO, CA 94107PH: 415.932.5965', NULL, NULL, NULL, 1, N'accountspayable@novoconstruction.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (261, N'NTIONAL CONTRUCTOR INC.', N'NATIONAL CONSTRUCTION INC.4300 BAKER RDMINNETONKA, MN 55343OFF:952.881.6123', N'Fax:952.881.', N'6321', N'952.881.6123', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (262, N'OAKLAND POLICE OFFICERS ASSOCIATION (OPOA)', N'555 5TH STREET OAKLAND, CA 94607P: (510) 834-9670', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (263, N'OMNI CONSTRUCTION', N'533 AIRPORT BLVD SUITE 555BURLINGAME, CA 94010OFF: 650.685.2490', N'FAX:', N'2491', NULL, 1, N'justinb@ocsi.us')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (264, N'ON TOP CONSTRUCTION', N'ON TOP CONSTRUCTION, INC.201 RICKENBACKER CIRCLELIVERMORE, CA 94551', NULL, NULL, NULL, 1, N'office.admin@calcocleaning.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (265, N'ONLINE BUILDERS', N'489 SAXONY PLACE, SUITE 102ENCINITAS, CA 95136', NULL, NULL, N'(760) 942-8600', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (266, N'ORANGE JULIUS', N'171 BLOSSOM HILL RD. #10-530', N'San Jose', N'95136', N'(408) 483-8641', 1, N'ojdqsj@bdknenterprises.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (267, N'ORCHARD SCHOOL DISTRICT', N'921 FOX LANE SAN JOSÉ, CA 95131OFFICE:408.944.0397', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (268, N'OTTO CONSTRUCTION', N'1717 SECOND STREET', N'SACRAMENTO', N'95811', N'(916) 441-6870', 1, N'SVanSomeren@ottoconstruction.com, jgoldem@ottoconstruction.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (269, N'PACIFIC COAST DEVELOPMENT', N'800 E LAKE AVE. WATSONVILLE, CA 95076OFFICE: 831.724.7504', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (270, N'PACIFIC GENERAL CONSTRUCTION', N'1150 CADILLAC COURTMILPITAS, CA 95035', NULL, NULL, N'(408) 935-9233', 1, N'raytong@pacgencon.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (271, N'PACIFIC WEST BUILDERS, INC.', N'430 EAST STATE STREET SET. 100EAGLE, ID 83616O: 208.461.0022F- 208.461.0033', NULL, NULL, N'208-461-0022', 1, N'cassandrat@tpchousing.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (272, N'PACIFIC-MOUNTAIN CONTRACTORS OF CALIFORNIA, INC.', N'4061 PORT CHICAGO HIGHWAY, SUITE HCONCORD, CA 94520', NULL, NULL, N'(925) 603-2652', 1, N'office.admin@calcocleaning.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (273, N'PATCO, INC.', N'566 DEBBIE DR.BOULDER CREEK, CA 95006', NULL, NULL, NULL, 1, N'Patcoinc10@gmail.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (274, N'PAUL SAVASKY', N'OFF 831-332-8087', N'fax', N'831-688-7539', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (275, N'PHILCO CONSTRUCTION, INC', N'1762 N NEVILLE STORANGE, CA 92865O:714.283.0604', N'F:714.283.', N'0608', N'714-283-0604', 1, N'kathe@philco-construction.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (276, N'PILLSBURY', N'2550 HANOVER STPALO ALTO CA 94304', N'O:650.233.4731', N'4545', N'650.233.4731', 1, N'lisa.darosa@pillsburylaw.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (277, N'PKC CONSTRUCTION', N'7802 BARTON ST.LENEXA, KC 66214912.782.4646FX: 913.390.8402', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (278, N'PLAZA LAS FLORES', N'LUIZ BAST233 CARROLL STCA 94086', N'Sunnyvale', N'94086', N'(408) 773-8120', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (279, N'PLOWMAN CONSTRUCTION COMPANY', N'PLOWMAN CONSTRUCTION INC905 EAST PARK STOLATHE KS 66061O:913.829.1200', N'F:913.829.', N'1231', N'913-829-1200', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (280, N'PMC', N'4061 PORT CHICAGO HIGHWAY, SUITE HCONCORD, CA 94520', N'925.687.8430', NULL, NULL, 1, N'tfeick@discoverybuilders.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (281, N'PR CONSTRUCTION, INC.', N'1995 N BATAVIA ST', N'Orange', N'928654107', N'7146377848', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (282, N'PREMIER BUILDERS', N'P.O. BOX 1805GILROY, CA 95021408.847.4622 OFF', N'408.847.4655', NULL, NULL, 1, N'GREG@PREIMERBUILDERS-CA.COM')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (283, N'PREMIER MANAGEMENT GROUP', N'133 RIVERSIDE AVEROSEVILLE, CA 95678OF: (916)787-4344', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (284, N'PROFORMA CONSTRUCTION', N'4439 STONERIDGE DR. STE 22O', N'PLEASANTON', N'94588', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (285, N'PROWEST CONSTRUCTORS', N'22710 PALOMAR STREETWILDOMAR, CA 92595O: 951.678.1038F: 951.678.1034', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (286, N'PUEBLO CONSTRUCTION', N'232 ANACAPA ST, STE #2DSANTA BARBARA, CA 93101OFFICE 805.564.1313', NULL, NULL, N'831-641-0580', 1, N'mmartinez@puebloconstruction.net')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (287, N'QUESADA CONSTRUCTION, INC.', N'2805 MONTEREY AVENUESOQUEL, CA 95073 PH: (831) 464-2634', NULL, NULL, NULL, 1, N'quesadaconst@yahoo.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (288, N'QUIRING GENERAL, LLC', N'5118 EAST CLINTON WAY SUITE 201FRESNO CA 93727', N'O:559.432.', N'2800', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (289, N'R.C. BENSON & SONS, INC.', N'1959 LEGHORN ST SUITE AMOUNTAIN VIEW, CA 94043P- 650-965-3430F- 650-965-7139', NULL, NULL, N'(650) 965-3430', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (290, N'R.C. PACIFIC CONSTRUCTION, INC.', N'GALILEE RD.ROSEVILLE, CA 95678', NULL, NULL, N'(916) 782-5682', 1, N'JENIFER@RCPACIFIC.COM')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (291, N'RADIAN HEATSINKS', N'2160 WALSH AVE.SANTA CLARA, CA 95050', NULL, NULL, NULL, 1, N'VBlack@radianheatsinks.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (292, N'RCS BUILDERS', N'1182 GALSTON DRFOLSOM, CA 95630P:916.817.7938', N'F:', N'916-294-7104', N'916-817-7938', 1, N'GC.PITZER@GMAIL.COM')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (293, N'RECONN CONSTRUCTION SERVICES', N'561 N. EGRET BAY BLVD.LEAGUE CITY, TX 77573', NULL, NULL, N'(281) 549-6267', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (294, N'RECTENWALD BROTHERS CONSTRUCTION, INC.', N'130 GENERAL STILWELL, SPACE#104', N'Marina', N'16066', N'(724) 772-8282', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (295, N'REEVE-KNIGHT CONSTRUCTION INC', N'128 ASCOT DRROSEVILLE, CA 95661O:916.786.5112', N'F:916.786.', N'5113', N'916-786-5112', 1, N'carmenm@reeve-knight.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (296, N'RENASCI MANAGEMENT CORPORATION', N'28118 AGOURA ROAD, 105AGOURA HILLS, CA 91301', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (297, N'RESIDENTIAL CLEANING', N'26310 ESPERANZA DRIVELOS ALTOS, CA 94022', NULL, NULL, N'(408) 504-3104', 1, N'Linjing64@yahoo.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (298, N'RGW CONSTRUCTION, INC.', N'550 GREENVILLE ROAD', N'Livermore', N'94550', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (299, N'RICHLEN CONSTRUCTION', N'115 ASPEN DRPACHECO, CA 94553O:925.674.8850', N'F:925.674.', N'8855', N'925-674-8850', 1, N'emartinsen@richlen.com')
GO
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (300, N'RIDGE CONSTRUCTION CORP.', N'280 TOWNE CENTER DR BLDG # 1NORTH BRUNSWICK, NJ 08902P: 732-398-9677', N'F:', N'732-398-9249', N'732-398-9677', 1, N'jmaiorana@ridgecorp.net')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (301, N'RIDGEVIEW BUILDERS, INC.', N'122 CALISTOGA ROAD, PMB #221SANTA ROSA, CA 95409OFFICE: 707.537.8861FAX: 707.537.8954', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (302, N'RITA CLAAR', N'4415 HANALEI PLSAN JOSE CA', N'408.666.', N'5852', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (303, N'RIVER VIEW', N'4003 SEAPORT BLDWEST SACRAMENTO CAP:916.371.9494', N'F:916.371.9495', NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (304, N'ROAD RIDER MOTORCYCLE ACCESSORIES', N'2897 MONTEREY HWY.SAN JOSE, CA 95111', NULL, NULL, N'(408) 981-8284', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (305, N'ROBER CANTWELL', N'ROBERT CANTWELL110 SUTTER ST SUITE #800', N'San Francisco CA', N'617-784-2577', N'617-784-2577', 1, N'robert@everlane.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (306, N'ROBERT A. BOTHMAN CONSTRUCTION', N'2690 SCOTT BOULEVARD', N'Santa Clara', N'95050', N'(408) 249-2277', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (307, N'ROBERT E. BOYER CONSTRUCTION, INC.', N'19608 E. MONO WAYSONORA, CA 95370PH: 209.586.5010', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (308, N'ROBINSON CONSTRUCTION, CO.', N'21360 NW AMBERWOOD DRIVE,HILLSBORO, OR 97124', NULL, NULL, N'(503) 645-8531', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (309, N'ROCKAWAY CONSTRUCTION INC', N'400 OLD COUNTY RD #3PACIFICA, CA 94044650.738.9920 OFF', N'650.359.6356', NULL, N'650..738.9920', 1, N'FDolan@rockawayconstruction.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (310, N'RODAN BUILDERS, INC.', N'3486 INVESTMENT BLVD. STE.BHAYWARD, CA 94545PH: 650-508.1700FX: 650.508.1705', NULL, NULL, N'650-508-1700', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (311, N'ROEBBELEN CONTRACTING, INC.', N'1241 HAWKS FLIGHT COURTEL DORADO HILLS, CA 95762OFF: 916.939.4000', N'FAX:', N'5317', NULL, 1, N'APVendors@roebbelen.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (312, N'ROEM BUILDERS', N'1650 LAFAYETTE STREETSANTA CLARA, CA 95050PH: 408.984.5600FX: 408.984.3111', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (313, N'ROMKON, INC.', N'1856 PACIFIC AVE # 9SAN FRANCISCO CA 94109', N'Fax:', N'415-529-2073', N'(415) 525-4432', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (314, N'RONNIE LA BARR', N'4486 JONQUIL DR', N'San Jose', N'95136', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (315, N'ROSEWOOD FAMILY ADVISORS LLP', N'2475 HANOVER STREETPALO ALTO, CA 94304', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (316, N'ROYCE CONSTRUCTION & DESIGN INC.', N'PO# BOX1072', N'Tuolume', N'95379', N'(209) 536-4805', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (317, N'RUSSELL-FILAND', N'18001 N. 79TH AVE SUITE C-56GLENDALE, AZ 85308PH: 623.412.8999 PH', N'FAX:', N'3666', NULL, 1, N'ZWOOD@RUSSELLBUILDERSINC.COM')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (318, N'SACHSE CONSTRUCTION', N'1528 WOODWARD AVE. SUITE 600DETROIT, MI 48226PHONE: 313.481.8200FAX: 313.481.8250', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (319, N'SAJO', N'1320 GRAHAM MONT-ROYALQUEBEC H3P 3C8 CANADAO:514.385.0333F:514.389.8622', NULL, NULL, N'(514) 385-0333', 1, N'ACHAN@SAJO.COM')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (320, N'SAKARI SIPPOLA', N'1363 ZURICH TERRACESUNNYVALE CA', N'408.386.', N'8539', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (321, N'SAN FRANCISCO UNIFIED SCHOOL DISTRICT', N'135 VAN NESS AVE ROOM 207 B', N'San Francisco', N'94102', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (322, N'SAUSAL CORPORATION', N'3550 WILLOW PASS RD.CONCORD, CA  94519O 925-568-2200 F 925-568-2225', NULL, NULL, N'(510) 568-6600', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (323, N'SAVANT CONSTRUCTION, INC.', N'13830 MOUNTAIN AVE', N'Chino', N'917109014', N'(909) 614-4300', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (324, N'SBAY CONSTRUCTION, INC.', N'2901 MOOREPARK AVE. #220SAN JOSE, CA 95128PH: 408.940.4390FX: 408.610.9042', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (325, N'SBI BUILDERS, INC.', N'1515 THE ALAMEDA, STE. 300SAN JOSE, CA 95126P: 408.549.1305F: 408.216.8625', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (326, N'SCM  CONSTRUCTION MANAGEMENT SERVICES, INC.', N'1920 STANDIFORD AVE #3 MODESTP, CA 95350', NULL, NULL, N'(209) 300-4190', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (327, N'SEA PAC ENGINEERING, INC.', N'3325 WILSHIRE BLVD., STE. 305LOS ANGELES, CA 90010PH: 213.487.6130FX: 213.487.6131', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (328, N'SEGUE CONSTRUCTION INC', N'7139 KOLL CENTER PARKWAY, SUITE 200', N'Pleasanton', N'94566-3120', N'(925) 931-1750', 1, N'gonzalo@calcocleaning.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (329, N'SFV CONSULTING', N'25550 GRAND RIVER AVENUEREDFORD, MI 48240F: 312.275.8543', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (330, N'SGI CONSTRUCTION M', N'WEST CONTRA COSTA UNIFIED SCHOOL DISTRIC1400 MARINA WAYS RICHMOND CA 94804OFF:510.307.4540', N'FAX:510.412.', N'5661', N'510-307-4540', 1, N'VVan@wccusd.net')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (331, N'SHAUNA MENDELOW', N'1540 BONITA  AVEMOUNTAIN VIEW CA  94040', N'P:707.239.', N'0406', N'707-239-0409', 1, N'smendelow@me.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (332, N'SHRADER & MARTINEZ CONSTRUCTION, INC.', N'160 DRY CREEK ROAD', N'Sedona', N'86336', N'(928) 282-7554', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (333, N'SIERRA VALLEY CONSTRUCTION, INC.', N'1001 ENTERPRISE WAY SUITE #100', N'Roseville', N'95678', N'916-772-0800', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (334, N'SIMILE CONSTRUCTION', N'4725 ENTERPRISE WAY #1MODESTO, CA 95356PH: 209.545.6111FX: 209.545.6112', NULL, NULL, N'209-545-6111', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (335, N'SIMPSON THACHER', N'2475 HANOVER STREETPALO ALTO CA 94304P: 650-251-5000', N'F:', N'650-251-5002', NULL, 1, N'rlopez@stblaw.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (336, N'SK LARSON, INC.', N'STEVE LARSON', N'P.O Box 615', N'95614', NULL, 1, N'sklarsoninc@yahoo.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (337, N'SKENDER CONSTRUCTION', N'200 W MADISON, SUIT 1300CHICAGO, ILL 60606OFF:312.781.0265', N'FX:312.781.', N'0279', N'714.947.3063', 1, N'BBUKOWSKI@SKENDER.COM')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (338, N'SLATER & SON GENERAL CONTRACTOR', N'3753 MOREHEAD AVE.', N'Chico', N'95928', N'(530) 893-3333', 1, N'brandon@slaterandson.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (339, N'SMITH DEVELOPMENT AND CONSTRUCTION COMPANY', N'7803 MADISON AVE #700C', N'CITRUS HEIGHTS', N'95610', N'(916) 966-7325', 1, N'AP@SMITHDCC.COM')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (340, N'SOUTHLAND CONSTRUCTION MANAGEMENT, INC.', N'3942 VALLEY AVE., SUIT APLEASANTON, CA 94566OFF-925.469.1101', N'Fax-925.469.1102', NULL, N'925.469.1101', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (341, N'SSEN USA DEVELOPMENT,INC', N'3700 WILSHIRE BLVD SUIT #427LOS ANGELES CA 90010IFF:213.368.0204', N'Fax:213.368.', N'0205', N'213.368.0204', 1, N'78bhkim@gmail.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (342, N'SSW CONSTRUCTION CORP', N'804 READING ST., STE AFOLSOM, CA 95630-321O: 916.773.9595F: 916.773.9517', NULL, NULL, N'916-773-9595', 1, N'ap@sswconstruction.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (343, N'STEPHANIE  FOSTER', N'18875 NUTMEG DR.', N'Morgan Hill', N'95037', N'(408) 210-6191', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (344, N'STEVE JULIUS CONSTRUCTION', N'230 CALLE PINTORESCOSAN CLEMENTE, CA 92673P: 949-369-7820', N'F:', N'949-369-7821', NULL, 1, N'mcurzon@juliusconstruction.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (345, N'STURGEON CONSTRUCTION INC', N'8259 ALPINE AVESACRAMENTO CA 95826OF: 916.452.6108', N'F:', N'1153', N'916-452-6108', 1, N'sturgeonconstruction@yahoo.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (346, N'SUGAR BUTTER FLOUR', N'669 BERNARDO AVE', N'Sunnyvale', N'94087', N'408-687-2295', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (347, N'SUMMERHILL CONSTRUCTION COMPANY', N'777 CALIFORNIA AVEPALO ALTO, CA 94304', NULL, NULL, N'(650) 857-0122', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (348, N'SUNSERI CONSTRUCTION', N'48 COMANCHE COURTCHICO, CA 95928', NULL, NULL, N'(530) 891-6444', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (349, N'SUSAN', N'543 LILYNN WAYMONTEREY, CA', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (350, N'SW ALLEN CONSTRUCTION, INC.', N'4777 AUBURN BLVD., SUITE 100SACRAMENTO, CA 95841P 916.344.2098F 916.344.2098', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (351, N'SWENSON & ASSOCIATES', N'581 DIVISION ST SUITE ACAMPBELL, CA 958008TEL: 408.866.7600', N'FAX:', N'7692', N'408-866-7600', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (352, N'SWENSON CONSTRUCTION', N'5887 WINFIELD BLVDSAN JOSE CA 95123OFF: 408.578.5298', N'FAX:', N'3203', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (353, N'T.B. PENICK & SONS, INC.', N'15435 INNOVATION DR., STE. 100SAN DIEGO, CA 92128O: 858.558.1800F:858.558.1881', NULL, NULL, NULL, 1, N'Tammis@tbpenick.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (354, N'TABER CONSTRUCTION, INC.', N'PO BOX 1309MATINEZ, CA 94553O 925.682.6133F 925.682.6124', NULL, NULL, NULL, 1, N'VALERIE@TABERCONSTRUCTION.COM')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (355, N'TEREK EBEID', N'TEREK EBEID28160 STORY HILL LANELOS ALTOS HILLS, CA 94022', N'415.269.', N'9026', NULL, 1, N'TEBEID@YAHOO.COM')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (356, N'TERRA NOVA INDUSTRIES', N'1607 TICE VALLEY BLVD.WALNUT CREEK, CA 94595', NULL, NULL, N'(925) 934-6133', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (357, N'TERRY ADAMS, INC.', N'460 DU BOIS ST.', N'San Rafael', N'94901', N'(270) 769-0859', 1, N'kgibson@terryadamsinc.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (358, N'THE CAMBRIAN SCHOOL DISTRICT', N'4115 JACKSOL DRIVE', N'San Jose', NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (359, N'THE TAX PRACTICE', N'1978 THE ALAMEDA AVE', N'SAN JOSE CA', N'408-772-2272', NULL, 1, N'WILLNER@TAXPRACTICE.COM')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (360, N'THOMAS PINHERO CONSTRUCTI', N'41541 DATE ST', N'Murrieta', N'925627086', N'(951) 365-5177', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (361, N'THOMPSON BUILDERS CORP.', N'THOMPSON BUILDERS CORP.250 BEL MARIN KEYS BLVD, BLDG ANOVATO CA 94949OFFICE: 415 456-8972', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (362, N'THOMPSON DORFMAN PARNERS, LLC', N'39 FORREST ST SRE. 201MILL VALLEY CA', N'O:415.381.', N'3001', N'415-381-3001', 1, N'JS@THOMPSONDORFMAN.COM')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (363, N'THREE RIVERS CONSTRUCTION, INC', N'255 DISTRIBUTION DR STE #204SPARKS NV 89441O:775.825.5248', N'F:775.825.', N'5326', N'775-825-5248', 1, N'MVAN@3RIVERSINC.COM')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (364, N'TI MANAGEMENT GROUP', N'266A N. SANTA CRUZ AVE', N'los gatos', N'95030', N'650-961-2010', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (365, N'TICO CONSTRUCTION', N'1585 TERMINAL AVE. SAN JOSE, CA 95112', NULL, NULL, NULL, 1, N'apinvoices@ticoinc.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (366, N'TOLL BROS., INC', N'2000 CROW CANYON PLACE SUITE #200SAN RAMON, CA 94583VENDOR#45203', N'off:925.743.3839', N'3709', N'925-743-3839', 1, N'zbalderama1@tollbrothersinc.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (367, N'TOM GRAMMER', N'231 MARKET PLACE', N'San Ramon', N'94582', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (368, N'TOMBLESON INC.', N'TOMBLESON INCPO BOX 1388SALINAS CA 93902OFF:831.422.9696', N'FAX:831.422.0566', N'93902', N'831-422-9696', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (369, N'TORRE REICH CONSTRUCTION', N'219 N BROADWAY AVETURLOCK CA 95380P: 209.668.8721', N'F:', N'2288', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (370, N'TORRENT LABORATORY, INC.', N'483 SINCLAIR FRONTAGE RD.MILPITAS, CA 95035', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (371, N'TORRES CONSTRUCTION', N'150 EXECITIVE PARK BLVD SUIT # 4400SAN FRANCISCO CA 94134OFF: 415-467-2000', N'Fax:', N'415-467-2033', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (372, N'TRAINOR COMMERCIAL CONSTRUCTION', N'1925 FRANCISCO BLVD. E SUITE 21', N'San Rafael', N'94901', N'(415) 259-0200', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (373, N'TRI-NORTH BUILDERS INC', N'2625 RESEARCH PARK DRFITCHURG, WI 53711O:608.204.7211', N'F:608.271.', N'3354', N'608-204-7211', 1, N'apsubs@tri-north.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (374, N'TRI-QUEST BUILDERS & DEVELOPERS, INC.', N'4630 NORTHGATE BLVD. SUITE 110SACRAMENTO, CA 95834O 916.923.0333 F 916.923.0933', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (375, N'TRICORP GROUP, INC.', N'1030 G STREET', N'Sacramento', N'95814', N'(916) 779-8010', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (376, N'TRINITY RENOVATION', N'1113 KANSAS AVE', N'MODESTO', N'95351', N'(209) 622-3610', 1, N'at@trinityrenovation.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (377, N'TRUMARKHOMES', N'3001 BISHOP DR., SUITE 100SAN RAMON, CA 94583', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (378, N'U-HAUL COMPANY OF SOUTH BAY', N'44511 SOUTH GRIMMER BLVD.FREMONT, CA 94538PH: 510.656.6200FX: 510.656.0935', NULL, NULL, NULL, 1, N'karl_hattendorf@uhaul.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (379, N'UNIFY FINANCIAL CREDIT UNION', N'1425 OCEAN AVENUESAN FRANCISCO, CA 94112OFFICE: 877.254.9328', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (380, N'USA CONSTRUCTION MANAGEMENT, INC.', N'3200 DOUGLAS BOULEVARD, SUITE 200ROSEVILLE, CA  95661O: 916-724-3882  F: 916-773-1931', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (381, N'UTOPIA DEVELOPMENT, INC.', N'2650 LEONIS BLVD VERNONLOS ANGELES CA 90058OFF: 323.582.5200', N'Fax:', N'323-585-4700', N'323-582-5200', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (382, N'V F MALL LLC WESTFIELD AMERICA, INC', N'2855 STEVENS CREEK BLVD,SUITE 2178', N'Santa Clara', N'95050', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (383, N'VAN DEWARK HEARN CONSTRUCTION, INC.', N'536 DAVIS STREET VACAVILLE, CA 95688', NULL, NULL, N'(707) 446-5467', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (384, N'VANTASSEL PROCTOR', N'5110 TALLEY ROAD', N'Little Rock', N'501-219-8855', N'501-219-8899', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (385, N'VCC, LLC', N'18201 VON KARMAN AVE., SUITE 100IRVINE, CA 92612O: 949.851.8479', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (386, N'VCMG LLC', N'1215 S 27TH STFORT PIERCE, FL 34947F: 772-408-4472', N'O:', N'772-618-2381', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (387, N'VIA PACIFICA GARDENS', N'1860 VIA PACIFICA', N'Aptos', N'95003', N'(831) 688-3324', 1, N'ehearon@cchnc.org')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (388, N'VILA CONSTRUCTION', N'590 SO. 33RD STREET', N'RICHMOND', N'94804', N'(510) 236-9111', 1, N'MIKEVILA@VILACONSTRUCTION.COM')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (389, N'VISCUSI ELSON INTERIOR DESIGN', N'147 MAIN STREET', N'Los Altos', N'94022', N'(650) 941-7800', 1, N'Emily@veinteriordesign.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (390, N'VISION CONTRUCTION', N'35640 FREMONT BLVD', N'fremont', N'94536', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (391, N'W"S SALON', N'1070 OLIN AVENUE SAN JOSE, CA 95128PHONE: 408-247-8953', NULL, NULL, NULL, 1, N'jning18@hotmail.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (392, N'W.E. LYONS CONSTRUCTION CO.', N'1301 YGNACIO VALLEY RD.', N'Walnut Creek', N'94598', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (393, N'W.L. BUTLER CONSTRUCTION INC', N'5666 LA RIBERA ST. SUITE ALIVERMORE, CA 94550(650) 361-1270', NULL, NULL, NULL, 1, N'mai@calcocleaning.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (394, N'WARWICK CONSTRUCTION', N'365 FM 1959HOUSTON, TX 77034OFF:  832-448-7000', N'Fax:', N'832-448-3000', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (395, N'WAYNE B. SNYDER', N'125 S MARKET STSAAN JOSE CA', N'650.248.', N'7772', NULL, 1, N'wayne@talentage.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (396, N'WELLS CONSTRUCTION, INC.', N'10648 INDUSTRIAL AVE.ROSEVILLE, CA 95678OFF: 916.788.4480FX: 916.788.4881', NULL, NULL, NULL, 1, N'accounting@wellsconstruction.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (397, N'WENDT & SON"S CONSTRUCTION, INC', N'P.O. BOX 1403LODI, CA 95241209.547.9310-OFFICE', N'209547.9312-Fax', NULL, NULL, 1, N'ken@wendtandsons.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (398, N'WEST BAY BUIDERS, INC', N'250 BEL MARIN KEYS BLVD BLDG ANOVATO, CA 94949O:415.456.8972', N'F:415.459.', N'0665', N'415-456-8972', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (399, N'WEST COAST HOODS/HVAC INC', N'2938 ABORN SQUARE RDSAN JOSE CA559.333.1308', NULL, NULL, NULL, 1, N'joseagarcia@12yahoo.com')
GO
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (400, N'WEWORK', N'222 BROADWAY, 23RD FLOORNEW YORK, NY 10038', NULL, NULL, NULL, 1, N'chad@wework.com,mei@calcocleaning.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (401, N'WEWORK CONSTRUCTION, LLC', N'115 WEST 18TH STREETNEW YORK, NY 10011', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (402, N'WILLOW GLEN VILLAGE', N'465 WILLOW GLEN WAY SAN JOSE, CA 95125', NULL, NULL, N'(408) 267-7252', 1, N'aparker@related.com')
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (403, N'WLC CONSTRUCTION SERVICES, INC.', N'8163 ROCHERSTER AVENUE, SUITE 101', N'Rancho Cucamonga', N'91730', NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (404, N'WOODLAND ESTATES COMMUNITY', N'70 RAILROAD AVENUE P.O. BOX 669 DANVILLE, CA 94526 OF: (925) 838-2095  FX: (925) 838-2198', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (405, N'WOODLAND ESTATES COMMUNITY ASSOCIATION', N'2494 OAKES DR.', N'Hayward', N'94542', N'(925) 838-2095', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (406, N'WORKSMITH', NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (407, N'WORKSPACE LLC', N'3348 PARADISE DRTIBURON, CA 94920TEL: 415.309.4235', N'Fax:', N'415-435-9818', N'510.760.1081', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (408, N'XL CONSTRUCTION', N'851 BUCKEYE COURTMILPITAS, CA 95035', NULL, NULL, N'(408) 240-6036', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (409, N'ZAKSKORN CONSTRUCTION COMPANY', N'780 W GRAND AVE', N'Oakland', N'94612', N'5104444190', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (410, N'OMAR CORTES CASILLAS A.C. DE C.V.', N'FARO DE ALEJANDRIA 220 A', N'(654) 646-54-54', NULL, N'(222) 222-22-22', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (411, N'MICHAEL ROBERTS CONSTRUCTION, INC.', N'1660 DELL AVE. CAMPBELL, CA 95008', N'(408) 374-36-67', NULL, N'(408) 374-36-62', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (412, N'JS BUILDERS, LLC', N'2600 OLD CROW CANYON RD. SUITE 200, SAN RAMON, CA 94583', NULL, NULL, N'(925) 399-88-11', 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (413, N'SUNDT CONSTRUCTION, INC.', N'2850 GATEWAY OAKS DR. SUITE 450, SACRAMENTO, CA 95833', NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (414, N'SRM CONSTRUCTION, INC.', N'111 N. POST STE.200, SPOKANE, WA 99201', N'(509) 838-09-33', NULL, NULL, 1, NULL)
INSERT [dbo].[Customers] ([ID], [CompanyName], [Address], [City], [Zip], [Phone], [Status], [Email]) VALUES (415, N'JG CONSTRUCTION COMPANY', N'15632 EL PRADO RD. CHINO, CA 91710', NULL, NULL, N'(909) 993-93-93', 1, NULL)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Documents] ON 

INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (1, N'SEGURO EMPRESA', N'android_application_development_cookbook.pdf', N'[BASE_URL]doc/android_application_development_cookbook.pdf', 13, 0, 0, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (2, N'PAPELES DE LA EMPRESA', N'Apache_Cordova_in_Action.pdf', N'[BASE_URL]doc/Apache_Cordova_in_Action.pdf', 13, 0, 0, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (3, N'PROPUESTA', N'Beginning_Node.js.pdf', N'[BASE_URL]doc/Beginning_Node.js.pdf', 0, 0, 14, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (4, N'CONTRATO', N'Dart_in_Action.pdf', N'[BASE_URL]doc/Dart_in_Action.pdf', 0, 0, 14, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (5, N'PROPUESTA', N'Express.js.pdf', N'[BASE_URL]doc/Express.js.pdf', 0, 0, 12, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (6, N'CONTRATO', N'The_Definitive_Guide_to_MongoDB.pdf', N'[BASE_URL]doc/The_Definitive_Guide_to_MongoDB.pdf', 0, 0, 12, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (7, N'PROPUESTA', N'Xamarin_Essentials.pdf', N'[BASE_URL]doc/Xamarin_Essentials.pdf', 0, 0, 13, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (8, N'CONTRATO', N'Write_Web_Apps_with_Dart.pdf', N'[BASE_URL]doc/Write_Web_Apps_with_Dart.pdf', 0, 0, 13, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (9, N'CO T&M', N'ECV_Gullo_Second_Floor_Reno_–_TM_WO_2019_269.pdf', N'[BASE_URL]doc/ECV_Gullo_Second_Floor_Reno_–_TM_WO_2019_269.pdf', 0, 0, 0, 5, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (10, N'CO T&M', N'WO_2019_269_1.pdf', N'[BASE_URL]doc/WO_2019_269_1.pdf', 0, 0, 0, 6, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (11, N'PROPOSAL', N'Starbucks_13557_International_Zinfandel_–_Proposal.docx', N'[BASE_URL]doc/Starbucks_13557_International_Zinfandel_–_Proposal.docx', 0, 0, 19, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (12, N'LOI', N'CA_Commercial_Clean_LOI.PDF', N'[BASE_URL]doc/CA_Commercial_Clean_LOI.PDF', 0, 0, 19, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (13, N'INSURANCE REQUIRED', N'Exhibit_A__SSW_Insurance_Requirements.pdf', N'[BASE_URL]doc/Exhibit_A__SSW_Insurance_Requirements.pdf', 0, 0, 19, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (14, N'PREI-LIM', N'SBUX13557_Pre_Lim_Info.pdf', N'[BASE_URL]doc/SBUX13557_Pre_Lim_Info.pdf', 0, 0, 19, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (15, N'CHANGE ORDER REQUIRED', N'SSW_Change_Order_Procedure.pdf', N'[BASE_URL]doc/SSW_Change_Order_Procedure.pdf', 0, 0, 19, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (16, N'PO', N'SHC_Spect_CT_Expansion_TI_Rm2210___PO.pdf', N'[BASE_URL]doc/SHC_Spect_CT_Expansion_TI_Rm2210___PO.pdf', 0, 0, 17, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (17, N'SUBCONTRACT', N'SBX_5405___Subcontract.pdf', N'[BASE_URL]doc/SBX_5405___Subcontract.pdf', 0, 0, 20, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (18, N'PROPOSAL', N'SBX_5405___Proposal.docx', N'[BASE_URL]doc/SBX_5405___Proposal.docx', 0, 0, 20, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (19, N'INSURANCE', N'SBX_5405___Insurance_2019.pdf', N'[BASE_URL]doc/SBX_5405___Insurance_2019.pdf', 0, 0, 20, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (20, N'WORK ORDER', N'WO2019_75_Final_Clean.pdf', N'[BASE_URL]doc/WO2019_75_Final_Clean.pdf', 0, 0, 20, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (21, N'SUBCONTRACT', N'The_Juice_Company___Mailed_Subcontract.pdf', N'[BASE_URL]doc/The_Juice_Company___Mailed_Subcontract.pdf', 0, 0, 21, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (22, N'PROPOSAL', N'The_Juice_Company___Proposal.docx', N'[BASE_URL]doc/The_Juice_Company___Proposal.docx', 0, 0, 21, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (23, N'INSURANCE', N'The_Juice_Company___COI.pdf', N'[BASE_URL]doc/The_Juice_Company___COI.pdf', 0, 0, 21, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (24, N'WO#2019-154', N'WO2019_154_Final_Clean_1150sf..pdf', N'[BASE_URL]doc/WO2019_154_Final_Clean_1150sf..pdf', 0, 0, 21, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (25, N'PO', N'Philz_Coffee___PO.pdf', N'[BASE_URL]doc/Philz_Coffee___PO.pdf', 0, 0, 23, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (26, N'PROPOSAL', N'Philz_Coffee_–_Proposal.docx', N'[BASE_URL]doc/Philz_Coffee_–_Proposal.docx', 0, 0, 23, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (27, N'INSURANCE', N'Philz_Coffee___Insurance.pdf', N'[BASE_URL]doc/Philz_Coffee___Insurance.pdf', 0, 0, 23, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (28, N'WO#2019-65', N'WO2019_65.pdf', N'[BASE_URL]doc/WO2019_65.pdf', 0, 0, 23, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (29, N'SUBCONTRACT', N'San_Pablo_Hotel___Ex_Subcontract.pdf', N'[BASE_URL]doc/San_Pablo_Hotel___Ex_Subcontract.pdf', 0, 0, 22, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (30, N'INSURANCE', N'San_Pablo_Hotel___Insurance19.pdf', N'[BASE_URL]doc/San_Pablo_Hotel___Insurance19.pdf', 0, 0, 22, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (32, N'PROPOSAL', N'San_Pablo_Hotel___Good_Proposal.docx', N'[BASE_URL]doc/San_Pablo_Hotel___Good_Proposal.docx', 0, 0, 22, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (33, N'PROPOSAL', N'Brookside_Senior_Apts___Subcontract.pdf', N'[BASE_URL]doc/Brookside_Senior_Apts___Subcontract.pdf', 0, 0, 10, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (34, N'PROPOSAL', N'Brookside_Senior_Apartments___Proposal.docx', N'[BASE_URL]doc/Brookside_Senior_Apartments___Proposal.docx', 0, 0, 24, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (35, N'SUBCONTRACT', N'Brookside_Senior_Apts___Subcontract1.pdf', N'[BASE_URL]doc/Brookside_Senior_Apts___Subcontract1.pdf', 0, 0, 24, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (36, N'WO-CO SIGNED', N'Brookside___WO1806_199_1_with_extra.pdf', N'[BASE_URL]doc/Brookside___WO1806_199_1_with_extra.pdf', 0, 0, 0, 7, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (37, N'PROPOSAL', N'SBX_55348___Proposal.docx', N'[BASE_URL]doc/SBX_55348___Proposal.docx', 0, 0, 30, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (38, N'SUBCONTRACT', N'SBX_55348___Subcontract.pdf', N'[BASE_URL]doc/SBX_55348___Subcontract.pdf', 0, 0, 30, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (39, N'WO#SIGNED', N'SBX_55348___Invoice4963.pdf', N'[BASE_URL]doc/SBX_55348___Invoice4963.pdf', 0, 0, 30, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (40, N'WO#217046-1', N'WO217046_1_FinalRough_Clean.jpg', N'[BASE_URL]doc/WO217046_1_FinalRough_Clean.jpg', 0, 0, 15, 0, 0, N'NULL', 0, 1)
INSERT [dbo].[Documents] ([ID], [Name], [Description], [Url], [IDCustomer], [IDProvide], [IDProject], [IDWorkOrder], [IDChangeOrden], [Expiration], [Type], [Status]) VALUES (41, N'WO# 217046-1', N'WO217046_1_FinalRough_Clean1.jpg', N'[BASE_URL]doc/WO217046_1_FinalRough_Clean1.jpg', 0, 0, 0, 1, 0, N'NULL', 0, 1)
SET IDENTITY_INSERT [dbo].[Documents] OFF
GO
SET IDENTITY_INSERT [dbo].[PrintOrdenWorks] ON 

INSERT [dbo].[PrintOrdenWorks] ([ID], [IDWorkOrder], [Compania], [Project], [DatePrint], [Hour], [Contact], [Phone], [Address], [City], [Assigned], [Description], [Change]) VALUES (4, 7, N'SUNSERI CONSTRUCTION', N'BROOKESIDE SENIOR APARTMENT', CAST(N'2019-07-18' AS Date), N'7:00 AM', N'BRODY', N'708.631.8072', N'738 MIKKELSEN DR', N'AUBURN, CA 95603', N'HE', N'&lt;p&gt;&amp;nbsp;FLUFF CLEAN: OHASE #3 bLDG#2&amp;nbsp;&lt;/p&gt;
', N'&lt;p&gt;eXTERIOR SITR CLEANING- DUSTING THE SIDING INTHE CORREDORS SWEEPING THE WALKWAYS AND PICKING UP CONSTRUCTION DEBRIS ARAUND THE PHASE 3 BUILDING. THIS EXTRA WORK REQUEST BY BRODY.&lt;/p&gt;
')
INSERT [dbo].[PrintOrdenWorks] ([ID], [IDWorkOrder], [Compania], [Project], [DatePrint], [Hour], [Contact], [Phone], [Address], [City], [Assigned], [Description], [Change]) VALUES (5, 8, N'SSW CONSTRUCTION CORP', N'PEET', CAST(N'2024-07-19' AS Date), N'7:00 MA', N'CHRIS', N'916.505.2471', N'1145 ALADDIN AVENUE ', N'SAN LEANDRO, CA', N'10:00 PM', NULL, NULL)
INSERT [dbo].[PrintOrdenWorks] ([ID], [IDWorkOrder], [Compania], [Project], [DatePrint], [Hour], [Contact], [Phone], [Address], [City], [Assigned], [Description], [Change]) VALUES (6, 10, N'TRUMARKHOMES', N'SP78', CAST(N'2024-07-19' AS Date), N'7:00AM', N'DANIEL VASQUEZ', N'925.719.1372', N'CORNER OF JULIAN & SAN PEDRO', N'SAN JOSE, CA', N'ISIDRO', N'&lt;p&gt;Block a Building #3 LOT#A308&lt;/p&gt;

&lt;p&gt;Phase II (Pre-Carpet)&lt;/p&gt;

&lt;p&gt;&amp;bull; Clean tub, shower pan, and all surrounds. &amp;bull; Clean thresholds, window tracks, channels, and sills. &amp;bull; Dust entire home including; closets, shelves, cabinet drawers, cabinet doors, cabinet interiors, doors, casings, and base board. &amp;bull; Clean and dust furnace. &amp;bull; Clean toilets, mirrors, lavatories, and countertops. &amp;bull; Thoroughly scrape floors (concrete) and sweep home &amp;bull;&lt;/p&gt;

&lt;p&gt;Power Wash This LOT&lt;/p&gt;
', NULL)
SET IDENTITY_INSERT [dbo].[PrintOrdenWorks] OFF
GO
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (1, N'LATITUDE PH2', N'1277 BABB COURT', N'SAN JOSE CA ', NULL, CAST(N'2018-04-11' AS Date), 54700.0000, 0, 0.0000, 5, 2735.0000, 1, 1, 0, 1, 14, 0.0000, N'&lt;p&gt;&lt;strong&gt;Inclusion: &lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;A.&lt;/strong&gt;&amp;nbsp; One rough clean: (86 residential units and common areas, and parking garage).&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;Sweep all interior floors including patios, porches, storage and hot water heater closet.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Clean all windows on the interior and exterior.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Remove all stickers from glass.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Clean all tracks at windows and doors.&lt;/li&gt;
	&lt;li&gt;Clean all bathrooms. Clean all toilets, showers, and countertops.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Sweep parking garage.&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;B.&lt;/strong&gt;&amp;nbsp;&amp;nbsp; One final clean: (86 residential units and common areas &amp;ndash; excluding parking garage).&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;Remove dust, dirt, grease, stains, fingerprints, labels, spilled and spattered, and other materials from all interior and exterior surfaces exposed to view.&lt;/li&gt;
	&lt;li&gt;Remove all packaging from appliances, and install shelves and accessories for homeowner use.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Place all literature in appliance as designated by Contractor.&lt;/li&gt;
	&lt;li&gt;Clean and polish all appliances.&lt;/li&gt;
	&lt;li&gt;Clean tops, interior, and exterior of all cabinets.&lt;/li&gt;
	&lt;li&gt;Clean and polish all countertops.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Remove countertops protection and place in dumpster.&lt;/li&gt;
	&lt;li&gt;Clean and polish all mirrors.&lt;/li&gt;
	&lt;li&gt;Clean all sheet vinyl and all title flooring.&lt;/li&gt;
	&lt;li&gt;Clean all interior light fixtures and all switch plates.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Remove all labels from lights with the exception of UL Labels and shine bulbs.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Clean all ceiling fans including blades as necessary.&lt;/li&gt;
	&lt;li&gt;Wipe HVAC unit clean.&lt;/li&gt;
	&lt;li&gt;Dust exterior railing systems and entry door.&lt;/li&gt;
	&lt;li&gt;Wipe down and clean all doors, hardware, and shelving.&lt;/li&gt;
	&lt;li&gt;Wipe off the top of all wood base, door casings, window sills, and other trim.&lt;/li&gt;
	&lt;li&gt;Polish all chrome items and sinks.&lt;/li&gt;
	&lt;li&gt;Clean all bathrooms including shower, toilet, accessories, counters, mirrors.&lt;/li&gt;
	&lt;li&gt;Vacuum all exposed to view air grilles and diffusers.&lt;/li&gt;
	&lt;li&gt;Vacuum all carpeted areas.&lt;/li&gt;
	&lt;li&gt;Dust interior railings and entry door.&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;C.&lt;/strong&gt;&amp;nbsp; One fluff clean: (86 residential units and common areas &amp;ndash; excluding parking garage).&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;Touch up kitchens and restrooms.&lt;/li&gt;
	&lt;li&gt;Vacuum carpeted floors and mop all floors.&lt;/li&gt;
	&lt;li&gt;Touch up all mirrors and windows on the interior only.&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;
', N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (2, N'HEALTH SERVICES AGENCY', N'830 SCENIC DR', N'MODESTO CA', NULL, CAST(N'2019-07-18' AS Date), 3800.0000, 0, 0.0000, 5, 190.0000, 2, 1, 0, 2, 1, 0.0000, N'&lt;ol&gt;
	&lt;li&gt;&lt;strong&gt;Inclusion: &lt;/strong&gt;&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&lt;strong&gt;One final cleaning: &lt;/strong&gt;&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;Remove dust, dirt, grease, stains, fingerprints, labels, spilled and spattered, and other materials from all surfaces exposed to view.&lt;/li&gt;
	&lt;li&gt;Clean all floor and mounted fixtures and furniture.&lt;/li&gt;
	&lt;li&gt;Clean and shine all windows on the interior only.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Clean tops, interior, and exterior of all cabinets.&lt;/li&gt;
	&lt;li&gt;Clean all interior light fixtures.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Clean and sanitize restrooms.&lt;/li&gt;
	&lt;li&gt;Wipe down and clean all doors, hardware, and shelving.&lt;/li&gt;
	&lt;li&gt;Wipe off the top of all wood base, door casings, window sills, and other trim.&lt;/li&gt;
	&lt;li&gt;Vacuum, sweep and mop clean all floors.&lt;/li&gt;
	&lt;li&gt;Clean and apply 2 coats of &amp;ldquo;Once a Year&amp;rdquo; floor finish to new VCT floors in rooms 101, 109, 110 and 116 only (+/- 1,000 sf.).&lt;/li&gt;
&lt;/ol&gt;
', N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (3, N'GNC', N'2543 STEVENS CREEK BLVD', N'SAN JOSE CA', NULL, CAST(N'2017-03-17' AS Date), 725.0000, 0, 0.0000, 5, 36.2500, 3, 1, 0, 1, 11, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (4, N'CHARLES APARTMENTS', N'3109 SEACREST AVE', N'MARINA CA 94901', NULL, CAST(N'2019-02-20' AS Date), 60473.0000, 0, 0.0000, 5, 3023.6499, 4, 1, 0, 1, 14, 0.0000, N'&lt;ol&gt;
	&lt;li&gt;&lt;strong&gt;Inclusion: &lt;/strong&gt;&lt;/li&gt;
&lt;/ol&gt;

&lt;ol&gt;
	&lt;li&gt;&lt;strong&gt;One Final Cleaning&lt;/strong&gt;&lt;strong&gt;:&lt;/strong&gt;&amp;nbsp;&lt;/li&gt;
&lt;/ol&gt;

&lt;ol&gt;
	&lt;li&gt;Clean all windows on the interior and exterior.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Remove all packaging from appliances, and install shelves and accessories for homeowner use.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Place all literature in appliance as designated by Contractor.&lt;/li&gt;
	&lt;li&gt;Clean and polish new appliances, countertops, mirrors, sinks &amp;amp; chrome items&lt;/li&gt;
	&lt;li&gt;Wipe clean existing appliances.&lt;/li&gt;
	&lt;li&gt;Clean tops, interior, and exterior of all cabinets.&lt;/li&gt;
	&lt;li&gt;Remove countertops protection and place in dumpster.&lt;/li&gt;
	&lt;li&gt;Vacuum all carpeted areas and mop clean all hard floor.&lt;/li&gt;
	&lt;li&gt;Clean all interior light fixtures.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Clean all ceiling fans including blades as necessary.&lt;/li&gt;
	&lt;li&gt;Clean all switch plates.&lt;/li&gt;
	&lt;li&gt;Wipe HVAC unit clean.&lt;/li&gt;
	&lt;li&gt;Dust interior/exterior railing systems and entry door.&lt;/li&gt;
	&lt;li&gt;Wipe down and clean all doors, hardware, and shelving.&lt;/li&gt;
	&lt;li&gt;Wipe off the top of all wood base, door casings, window sills, and other trim.&lt;/li&gt;
	&lt;li&gt;Clean all bathrooms including shower, toilet, accessories, counters, mirrors.&lt;/li&gt;
	&lt;li&gt;LVT Interface Level Set sweep clean and wet mop using a neutral cleaning solution (pH of 6 - 8) and a microfiber mop.&lt;/li&gt;
&lt;/ol&gt;

&lt;ol&gt;
	&lt;li&gt;&lt;strong&gt;One fluff cleaning&lt;/strong&gt;&lt;strong&gt;:&lt;/strong&gt;&lt;/li&gt;
&lt;/ol&gt;

&lt;ol&gt;
	&lt;li&gt;Vacuum, sweep and mop clean all floors.&lt;/li&gt;
	&lt;li&gt;General light dusting.&lt;/li&gt;
	&lt;li&gt;Touch up restrooms and kitchens.&lt;/li&gt;
	&lt;li&gt;Touch up mirrors and windows (inside only).&lt;/li&gt;
&lt;/ol&gt;
', N'OCIP GL', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (5, N'RENOVATION OF BLDG #100', N'25600 CHRISMAN RD', N'TRACY CA', NULL, CAST(N'2018-02-18' AS Date), 3000.0000, 0, 0.0000, 5, 150.0000, 7, 1, 0, 2, 4, 0.0000, N'&lt;ol&gt;
	&lt;li&gt;&lt;strong&gt;Inclusion: &lt;/strong&gt;&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&lt;strong&gt;One final cleaning: &lt;/strong&gt;&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;Remove dust, dirt, grease, stains, fingerprints, labels, spilled and spattered, and other materials from all interior and exterior surfaces exposed to view.&lt;/li&gt;
	&lt;li&gt;Clean all floor and mounted fixtures and furniture.&lt;/li&gt;
	&lt;li&gt;Clean and shine glazing and framing (interior and exterior).&lt;/li&gt;
	&lt;li&gt;Clean tops, interior, and exterior of all cabinets and closets.&lt;/li&gt;
	&lt;li&gt;Clean all walls, doors, frames and hardware surfaces.&lt;/li&gt;
	&lt;li&gt;Clean wall/floor baseboards.&lt;/li&gt;
	&lt;li&gt;Clean interior light fixtures.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Clean all switch plates.&lt;/li&gt;
	&lt;li&gt;Vacuum, sweep, dry mop and wet mop all floor surfaces.&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;
', N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (6, N'SANTE NUTS', N'491 LAURELWOOD RD', N'SANTA CLARA CA', NULL, CAST(N'2016-05-14' AS Date), 8640.0000, 0, 0.0000, 5, 432.0000, 10, 4, 0, 1, 19, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (7, N'DIGNITY SHELL', N'7115 GREENBACK LN ', N'CITRUS HEIGTHS CA', NULL, CAST(N'2018-05-10' AS Date), 12400.0000, 0, 0.0000, 5, 620.0000, 11, 4, 0, 1, 15, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (8, N'LOOMIS TI', N'27229 INDUSTRIAL BLVD HAYWARD CA 84545', NULL, NULL, CAST(N'2019-02-19' AS Date), 13500.0000, 0, 0.0000, 5, 675.0000, 11, 4, 0, 1, 15, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (9, N'SIERRA VISTA APARMENTS 1<BR/>TIME: 0 HRS<BR/>AMOUNT: $0.00<BR/>TOTAL WO: 0 HRS', N'1520 11TH ST', N'STOCKTON, CA 95206', NULL, CAST(N'2018-05-02' AS Date), 68000.0000, 0, 0.0000, 5, 3400.0000, 12, 1, 0, 2, 23, 0.0000, N'&lt;p&gt;&lt;strong&gt;I.&amp;nbsp;&amp;nbsp;&amp;nbsp; Inclusion: &lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;A.&lt;/strong&gt;&amp;nbsp; One Rough Clean (115 residential units and community center).&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;Sweep all interior floors including patios, porches, and storage.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Clean all windows on the interior and exterior.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Remove all stickers from glass.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Clean all tracks at windows and doors.&lt;/li&gt;
	&lt;li&gt;Clean all bathrooms. Clean all toilets, showers, and countertops.&amp;nbsp;&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;B.&lt;/strong&gt;&amp;nbsp;&amp;nbsp; One final clean (115 residential units and community center).&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;Remove dust, dirt, grease, stains, fingerprints, labels, spilled and spattered, and other materials from all interior and exterior surfaces exposed to view.&lt;/li&gt;
	&lt;li&gt;Remove all packaging from appliances, and install shelves and accessories for homeowner use.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Place all literature in appliance as designated by Contractor.&lt;/li&gt;
	&lt;li&gt;Clean and polish all appliances.&lt;/li&gt;
	&lt;li&gt;Clean tops, interior, and exterior of all cabinets.&lt;/li&gt;
	&lt;li&gt;Clean and polish all countertops.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Remove countertops protection and place in dumpster.&lt;/li&gt;
	&lt;li&gt;Clean and polish all mirrors.&lt;/li&gt;
	&lt;li&gt;Clean all sheet vinyl and all title flooring.&lt;/li&gt;
	&lt;li&gt;Clean all interior light fixtures and all switch plates.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Remove all labels from lights with the exception of UL Labels and shine bulbs.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Clean all ceiling fans including blades as necessary.&lt;/li&gt;
	&lt;li&gt;Wipe HVAC unit clean.&lt;/li&gt;
	&lt;li&gt;Dust exterior railing systems and entry door.&lt;/li&gt;
	&lt;li&gt;Wipe down and clean all doors, hardware, and shelving.&lt;/li&gt;
	&lt;li&gt;Wipe off the top of all wood base, door casings, window sills, and other trim.&lt;/li&gt;
	&lt;li&gt;Polish all chrome items and sinks.&lt;/li&gt;
	&lt;li&gt;Clean all bathrooms including shower, toilet, accessories, counters, mirrors.&lt;/li&gt;
	&lt;li&gt;Vacuum all exposed to view air grilles and diffusers.&lt;/li&gt;
	&lt;li&gt;Vacuum all carpeted areas.&lt;/li&gt;
	&lt;li&gt;Dust interior railings and entry door.&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;C.&lt;/strong&gt;&amp;nbsp; One Fluff clean: (115 residential units and community center).&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;Touch up kitchens and restrooms.&lt;/li&gt;
	&lt;li&gt;Vacuum carpeted floors and mop all floors.&lt;/li&gt;
	&lt;li&gt;Touch up all mirrors and windows on the interior only.&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;
', N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (10, N'SIERRA VISTA APARTMENTS 2', N'2445 VOLNEY ST.', N'STOCKTON, CA 95206', NULL, CAST(N'2019-05-23' AS Date), 66000.0000, 0, 0.0000, 5, 3300.0000, 12, 1, 0, 2, 23, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (11, N'SP78', N'CORNER OF JULIAN AND SAN PEDRO', N'SAN JOSE CA', NULL, CAST(N'2018-12-28' AS Date), 68500.0000, 0, 0.0000, 5, 3425.0000, 377, 1, 0, 1, 19, 0.0000, N'&lt;p&gt;All work to be performed at finished location. &lt;strong&gt;Minimum of 3 units per mobilization.&lt;/strong&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;Wage rate:&amp;nbsp; This is not a prevailing wage proposal. Non-Union.&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;TRADE CONTRACTOR agrees that Final Cleaning shall be performed in four &amp;ndash; (4) phases:&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Phase I (Rough Clean &amp;ndash; After Interior Paint) &lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;bull; Clean windows, French doors, and exterior doors inside and out, including tracks, channels, frames, glass, weep holes, etc. &amp;bull; Clean all bathtubs and shower pans. &amp;bull; Sweep out home and place debris in garage.&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Phase II (Pre-Carpet) &lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;bull; Clean tub, shower pan, and all surrounds. &amp;bull; Clean thresholds, window tracks, channels, and sills. &amp;bull; Dust entire home including; closets, shelves, cabinet drawers, cabinet doors, cabinet interiors, doors, casings, and base board. &amp;bull; Clean and dust furnace. &amp;bull; Clean toilets, mirrors, lavatories, and countertops. &amp;bull; Thoroughly scrape floors (concrete) and sweep home.&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Phase III (Final Clean &amp;ndash; After Carpet) &lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;bull; Re-clean windows and French doors as required. &amp;bull; Vacuum and clean sills and thresholds. &amp;bull; Clean vanity and kitchen counter tops &amp;amp; sinks. &amp;bull; Clean tubs, showers, sinks, lavatories, water closets, and all bathroom fixtures &amp;amp; accessories. &amp;bull; Clean and polish bath fixtures per manufacturer&amp;rsquo;s requirements. &amp;bull; Dust all doors, closet shelves, and poles. &amp;bull; Wipe down all woodwork per manufacturer&amp;rsquo;s requirements. &amp;bull; Clean and dust all millwork, wood trim, and cabinets.&amp;nbsp; Clean cabinets inside and out. &amp;bull; Clean and dust all light fixtures, glass, and appliances. &amp;bull; Vacuum carpet and clean all hard surface flooring. &amp;bull; Remove all stickers from hardware, light fixtures, appliances, windows, and doors. &amp;bull; Clean all hardware including; knobs, strike plates, bolts, hinges, etc. &amp;bull; Clean all electrical plates and door chimes. &amp;bull; Pressure-wash all concrete including; garage, porches, patios, and driveway.&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Phase IV (Pre-Walk Fluff&lt;/strong&gt;)&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;bull; Vacuum carpet and clean all hard surface floors throughout the home. &amp;bull; Clean vanity and kitchen countertops and sinks. &amp;bull; Clean all tubs, showers, lavatories, water closets, and all bathroom fixtures and accessories. &amp;bull; Rewash all windows, sliding glass doors, and French doors including weeps. &amp;bull; Hose down garage, porches, sidewalks, and driveway.&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;
', N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (12, N'OMAR CORTES CASILLAS', N'FARO DE ALEJANDRIA 220 A', N'LEÓN', NULL, CAST(N'2018-07-20' AS Date), 104585.4766, 0, 0.0000, 5, 5229.2700, 410, 3, 0, 1, 14, 0.0000, NULL, N'OCIP Our', 2)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (13, N'CORTES CASILLAS OMAR', N'FARO DE ALEJANDRIA 220 A', N'LEÓN', NULL, CAST(N'2018-06-05' AS Date), 365948.8750, 0, 0.0000, 5, 18297.4395, 410, 2, 0, 2, 1, 0.0000, NULL, N'OCIP Our', 2)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (14, N'COCO OMAR CORTES CASILLAS', N'FARO DE ALEJANDRIA 220 A', N'LEÓN', NULL, CAST(N'2019-07-22' AS Date), 568987.8750, 0, 0.0000, 5, 28449.3906, 410, 3, 0, 1, 14, 0.0000, NULL, N'OCIP Our', 2)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (15, N'CLEARWATER AT SONOMA HILLS', N'710 ROHNERT PARK EXPY. EAST', N' ROHNERT PARK, CA 94928', NULL, CAST(N'2019-07-22' AS Date), 43500.0000, 0, 0.0000, 5, 2175.0000, 212, 2, 0, 1, 14, 0.0000, N'&lt;p&gt;This proposal is to complete one rough, final &amp;amp; fluff clean of all interior areas of a new two story building. Consisting of 90 units &amp;amp; 114 bed assisted living &amp;amp; memory care facility (+/-96,450sf.). Cleaning to include all common and private areas, including 2 elevators, offices, storage and mechanical rooms etc.&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;All work to be performed at finished location.&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Wage Rate:&lt;/strong&gt;&amp;nbsp; &lt;em&gt;This is not a Prevailing wage proposal&lt;/em&gt;.&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;&lt;strong&gt;Inclusion: &lt;/strong&gt;&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&lt;strong&gt;A.&lt;/strong&gt;&amp;nbsp; &lt;strong&gt;One Rough Clean:&lt;/strong&gt; &lt;em&gt;All units, offices, elevators and Bldg. common areas&lt;/em&gt;&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;Sweep all interior floors including storage/utility rooms, common areas, kitchens &amp;amp; offices.&lt;/li&gt;
	&lt;li&gt;Clean all windows - interior &amp;amp; exterior.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Remove all stickers from glass and any warranty or manuals to be handed to KPRS in packages per areas removed.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Clean all tracks at windows and doors.&lt;/li&gt;
	&lt;li&gt;Clean all bathrooms; toilets, showers, countertops and finish hardware&amp;nbsp;&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;B.&lt;/strong&gt;&amp;nbsp;&amp;nbsp; &lt;strong&gt;One Final Clean&lt;/strong&gt;:&lt;em&gt; &lt;/em&gt;&lt;em&gt;All units, offices, elevators and Bldg. common areas&lt;/em&gt;&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;Remove dust, dirt, grease, stains, fingerprints, labels, spilled and spattered, and other materials from all interior and exterior surfaces exposed to view.&lt;/li&gt;
	&lt;li&gt;Clean and polish all appliances, countertops, mirrors, sinks, elevators &amp;amp; other chrome items.&lt;/li&gt;
	&lt;li&gt;Clean tops, interior, and exterior of all cabinets.&lt;/li&gt;
	&lt;li&gt;Clean all interior light fixtures and all switch plates.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Remove all labels from lights except for UL Labels and shine bulbs.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Dust interior &amp;amp; exterior railing systems and entry door.&lt;/li&gt;
	&lt;li&gt;Wipe down and clean all doors, hardware, and shelving.&lt;/li&gt;
	&lt;li&gt;Wipe off the top of all wood base, door casings, window sills, and other trim.&lt;/li&gt;
	&lt;li&gt;Clean all bathrooms including shower, toilet, accessories, counters, mirrors.&lt;/li&gt;
	&lt;li&gt;Vacuum all exposed to view air grilles and diffusers.&lt;/li&gt;
	&lt;li&gt;Feather dust blinds and shades.&lt;/li&gt;
	&lt;li&gt;Wipe clean unit&amp;rsquo;s entry doors.&lt;/li&gt;
	&lt;li&gt;Sweep &amp;amp; mop all hard floor surfaces using Wet Swifter &amp;amp; vacuum any carpeted areas.&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;C.&amp;nbsp;&amp;nbsp; &lt;/strong&gt;&lt;strong&gt;Fluff Clean:&lt;/strong&gt; &lt;em&gt;All units, offices, elevators and Bldg. common areas&lt;/em&gt;&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;Touch up interior windows&lt;/li&gt;
	&lt;li&gt;Touch up kitchens and restrooms.&lt;/li&gt;
	&lt;li&gt;Vacuum carpeted floors and mop all floors.&lt;/li&gt;
	&lt;li&gt;Touch up all mirrors and windows on the interior only.&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;
', N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (16, N'DEPARTMENT OF TAX AND COLLECTIONS TI', N'852 NORTH FIRST STREET', N'SAN JOSE, CA ', NULL, CAST(N'2019-06-19' AS Date), 12500.0000, 0, 0.0000, 5, 625.0000, 94, 1, 0, 1, 15, 0.0000, N'&lt;p&gt;This proposal is to complete one final cleaning of 4 stories building (22,103 sf).&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;All work to be performed at finished location.&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Wage rate:&lt;/strong&gt;&amp;nbsp; This is a prevailing wage proposal. Non-Union. No PLA or PSA and any Union requirements included.&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;&lt;strong&gt;Inclusion: One final cleaning: &lt;/strong&gt;&lt;/li&gt;
&lt;/ol&gt;

&lt;ol&gt;
	&lt;li&gt;Clean floor and mounted fixtures and furniture.&lt;/li&gt;
	&lt;li&gt;Clean and sanitize restrooms.&lt;/li&gt;
	&lt;li&gt;Clean tops, interior, and exterior of cabinets.&lt;/li&gt;
	&lt;li&gt;Clean walls, doors, frames, and hardware surfaces.&lt;/li&gt;
	&lt;li&gt;Clean and shine all glazing and framing (interior and exterior).&lt;/li&gt;
	&lt;li&gt;Clean wall/floor baseboards.&lt;/li&gt;
	&lt;li&gt;Clean interior light fixtures.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Clean all switch plates.&lt;/li&gt;
	&lt;li&gt;Vacuum, sweep, dry mop, and wet mop floor surfaces.&lt;/li&gt;
	&lt;li&gt;Apply 2 coats of Armstrong floor finish on new VCT floor at storage rooms and IT closet only (397 sf.)&lt;/li&gt;
&lt;/ol&gt;
', N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (17, N'SHC-SPECT CT ROOM 2210', N'300 PASTTEUR DR', N'PALO ALTA CA 94305', NULL, CAST(N'2019-06-26' AS Date), 700.0000, 0, 0.0000, 5, 35.0000, 118, 1, 0, 1, 20, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (18, N'EVA GULLO 2ND FLOOR RENOVATION', N'3095 YERBA BUENA RD', N'SAN JOSE CA', NULL, CAST(N'2019-04-19' AS Date), 4000.0000, 0, 0.0000, 5, 200.0000, 289, 1, 0, 1, 19, 0.0000, N'&lt;p&gt;This proposal is to complete one final cleaning of 2nd floor upper lobby, student&amp;rsquo;s offices and lounge, stairs and 2 storage rooms only (4,950 sf&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;I. Inclusion: One final cleaning:&amp;nbsp;&lt;/p&gt;

&lt;p&gt;1. Clean floor and mounted fixtures and furniture.&lt;/p&gt;

&lt;p&gt;2. Clean tops, interior, and exterior of cabinets.&lt;/p&gt;

&lt;p&gt;3. Clean walls, doors, frames, and hardware surfaces.&lt;/p&gt;

&lt;p&gt;4. Clean and shine all glazing and framing (interior only).&lt;/p&gt;

&lt;p&gt;5. Clean wall/floor baseboards.&lt;/p&gt;

&lt;p&gt;6. Clean interior light fixtures.&amp;nbsp;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;7. Clean all switch plates. Vacuum, sweep, dry mop, and wet mop all floor surfaces. Apply 3 coats of Armstrong floor polish on new resilient floors (2,700 sf.).&lt;/p&gt;
', N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (19, N'STARBUCKS#13557 - RANCHO CORDOVA', N'3195 ZINFANDEL DR. #1', N'RANCHO CORDOVA, CA 95670', NULL, CAST(N'2019-07-22' AS Date), 1600.0000, 0, 0.0000, 5, 80.0000, 342, 1, 0, 1, 8, 0.0000, N'&lt;p&gt;&lt;strong&gt;This proposal is to complete one final and one fluff cleaning of store (1,602 sf.).&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;All work to be performed at finished location. Includes 2 mobilizations only.&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Wage rate:&lt;/strong&gt;&amp;nbsp; This is not a prevailing wage proposal. Non-Union. All sale taxes included.&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;&lt;strong&gt;Inclusion: &lt;/strong&gt;&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&lt;strong&gt;A.&lt;/strong&gt;&lt;strong&gt;&amp;nbsp; One Final Cleaning:&lt;/strong&gt;&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;Clean and shine all glass mirrors and glazing and framing (interior and exterior).&lt;/li&gt;
	&lt;li&gt;Clean and sanitize restrooms.&lt;/li&gt;
	&lt;li&gt;Clean all floor and mounted fixtures and furniture.&lt;/li&gt;
	&lt;li&gt;Clean all doors, frames and hardware surfaces.&lt;/li&gt;
	&lt;li&gt;Clean wall/floor baseboards.&lt;/li&gt;
	&lt;li&gt;Clean interior light fixtures.&lt;/li&gt;
	&lt;li&gt;Clean all switch plates.&lt;/li&gt;
	&lt;li&gt;Vacuum, sweep, dry mop and wet mop all floor surfaces.&lt;/li&gt;
	&lt;li&gt;Machine deep scrub hard floor areas.&lt;/li&gt;
	&lt;li&gt;Pressure wash sidewalks and outdoor sitting area.&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;B.&lt;/strong&gt;&lt;strong&gt; One Fluff cleaning: &lt;/strong&gt;&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;Touch up windows (inside only).&lt;/li&gt;
	&lt;li&gt;Mop clean all hard floors.&lt;/li&gt;
	&lt;li&gt;Touch up restrooms.&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;&lt;strong&gt;Base bid amount:&lt;/strong&gt; &lt;strong&gt;$1,600.00&lt;/strong&gt;&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;Add Alt price to acid wash base tiles: $500.00 (not included in base bid amount)&lt;/p&gt;
', N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (20, N'STARBUCKS#5405 - SAN FRANCISCO', N'1401 VAN NESS AVE.', N'SAN FRANCISCO, CA', NULL, CAST(N'2019-07-23' AS Date), 1375.0000, 0, 0.0000, 5, 68.7500, 147, 1, 0, 1, 8, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (21, N'THE JUICE COMPANY', N'1670 E. MONTE VISTA AVE. #12', N'VACAVILLE, CA 95678', NULL, CAST(N'2019-07-23' AS Date), 975.0000, 0, 0.0000, 5, 48.7500, 290, 1, 0, 1, 17, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (22, N'SAN PABLO HOTEL', N'1955 SAN PABLO AVE.', N'OAKLAND, CA 94612', NULL, CAST(N'2019-07-23' AS Date), 50000.0000, 0, 0.0000, 5, 2500.0000, 91, 1, 0, 2, 23, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (23, N'PHILZ COFFEE - SAN FRANCISCO<BR/>TIME: 0 HRS<BR/>AMOUNT: $0.00<BR/>TOTAL WO: 0 HRS', N'1258 MINNESOTA ST.', N'SAN FRANCISCO, CA 94107', NULL, CAST(N'2019-07-23' AS Date), 2150.0000, 0, 0.0000, 5, 107.5000, 342, 1, 0, 1, 8, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (24, N'BROOKESIDE SENIOR APARTMENT', N'738 MIKKEISEN DR', N'AUBURN CA 95603', NULL, CAST(N'2018-11-23' AS Date), 21850.0000, 0, 0.0000, 5, 1092.5000, 348, 1, 0, 0, 19, 0.0000, N'&lt;p&gt;This proposal is to complete final and one fluff cleaning of 32 &amp;ndash; 1bedroom (616 sf. each) and 16 &amp;ndash; 2 bedrooms units (728 sf. each) and office, community areas and common areas. Total project: 33,430 sf. in 2 and 3 stories building.&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;All work to be performed at finished location in 4 Phases. Includes a total of 12 mobilizations, 3 per each Phase.&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Wage rate:&lt;/strong&gt;&amp;nbsp; This is not a prevailing wage proposal. Non-union.&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;&lt;strong&gt;Inclusion: &amp;nbsp;&lt;/strong&gt;&lt;/li&gt;
&lt;/ol&gt;

&lt;ol&gt;
	&lt;li&gt;&lt;strong&gt;Rough Clean (32 units, office, community areas and common areas).&lt;/strong&gt;&lt;/li&gt;
&lt;/ol&gt;

&lt;ol&gt;
	&lt;li&gt;Sweep interior floors including patios, porches, storage and hot water heater closet.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Clean all windows on the interior and exterior.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Remove all stickers from glass.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Clean all tracks at windows and doors.&lt;/li&gt;
	&lt;li&gt;Clean all bathrooms. Clean all toilets, showers, and countertops. &amp;nbsp;&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;B.&lt;/strong&gt;&amp;nbsp;&amp;nbsp; &lt;strong&gt;Final Clean &lt;/strong&gt;&lt;strong&gt;(32 units, office, community areas and common areas).&lt;/strong&gt;&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;Remove all debris from interiors.&lt;/li&gt;
	&lt;li&gt;Place debris in the dumpster provided by Contractor.&lt;/li&gt;
	&lt;li&gt;Wipe down and remove dirt from interior horizontal and vertical surfaces, including, but not limited to, walls, doors, countertops, cabinets, cabinet shelves, cabinet drawers, mirrors, and trim.&lt;/li&gt;
	&lt;li&gt;Clean plumbing fixtures, including toilets, sinks, faucets, and showers and tubs (including removal of labels, stickers and light rust spots at tubs).&lt;/li&gt;
	&lt;li&gt;Clean light fixtures of dust and debris.&lt;/li&gt;
	&lt;li&gt;Remove packing material and manufacturer&amp;rsquo;s stickers from appliances, and clean inside and outside.&lt;/li&gt;
	&lt;li&gt;Save Operations and Maintenance documentation shipped with the appliances and turn over to General Contractor.&lt;/li&gt;
	&lt;li&gt;Clean and polish stainless steel, including but not limited to, sinks and appliances.&lt;/li&gt;
	&lt;li&gt;Vacuum, sweep &amp;amp; mop floors as required&lt;/li&gt;
	&lt;li&gt;Clean entryways and patios.&lt;/li&gt;
	&lt;li&gt;Provide thorough cleaning of thresholds.&lt;/li&gt;
	&lt;li&gt;Polish transparent and glossy surfaces.&lt;/li&gt;
	&lt;li&gt;Clean, dust and vacuum interior stairwells and wipe down handrails.&lt;/li&gt;
	&lt;li&gt;Sweep and dust decks, patios, common stairwells.&lt;/li&gt;
	&lt;li&gt;Clean and dust storage rooms.&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;C.&amp;nbsp; Fluff Clean: (32 units, office, community areas and common areas).&lt;/strong&gt;&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;Touch up kitchens and restrooms.&lt;/li&gt;
	&lt;li&gt;Vacuum carpeted floors and mop all floors.&lt;/li&gt;
	&lt;li&gt;Touch up all mirrors and windows on the interior only.&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;
', N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (25, N'PEETS COFFEE#1814 - ROSEVILLE"', N'1198 ROSEVILLE PARKWAY, SUITE 175', N'ROSEVILLE, CA 95678', NULL, CAST(N'2019-07-10' AS Date), 1500.0000, 0, 0.0000, 5, 75.0000, 342, 1, 0, 1, 8, 0.0000, N'&lt;p&gt;&lt;strong&gt;This proposal is to complete one final Cleaning of a 1,672-sf. store&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;All work to be performed at finished location&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Wage rate:&lt;/strong&gt;&amp;nbsp; This is not a prevailing wage proposal.&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;I.&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; Inclusion:&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;A. Final Cleaning:&lt;/strong&gt;&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;Clean all exposed surface.&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Clean display and sales area, bar, caf&amp;eacute; seating area, and workroom.&lt;/li&gt;
	&lt;li&gt;Clean and sanitize restrooms.&lt;/li&gt;
	&lt;li&gt;Dust and clean all floor and mounted fixtures and furniture.&lt;/li&gt;
	&lt;li&gt;Clean and shine all glass mirrors and glazing and framing (interior and exterior).&lt;/li&gt;
	&lt;li&gt;Clean wall/floor baseboards.&lt;/li&gt;
	&lt;li&gt;Vacuum, sweep, dry mop and wet mop all floor surfaces.&lt;/li&gt;
	&lt;li&gt;Clean back of the store.&lt;/li&gt;
	&lt;li&gt;Power wash sidewalk and outdoor sitting area only.&lt;/li&gt;
	&lt;li&gt;Machine scrub tile floors.&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;&lt;strong&gt;One Fluff Cleaning:&lt;/strong&gt;&lt;/li&gt;
&lt;/ol&gt;

&lt;ol&gt;
	&lt;li&gt;Vacuum, sweep and mop clean all floors.&lt;/li&gt;
	&lt;li&gt;Touch up windows and mirrors (interior only).&lt;/li&gt;
	&lt;li&gt;Touch up restrooms.&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;
', N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (26, N'COREPOWER YOGA - GRAND LAKE STUDIO', N'3265 GRAND AVE., OAKLAND, CA 94610', N' OAKLAND, CA 94610', NULL, CAST(N'2019-06-25' AS Date), 1700.0000, 0, 0.0000, 5, 85.0000, 8, 2, 0, 1, 15, 0.0000, N'&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;This proposal is to complete one final clean of site after construction. All work to be completed at the listed address +/-3,752sf.&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;&lt;em&gt;Wage rate:&amp;nbsp; This is not a prevailing wage proposal.&lt;/em&gt;&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Inclusion&lt;/strong&gt;&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;&lt;strong&gt;Final Cleaning:&lt;/strong&gt;&lt;/li&gt;
&lt;/ol&gt;

&lt;ol&gt;
	&lt;li&gt;Remove dust, dirt, grease, stains, fingerprints, labels, spilled and spattered, and other materials from all surfaces exposed to view&lt;/li&gt;
	&lt;li&gt;Clean and polish all glazing, mirrors, sinks and any other stainless-steel surfaces&lt;/li&gt;
	&lt;li&gt;Clean all windows - interior and exterior&lt;/li&gt;
	&lt;li&gt;Clean all floor and mounted fixtures including switch plates&lt;/li&gt;
	&lt;li&gt;Clean all doors, door casings and hardware&lt;/li&gt;
	&lt;li&gt;Vacuum, sweep and mop clean all floor surfaces&lt;/li&gt;
	&lt;li&gt;Clean all casework, drawers and cabinets inside and out&lt;/li&gt;
	&lt;li&gt;Clean all areas, including storage and utilities rooms &amp;amp; office&lt;/li&gt;
	&lt;li&gt;Clean and sanitize restrooms&lt;/li&gt;
&lt;/ol&gt;
', N'OCIP Our', 3)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (27, N'DISTRICT OFFICES TRAINING CENTER REMODEL – SAN LEANDRO', N'1145 ALADDIN AVENUE SAN LEANDRO, CA', N'SAN LEANDRO, CA', NULL, CAST(N'2018-12-27' AS Date), 1950.0000, 0, 0.0000, 5, 97.5000, 48, 1, 0, 2, 2, 0.0000, N'&lt;p&gt;This proposal is to complete one final cleaning of area of work only (3,149 sf.). &amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;All work to be performed at finished location&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Wage Rate:&lt;/strong&gt;&amp;nbsp; This is a prevailing wage proposal. Non-Union. Addendum 1, 2, 2 issued by RGM, 3 viewed.&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;&lt;strong&gt;Inclusion: &lt;/strong&gt;&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&lt;strong&gt;One Final Clean: &lt;/strong&gt;&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;Clean all floor and mounted fixtures and furniture.&lt;/li&gt;
	&lt;li&gt;Clean and sanitize restrooms.&lt;/li&gt;
	&lt;li&gt;Clean and shine glazing (interior and exterior).&lt;/li&gt;
	&lt;li&gt;Clean tops, interior, and exterior of all cabinets and closets.&lt;/li&gt;
	&lt;li&gt;Clean all walls, doors, frames and hardware surfaces.&lt;/li&gt;
	&lt;li&gt;Clean wall/floor baseboards.&lt;/li&gt;
	&lt;li&gt;Clean interior light fixtures.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Clean all switch plates.&lt;/li&gt;
	&lt;li&gt;Vacuum, sweep, dry mop and wet mop all floor surfaces.&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;&lt;strong&gt;Base bid amount:&lt;/strong&gt;&lt;strong&gt; $1,950.00&lt;/strong&gt;&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; District Offices Training Center Remodel &amp;ndash; San Leandro&lt;/p&gt;
', N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (28, N'COREPOWER YOGA - GRAND LAKE STUDIO', N'3265 GRAND AVE', N' OAKLAND, CA 94610', NULL, CAST(N'2019-06-25' AS Date), 1700.0000, 0, 0.0000, 5, 85.0000, 8, 2, 0, 1, 19, 0.0000, N'&lt;p&gt;This proposal is to complete one final clean of site after construction. All work to be completed at the listed address +/-3,752sf.&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;&lt;em&gt;Wage rate:&amp;nbsp; This is not a prevailing wage proposal.&lt;/em&gt;&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Inclusion&lt;/strong&gt;&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;&lt;strong&gt;Final Cleaning:&lt;/strong&gt;&lt;/li&gt;
&lt;/ol&gt;

&lt;ol&gt;
	&lt;li&gt;Remove dust, dirt, grease, stains, fingerprints, labels, spilled and spattered, and other materials from all surfaces exposed to view&lt;/li&gt;
	&lt;li&gt;Clean and polish all glazing, mirrors, sinks and any other stainless-steel surfaces&lt;/li&gt;
	&lt;li&gt;Clean all windows - interior and exterior&lt;/li&gt;
	&lt;li&gt;Clean all floor and mounted fixtures including switch plates&lt;/li&gt;
	&lt;li&gt;Clean all doors, door casings and hardware&lt;/li&gt;
	&lt;li&gt;Vacuum, sweep and mop clean all floor surfaces&lt;/li&gt;
	&lt;li&gt;Clean all casework, drawers and cabinets inside and out&lt;/li&gt;
	&lt;li&gt;Clean all areas, including storage and utilities rooms &amp;amp; office&lt;/li&gt;
	&lt;li&gt;Clean and sanitize restrooms
	&lt;p&gt;&amp;nbsp;&lt;/p&gt;
	&lt;/li&gt;
&lt;/ol&gt;
', N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (29, N'HOOKSTON<BR/>TIME: 0 HRS<BR/>AMOUNT: $0.00<BR/>TOTAL WO: 0 HRS', N'80 W HOOKSTON RD', N' PLEASANT HILL, CA', NULL, CAST(N'2019-02-19' AS Date), 42000.0000, 0, 0.0000, 5, 2100.0000, 91, 1, 0, 2, 23, 0.0000, N'&lt;p&gt;This proposal is to complete one (1) final and one (1) fluff cleaning of 100 residential units (84 - 1 bed and 16 &amp;ndash; 2 bed) averaging 562 sf. each in 6 &amp;ndash; 2 stories buildings plus a community room, laundry rooms, manager&amp;rsquo;s office and circulation areas, stairwells, corridors, and elevators. Total project 68,738 sf.&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;All work to be performed at finished location. Minimum of 1 building per mobilization.&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Wage Rate:&lt;/strong&gt;&amp;nbsp; &lt;em&gt;This is a prevailing wage proposal&lt;/em&gt;. Non-union. Addendum 1, 2 ,3, 4, 5, 6 reviewed.&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;&lt;strong&gt;Inclusion: &lt;/strong&gt;&lt;/li&gt;
&lt;/ol&gt;

&lt;ol&gt;
	&lt;li&gt;&lt;strong&gt;One Final Cleaning of 100 units plus community room, laundry rooms, manager&amp;rsquo;s office and circulation areas, stairwells, corridors, and elevators:&lt;/strong&gt;&amp;nbsp; &amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/li&gt;
&lt;/ol&gt;

&lt;ol&gt;
	&lt;li&gt;Clean all windows on the interior and exterior.&lt;/li&gt;
	&lt;li&gt;Remove all packaging from appliances, and install shelves and accessories for homeowner use.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Place all literature in appliance as designated by Contractor.&lt;/li&gt;
	&lt;li&gt;Clean and polish all appliances &amp;ndash; exterior only.&lt;/li&gt;
	&lt;li&gt;Clean tops, interior, and exterior of all cabinets.&lt;/li&gt;
	&lt;li&gt;Clean and polish all countertops.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Remove countertops protection and place in dumpster.&lt;/li&gt;
	&lt;li&gt;Clean and polish all mirrors.&lt;/li&gt;
	&lt;li&gt;Clean all hard floor.&lt;/li&gt;
	&lt;li&gt;Clean all interior light fixtures and all switch plates.&lt;/li&gt;
	&lt;li&gt;Wipe down and clean all doors, hardware, and shelving.&lt;/li&gt;
	&lt;li&gt;Vacuum and mop all floors.&lt;/li&gt;
	&lt;li&gt;Wipe off the top of all wood base, door casings, window sills, and other trim.&lt;/li&gt;
	&lt;li&gt;Polish all chrome items and sinks.&lt;/li&gt;
	&lt;li&gt;Clean all bathrooms including bath, toilet, accessories, counters, mirrors.&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;B.&amp;nbsp; One fluff cleaning: 100 units plus community room, laundry rooms, manager&amp;rsquo;s office and circulation areas, stairwells, corridors, and elevators:&lt;/strong&gt;&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;Touch up kitchens and restrooms&lt;/li&gt;
	&lt;li&gt;Vacuum and mop all floors.&lt;/li&gt;
	&lt;li&gt;Touch up all mirrors and windows on the interior only.&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;
', N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (30, N'STARBUCKS 55348   – SCOTTS VALLEY<BR/>TIME: 0 HRS<BR/>AMOUNT: $0.00<BR/>TOTAL WO: 0 HRS', N'260 MOUNT HERMON ROAD ', N' SCOTTS VALLEY, CA  ', NULL, CAST(N'2019-01-17' AS Date), 2150.0000, 0, 0.0000, 5, 107.5000, 396, 1, 0, 1, 8, 0.0000, N'&lt;p&gt;&lt;strong&gt;This proposal is to complete one final Cleaning of TI area 2,434 sf.&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;All work to be performed at finished location&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Wage Rate:&lt;/strong&gt;&amp;nbsp; This is not a prevailing wage proposal.&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;I.&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; Inclusion:&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;A. Final Cleaning:&lt;/strong&gt;&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;Clean all exposed surface.&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Clean display and sales area, bar, caf&amp;eacute; seating area, and workroom.&lt;/li&gt;
	&lt;li&gt;Clean and sanitize restrooms.&lt;/li&gt;
	&lt;li&gt;Dust and clean all floor and mounted fixtures and furniture.&lt;/li&gt;
	&lt;li&gt;Clean and shine all glass mirrors and glazing and framing (interior and exterior).&lt;/li&gt;
	&lt;li&gt;Clean wall/floor baseboards.&lt;/li&gt;
	&lt;li&gt;Vacuum, sweep, dry mop and wet mop all floor surfaces.&lt;/li&gt;
	&lt;li&gt;Clean back of the store.&lt;/li&gt;
	&lt;li&gt;Power wash sidewalk in front of the store and outdoor sitting area.&lt;/li&gt;
	&lt;li&gt;Machine scrub tile floors.&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;&lt;strong&gt;One Fluff Cleaning:&lt;/strong&gt;&lt;/li&gt;
&lt;/ol&gt;

&lt;ol&gt;
	&lt;li&gt;Vacuum, sweep and mop clean all floors.&lt;/li&gt;
	&lt;li&gt;Touch up windows and mirrors (interior only).&lt;/li&gt;
	&lt;li&gt;Touch up restrooms.&lt;/li&gt;
&lt;/ol&gt;
', N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (31, N'SEQUOIA COMMONS APARTMENTS - GOSHEN', N'S.W. CORNER OF W. RIGGIN AVE. ', N'GOSHEN, CA', NULL, CAST(N'2019-02-13' AS Date), 58000.0000, 0, 0.0000, 5, 2900.0000, 1, 1, 0, 2, 23, 0.0000, N'&lt;p&gt;This proposal is to complete final cleaning of 66 units (22 &amp;ndash; 1bed; 22&amp;ndash; 2bed and 22 &amp;ndash; 3bed) averaging 902 sf. each in 11 &amp;ndash; 2 stories buildings, and 1 story Community Building (3,735 sf.).&amp;nbsp;&lt;/p&gt;

&lt;p&gt;All work to be performed at finished location. Minimum of 22 units per mobilization.&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Wage Rate:&lt;/strong&gt;&amp;nbsp; This is a State and Federal prevailing wage proposal. Non-Union. NO PLA. Addendum 1, 2, 3, 4, 5, 6 reviewed.&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;I.&amp;nbsp;&amp;nbsp;&amp;nbsp; Inclusion: &lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;A.&lt;/strong&gt;&amp;nbsp; One Rough Clean (66 residential units and community building).&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;Sweep all interior floors including patios, porches, and storage.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Clean all windows on the interior and exterior.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Remove all stickers from glass.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Clean all tracks at windows and doors.&lt;/li&gt;
	&lt;li&gt;Clean all bathrooms.&amp;nbsp;&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;B.&lt;/strong&gt;&amp;nbsp;&amp;nbsp; One final clean (66 residential units and community building).&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;Remove all packaging from appliances and install shelves and accessories for homeowner use.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Place all literature in appliance as designated by Contractor.&lt;/li&gt;
	&lt;li&gt;Clean and polish all appliances and countertops.&lt;/li&gt;
	&lt;li&gt;Clean tops, interior, and exterior of all cabinets.&lt;/li&gt;
	&lt;li&gt;Remove countertops protection and place in dumpster.&lt;/li&gt;
	&lt;li&gt;Clean and polish all mirrors.&lt;/li&gt;
	&lt;li&gt;Clean all sheet vinyl and all title flooring.&lt;/li&gt;
	&lt;li&gt;Clean all interior light fixtures and all switch plates.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Remove all labels from lights with the exception of UL Labels and shine bulbs.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Clean all ceiling fans including blades as necessary.&lt;/li&gt;
	&lt;li&gt;Wipe HVAC unit clean.&lt;/li&gt;
	&lt;li&gt;Dust exterior railing systems and entry door.&lt;/li&gt;
	&lt;li&gt;Wipe down and clean all doors, hardware, and shelving.&lt;/li&gt;
	&lt;li&gt;Wipe off the top of all wood base, door casings, window sills, and other trim.&lt;/li&gt;
	&lt;li&gt;Polish all chrome items and sinks.&lt;/li&gt;
	&lt;li&gt;Clean all bathrooms including shower, toilet, accessories, counters, mirrors.&lt;/li&gt;
	&lt;li&gt;Vacuum all exposed to view air grilles and diffusers.&lt;/li&gt;
	&lt;li&gt;Vacuum all carpeted areas.&lt;/li&gt;
	&lt;li&gt;Dust interior railings and entry door.&lt;/li&gt;
	&lt;li&gt;Apply 1 coat of &amp;ldquo;Once a Year&amp;rdquo; floor finish throughout the units.&lt;/li&gt;
	&lt;li&gt;Apply 2 coats of &amp;ldquo;Once a Year&amp;rdquo; floor finish on resilient floors at hallway, maintenance, toilets, laundry and storage in Community Building.&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&lt;strong&gt;C.&lt;/strong&gt;&amp;nbsp; One Fluff clean: (66 residential units and community building).&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;Touch up kitchens and restrooms.&lt;/li&gt;
	&lt;li&gt;Vacuum carpeted floors and mop all floors.&lt;/li&gt;
	&lt;li&gt;Touch up all mirrors and windows on the interior only.&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;
', N'OCIP Our', 3)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (32, N'SARBUCKS 5265-DAVIS', N'623 - 2ND STREET', N'DAVIS, CA  ', NULL, CAST(N'2019-01-25' AS Date), 0.0000, 0, 0.0000, 5, 0.0000, 205, 1, 0, 1, 12, 0.0000, N'&lt;p&gt;&lt;strong&gt;This proposal is to complete one final and one fluff cleaning of TI store (3,035 sf.).&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;All work to be performed at finished location&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Wage Rate:&lt;/strong&gt;&amp;nbsp; This is not a prevailing wage proposal. Non-Union.&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;I.&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; Inclusion:&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;A. Final Cleaning:&lt;/strong&gt;&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;Clean caf&amp;eacute;, restroom, engine, workroom from ceiling to floor removing all paint overspray, caulking residue, construction dirt, dust, stickers, tape.&lt;/li&gt;
	&lt;li&gt;Clean light fixtures, lights, inside and outside of all equipment, interior and exterior of casework, doors, frames, sinks, toilets, drains, exposed duct work, grilles, registers, vents, furniture (interior &amp;amp; exterior), all mirrors and glass on the interior &amp;amp; exterior.&lt;/li&gt;
	&lt;li&gt;Machine scrub all tile floors and cove tile. Buff and clean all wall tile.&lt;/li&gt;
	&lt;li&gt;Pressure wash all surrounding sidewalks.&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;&lt;strong&gt;One Fluff Cleaning:&lt;/strong&gt;&lt;/li&gt;
&lt;/ol&gt;

&lt;ol&gt;
	&lt;li&gt;Vacuum, sweep and mop clean all floors.&lt;/li&gt;
	&lt;li&gt;Touch up windows and mirrors (interior only).&lt;/li&gt;
&lt;/ol&gt;
', N'OCIP Our', 3)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (33, N'502 7TH STREET', N'502 7TH STREET', N'SAN FRANCISCO, CA 94103', NULL, CAST(N'2018-03-16' AS Date), 8250.0000, 0, 0.0000, 5, 412.5000, 155, 1, 0, 1, 14, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (34, N'SEQUOIA COMMONS APARTMENTS ', N'S.W. CORNER OF W. RIGGIN AVE. & 76 ST.', N'GOSHEN, CA', NULL, CAST(N'2019-03-28' AS Date), 58000.0000, 0, 0.0000, 5, 2900.0000, 12, 1, 0, 2, 23, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (35, N'STARBUCKS#5265 - DAVIS', N'623 2ND ST.', N'DAVIS, CA 95616', NULL, CAST(N'2019-01-21' AS Date), 2350.0000, 0, 0.0000, 5, 117.5000, 205, 1, 0, 1, 8, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (36, N'STARBUCKS#5780 - OAKLAND', N'2084 MOUNTAIN BLVD.', N'OAKLAND, CA 94612', NULL, CAST(N'2019-01-22' AS Date), 1750.0000, 0, 0.0000, 5, 87.5000, 396, 1, 0, 1, 8, 0.0000, NULL, N'OCIP Our', 3)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (37, N'COMMUNITY FOODS MARKET', N'3105 SAN PABLO AVE.', N'OAKLAND, CA 94608', NULL, CAST(N'2019-01-24' AS Date), 5700.0000, 0, 0.0000, 5, 285.0000, 147, 1, 0, 1, 15, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (38, N'TACO BELL#30938 - ROHNERT PARK', N'1700 E. COVATI AVE.', N'ROHNERT PARK, CA 94928', NULL, CAST(N'2019-01-24' AS Date), 2600.0000, 0, 0.0000, 5, 130.0000, 147, 1, 0, 1, 17, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (39, N'STARBUCKS#8851 - SAN PABLO', N'14330 SAN PABLO AVE. STE.A', N'SAN PABLO, CA 94806', NULL, CAST(N'2019-01-25' AS Date), 1700.0000, 0, 0.0000, 5, 85.0000, 396, 1, 0, 1, 17, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (40, N'HERCULES BLOCK N (CREEKSIDE APTS.)', N'2525 BAYFRONT BLVD.', N'HERCULES, CA 94547', NULL, CAST(N'2019-01-30' AS Date), 86850.0000, 0, 0.0000, 5, 4342.5000, 411, 1, 0, 1, 14, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (41, N'BANFIELD PET HOSPITAL#5215 - PACIFICA', N'721 HICKEY BLVD.', N'PACIFICA, CA 94044', NULL, CAST(N'2019-01-29' AS Date), 1600.0000, 0, 0.0000, 5, 80.0000, 290, 1, 0, 1, 20, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (42, N'CAMP PARKS MILITARY PROJECTS (ARC PH.2)<BR/>TIME: 0 HRS<BR/>AMOUNT: $0.00<BR/>TOTAL WO: 0 HRS', N'620 6TH STREET', N'DUBLIN, CA 94568', NULL, CAST(N'2019-03-31' AS Date), 18000.0000, 0, 0.0000, 5, 900.0000, 249, 1, 0, 2, 7, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (43, N'CAMP PARKS MILITARY PROJECTS (DPW/DOL)', N'620 6TH STREET', N'DUBLIN, CA 94568', NULL, CAST(N'2019-03-31' AS Date), 18000.0000, 0, 0.0000, 5, 900.0000, 249, 1, 0, 2, 7, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (44, N'COMCAST - FREMONT TECH OPS TI', N'395 MOWRY', N'FREMONT, CA 94536', NULL, CAST(N'2019-01-29' AS Date), 3800.0000, 0, 0.0000, 5, 190.0000, 342, 1, 0, 1, 12, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (45, N'CLEMENTINA TOWERS - SAN FRANCISCO', N'330 CLEMENTINA ST.', N'SAN FRANCISCO, CA', NULL, CAST(N'2016-10-25' AS Date), 112850.0000, 0, 0.0000, 5, 5642.5000, 128, 1, 0, 2, 23, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (46, N'VAYA - WALNUT CREEK', N'207 YGNACIO VALLEY RD.', N'WALNUT CREEK, CA', NULL, CAST(N'2017-06-06' AS Date), 87154.0000, 0, 0.0000, 5, 4357.7002, 326, 1, 0, 1, 14, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (47, N'DEER CREEK APTS.', N'17011 BOLLINGER CANYON RD.', N'SAN RAMON, CA 94582', NULL, CAST(N'2017-09-13' AS Date), 134020.0000, 0, 0.0000, 5, 6701.0000, 326, 1, 0, 1, 14, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (48, N'MOUNTAIN VIEW 164', N'801 W. EL CAMINO REAL', N'MOUNTAIN VIEW, CA 94040', NULL, CAST(N'2018-01-28' AS Date), 72500.0000, 0, 0.0000, 5, 3625.0000, 151, 1, 0, 1, 14, 0.0000, NULL, N'OCIP WC&GL', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (49, N'350 ELLIS ST.', N'350 ELLIS ST.', N'SAN FRANCISCO, CA', NULL, CAST(N'2018-07-25' AS Date), 53850.0000, 0, 0.0000, 5, 2692.5000, 91, 1, 0, 1, 14, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (50, N'MCALLISTER', N'1750 MCALLISTER ST.', N'SAN FRANCISCO, CA 94115', NULL, CAST(N'2018-07-25' AS Date), 35800.0000, 0, 0.0000, 5, 1790.0000, 128, 1, 0, 2, 23, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (51, N'MONTEVIDEO ELEMENTARY SCHOOL', N'13000 BROADMOOR DRIVE', N'SAN RAMON, CA 94583', NULL, CAST(N'2019-07-25' AS Date), 18850.0000, 0, 0.0000, 5, 942.5000, 322, 1, 0, 2, 2, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (52, N'EDEN HOUSING A STREET OFFICE TI', N'808 A STREET', N'HAYWARD, CA 94541', NULL, CAST(N'2019-05-17' AS Date), 1950.0000, 0, 0.0000, 5, 97.5000, 375, 1, 0, 1, 12, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (53, N'STARBUCKS#55828', N'1385 SANTA ROSA AVE.', N'SANTA ROSA, CA 95404', NULL, CAST(N'2019-03-19' AS Date), 2250.0000, 0, 0.0000, 5, 112.5000, 396, 1, 0, 1, 8, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (54, N'STARBUCKS#11337 - SANTA ROSA', N'2688 SANTA ROSA AVE.', N'SANTA ROSA, CA 95407', NULL, CAST(N'2019-03-26' AS Date), 1850.0000, 0, 0.0000, 5, 92.5000, 396, 1, 0, 1, 8, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (55, N'STARBUCKS#10258 - SAN JOSE', N'695 COLEMAN AVE.', N'SAN JOSE, CA 95110', NULL, CAST(N'2019-07-16' AS Date), 1900.0000, 0, 0.0000, 5, 95.0000, 396, 1, 0, 1, 8, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (56, N'STARBUCKS#5653 - UNION CITY', N'32240 DYER STREET', N'UNION CITY, CA 94587', NULL, CAST(N'2019-06-21' AS Date), 1200.0000, 0, 0.0000, 5, 60.0000, 396, 1, 0, 1, 8, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (57, N'CA GROCERS ASSOCIATION', N'1005 12TH STREET', N'SACRAMENTO, CA 95814', NULL, CAST(N'2019-03-04' AS Date), 3200.0000, 0, 0.0000, 5, 160.0000, 396, 1, 0, 1, 12, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (58, N'STARBUCKS#5780 - OAKLAND', N'2084 MOUNTAIN BLVD.', N'OAKLAND, CA 94612', NULL, CAST(N'2019-01-22' AS Date), 1750.0000, 0, 0.0000, 5, 87.5000, 396, 1, 0, 1, 8, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (59, N'STARBUCKS#53587 - SAN MATEO', N'455 CONCAR DR.', N'SAN MATEO, CA 94402', NULL, CAST(N'2019-07-01' AS Date), 1850.0000, 0, 0.0000, 5, 92.5000, 396, 1, 0, 1, 8, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (60, N'DENTAL & MEDICAL COUNSEL<BR/>TIME: 0 HRS<BR/>AMOUNT: $0.00<BR/>TOTAL WO: 0 HRS', N'111 DEERWOOD RD. STE.335', N'SAN RAMON, CA 94582', NULL, CAST(N'2019-07-19' AS Date), 1000.0000, 0, 0.0000, 5, 50.0000, 396, 1, 0, 1, 12, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (61, N'STARBUCKS#10711 - NOVATO', N'7514 REDWOOD BLVD.', N'NOVATO, CA 94945', NULL, CAST(N'2019-02-08' AS Date), 1750.0000, 0, 0.0000, 5, 87.5000, 1, 1, 0, 1, 8, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (62, N'STARBUCKS#13401 - SALINAS', N'917 B NORTH MAIN STREET', N'SALINAS, CA 93906', NULL, CAST(N'2019-03-28' AS Date), 1550.0000, 0, 0.0000, 5, 77.5000, 396, 1, 0, 1, 8, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (63, N'STARBUCKS#10113 - SAN JOSE', N'1 EASTRIDGE MALL', N'SAN JOSE, CA 95121', NULL, CAST(N'2019-02-21' AS Date), 700.0000, 0, 0.0000, 5, 35.0000, 396, 1, 0, 1, 8, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (64, N'STARBUCKS#11096 - LINCOLN', N'129 FERRARI RANCH ROAD #110', N'LINCOLN, CA 95648', NULL, CAST(N'2019-03-15' AS Date), 1750.0000, 0, 0.0000, 5, 87.5000, 396, 1, 0, 1, 8, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (65, N'STARBUCKS#14730 - FREMONT', N'5387 MOWRY AVE.', N'FREMONT, CA 94583', NULL, CAST(N'2019-02-20' AS Date), 1425.0000, 0, 0.0000, 5, 71.2500, 396, 1, 0, 1, 8, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (66, N'STARBUCKS#11602 - UKIAH', N'1212 AIRPORT PARK BLVD. STE.100', N'UKIAH, CA 95482', NULL, CAST(N'2019-01-22' AS Date), 2400.0000, 0, 0.0000, 5, 120.0000, 396, 4, 0, 1, 8, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (67, N'H&M SUNVALLEY MALL - CONCORD', N'313 SUNVALLEY MALL RD. #B-206', N'CONCORD, CA 94520', NULL, CAST(N'2019-02-04' AS Date), 8600.0000, 0, 0.0000, 5, 430.0000, 147, 1, 0, 1, 11, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (68, N'LUSH COSMETICS - ROSEVILLE', N'1151 GALLERIA BLVD. #119', N'ROSEVILLE, CA 95678', NULL, CAST(N'2019-05-23' AS Date), 1700.0000, 0, 0.0000, 5, 85.0000, 147, 1, 0, 1, 11, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (69, N'MENDOCINO FARMS - SAN RAMON', N'6000 BOLLINGER CANYON RD.', N'SAN RAMON, CA 94538', NULL, CAST(N'2019-03-06' AS Date), 2900.0000, 0, 0.0000, 5, 145.0000, 147, 1, 0, 1, 17, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (70, N'STARBUCKS#5981 - SUNNYVALE', N'348 W. EL CAMINO REAL', N'SUNNYVALE, CA 94087', NULL, CAST(N'2019-03-08' AS Date), 2325.0000, 0, 0.0000, 5, 116.2500, 147, 1, 0, 1, 8, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (71, N'STARBUCKS#1041 - MORGAN HILL', N'1041 COCHRANE RD.', N'MORGAN HILL, CA 95037', NULL, CAST(N'2019-05-23' AS Date), 1850.0000, 0, 0.0000, 5, 92.5000, 147, 1, 0, 1, 8, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (72, N'STARBUCKS#13463 - SANTA ROSA', N'269 AVIATION BLVD.', N'SANTA ROSA, CA 95403', NULL, CAST(N'2019-02-11' AS Date), 1800.0000, 0, 0.0000, 5, 90.0000, 147, 1, 0, 1, 8, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (73, N'TACO BELL - PACIFICA', N'5200 PACIFIC COAST HIGHWAY', N'PACIFICA, CA 94044', NULL, CAST(N'2019-05-01' AS Date), 2600.0000, 0, 0.0000, 5, 130.0000, 147, 1, 0, 1, 17, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (74, N'TACO BELL - CONCORD', N'4674 CLAYTON RD.', N'CONCORD, CA 94521', NULL, CAST(N'2019-04-26' AS Date), 2500.0000, 0, 0.0000, 5, 125.0000, 147, 1, 0, 1, 17, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (75, N'TACO BELL - LAFAYETTE', N'3501 MY DIABLO BLVD.', N'LAFAYETTE, CA 94549', NULL, CAST(N'2019-01-30' AS Date), 1000.0000, 0, 0.0000, 5, 50.0000, 147, 1, 0, 1, 17, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (76, N'PANERA#2223 - SANTA ROSA', N'885 HOPPER AVE.', N'SANTA ROSA, CA 95403', NULL, CAST(N'2019-07-25' AS Date), 2500.0000, 0, 0.0000, 5, 125.0000, 205, 1, 0, 1, 17, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (77, N'FM INDUSTRIES, INC.', N'7100 NATIONAL DR.', N'LIVERMORE, CA 94550', NULL, CAST(N'2019-07-26' AS Date), 4800.0000, 0, 0.0000, 5, 240.0000, 392, 2, 0, 1, 15, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (78, N'CHEVRON#95954 - CUPERTINO', N'10023 DE ANZA BLVD.', N'CUPERTINO, CA 95014', NULL, CAST(N'2019-07-02' AS Date), 1150.0000, 0, 0.0000, 5, 57.5000, 205, 1, 0, 1, 19, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (79, N'CHEVRON#208221 - SANTA ROSA', N'879 HOPPER ST.', N'SANTA ROSA, CA 95404', NULL, CAST(N'2019-06-18' AS Date), 1850.0000, 0, 0.0000, 5, 92.5000, 205, 1, 0, 1, 19, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (80, N'PANERA#935 - FREMONT', N'43317 CHRISTY ST.', N'FREMONT, CA 94538', NULL, CAST(N'2019-02-04' AS Date), 1000.0000, 0, 0.0000, 5, 50.0000, 205, 1, 0, 1, 17, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (81, N'STARBUCKS#5926 - VALLEJO', N'974 ADMIRAL CALLAGHAN LANE', N'VALLEJO, CA 94591', NULL, CAST(N'2019-04-18' AS Date), 1700.0000, 0, 0.0000, 5, 85.0000, 205, 1, 0, 1, 8, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (82, N'STARBUCKS#11832 - MODESTO', N'166 E. WHITMORE AVE.', N'MODESTO, CA 95358', NULL, CAST(N'2019-06-04' AS Date), 1850.0000, 0, 0.0000, 5, 92.5000, 205, 1, 0, 1, 8, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (83, N'STARBUCKS#50712 - SACRAMENTO', N'4200 FLORIN BLVD.', N'SACRAMENTO, CA 95823', NULL, CAST(N'2019-04-09' AS Date), 2000.0000, 0, 0.0000, 5, 100.0000, 205, 1, 0, 1, 8, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (84, N'MANCHURIAN RESTAURANT - WEST SACRAMENTO', N'767 IKEA CT. BLDG. 11C', N'WEST SACRAMENTO, CA 95605', NULL, CAST(N'2019-03-08' AS Date), 1700.0000, 0, 0.0000, 5, 85.0000, 342, 1, 0, 1, 17, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (85, N'STARBUCKS#6663 - RANCHO CORDOVA', N'3110 SUNRISE BLVD.', N'RANCHO CORDOVA, CA 95742', NULL, CAST(N'2019-04-22' AS Date), 1600.0000, 0, 0.0000, 5, 80.0000, 342, 1, 0, 1, 8, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (86, N'STARBUCKS#13639 - SACRAMENTO', N'8231 TIMBERLAKE WAY #140', N'SACRAMENTO, CA 95823', NULL, CAST(N'2019-03-12' AS Date), 1850.0000, 0, 0.0000, 5, 92.5000, 342, 1, 0, 1, 8, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (87, N'STARBUCKS#14226 - DANVILLE', N'4000 BLACKHAWK PLAZA CIR.', N'DANVILLE, CA 94510', NULL, CAST(N'2019-02-28' AS Date), 1825.0000, 0, 0.0000, 5, 91.2500, 342, 1, 0, 1, 8, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (88, N'SUNGLASS HUT - SAN RAMON', N'6000 BOLLINGER CANYON RD. #1503', N'SAN RAMON, CA 94583', NULL, CAST(N'2019-04-05' AS Date), 1550.0000, 0, 0.0000, 5, 77.5000, 342, 1, 0, 1, 11, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (89, N'TEA 2 - VALLEY FAIR MALL', N'2855 STEVENS CREEK BLVD. #1047', N'SANTA CLARA, CA 95050', NULL, CAST(N'2019-04-16' AS Date), 1250.0000, 0, 0.0000, 5, 62.5000, 342, 1, 0, 1, 17, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (90, N'VITALITY BOWL - MILL VALLEY', N'765 E. BLITHEDALE AVE.', N'MILL VALLEY, CA 94941', NULL, CAST(N'2019-05-10' AS Date), 1400.0000, 0, 0.0000, 5, 70.0000, 342, 1, 0, 1, 17, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (91, N'VITALITY BOWL - SAUSALITO', N'100 DONAHUE ST. #160F', N'SAUSALITO, CA 94965', NULL, CAST(N'2019-05-24' AS Date), 1375.0000, 0, 0.0000, 5, 68.7500, 342, 1, 0, 1, 17, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (92, N'WETZELS PRETZELS - SAN FRANCISCO"', N'250 BEACH ST. SUITE C1', N'SAN FRANCISCO, CA', NULL, CAST(N'2019-02-04' AS Date), 1300.0000, 0, 0.0000, 5, 65.0000, 342, 1, 0, 1, 17, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (93, N'GILROY EARLY COLLEGE ACADEMY SCIENCELAB MODERNIZATION', N'5055 SANTA TERESA BLVD.', N'GILROY, CA 95020', NULL, CAST(N'2019-02-01' AS Date), 1200.0000, 0, 0.0000, 5, 60.0000, 206, 1, 0, 2, 2, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (94, N'LAKESIDE LOFTS', N'250 14TH ST.', N'OAKLAND, CA 94040', NULL, CAST(N'2019-02-06' AS Date), 32500.0000, 0, 0.0000, 5, 1625.0000, 412, 1, 0, 1, 14, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (95, N'DUBLIN SENIOR LIVING FACILITY', N'7601 AMADOR VALLEY BLVD.', N'DUBLIN, CA 94568', NULL, CAST(N'2019-02-12' AS Date), 24850.0000, 0, 0.0000, 5, 1242.5000, 413, 1, 0, 1, 14, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (96, N'1950 ADDISON', N'1950 ADDISON ST.', N'BERKELEY, CA 94704', NULL, CAST(N'2019-02-11' AS Date), 64800.0000, 0, 0.0000, 5, 3240.0000, 411, 1, 0, 1, 14, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (97, N'SWINE FACILITY ELECTRICAL UPGRADE', N'625 E. TAYLOR RD.', N'TURLOCK, CA 95380', NULL, CAST(N'2019-02-11' AS Date), 2250.0000, 0, 0.0000, 5, 112.5000, 159, 1, 0, 2, 2, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (98, N'RESIDENCES AT FIVE CREEK', N'541 CARLSON AVE.', N'ROHNERT PARK, CA 94928', NULL, CAST(N'2019-03-27' AS Date), 77355.0000, 0, 0.0000, 5, 3867.7500, 380, 1, 0, 1, 14, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (99, N'CYPRESS GARDEN', N'3135 SEACREST AVE.', N'MARINA, CA 93933', NULL, CAST(N'2019-02-21' AS Date), 38960.0000, 0, 0.0000, 5, 1948.0000, 4, 1, 0, 1, 14, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (100, N'KO CUPS', N'2045 DIAMOND BLVD.', N'CONCORD, CA 94520', NULL, CAST(N'2019-02-18' AS Date), 975.0000, 0, 0.0000, 5, 48.7500, 281, 1, 0, 1, 17, 0.0000, NULL, N'OCIP Our', 1)
GO
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (101, N'MILPITAS SOUTH MAIN SENIOR LIFESTYLES', N'1620 S. MAIN STREET', N'MILPITAS, CA 95035', NULL, CAST(N'2019-03-19' AS Date), 118735.0000, 0, 0.0000, 5, 5936.7500, 414, 1, 0, 2, 23, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (102, N'RAINBOW RECREATION CENTER', N'5800 INTERNATIONAL BLVD.', N'OAKLAND, CA', NULL, CAST(N'2019-02-25' AS Date), 7500.0000, 0, 0.0000, 5, 375.0000, 199, 1, 0, 1, 19, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (103, N'AFFORDABLE DENTURES T.I.', N'2225 PLAZA PARKWAY STE.C-12', N'MODESTO, CA 95350', NULL, CAST(N'2018-11-09' AS Date), 2200.0000, 0, 0.0000, 5, 110.0000, 160, 1, 0, 1, 19, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (104, N'ORBIMED', N'1700 OWENS ST.', N'SAN FRANCISCO, CA', NULL, CAST(N'2019-02-06' AS Date), 966.0000, 0, 0.0000, 5, 48.3000, 289, 1, 0, 1, 19, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (105, N'MADISON PARK APARTMENTS', N'100 9TH STREET', N'OAKLAND, CA 94612', NULL, CAST(N'2019-03-11' AS Date), 43500.0000, 0, 0.0000, 5, 2175.0000, 91, 1, 0, 1, 14, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (106, N'LEIGH AVENUE SENIOR APARTMENTS', N'1030 LEIGH AVE.', N'SAN JOSE, CA 95126', NULL, CAST(N'2019-03-15' AS Date), 37312.0000, 0, 0.0000, 5, 1865.6000, 4, 1, 0, 2, 23, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (107, N'MARJAREE MASON CENTER', N'1660 M STREET', N'FRESNO, CA 93721', NULL, CAST(N'2019-03-11' AS Date), 1650.0000, 0, 0.0000, 5, 82.5000, 180, 1, 0, 2, 4, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (108, N'TOWN & COUNTRY CENTER', N'855 EL CAMINO REAL STE.115', N'PALO ALTO, CA 94104', NULL, CAST(N'2019-03-04' AS Date), 975.0000, 0, 0.0000, 5, 48.7500, 115, 1, 0, 1, 19, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (109, N'MORAGA-ORINDA FIRE STATION #43', N'20 VIA LAS CRUCES', N'ORINDA, CA 94563', NULL, CAST(N'2019-03-14' AS Date), 3150.0000, 0, 0.0000, 5, 157.5000, 322, 1, 0, 2, 7, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (110, N'EMPIRE USD MAINTANENCE BUILDING', N'5201 FIRST ST.', N'EMPIRE, CA 95351', NULL, CAST(N'2019-03-20' AS Date), 3500.0000, 0, 0.0000, 5, 175.0000, 98, 1, 0, 2, 2, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (111, N'FREEDOM HIGH SCHOOL', N'1050 NEROLY RD.', N'OAKLEY, CA 94561', NULL, CAST(N'2019-03-14' AS Date), 2000.0000, 0, 0.0000, 5, 100.0000, 350, 1, 0, 2, 2, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (112, N'GIRL SCOUTS TI', N'10550 MERRITT ST.', N'CASTROVILLE, CA 95012', NULL, CAST(N'2019-03-11' AS Date), 1950.0000, 0, 0.0000, 5, 97.5000, 39, 1, 0, 2, 7, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (113, N'UC DAVIS PHYSICS CME LAB', N'225 COUSTEAU PLACE', N'DAVIS, CA 95618', NULL, CAST(N'2019-03-11' AS Date), 4000.0000, 0, 0.0000, 5, 200.0000, 98, 1, 0, 2, 2, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (114, N'PRIMROSE SCHOOL - EVERGREEN', N'3008 ABORN RD.', N'SAN JOSE, CA 95135', NULL, CAST(N'2019-03-26' AS Date), 4560.0000, 0, 0.0000, 5, 228.0000, 1, 1, 0, 1, 28, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (115, N'ANYTIME FITNESS', N'90 RANCHO DEL MAR SHOPPING CENTER', N'APTOS, CA', NULL, CAST(N'2019-06-13' AS Date), 1600.0000, 0, 0.0000, 5, 80.0000, 206, 1, 0, 1, 19, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (116, N'OAKWOOD GYMNASIUM', N'105 JOHN WILSON WAY', N'MORGAN HILL', NULL, CAST(N'2019-02-15' AS Date), 7600.0000, 0, 0.0000, 5, 380.0000, 206, 1, 0, 2, 2, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (117, N'OAKWOOD LIBERAL ARTS', N'105 JOHN WILSON WAY', N'MORGAN HILL, CA 95037', NULL, CAST(N'2019-03-02' AS Date), 17850.0000, 0, 0.0000, 5, 892.5000, 206, 1, 0, 2, 2, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (118, N'SANTA CLARA COUNTY  ASSOCIATION OF REALTORS', N'7901 WESTWOOD DR.', N'GILROY, CA', NULL, CAST(N'2019-07-11' AS Date), 900.0000, 0, 0.0000, 5, 45.0000, 206, 1, 0, 1, 12, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (119, N'SYSCO - SALINAS', N'20 E. SAN JOAQUIN ST.', N'SALINAS, CA 93901', NULL, CAST(N'2019-07-30' AS Date), 6183.8701, 0, 0.0000, 5, 309.1900, 40, 4, 0, 1, 12, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (120, N'WHEELER PLAZA', N'657 WALNUT ST.', N'SAN CARLOS, CA 94070', NULL, CAST(N'2019-07-30' AS Date), 71300.0000, 0, 0.0000, 5, 3565.0000, 361, 1, 0, 2, 23, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (121, N'WALGREENS#21193 - SAN JOSE', N'1757 W. SAN CARLOS ST.', N'SAN JOSE, CA 95128', NULL, CAST(N'2019-07-30' AS Date), 740.0000, 0, 0.0000, 5, 37.0000, 40, 1, 0, 1, 11, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (122, N'10 RAGSDALE 1ST FLOOR MINOR MODS.', N'10 RAGSDALE DR.', N'MONTEREY, CA 93940', NULL, CAST(N'2019-05-14' AS Date), 1800.0000, 0, 0.0000, 5, 90.0000, 40, 4, 0, 1, 20, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (123, N'ARMSTRONG RESIDENCE', N'102 2ND ST.', N'PACIFIC GROVE, CA 93950', NULL, CAST(N'2019-07-30' AS Date), 4117.0000, 0, 0.0000, 5, 205.8500, 40, 4, 0, 1, 19, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (124, N'CENTRAL COAST COMMUNITY DAY SCHOOL', N'200 COE AVE.', N'SEASIDE, CA 93955', NULL, CAST(N'2019-04-15' AS Date), 10100.0000, 0, 0.0000, 5, 505.0000, 40, 4, 0, 1, 28, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (125, N'CSUMB RESTROOM REMODEL', N'1 MAIN ST.', N'SALINAS, CA 93901', NULL, CAST(N'2019-01-14' AS Date), 3050.0000, 0, 0.0000, 5, 152.5000, 40, 4, 0, 2, 2, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (126, N'DUAL LANGUAGE ACADEMY', N'255 NORMANDY RD.', N'SEASIDE, CA 93955', NULL, CAST(N'2019-05-28' AS Date), 12500.0000, 0, 0.0000, 5, 625.0000, 40, 4, 0, 2, 2, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (127, N'THE HIDEAWAY INTERIOR IPROVEMENTS', N'JUNIOERO ST. & 8TH AVE.', N'CARMEL, CA 93923', NULL, CAST(N'2019-03-18' AS Date), 4300.0000, 0, 0.0000, 5, 215.0000, 40, 4, 0, 1, 9, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (128, N'ICR', N'2 LOWER RAGSDALE DR. STE.101', N'MONTEREY, CA', NULL, CAST(N'2019-03-25' AS Date), 3000.0000, 0, 0.0000, 5, 150.0000, 40, 2, 0, 1, 19, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (129, N'MARINA HIGH FURNACE REPLACEMENT', N'298 PATTON PKWY', N'MARINA, CA 93940', NULL, CAST(N'2019-07-31' AS Date), 2640.0000, 0, 0.0000, 5, 132.0000, 40, 4, 0, 2, 2, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (130, N'MEE MEMORIAL HOSPITAL GREENFIELD CLINIC ADDITION', N'467 EL CAMINO REAL', N'GREENFIELD, CA 93927', NULL, CAST(N'2018-08-29' AS Date), 2350.0000, 0, 0.0000, 5, 117.5000, 40, 4, 0, 1, 20, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (131, N'SVMH OUTPATIENT INFUSION CLINIC', N'515 E. ROMIE LANE', N'SALINAS, CA 93901', NULL, CAST(N'2019-02-06' AS Date), 3750.0000, 0, 0.0000, 5, 187.5000, 40, 4, 0, 2, 1, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (132, N'SVMH MULTI-SPECIALTY CLINIC', N'5 LOWER RAGSDALE DR. STE.101', N'MONTEREY, CA 93940', NULL, CAST(N'2019-03-18' AS Date), 2300.0000, 0, 0.0000, 5, 115.0000, 40, 4, 0, 2, 1, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (133, N'DCP AT OCALA PH.2<BR/>TIME: 0 HRS<BR/>AMOUNT: $0.00<BR/>TOTAL WO: 0 HRS', N'2888 OCALA AVE.', N'SAN JOSE, CA 95148', NULL, CAST(N'2018-02-13' AS Date), 5925.0000, 0, 0.0000, 5, 296.2500, 45, 1, 0, 2, 2, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (134, N'HOOVER COMMUNITY SCHOOL - NEW GYM & MODERNIZATION', N'2565 GOODWIN AVE.', N'REDWOOD CITY, CA', NULL, CAST(N'2019-07-02' AS Date), 50790.0000, 0, 0.0000, 5, 2539.5000, 48, 1, 0, 2, 2, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (135, N'LLESA CHILD CARE CENTER', N'1399 ALMOND AVE.', N'LIVERMORE, CA 94550', NULL, CAST(N'2019-04-17' AS Date), 966.0000, 0, 0.0000, 5, 48.3000, 175, 2, 0, 1, 12, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (136, N'MENLO ATHERTON HS', N'555 MIDDLEFIELD RD.', N'ATHERTON, CA 94027', NULL, CAST(N'2019-01-04' AS Date), 11250.0000, 0, 0.0000, 5, 562.5000, 175, 2, 0, 2, 2, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (137, N'RANCHOS LIBRARY & SHERRIFS OFFICE"', N'37398 BERKSHIRE DR.', N'MADERA, CA 93636', NULL, CAST(N'2019-08-01' AS Date), 4500.0000, 0, 0.0000, 5, 225.0000, 159, 1, 0, 2, 22, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (138, N'HALL ROAD', N'1 HALL ROAD', N'HAYWARD, CA', NULL, CAST(N'2019-08-01' AS Date), 1900.0000, 0, 0.0000, 5, 95.0000, 11, 4, 0, 1, 19, 0.0000, NULL, N'OCIP Our', 1)
INSERT [dbo].[Projects] ([ID], [ProjectName], [Address], [City], [Description], [DateProject], [Amount], [RetentionsProject], [Retentions], [SellerProject], [Selle], [IDCustomer], [IDSeller], [IDProvide], [IDTypeProject], [IDTypeBuilding], [AmountProvide], [Inclusion], [OCIP], [Status]) VALUES (139, N'GROWLER USA', N'787 THE ALAMEDA #10', N'SAN JOSE, CA 95126', NULL, CAST(N'2019-07-10' AS Date), 3200.0000, 0, 0.0000, 5, 160.0000, 415, 1, 0, 1, 17, 0.0000, NULL, N'OCIP Our', 1)
GO
SET IDENTITY_INSERT [dbo].[Providers] ON 

INSERT [dbo].[Providers] ([ID], [Name], [Email], [Address], [City], [Zip], [Phone], [Status]) VALUES (1, N'ALEJANDRO SAMPERO', N'alejandro@calcocleaning.com', N'979 GOLDENLEAF WAY', N'PITTSBURG, CA ', 94565, N'(925) 586-66-26', 1)
INSERT [dbo].[Providers] ([ID], [Name], [Email], [Address], [City], [Zip], [Phone], [Status]) VALUES (2, N'ISIDRO', NULL, N'1647 89TH AVE', N'OAKLAND CA ', 94621, N'(510) 355-57-03', 1)
INSERT [dbo].[Providers] ([ID], [Name], [Email], [Address], [City], [Zip], [Phone], [Status]) VALUES (7, N'ELENA HERNANDEZ', NULL, N'2201 MAHOGANY WAY #16', N' ANTIOCH CA ', 94509, N'(415) 424-32-37', 1)
INSERT [dbo].[Providers] ([ID], [Name], [Email], [Address], [City], [Zip], [Phone], [Status]) VALUES (8, N'MARLEN AGUILAR', NULL, N'714 H ST. ANTIOCH, CA', NULL, NULL, N'(925) 848-85-96', 1)
INSERT [dbo].[Providers] ([ID], [Name], [Email], [Address], [City], [Zip], [Phone], [Status]) VALUES (9, N'NACY LOPEZ', NULL, N'2093 SAN LUIS ST. ', N'LOS BANOS, CA', NULL, N'(408) 509-11-57', 1)
INSERT [dbo].[Providers] ([ID], [Name], [Email], [Address], [City], [Zip], [Phone], [Status]) VALUES (10, N'DANIEL BONILLA', NULL, N'P.O. BOX 3524 ', N'SAN JOSE, CA', NULL, N'(408) 594-07-21', 1)
INSERT [dbo].[Providers] ([ID], [Name], [Email], [Address], [City], [Zip], [Phone], [Status]) VALUES (11, N'MAURICIO DIAZ', NULL, NULL, NULL, NULL, N'(925) 667-75-14', 1)
INSERT [dbo].[Providers] ([ID], [Name], [Email], [Address], [City], [Zip], [Phone], [Status]) VALUES (12, N'ELENA CORTES', NULL, NULL, NULL, NULL, N'(408) 528-42-38', 1)
INSERT [dbo].[Providers] ([ID], [Name], [Email], [Address], [City], [Zip], [Phone], [Status]) VALUES (13, N'MARIBEL', N'maribelrodriguez367@gmail.com', N'2628 RIBER WAY ', N'RANCHO CORDOVA, CA ', 95620, N'(916) 716-21-92', 1)
INSERT [dbo].[Providers] ([ID], [Name], [Email], [Address], [City], [Zip], [Phone], [Status]) VALUES (14, N'CAROLINA YEPES', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Providers] ([ID], [Name], [Email], [Address], [City], [Zip], [Phone], [Status]) VALUES (15, N'JULIO CORDOVA', NULL, N'P.O. BOX 43007 ', N'OAKLAND, CA ', 94624, N'(510) 697-74-37', 1)
INSERT [dbo].[Providers] ([ID], [Name], [Email], [Address], [City], [Zip], [Phone], [Status]) VALUES (16, N'RAFAEL CORTEZ', NULL, N'4299 WINDSOR PARK DR', N'SAN JOSE', 95136, NULL, 1)
SET IDENTITY_INSERT [dbo].[Providers] OFF
GO
SET IDENTITY_INSERT [dbo].[Sellers] ON 

INSERT [dbo].[Sellers] ([ID], [Name], [Email], [Phone], [Status]) VALUES (1, N'GONZALO E. MARTINEZ METZLER', N'correo@gmail.com', N'(999) 999-99-99', 1)
INSERT [dbo].[Sellers] ([ID], [Name], [Email], [Phone], [Status]) VALUES (2, N'SOLEDAD CORTEZ', N'soledad@calcocleaning.com', N'(999) 999-99-99', 1)
INSERT [dbo].[Sellers] ([ID], [Name], [Email], [Phone], [Status]) VALUES (3, N'CARLOS CORTEZ', N'carlos@calcocleaning.com', N'(408) 202-35-03', 1)
INSERT [dbo].[Sellers] ([ID], [Name], [Email], [Phone], [Status]) VALUES (4, N'CESILIA CORTEZ', N'cesilia@calcocleaning.com', N'(408) 569-24-58', 1)
SET IDENTITY_INSERT [dbo].[Sellers] OFF
GO
SET IDENTITY_INSERT [dbo].[StatusDate] ON 

INSERT [dbo].[StatusDate] ([ID], [Description], [TextColor], [BackColor]) VALUES (1, N'WO DONE', N'#000000', N'#FFFFFF')
INSERT [dbo].[StatusDate] ([ID], [Description], [TextColor], [BackColor]) VALUES (2, N'CONFIRMED', N'#FF0000', N'#FFFFFF')
INSERT [dbo].[StatusDate] ([ID], [Description], [TextColor], [BackColor]) VALUES (3, N'WO SENT TO SUB', N'#000000', N'#66B2FF')
INSERT [dbo].[StatusDate] ([ID], [Description], [TextColor], [BackColor]) VALUES (4, N'PENDING SIGN WO', N'#000000', N'#FF8000')
INSERT [dbo].[StatusDate] ([ID], [Description], [TextColor], [BackColor]) VALUES (5, N'READY TO INVOICE', N'#FFFFFF', N'#000000')
INSERT [dbo].[StatusDate] ([ID], [Description], [TextColor], [BackColor]) VALUES (6, N'INVOICED', N'#000000', N'#99FF99')
SET IDENTITY_INSERT [dbo].[StatusDate] OFF
GO
SET IDENTITY_INSERT [dbo].[StatusProjects] ON 

INSERT [dbo].[StatusProjects] ([ID], [Description]) VALUES (1, N'PROCESS')
INSERT [dbo].[StatusProjects] ([ID], [Description]) VALUES (2, N'CANCEL')
INSERT [dbo].[StatusProjects] ([ID], [Description]) VALUES (3, N'DELETE')
INSERT [dbo].[StatusProjects] ([ID], [Description]) VALUES (4, N'FINISHED')
INSERT [dbo].[StatusProjects] ([ID], [Description]) VALUES (5, N'INBOXES')
SET IDENTITY_INSERT [dbo].[StatusProjects] OFF
GO
SET IDENTITY_INSERT [dbo].[StatusWorkOrders] ON 

INSERT [dbo].[StatusWorkOrders] ([ID], [Description], [TextColor], [BackColor], [Filter], [Order]) VALUES (1, N'WORK ORDER CREATED FOR DATE ASSIGNED', N'#000000', N'#FFFF00', N'WO', 1)
INSERT [dbo].[StatusWorkOrders] ([ID], [Description], [TextColor], [BackColor], [Filter], [Order]) VALUES (2, N'WORK ORDER CONFIRMED FOR TO VISITED', N'#FFFFFF', N'#994C00', N'WO', 2)
INSERT [dbo].[StatusWorkOrders] ([ID], [Description], [TextColor], [BackColor], [Filter], [Order]) VALUES (3, N'WORK ORDER SIGNED AND FINISHED', N'#000000', N'#009900', N'WO', 3)
INSERT [dbo].[StatusWorkOrders] ([ID], [Description], [TextColor], [BackColor], [Filter], [Order]) VALUES (4, N'WORK ORDER WITH CHANGE ORDER', N'#000000', N'#00FF00', N'WO&CO', 4)
INSERT [dbo].[StatusWorkOrders] ([ID], [Description], [TextColor], [BackColor], [Filter], [Order]) VALUES (5, N'CHANGE ORDER CREATED', N'#FFFFFF', N'#CC0000', N'CO', 5)
INSERT [dbo].[StatusWorkOrders] ([ID], [Description], [TextColor], [BackColor], [Filter], [Order]) VALUES (6, N'CHANGE OF ORDER SEND TO THE CUSTOMER', N'#FFFFFF', N'#FF8000', N'CO', 6)
INSERT [dbo].[StatusWorkOrders] ([ID], [Description], [TextColor], [BackColor], [Filter], [Order]) VALUES (7, N'CHANGE ORDER ACCEPTED FOR PAY', N'#000000', N'#FFFF66', N'CO', 7)
INSERT [dbo].[StatusWorkOrders] ([ID], [Description], [TextColor], [BackColor], [Filter], [Order]) VALUES (8, N'CHANGE ORDER PAYED', N'#000000', N'#00FF00', N'CO', 8)
SET IDENTITY_INSERT [dbo].[StatusWorkOrders] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeDocumentProjects] ON 

INSERT [dbo].[TypeDocumentProjects] ([ID], [Description], [IDTypeProject]) VALUES (1, N'CONTRACT', 1)
INSERT [dbo].[TypeDocumentProjects] ([ID], [Description], [IDTypeProject]) VALUES (2, N'PROPOSAL', 1)
INSERT [dbo].[TypeDocumentProjects] ([ID], [Description], [IDTypeProject]) VALUES (3, N'PRELIMINARY INFORMATION', 1)
INSERT [dbo].[TypeDocumentProjects] ([ID], [Description], [IDTypeProject]) VALUES (4, N'DAS 140', 2)
INSERT [dbo].[TypeDocumentProjects] ([ID], [Description], [IDTypeProject]) VALUES (5, N'DAS 142', 2)
INSERT [dbo].[TypeDocumentProjects] ([ID], [Description], [IDTypeProject]) VALUES (6, N'CONTRACT', 2)
INSERT [dbo].[TypeDocumentProjects] ([ID], [Description], [IDTypeProject]) VALUES (7, N'SECURE', 2)
INSERT [dbo].[TypeDocumentProjects] ([ID], [Description], [IDTypeProject]) VALUES (8, N'PROPOSAL', 2)
INSERT [dbo].[TypeDocumentProjects] ([ID], [Description], [IDTypeProject]) VALUES (9, N'OTHER', 1)
INSERT [dbo].[TypeDocumentProjects] ([ID], [Description], [IDTypeProject]) VALUES (10, N'OTHER', 2)
SET IDENTITY_INSERT [dbo].[TypeDocumentProjects] OFF
GO
SET IDENTITY_INSERT [dbo].[TypesOrderWork] ON 

INSERT [dbo].[TypesOrderWork] ([ID], [Description]) VALUES (1, N'WORK ORDER')
INSERT [dbo].[TypesOrderWork] ([ID], [Description]) VALUES (2, N'WORK ORDER T&M')
INSERT [dbo].[TypesOrderWork] ([ID], [Description]) VALUES (3, N'CHANGE ORDER T&M')
SET IDENTITY_INSERT [dbo].[TypesOrderWork] OFF
GO
SET IDENTITY_INSERT [dbo].[TypesProject] ON 

INSERT [dbo].[TypesProject] ([ID], [Description]) VALUES (1, N'PRIVATE PROJECT')
INSERT [dbo].[TypesProject] ([ID], [Description]) VALUES (2, N'GOVERNMENT PROJECT')
SET IDENTITY_INSERT [dbo].[TypesProject] OFF
GO
SET IDENTITY_INSERT [dbo].[Workers] ON 

INSERT [dbo].[Workers] ([ID], [Name], [Address], [Phone], [Email], [Status]) VALUES (1, N'SOLEDAD CORTEZ', N'CONTRACTS / ADMINISTRATION
O&M INFORMATION / WARRANTIES', N'(408) 826-28-54', N'soledad@calcocleaning.com', 1)
INSERT [dbo].[Workers] ([ID], [Name], [Address], [Phone], [Email], [Status]) VALUES (2, N'CARLOS CORTEZ', N'SITE SUPER/FOREMAN', N'(408) 202-35-03', N'carlos@calcocleaning.com', 1)
INSERT [dbo].[Workers] ([ID], [Name], [Address], [Phone], [Email], [Status]) VALUES (3, N'CESILIA CORTEZ', N'PROJECT MANAGER', N'(408) 569-24-58', N'cesilia@calcocleaning.com', 1)
INSERT [dbo].[Workers] ([ID], [Name], [Address], [Phone], [Email], [Status]) VALUES (4, N'ALEX CORTES', N'ACCOUNTING', N'(408) 613-26-73', N'office.admin@calcocleaning.com', 1)
INSERT [dbo].[Workers] ([ID], [Name], [Address], [Phone], [Email], [Status]) VALUES (5, N'HERMELINDA', NULL, NULL, NULL, 1)
INSERT [dbo].[Workers] ([ID], [Name], [Address], [Phone], [Email], [Status]) VALUES (9, N'CESILIA CORTEZ', N'4299 WINDSOR PARK DR', N'(408) 569-24-58', N'cesilia@calcocleaning.com', 1)
SET IDENTITY_INSERT [dbo].[Workers] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkOrders] ON 

INSERT [dbo].[WorkOrders] ([ID], [Clave], [IDProject], [IDCustomer], [Contact], [Address], [City], [Phone], [IDAssigned], [IDProvider], [Description], [DateOrder], [DateEnd], [IDType], [IDStatusWO], [IDStatusCalendario], [IDStatus]) VALUES (1, 1, 15, 212, NULL, N'3 MODELS ROUGH AND FINAL CLEAN', NULL, NULL, 0, 0, N'&lt;p&gt;This proposal is to complete one rough, final &amp;amp; fluff clean of all interior areas of a new two story building. Consisting of 90 units &amp;amp; 114 bed assisted living &amp;amp; memory care facility (+/-96,450sf.). Cleaning to include all common and private areas, including 2 elevators, offices, storage and mechanical rooms etc.&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;All work to be performed at finished location.&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Wage Rate:&lt;/strong&gt;&amp;nbsp; &lt;em&gt;This is not a Prevailing wage proposal&lt;/em&gt;.&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;&lt;strong&gt;Inclusion: &lt;/strong&gt;&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&lt;strong&gt;A.&lt;/strong&gt;&amp;nbsp; &lt;strong&gt;One Rough Clean:&lt;/strong&gt; &lt;em&gt;All units, offices, elevators and Bldg. common areas&lt;/em&gt;&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;Sweep all interior floors including storage/utility rooms, common areas, kitchens &amp;amp; offices.&lt;/li&gt;
	&lt;li&gt;Clean all windows - interior &amp;amp; exterior.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Remove all stickers from glass and any warranty or manuals to be handed to KPRS in packages per areas removed.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Clean all tracks at windows and doors.&lt;/li&gt;
	&lt;li&gt;Clean all bathrooms; toilets, showers, countertops and finish hardware&amp;nbsp;&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;B.&lt;/strong&gt;&amp;nbsp;&amp;nbsp; &lt;strong&gt;One Final Clean&lt;/strong&gt;:&lt;em&gt; &lt;/em&gt;&lt;em&gt;All units, offices, elevators and Bldg. common areas&lt;/em&gt;&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;Remove dust, dirt, grease, stains, fingerprints, labels, spilled and spattered, and other materials from all interior and exterior surfaces exposed to view.&lt;/li&gt;
	&lt;li&gt;Clean and polish all appliances, countertops, mirrors, sinks, elevators &amp;amp; other chrome items.&lt;/li&gt;
	&lt;li&gt;Clean tops, interior, and exterior of all cabinets.&lt;/li&gt;
	&lt;li&gt;Clean all interior light fixtures and all switch plates.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Remove all labels from lights except for UL Labels and shine bulbs.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Dust interior &amp;amp; exterior railing systems and entry door.&lt;/li&gt;
	&lt;li&gt;Wipe down and clean all doors, hardware, and shelving.&lt;/li&gt;
	&lt;li&gt;Wipe off the top of all wood base, door casings, window sills, and other trim.&lt;/li&gt;
	&lt;li&gt;Clean all bathrooms including shower, toilet, accessories, counters, mirrors.&lt;/li&gt;
	&lt;li&gt;Vacuum all exposed to view air grilles and diffusers.&lt;/li&gt;
	&lt;li&gt;Feather dust blinds and shades.&lt;/li&gt;
	&lt;li&gt;Wipe clean unit&amp;rsquo;s entry doors.&lt;/li&gt;
	&lt;li&gt;Sweep &amp;amp; mop all hard floor surfaces using Wet Swifter &amp;amp; vacuum any carpeted areas.&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;C.&amp;nbsp;&amp;nbsp; &lt;/strong&gt;&lt;strong&gt;Fluff Clean:&lt;/strong&gt; &lt;em&gt;All units, offices, elevators and Bldg. common areas&lt;/em&gt;&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;Touch up interior windows&lt;/li&gt;
	&lt;li&gt;Touch up kitchens and restrooms.&lt;/li&gt;
	&lt;li&gt;Vacuum carpeted floors and mop all floors.&lt;/li&gt;
	&lt;li&gt;Touch up all mirrors and windows on the interior only.&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;
', CAST(N'2019-07-23' AS Date), CAST(N'2019-07-23' AS Date), 1, 3, 5, 1)
INSERT [dbo].[WorkOrders] ([ID], [Clave], [IDProject], [IDCustomer], [Contact], [Address], [City], [Phone], [IDAssigned], [IDProvider], [Description], [DateOrder], [DateEnd], [IDType], [IDStatusWO], [IDStatusCalendario], [IDStatus]) VALUES (2, 1, 16, 94, NULL, N'FINISH 3ER AND 2ND FLOOR', NULL, NULL, 0, 0, N'&lt;p&gt;This proposal is to complete one final cleaning of 4 stories building (22,103 sf).&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;All work to be performed at finished location.&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Wage rate:&lt;/strong&gt;&amp;nbsp; This is a prevailing wage proposal. Non-Union. No PLA or PSA and any Union requirements included.&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;&lt;strong&gt;Inclusion: One final cleaning: &lt;/strong&gt;&lt;/li&gt;
&lt;/ol&gt;

&lt;ol&gt;
	&lt;li&gt;Clean floor and mounted fixtures and furniture.&lt;/li&gt;
	&lt;li&gt;Clean and sanitize restrooms.&lt;/li&gt;
	&lt;li&gt;Clean tops, interior, and exterior of cabinets.&lt;/li&gt;
	&lt;li&gt;Clean walls, doors, frames, and hardware surfaces.&lt;/li&gt;
	&lt;li&gt;Clean and shine all glazing and framing (interior and exterior).&lt;/li&gt;
	&lt;li&gt;Clean wall/floor baseboards.&lt;/li&gt;
	&lt;li&gt;Clean interior light fixtures.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Clean all switch plates.&lt;/li&gt;
	&lt;li&gt;Vacuum, sweep, dry mop, and wet mop floor surfaces.&lt;/li&gt;
	&lt;li&gt;Apply 2 coats of Armstrong floor finish on new VCT floor at storage rooms and IT closet only (397 sf.)&lt;/li&gt;
&lt;/ol&gt;
', CAST(N'2019-07-19' AS Date), CAST(N'2019-07-19' AS Date), 1, 2, 3, 1)
INSERT [dbo].[WorkOrders] ([ID], [Clave], [IDProject], [IDCustomer], [Contact], [Address], [City], [Phone], [IDAssigned], [IDProvider], [Description], [DateOrder], [DateEnd], [IDType], [IDStatusWO], [IDStatusCalendario], [IDStatus]) VALUES (3, 2, 16, 94, NULL, N'FINAL CLEAN FIRST AND BASEMENT', NULL, NULL, 0, 0, N'&lt;p&gt;This proposal is to complete one final cleaning of 4 stories building (22,103 sf).&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;All work to be performed at finished location.&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Wage rate:&lt;/strong&gt;&amp;nbsp; This is a prevailing wage proposal. Non-Union. No PLA or PSA and any Union requirements included.&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;&lt;strong&gt;Inclusion: One final cleaning: &lt;/strong&gt;&lt;/li&gt;
&lt;/ol&gt;

&lt;ol&gt;
	&lt;li&gt;Clean floor and mounted fixtures and furniture.&lt;/li&gt;
	&lt;li&gt;Clean and sanitize restrooms.&lt;/li&gt;
	&lt;li&gt;Clean tops, interior, and exterior of cabinets.&lt;/li&gt;
	&lt;li&gt;Clean walls, doors, frames, and hardware surfaces.&lt;/li&gt;
	&lt;li&gt;Clean and shine all glazing and framing (interior and exterior).&lt;/li&gt;
	&lt;li&gt;Clean wall/floor baseboards.&lt;/li&gt;
	&lt;li&gt;Clean interior light fixtures.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Clean all switch plates.&lt;/li&gt;
	&lt;li&gt;Vacuum, sweep, dry mop, and wet mop floor surfaces.&lt;/li&gt;
	&lt;li&gt;Apply 2 coats of Armstrong floor finish on new VCT floor at storage rooms and IT closet only (397 sf.)&lt;/li&gt;
&lt;/ol&gt;
', CAST(N'2019-07-22' AS Date), CAST(N'2019-07-23' AS Date), 1, 2, 2, 1)
INSERT [dbo].[WorkOrders] ([ID], [Clave], [IDProject], [IDCustomer], [Contact], [Address], [City], [Phone], [IDAssigned], [IDProvider], [Description], [DateOrder], [DateEnd], [IDType], [IDStatusWO], [IDStatusCalendario], [IDStatus]) VALUES (4, 1, 17, 118, NULL, N'FINAL CLEAN SMALL ROOM', NULL, NULL, 0, 0, NULL, CAST(N'2019-07-23' AS Date), CAST(N'2019-07-23' AS Date), 1, 2, 3, 1)
INSERT [dbo].[WorkOrders] ([ID], [Clave], [IDProject], [IDCustomer], [Contact], [Address], [City], [Phone], [IDAssigned], [IDProvider], [Description], [DateOrder], [DateEnd], [IDType], [IDStatusWO], [IDStatusCalendario], [IDStatus]) VALUES (5, 1, 18, 289, NULL, NULL, NULL, NULL, 0, 0, N'&lt;p&gt;This proposal is to complete one final cleaning of 2nd floor upper lobby, student&amp;rsquo;s offices and lounge, stairs and 2 storage rooms only (4,950 sf&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;I. Inclusion: One final cleaning:&amp;nbsp;&lt;/p&gt;

&lt;p&gt;1. Clean floor and mounted fixtures and furniture.&lt;/p&gt;

&lt;p&gt;2. Clean tops, interior, and exterior of cabinets.&lt;/p&gt;

&lt;p&gt;3. Clean walls, doors, frames, and hardware surfaces.&lt;/p&gt;

&lt;p&gt;4. Clean and shine all glazing and framing (interior only).&lt;/p&gt;

&lt;p&gt;5. Clean wall/floor baseboards.&lt;/p&gt;

&lt;p&gt;6. Clean interior light fixtures.&amp;nbsp;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;7. Clean all switch plates. Vacuum, sweep, dry mop, and wet mop all floor surfaces. Apply 3 coats of Armstrong floor polish on new resilient floors (2,700 sf.).&lt;/p&gt;
', CAST(N'2019-07-16' AS Date), CAST(N'2019-07-16' AS Date), 3, 1, 1, 1)
INSERT [dbo].[WorkOrders] ([ID], [Clave], [IDProject], [IDCustomer], [Contact], [Address], [City], [Phone], [IDAssigned], [IDProvider], [Description], [DateOrder], [DateEnd], [IDType], [IDStatusWO], [IDStatusCalendario], [IDStatus]) VALUES (6, 2, 18, 289, NULL, N'CO EMERGENCY CLEANING', NULL, NULL, 0, 0, N'&lt;p&gt;This proposal is to complete one final cleaning of 2nd floor upper lobby, student&amp;rsquo;s offices and lounge, stairs and 2 storage rooms only (4,950 sf&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;I. Inclusion: One final cleaning:&amp;nbsp;&lt;/p&gt;

&lt;p&gt;1. Clean floor and mounted fixtures and furniture.&lt;/p&gt;

&lt;p&gt;2. Clean tops, interior, and exterior of cabinets.&lt;/p&gt;

&lt;p&gt;3. Clean walls, doors, frames, and hardware surfaces.&lt;/p&gt;

&lt;p&gt;4. Clean and shine all glazing and framing (interior only).&lt;/p&gt;

&lt;p&gt;5. Clean wall/floor baseboards.&lt;/p&gt;

&lt;p&gt;6. Clean interior light fixtures.&amp;nbsp;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;7. Clean all switch plates. Vacuum, sweep, dry mop, and wet mop all floor surfaces. Apply 3 coats of Armstrong floor polish on new resilient floors (2,700 sf.).&lt;/p&gt;
', CAST(N'2019-07-22' AS Date), CAST(N'2019-07-22' AS Date), 3, 1, 1, 1)
INSERT [dbo].[WorkOrders] ([ID], [Clave], [IDProject], [IDCustomer], [Contact], [Address], [City], [Phone], [IDAssigned], [IDProvider], [Description], [DateOrder], [DateEnd], [IDType], [IDStatusWO], [IDStatusCalendario], [IDStatus]) VALUES (7, 1, 24, 348, NULL, N'FLUFF CLEAN PHASE #3 BLDG#2', NULL, NULL, 0, 0, N'&lt;p&gt;This proposal is to complete final and one fluff cleaning of 32 &amp;ndash; 1bedroom (616 sf. each) and 16 &amp;ndash; 2 bedrooms units (728 sf. each) and office, community areas and common areas. Total project: 33,430 sf. in 2 and 3 stories building.&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;All work to be performed at finished location in 4 Phases. Includes a total of 12 mobilizations, 3 per each Phase.&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Wage rate:&lt;/strong&gt;&amp;nbsp; This is not a prevailing wage proposal. Non-union.&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;&lt;strong&gt;Inclusion: &amp;nbsp;&lt;/strong&gt;&lt;/li&gt;
&lt;/ol&gt;

&lt;ol&gt;
	&lt;li&gt;&lt;strong&gt;Rough Clean (32 units, office, community areas and common areas).&lt;/strong&gt;&lt;/li&gt;
&lt;/ol&gt;

&lt;ol&gt;
	&lt;li&gt;Sweep interior floors including patios, porches, storage and hot water heater closet.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Clean all windows on the interior and exterior.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Remove all stickers from glass.&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Clean all tracks at windows and doors.&lt;/li&gt;
	&lt;li&gt;Clean all bathrooms. Clean all toilets, showers, and countertops. &amp;nbsp;&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;B.&lt;/strong&gt;&amp;nbsp;&amp;nbsp; &lt;strong&gt;Final Clean &lt;/strong&gt;&lt;strong&gt;(32 units, office, community areas and common areas).&lt;/strong&gt;&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;Remove all debris from interiors.&lt;/li&gt;
	&lt;li&gt;Place debris in the dumpster provided by Contractor.&lt;/li&gt;
	&lt;li&gt;Wipe down and remove dirt from interior horizontal and vertical surfaces, including, but not limited to, walls, doors, countertops, cabinets, cabinet shelves, cabinet drawers, mirrors, and trim.&lt;/li&gt;
	&lt;li&gt;Clean plumbing fixtures, including toilets, sinks, faucets, and showers and tubs (including removal of labels, stickers and light rust spots at tubs).&lt;/li&gt;
	&lt;li&gt;Clean light fixtures of dust and debris.&lt;/li&gt;
	&lt;li&gt;Remove packing material and manufacturer&amp;rsquo;s stickers from appliances, and clean inside and outside.&lt;/li&gt;
	&lt;li&gt;Save Operations and Maintenance documentation shipped with the appliances and turn over to General Contractor.&lt;/li&gt;
	&lt;li&gt;Clean and polish stainless steel, including but not limited to, sinks and appliances.&lt;/li&gt;
	&lt;li&gt;Vacuum, sweep &amp;amp; mop floors as required&lt;/li&gt;
	&lt;li&gt;Clean entryways and patios.&lt;/li&gt;
	&lt;li&gt;Provide thorough cleaning of thresholds.&lt;/li&gt;
	&lt;li&gt;Polish transparent and glossy surfaces.&lt;/li&gt;
	&lt;li&gt;Clean, dust and vacuum interior stairwells and wipe down handrails.&lt;/li&gt;
	&lt;li&gt;Sweep and dust decks, patios, common stairwells.&lt;/li&gt;
	&lt;li&gt;Clean and dust storage rooms.&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;C.&amp;nbsp; Fluff Clean: (32 units, office, community areas and common areas).&lt;/strong&gt;&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;Touch up kitchens and restrooms.&lt;/li&gt;
	&lt;li&gt;Vacuum carpeted floors and mop all floors.&lt;/li&gt;
	&lt;li&gt;Touch up all mirrors and windows on the interior only.&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;
', CAST(N'2019-07-18' AS Date), CAST(N'2019-07-18' AS Date), 1, 1, 1, 1)
INSERT [dbo].[WorkOrders] ([ID], [Clave], [IDProject], [IDCustomer], [Contact], [Address], [City], [Phone], [IDAssigned], [IDProvider], [Description], [DateOrder], [DateEnd], [IDType], [IDStatusWO], [IDStatusCalendario], [IDStatus]) VALUES (8, 1, 25, 342, NULL, N'FINAL CLEAN SLUSD SAN LEANDRO', NULL, NULL, 0, 0, N'&lt;p&gt;&lt;strong&gt;This proposal is to complete one final Cleaning of a 1,672-sf. store&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;All work to be performed at finished location&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Wage rate:&lt;/strong&gt;&amp;nbsp; This is not a prevailing wage proposal.&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;I.&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; Inclusion:&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;A. Final Cleaning:&lt;/strong&gt;&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;Clean all exposed surface.&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/li&gt;
	&lt;li&gt;Clean display and sales area, bar, caf&amp;eacute; seating area, and workroom.&lt;/li&gt;
	&lt;li&gt;Clean and sanitize restrooms.&lt;/li&gt;
	&lt;li&gt;Dust and clean all floor and mounted fixtures and furniture.&lt;/li&gt;
	&lt;li&gt;Clean and shine all glass mirrors and glazing and framing (interior and exterior).&lt;/li&gt;
	&lt;li&gt;Clean wall/floor baseboards.&lt;/li&gt;
	&lt;li&gt;Vacuum, sweep, dry mop and wet mop all floor surfaces.&lt;/li&gt;
	&lt;li&gt;Clean back of the store.&lt;/li&gt;
	&lt;li&gt;Power wash sidewalk and outdoor sitting area only.&lt;/li&gt;
	&lt;li&gt;Machine scrub tile floors.&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;&lt;strong&gt;One Fluff Cleaning:&lt;/strong&gt;&lt;/li&gt;
&lt;/ol&gt;

&lt;ol&gt;
	&lt;li&gt;Vacuum, sweep and mop clean all floors.&lt;/li&gt;
	&lt;li&gt;Touch up windows and mirrors (interior only).&lt;/li&gt;
	&lt;li&gt;Touch up restrooms.&lt;/li&gt;
&lt;/ol&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;
', CAST(N'2019-07-24' AS Date), CAST(N'2019-07-24' AS Date), 1, 1, 1, 1)
INSERT [dbo].[WorkOrders] ([ID], [Clave], [IDProject], [IDCustomer], [Contact], [Address], [City], [Phone], [IDAssigned], [IDProvider], [Description], [DateOrder], [DateEnd], [IDType], [IDStatusWO], [IDStatusCalendario], [IDStatus]) VALUES (9, 1, 28, 8, NULL, N'EXTRA WORK T&M', NULL, NULL, 0, 0, N'&lt;p&gt;This proposal is to complete one final clean of site after construction. All work to be completed at the listed address +/-3,752sf.&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;&lt;em&gt;Wage rate:&amp;nbsp; This is not a prevailing wage proposal.&lt;/em&gt;&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Inclusion&lt;/strong&gt;&lt;/p&gt;

&lt;ol&gt;
	&lt;li&gt;&lt;strong&gt;Final Cleaning:&lt;/strong&gt;&lt;/li&gt;
&lt;/ol&gt;

&lt;ol&gt;
	&lt;li&gt;Remove dust, dirt, grease, stains, fingerprints, labels, spilled and spattered, and other materials from all surfaces exposed to view&lt;/li&gt;
	&lt;li&gt;Clean and polish all glazing, mirrors, sinks and any other stainless-steel surfaces&lt;/li&gt;
	&lt;li&gt;Clean all windows - interior and exterior&lt;/li&gt;
	&lt;li&gt;Clean all floor and mounted fixtures including switch plates&lt;/li&gt;
	&lt;li&gt;Clean all doors, door casings and hardware&lt;/li&gt;
	&lt;li&gt;Vacuum, sweep and mop clean all floor surfaces&lt;/li&gt;
	&lt;li&gt;Clean all casework, drawers and cabinets inside and out&lt;/li&gt;
	&lt;li&gt;Clean all areas, including storage and utilities rooms &amp;amp; office&lt;/li&gt;
	&lt;li&gt;Clean and sanitize restrooms
	&lt;p&gt;&amp;nbsp;&lt;/p&gt;
	&lt;/li&gt;
&lt;/ol&gt;
', CAST(N'2019-07-24' AS Date), CAST(N'2019-07-24' AS Date), 3, 1, 1, 1)
INSERT [dbo].[WorkOrders] ([ID], [Clave], [IDProject], [IDCustomer], [Contact], [Address], [City], [Phone], [IDAssigned], [IDProvider], [Description], [DateOrder], [DateEnd], [IDType], [IDStatusWO], [IDStatusCalendario], [IDStatus]) VALUES (10, 1, 11, 377, NULL, N'BLOCK! BLDG.3 LOT#A308', NULL, NULL, 0, 0, N'&lt;p&gt;All work to be performed at finished location. &lt;strong&gt;Minimum of 3 units per mobilization.&lt;/strong&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;Wage rate:&amp;nbsp; This is not a prevailing wage proposal. Non-Union.&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;TRADE CONTRACTOR agrees that Final Cleaning shall be performed in four &amp;ndash; (4) phases:&lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Phase I (Rough Clean &amp;ndash; After Interior Paint) &lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;bull; Clean windows, French doors, and exterior doors inside and out, including tracks, channels, frames, glass, weep holes, etc. &amp;bull; Clean all bathtubs and shower pans. &amp;bull; Sweep out home and place debris in garage.&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Phase II (Pre-Carpet) &lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;bull; Clean tub, shower pan, and all surrounds. &amp;bull; Clean thresholds, window tracks, channels, and sills. &amp;bull; Dust entire home including; closets, shelves, cabinet drawers, cabinet doors, cabinet interiors, doors, casings, and base board. &amp;bull; Clean and dust furnace. &amp;bull; Clean toilets, mirrors, lavatories, and countertops. &amp;bull; Thoroughly scrape floors (concrete) and sweep home.&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Phase III (Final Clean &amp;ndash; After Carpet) &lt;/strong&gt;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;bull; Re-clean windows and French doors as required. &amp;bull; Vacuum and clean sills and thresholds. &amp;bull; Clean vanity and kitchen counter tops &amp;amp; sinks. &amp;bull; Clean tubs, showers, sinks, lavatories, water closets, and all bathroom fixtures &amp;amp; accessories. &amp;bull; Clean and polish bath fixtures per manufacturer&amp;rsquo;s requirements. &amp;bull; Dust all doors, closet shelves, and poles. &amp;bull; Wipe down all woodwork per manufacturer&amp;rsquo;s requirements. &amp;bull; Clean and dust all millwork, wood trim, and cabinets.&amp;nbsp; Clean cabinets inside and out. &amp;bull; Clean and dust all light fixtures, glass, and appliances. &amp;bull; Vacuum carpet and clean all hard surface flooring. &amp;bull; Remove all stickers from hardware, light fixtures, appliances, windows, and doors. &amp;bull; Clean all hardware including; knobs, strike plates, bolts, hinges, etc. &amp;bull; Clean all electrical plates and door chimes. &amp;bull; Pressure-wash all concrete including; garage, porches, patios, and driveway.&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&lt;strong&gt;Phase IV (Pre-Walk Fluff&lt;/strong&gt;)&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;bull; Vacuum carpet and clean all hard surface floors throughout the home. &amp;bull; Clean vanity and kitchen countertops and sinks. &amp;bull; Clean all tubs, showers, lavatories, water closets, and all bathroom fixtures and accessories. &amp;bull; Rewash all windows, sliding glass doors, and French doors including weeps. &amp;bull; Hose down garage, porches, sidewalks, and driveway.&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;

&lt;p&gt;&amp;nbsp;&lt;/p&gt;
', CAST(N'2019-07-24' AS Date), CAST(N'2019-07-24' AS Date), 1, 1, 1, 1)
INSERT [dbo].[WorkOrders] ([ID], [Clave], [IDProject], [IDCustomer], [Contact], [Address], [City], [Phone], [IDAssigned], [IDProvider], [Description], [DateOrder], [DateEnd], [IDType], [IDStatusWO], [IDStatusCalendario], [IDStatus]) VALUES (11, 1, 33, 155, NULL, N'ROUGH CLEAN 16 UNITS
', NULL, NULL, 0, 0, NULL, CAST(N'2019-04-24' AS Date), CAST(N'2019-04-24' AS Date), 1, 3, 5, 1)
INSERT [dbo].[WorkOrders] ([ID], [Clave], [IDProject], [IDCustomer], [Contact], [Address], [City], [Phone], [IDAssigned], [IDProvider], [Description], [DateOrder], [DateEnd], [IDType], [IDStatusWO], [IDStatusCalendario], [IDStatus]) VALUES (12, 2, 33, 155, NULL, N'FLUFF CLEAN 16 UNITS T&M', NULL, NULL, 0, 0, NULL, CAST(N'2019-07-18' AS Date), CAST(N'2019-07-18' AS Date), 3, 1, 1, 1)
INSERT [dbo].[WorkOrders] ([ID], [Clave], [IDProject], [IDCustomer], [Contact], [Address], [City], [Phone], [IDAssigned], [IDProvider], [Description], [DateOrder], [DateEnd], [IDType], [IDStatusWO], [IDStatusCalendario], [IDStatus]) VALUES (13, 1, 45, 128, NULL, N'CLEANING BIRD DROPPINGS ON BALCONIES', NULL, NULL, 0, 0, NULL, CAST(N'2019-01-15' AS Date), CAST(N'2019-01-15' AS Date), 3, 4, 5, 1)
INSERT [dbo].[WorkOrders] ([ID], [Clave], [IDProject], [IDCustomer], [Contact], [Address], [City], [Phone], [IDAssigned], [IDProvider], [Description], [DateOrder], [DateEnd], [IDType], [IDStatusWO], [IDStatusCalendario], [IDStatus]) VALUES (14, 2, 45, 128, NULL, NULL, NULL, NULL, 0, 0, NULL, CAST(N'2019-01-25' AS Date), CAST(N'2019-01-25' AS Date), 1, 4, 5, 3)
INSERT [dbo].[WorkOrders] ([ID], [Clave], [IDProject], [IDCustomer], [Contact], [Address], [City], [Phone], [IDAssigned], [IDProvider], [Description], [DateOrder], [DateEnd], [IDType], [IDStatusWO], [IDStatusCalendario], [IDStatus]) VALUES (15, 1, 46, 326, NULL, N'WINDOW CLEAN AFTER SCAFFOLDS', NULL, NULL, 0, 0, NULL, CAST(N'2019-01-15' AS Date), CAST(N'2019-01-15' AS Date), 3, 1, 1, 1)
INSERT [dbo].[WorkOrders] ([ID], [Clave], [IDProject], [IDCustomer], [Contact], [Address], [City], [Phone], [IDAssigned], [IDProvider], [Description], [DateOrder], [DateEnd], [IDType], [IDStatusWO], [IDStatusCalendario], [IDStatus]) VALUES (16, 1, 47, 326, NULL, N'RE-CLEAN SECTION 1A', NULL, NULL, 0, 0, NULL, CAST(N'2019-01-21' AS Date), CAST(N'2019-01-21' AS Date), 3, 1, 1, 1)
INSERT [dbo].[WorkOrders] ([ID], [Clave], [IDProject], [IDCustomer], [Contact], [Address], [City], [Phone], [IDAssigned], [IDProvider], [Description], [DateOrder], [DateEnd], [IDType], [IDStatusWO], [IDStatusCalendario], [IDStatus]) VALUES (17, 2, 47, 326, NULL, N'RE-CLEAN SECTION 1A 4TH FLOOR', NULL, NULL, 0, 0, NULL, CAST(N'2019-01-22' AS Date), CAST(N'2019-01-22' AS Date), 3, 1, 1, 1)
INSERT [dbo].[WorkOrders] ([ID], [Clave], [IDProject], [IDCustomer], [Contact], [Address], [City], [Phone], [IDAssigned], [IDProvider], [Description], [DateOrder], [DateEnd], [IDType], [IDStatusWO], [IDStatusCalendario], [IDStatus]) VALUES (18, 1, 48, 151, NULL, N'FINAL CHANGE ORDER TO COMPLETE CONTRACT', NULL, NULL, 0, 0, NULL, CAST(N'2019-01-23' AS Date), CAST(N'2019-01-23' AS Date), 1, 4, 5, 1)
INSERT [dbo].[WorkOrders] ([ID], [Clave], [IDProject], [IDCustomer], [Contact], [Address], [City], [Phone], [IDAssigned], [IDProvider], [Description], [DateOrder], [DateEnd], [IDType], [IDStatusWO], [IDStatusCalendario], [IDStatus]) VALUES (19, 1, 49, 91, NULL, N'PROVIDE JANITORIAL SERVICES IN UNITS 8F, 12G & 10B', NULL, NULL, 0, 0, NULL, CAST(N'2019-01-28' AS Date), CAST(N'2019-01-28' AS Date), 3, 1, 1, 1)
INSERT [dbo].[WorkOrders] ([ID], [Clave], [IDProject], [IDCustomer], [Contact], [Address], [City], [Phone], [IDAssigned], [IDProvider], [Description], [DateOrder], [DateEnd], [IDType], [IDStatusWO], [IDStatusCalendario], [IDStatus]) VALUES (20, 1, 50, 128, NULL, N'WINDOWS', NULL, NULL, 0, 0, NULL, CAST(N'2019-01-28' AS Date), CAST(N'2019-01-28' AS Date), 3, 1, 1, 1)
INSERT [dbo].[WorkOrders] ([ID], [Clave], [IDProject], [IDCustomer], [Contact], [Address], [City], [Phone], [IDAssigned], [IDProvider], [Description], [DateOrder], [DateEnd], [IDType], [IDStatusWO], [IDStatusCalendario], [IDStatus]) VALUES (21, 1, 103, 160, NULL, N'ADDITIONAL FINAL CLEAN', NULL, NULL, 0, 0, NULL, CAST(N'2019-02-12' AS Date), CAST(N'2019-02-12' AS Date), 3, 1, 1, 1)
INSERT [dbo].[WorkOrders] ([ID], [Clave], [IDProject], [IDCustomer], [Contact], [Address], [City], [Phone], [IDAssigned], [IDProvider], [Description], [DateOrder], [DateEnd], [IDType], [IDStatusWO], [IDStatusCalendario], [IDStatus]) VALUES (22, 1, 66, 396, NULL, N'ADDITIONAL FLUFF CLEAN', NULL, NULL, 0, 0, NULL, CAST(N'2019-02-04' AS Date), CAST(N'2019-02-04' AS Date), 3, 1, 1, 1)
INSERT [dbo].[WorkOrders] ([ID], [Clave], [IDProject], [IDCustomer], [Contact], [Address], [City], [Phone], [IDAssigned], [IDProvider], [Description], [DateOrder], [DateEnd], [IDType], [IDStatusWO], [IDStatusCalendario], [IDStatus]) VALUES (23, 2, 46, 326, NULL, N'ADDITIONAL CLEANING', NULL, NULL, 0, 0, NULL, CAST(N'2019-02-03' AS Date), CAST(N'2019-02-03' AS Date), 3, 2, 2, 3)
INSERT [dbo].[WorkOrders] ([ID], [Clave], [IDProject], [IDCustomer], [Contact], [Address], [City], [Phone], [IDAssigned], [IDProvider], [Description], [DateOrder], [DateEnd], [IDType], [IDStatusWO], [IDStatusCalendario], [IDStatus]) VALUES (24, 3, 46, 326, NULL, N'ADDITIONAL CLEAN', NULL, NULL, 0, 0, NULL, CAST(N'2019-02-03' AS Date), CAST(N'2019-02-03' AS Date), 3, 1, 1, 1)
INSERT [dbo].[WorkOrders] ([ID], [Clave], [IDProject], [IDCustomer], [Contact], [Address], [City], [Phone], [IDAssigned], [IDProvider], [Description], [DateOrder], [DateEnd], [IDType], [IDStatusWO], [IDStatusCalendario], [IDStatus]) VALUES (25, 4, 46, 326, NULL, N'ADDITIONAL ON T&M', NULL, NULL, 0, 0, NULL, CAST(N'2019-02-27' AS Date), CAST(N'2019-02-27' AS Date), 3, 1, 1, 1)
INSERT [dbo].[WorkOrders] ([ID], [Clave], [IDProject], [IDCustomer], [Contact], [Address], [City], [Phone], [IDAssigned], [IDProvider], [Description], [DateOrder], [DateEnd], [IDType], [IDStatusWO], [IDStatusCalendario], [IDStatus]) VALUES (26, 1, 99, 4, NULL, N'CLEAN APPLIANCES', NULL, NULL, 0, 0, NULL, CAST(N'2019-03-29' AS Date), CAST(N'2019-03-29' AS Date), 3, 1, 1, 1)
INSERT [dbo].[WorkOrders] ([ID], [Clave], [IDProject], [IDCustomer], [Contact], [Address], [City], [Phone], [IDAssigned], [IDProvider], [Description], [DateOrder], [DateEnd], [IDType], [IDStatusWO], [IDStatusCalendario], [IDStatus]) VALUES (27, 2, 99, 4, NULL, N'ADDITIONAL FLUFF', NULL, NULL, 0, 0, NULL, CAST(N'2019-03-29' AS Date), CAST(N'2019-03-29' AS Date), 3, 1, 1, 1)
INSERT [dbo].[WorkOrders] ([ID], [Clave], [IDProject], [IDCustomer], [Contact], [Address], [City], [Phone], [IDAssigned], [IDProvider], [Description], [DateOrder], [DateEnd], [IDType], [IDStatusWO], [IDStatusCalendario], [IDStatus]) VALUES (28, 1, 67, 147, NULL, N'ADDITIONAL CLEANING', NULL, NULL, 0, 0, NULL, CAST(N'2019-03-19' AS Date), CAST(N'2019-03-19' AS Date), 3, 1, 1, 1)
INSERT [dbo].[WorkOrders] ([ID], [Clave], [IDProject], [IDCustomer], [Contact], [Address], [City], [Phone], [IDAssigned], [IDProvider], [Description], [DateOrder], [DateEnd], [IDType], [IDStatusWO], [IDStatusCalendario], [IDStatus]) VALUES (29, 1, 57, 396, NULL, N'ADDITIONAL CLEAN', NULL, NULL, 0, 0, NULL, CAST(N'2019-03-27' AS Date), CAST(N'2019-03-27' AS Date), 3, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[WorkOrders] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkOrdersAssigned] ON 

INSERT [dbo].[WorkOrdersAssigned] ([ID], [Clave], [DateAssigned], [IDWorker], [IDProveedor], [Order], [Status], [Document], [Description]) VALUES (1, 1, CAST(N'2019-07-23' AS Date), 0, 8, 1, 1, N'NULL', N'3 MODELOS')
INSERT [dbo].[WorkOrdersAssigned] ([ID], [Clave], [DateAssigned], [IDWorker], [IDProveedor], [Order], [Status], [Document], [Description]) VALUES (2, 1, CAST(N'2019-07-23' AS Date), 0, 1, 2, 1, N'NULL', N'FINAL CLEAN 3ER AND 2ND FLOOR')
INSERT [dbo].[WorkOrdersAssigned] ([ID], [Clave], [DateAssigned], [IDWorker], [IDProveedor], [Order], [Status], [Document], [Description]) VALUES (3, 1, CAST(N'2019-07-22' AS Date), 0, 8, 3, 0, N'[BASE_URL]doc/WO2019_271_Marlen.jpg', N'FIRST FLOOR AND BASEMENT')
INSERT [dbo].[WorkOrdersAssigned] ([ID], [Clave], [DateAssigned], [IDWorker], [IDProveedor], [Order], [Status], [Document], [Description]) VALUES (4, 2, CAST(N'2019-07-23' AS Date), 5, 0, 3, 1, N'NULL', N'FINISHED BASEMENT VACUUM AND MOP FLOOR')
INSERT [dbo].[WorkOrdersAssigned] ([ID], [Clave], [DateAssigned], [IDWorker], [IDProveedor], [Order], [Status], [Document], [Description]) VALUES (5, 1, CAST(N'2019-07-23' AS Date), 5, 0, 4, 1, N'NULL', N'FINAL CLEAN SMALL ROOM')
INSERT [dbo].[WorkOrdersAssigned] ([ID], [Clave], [DateAssigned], [IDWorker], [IDProveedor], [Order], [Status], [Document], [Description]) VALUES (6, 1, CAST(N'2019-07-23' AS Date), 5, 0, 6, 1, N'NULL', N'EMERGENCY CLEANING')
INSERT [dbo].[WorkOrdersAssigned] ([ID], [Clave], [DateAssigned], [IDWorker], [IDProveedor], [Order], [Status], [Document], [Description]) VALUES (7, 2, CAST(N'2019-07-23' AS Date), 5, 0, 6, 1, N'NULL', N'EMERGENCY CLEANING')
INSERT [dbo].[WorkOrdersAssigned] ([ID], [Clave], [DateAssigned], [IDWorker], [IDProveedor], [Order], [Status], [Document], [Description]) VALUES (8, 1, CAST(N'2019-07-24' AS Date), 0, 13, 8, 1, N'NULL', N'FINAL CLEAN')
INSERT [dbo].[WorkOrdersAssigned] ([ID], [Clave], [DateAssigned], [IDWorker], [IDProveedor], [Order], [Status], [Document], [Description]) VALUES (9, 1, CAST(N'2019-07-24' AS Date), 0, 1, 12, 1, N'NULL', N'EXTRA FLUFF CLEAN 16 UNITS 42.5 TOTAL HRS.')
SET IDENTITY_INSERT [dbo].[WorkOrdersAssigned] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkOrdersOvertime] ON 

INSERT [dbo].[WorkOrdersOvertime] ([ID], [DateOrder], [BeginTime], [EndTime], [People], [TotalHrsPeople], [TotalHrsGroup], [AmountHrs], [IDProject], [IDWorkOder]) VALUES (1, CAST(N'2019-07-16' AS Date), CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time), 2, 4, 8, 0, 0, 5)
INSERT [dbo].[WorkOrdersOvertime] ([ID], [DateOrder], [BeginTime], [EndTime], [People], [TotalHrsPeople], [TotalHrsGroup], [AmountHrs], [IDProject], [IDWorkOder]) VALUES (2, CAST(N'2019-07-18' AS Date), CAST(N'07:00:00' AS Time), CAST(N'11:00:00' AS Time), 2, 4, 8, 0, 0, 5)
SET IDENTITY_INSERT [dbo].[WorkOrdersOvertime] OFF
GO
ALTER TABLE [dbo].[ChangeOrders]  WITH CHECK ADD  CONSTRAINT [FK_ChangeOrders_Projects] FOREIGN KEY([IDProject])
REFERENCES [dbo].[Projects] ([ID])
GO
ALTER TABLE [dbo].[ChangeOrders] CHECK CONSTRAINT [FK_ChangeOrders_Projects]
GO
ALTER TABLE [dbo].[ChangeOrders]  WITH CHECK ADD  CONSTRAINT [FK_ChangeOrders_WorkOrders] FOREIGN KEY([IDWorkOrder])
REFERENCES [dbo].[WorkOrders] ([ID])
GO
ALTER TABLE [dbo].[ChangeOrders] CHECK CONSTRAINT [FK_ChangeOrders_WorkOrders]
GO
ALTER TABLE [dbo].[CommentsWO]  WITH CHECK ADD  CONSTRAINT [FK_CommentsWO_WorkOrders] FOREIGN KEY([ID])
REFERENCES [dbo].[WorkOrders] ([ID])
GO
ALTER TABLE [dbo].[CommentsWO] CHECK CONSTRAINT [FK_CommentsWO_WorkOrders]
GO
ALTER TABLE [dbo].[Documents]  WITH NOCHECK ADD  CONSTRAINT [FK_Documents_ChangeOrders] FOREIGN KEY([IDChangeOrden])
REFERENCES [dbo].[ChangeOrders] ([ID])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_Documents_ChangeOrders]
GO
ALTER TABLE [dbo].[Documents]  WITH NOCHECK ADD  CONSTRAINT [FK_Documents_Projects] FOREIGN KEY([IDProject])
REFERENCES [dbo].[Projects] ([ID])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_Documents_Projects]
GO
ALTER TABLE [dbo].[Documents]  WITH NOCHECK ADD  CONSTRAINT [FK_Documents_TypeDocumentProjects] FOREIGN KEY([Type])
REFERENCES [dbo].[TypeDocumentProjects] ([ID])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_Documents_TypeDocumentProjects]
GO
ALTER TABLE [dbo].[Documents]  WITH NOCHECK ADD  CONSTRAINT [FK_Documents_WorkOrders] FOREIGN KEY([IDWorkOrder])
REFERENCES [dbo].[WorkOrders] ([ID])
GO
ALTER TABLE [dbo].[Documents] CHECK CONSTRAINT [FK_Documents_WorkOrders]
GO
ALTER TABLE [dbo].[PrintOrdenWorks]  WITH CHECK ADD  CONSTRAINT [FK_PrintOrdenWorks_WorkOrders] FOREIGN KEY([IDWorkOrder])
REFERENCES [dbo].[WorkOrders] ([ID])
GO
ALTER TABLE [dbo].[PrintOrdenWorks] CHECK CONSTRAINT [FK_PrintOrdenWorks_WorkOrders]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Buildings] FOREIGN KEY([IDTypeBuilding])
REFERENCES [dbo].[Buildings] ([ID])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Buildings]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Customers] FOREIGN KEY([IDCustomer])
REFERENCES [dbo].[Customers] ([ID])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Customers]
GO
ALTER TABLE [dbo].[Projects]  WITH NOCHECK ADD  CONSTRAINT [FK_Projects_Providers] FOREIGN KEY([IDProvide])
REFERENCES [dbo].[Providers] ([ID])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Providers]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_StatusProjects] FOREIGN KEY([Status])
REFERENCES [dbo].[StatusProjects] ([ID])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_StatusProjects]
GO
ALTER TABLE [dbo].[Projects]  WITH NOCHECK ADD  CONSTRAINT [FK_Projects_TypesProject] FOREIGN KEY([IDTypeProject])
REFERENCES [dbo].[TypesProject] ([ID])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_TypesProject]
GO
ALTER TABLE [dbo].[Workers]  WITH CHECK ADD  CONSTRAINT [FK_Workers_Sellers] FOREIGN KEY([Status])
REFERENCES [dbo].[Sellers] ([ID])
GO
ALTER TABLE [dbo].[Workers] CHECK CONSTRAINT [FK_Workers_Sellers]
GO
ALTER TABLE [dbo].[WorkOrders]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrders_Customers] FOREIGN KEY([IDCustomer])
REFERENCES [dbo].[Customers] ([ID])
GO
ALTER TABLE [dbo].[WorkOrders] CHECK CONSTRAINT [FK_WorkOrders_Customers]
GO
ALTER TABLE [dbo].[WorkOrders]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrders_Projects] FOREIGN KEY([IDProject])
REFERENCES [dbo].[Projects] ([ID])
GO
ALTER TABLE [dbo].[WorkOrders] CHECK CONSTRAINT [FK_WorkOrders_Projects]
GO
ALTER TABLE [dbo].[WorkOrders]  WITH NOCHECK ADD  CONSTRAINT [FK_WorkOrders_Providers] FOREIGN KEY([IDProvider])
REFERENCES [dbo].[Providers] ([ID])
GO
ALTER TABLE [dbo].[WorkOrders] CHECK CONSTRAINT [FK_WorkOrders_Providers]
GO
ALTER TABLE [dbo].[WorkOrders]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrders_StatusDate] FOREIGN KEY([IDStatusCalendario])
REFERENCES [dbo].[StatusDate] ([ID])
GO
ALTER TABLE [dbo].[WorkOrders] CHECK CONSTRAINT [FK_WorkOrders_StatusDate]
GO
ALTER TABLE [dbo].[WorkOrders]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrders_StatusWorkorders] FOREIGN KEY([IDStatus])
REFERENCES [dbo].[StatusWorkOrders] ([ID])
GO
ALTER TABLE [dbo].[WorkOrders] CHECK CONSTRAINT [FK_WorkOrders_StatusWorkorders]
GO
ALTER TABLE [dbo].[WorkOrders]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrders_TypesOrderWork] FOREIGN KEY([IDType])
REFERENCES [dbo].[TypesOrderWork] ([ID])
GO
ALTER TABLE [dbo].[WorkOrders] CHECK CONSTRAINT [FK_WorkOrders_TypesOrderWork]
GO
ALTER TABLE [dbo].[WorkOrders]  WITH NOCHECK ADD  CONSTRAINT [FK_WorkOrders_Workers] FOREIGN KEY([IDAssigned])
REFERENCES [dbo].[Workers] ([ID])
GO
ALTER TABLE [dbo].[WorkOrders] CHECK CONSTRAINT [FK_WorkOrders_Workers]
GO
ALTER TABLE [dbo].[WorkOrdersAssigned]  WITH NOCHECK ADD  CONSTRAINT [FK_WorkOrdersAssigned_Providers] FOREIGN KEY([IDProveedor])
REFERENCES [dbo].[Providers] ([ID])
GO
ALTER TABLE [dbo].[WorkOrdersAssigned] CHECK CONSTRAINT [FK_WorkOrdersAssigned_Providers]
GO
ALTER TABLE [dbo].[WorkOrdersAssigned]  WITH NOCHECK ADD  CONSTRAINT [FK_WorkOrdersAssigned_Workers] FOREIGN KEY([IDWorker])
REFERENCES [dbo].[Workers] ([ID])
GO
ALTER TABLE [dbo].[WorkOrdersAssigned] CHECK CONSTRAINT [FK_WorkOrdersAssigned_Workers]
GO
ALTER TABLE [dbo].[WorkOrdersOvertime]  WITH NOCHECK ADD  CONSTRAINT [FK_WorkOrdersOvertime_Projects] FOREIGN KEY([IDProject])
REFERENCES [dbo].[Projects] ([ID])
GO
ALTER TABLE [dbo].[WorkOrdersOvertime] CHECK CONSTRAINT [FK_WorkOrdersOvertime_Projects]
GO
ALTER TABLE [dbo].[WorkOrdersOvertime]  WITH CHECK ADD  CONSTRAINT [FK_WorkOrdersOvertime_WorkOrders] FOREIGN KEY([IDWorkOder])
REFERENCES [dbo].[WorkOrders] ([ID])
GO
ALTER TABLE [dbo].[WorkOrdersOvertime] CHECK CONSTRAINT [FK_WorkOrdersOvertime_WorkOrders]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 258
               Bottom = 136
               Right = 431
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 469
               Bottom = 136
               Right = 639
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "t"
            Begin Extent = 
               Top = 6
               Left = 677
               Bottom = 102
               Right = 847
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 6
               Left = 885
               Bottom = 136
               Right = 1055
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "sp"
            Begin Extent = 
               Top = 6
               Left = 1093
               Bottom = 102
               Right = 1263
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
        ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vListProjects'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vListProjects'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vListProjects'
GO
