USE [master]
GO
/****** Object:  Database [MichalKalinaLab3]    Script Date: 2018-11-20 21:07:30 ******/
CREATE DATABASE [MichalKalinaLab3]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MichalKalinaLab3', FILENAME = N'D:\KREDEK\sql Root\MSSQL14.MICHALSQL\MSSQL\DATA\MichalKalinaLab3.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MichalKalinaLab3_log', FILENAME = N'D:\KREDEK\sql Root\MSSQL14.MICHALSQL\MSSQL\DATA\MichalKalinaLab3_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MichalKalinaLab3] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MichalKalinaLab3].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MichalKalinaLab3] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MichalKalinaLab3] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MichalKalinaLab3] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MichalKalinaLab3] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MichalKalinaLab3] SET ARITHABORT OFF 
GO
ALTER DATABASE [MichalKalinaLab3] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MichalKalinaLab3] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MichalKalinaLab3] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MichalKalinaLab3] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MichalKalinaLab3] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MichalKalinaLab3] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MichalKalinaLab3] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MichalKalinaLab3] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MichalKalinaLab3] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MichalKalinaLab3] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MichalKalinaLab3] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MichalKalinaLab3] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MichalKalinaLab3] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MichalKalinaLab3] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MichalKalinaLab3] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MichalKalinaLab3] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MichalKalinaLab3] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MichalKalinaLab3] SET RECOVERY FULL 
GO
ALTER DATABASE [MichalKalinaLab3] SET  MULTI_USER 
GO
ALTER DATABASE [MichalKalinaLab3] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MichalKalinaLab3] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MichalKalinaLab3] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MichalKalinaLab3] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MichalKalinaLab3] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MichalKalinaLab3', N'ON'
GO
ALTER DATABASE [MichalKalinaLab3] SET QUERY_STORE = OFF
GO
USE [MichalKalinaLab3]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 2018-11-20 21:07:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[StudentIdent] [numeric](6, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 2018-11-20 21:07:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](63) NULL,
	[Teacher] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IndexPosition]    Script Date: 2018-11-20 21:07:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IndexPosition](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[StudentID] [int] NULL,
	[CourseID] [int] NULL,
	[Grade] [numeric](2, 1) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[GradesView]    Script Date: 2018-11-20 21:07:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[GradesView] 
AS
SELECT c.Name, s.StudentIdent, i.Grade
  FROM IndexPosition i
    JOIN Courses c on i.CourseID = c.ID
    JOIN Students s on i.StudentID = s.ID;

	
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([ID], [Name], [Teacher]) VALUES (1, N'Bazy Danych 1', N'dr Mariusz Pazdan')
INSERT [dbo].[Courses] ([ID], [Name], [Teacher]) VALUES (2, N'Archiktektura Komputerów 1', N'mgr Jarosław Zięba')
INSERT [dbo].[Courses] ([ID], [Name], [Teacher]) VALUES (3, N'Teoria obwodów 1', N'dr inż. Marian Paździoch')
INSERT [dbo].[Courses] ([ID], [Name], [Teacher]) VALUES (4, N'Bazy Danych 1', N'dr Mariusz Pazdan')
INSERT [dbo].[Courses] ([ID], [Name], [Teacher]) VALUES (5, N'Archiktektura Komputerów 1', N'mgr Jarosław Zięba')
INSERT [dbo].[Courses] ([ID], [Name], [Teacher]) VALUES (6, N'Teoria obwodów 1', N'dr inż. Marian Paździoch')
SET IDENTITY_INSERT [dbo].[Courses] OFF
SET IDENTITY_INSERT [dbo].[IndexPosition] ON 

INSERT [dbo].[IndexPosition] ([ID], [StudentID], [CourseID], [Grade]) VALUES (1, 1, 1, CAST(3.5 AS Numeric(2, 1)))
INSERT [dbo].[IndexPosition] ([ID], [StudentID], [CourseID], [Grade]) VALUES (2, 1, 2, CAST(3.0 AS Numeric(2, 1)))
INSERT [dbo].[IndexPosition] ([ID], [StudentID], [CourseID], [Grade]) VALUES (3, 1, 3, CAST(2.0 AS Numeric(2, 1)))
INSERT [dbo].[IndexPosition] ([ID], [StudentID], [CourseID], [Grade]) VALUES (4, 2, 1, CAST(4.0 AS Numeric(2, 1)))
INSERT [dbo].[IndexPosition] ([ID], [StudentID], [CourseID], [Grade]) VALUES (5, 2, 2, CAST(4.5 AS Numeric(2, 1)))
INSERT [dbo].[IndexPosition] ([ID], [StudentID], [CourseID], [Grade]) VALUES (6, 2, 3, CAST(5.0 AS Numeric(2, 1)))
INSERT [dbo].[IndexPosition] ([ID], [StudentID], [CourseID], [Grade]) VALUES (7, 3, 1, CAST(5.0 AS Numeric(2, 1)))
INSERT [dbo].[IndexPosition] ([ID], [StudentID], [CourseID], [Grade]) VALUES (8, 3, 2, CAST(5.5 AS Numeric(2, 1)))
INSERT [dbo].[IndexPosition] ([ID], [StudentID], [CourseID], [Grade]) VALUES (9, 3, 3, CAST(2.0 AS Numeric(2, 1)))
INSERT [dbo].[IndexPosition] ([ID], [StudentID], [CourseID], [Grade]) VALUES (10, 1, 1, CAST(3.5 AS Numeric(2, 1)))
INSERT [dbo].[IndexPosition] ([ID], [StudentID], [CourseID], [Grade]) VALUES (11, 1, 2, CAST(3.0 AS Numeric(2, 1)))
INSERT [dbo].[IndexPosition] ([ID], [StudentID], [CourseID], [Grade]) VALUES (12, 1, 3, CAST(2.0 AS Numeric(2, 1)))
INSERT [dbo].[IndexPosition] ([ID], [StudentID], [CourseID], [Grade]) VALUES (13, 2, 1, CAST(4.0 AS Numeric(2, 1)))
INSERT [dbo].[IndexPosition] ([ID], [StudentID], [CourseID], [Grade]) VALUES (14, 2, 2, CAST(4.5 AS Numeric(2, 1)))
INSERT [dbo].[IndexPosition] ([ID], [StudentID], [CourseID], [Grade]) VALUES (15, 2, 3, CAST(5.0 AS Numeric(2, 1)))
INSERT [dbo].[IndexPosition] ([ID], [StudentID], [CourseID], [Grade]) VALUES (16, 3, 1, CAST(5.0 AS Numeric(2, 1)))
INSERT [dbo].[IndexPosition] ([ID], [StudentID], [CourseID], [Grade]) VALUES (17, 3, 2, CAST(5.5 AS Numeric(2, 1)))
INSERT [dbo].[IndexPosition] ([ID], [StudentID], [CourseID], [Grade]) VALUES (18, 3, 3, CAST(2.0 AS Numeric(2, 1)))
INSERT [dbo].[IndexPosition] ([ID], [StudentID], [CourseID], [Grade]) VALUES (19, 1, 1, CAST(3.5 AS Numeric(2, 1)))
INSERT [dbo].[IndexPosition] ([ID], [StudentID], [CourseID], [Grade]) VALUES (20, 1, 2, CAST(3.0 AS Numeric(2, 1)))
INSERT [dbo].[IndexPosition] ([ID], [StudentID], [CourseID], [Grade]) VALUES (21, 1, 3, CAST(2.0 AS Numeric(2, 1)))
INSERT [dbo].[IndexPosition] ([ID], [StudentID], [CourseID], [Grade]) VALUES (22, 2, 1, CAST(4.0 AS Numeric(2, 1)))
INSERT [dbo].[IndexPosition] ([ID], [StudentID], [CourseID], [Grade]) VALUES (23, 2, 2, CAST(4.5 AS Numeric(2, 1)))
INSERT [dbo].[IndexPosition] ([ID], [StudentID], [CourseID], [Grade]) VALUES (24, 2, 3, CAST(5.0 AS Numeric(2, 1)))
INSERT [dbo].[IndexPosition] ([ID], [StudentID], [CourseID], [Grade]) VALUES (25, 3, 1, CAST(5.0 AS Numeric(2, 1)))
INSERT [dbo].[IndexPosition] ([ID], [StudentID], [CourseID], [Grade]) VALUES (26, 3, 2, CAST(5.5 AS Numeric(2, 1)))
INSERT [dbo].[IndexPosition] ([ID], [StudentID], [CourseID], [Grade]) VALUES (27, 3, 3, CAST(2.0 AS Numeric(2, 1)))
SET IDENTITY_INSERT [dbo].[IndexPosition] OFF
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([ID], [FirstName], [LastName], [Address], [StudentIdent]) VALUES (1, N'Jan', N'Kowalski', N'ul.Polna 1, Wroclaw 50-100', CAST(123332 AS Numeric(6, 0)))
INSERT [dbo].[Students] ([ID], [FirstName], [LastName], [Address], [StudentIdent]) VALUES (2, N'Marek', N'Nowak', N'Nowakowskiego 322, Wroclaw 51-222', CAST(226705 AS Numeric(6, 0)))
INSERT [dbo].[Students] ([ID], [FirstName], [LastName], [Address], [StudentIdent]) VALUES (3, N'Jan', N'Kowalski', N'ul.Polna 1, Wroclaw 50-100', CAST(123332 AS Numeric(6, 0)))
INSERT [dbo].[Students] ([ID], [FirstName], [LastName], [Address], [StudentIdent]) VALUES (4, N'Marek', N'Nowak', N'Nowakowskiego 322, Wroclaw 51-222', CAST(226705 AS Numeric(6, 0)))
INSERT [dbo].[Students] ([ID], [FirstName], [LastName], [Address], [StudentIdent]) VALUES (5, N'Staś', N'Bórczymócha', N'Padewskiego 1/3, Wrocław 51-200', CAST(20000 AS Numeric(6, 0)))
SET IDENTITY_INSERT [dbo].[Students] OFF
ALTER TABLE [dbo].[IndexPosition]  WITH CHECK ADD CHECK  (([Grade]=(5.5) OR [Grade]=(5.0) OR [Grade]=(4.5) OR [Grade]=(4.0) OR [Grade]=(3.5) OR [Grade]=(3.0) OR [Grade]=(2.0)))
GO
USE [master]
GO
ALTER DATABASE [MichalKalinaLab3] SET  READ_WRITE 
GO
