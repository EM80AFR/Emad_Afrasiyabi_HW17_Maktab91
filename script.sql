USE [master]
GO
/****** Object:  Database [Uinits_Management]    Script Date: 4/25/2023 2:27:30 AM ******/
CREATE DATABASE [Uinits_Management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Uinits_Management', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.EM_SQLSERVER\MSSQL\DATA\Uinits_Management.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Uinits_Management_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.EM_SQLSERVER\MSSQL\DATA\Uinits_Management_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Uinits_Management] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Uinits_Management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Uinits_Management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Uinits_Management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Uinits_Management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Uinits_Management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Uinits_Management] SET ARITHABORT OFF 
GO
ALTER DATABASE [Uinits_Management] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Uinits_Management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Uinits_Management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Uinits_Management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Uinits_Management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Uinits_Management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Uinits_Management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Uinits_Management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Uinits_Management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Uinits_Management] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Uinits_Management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Uinits_Management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Uinits_Management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Uinits_Management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Uinits_Management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Uinits_Management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Uinits_Management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Uinits_Management] SET RECOVERY FULL 
GO
ALTER DATABASE [Uinits_Management] SET  MULTI_USER 
GO
ALTER DATABASE [Uinits_Management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Uinits_Management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Uinits_Management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Uinits_Management] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Uinits_Management] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Uinits_Management] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Uinits_Management', N'ON'
GO
ALTER DATABASE [Uinits_Management] SET QUERY_STORE = ON
GO
ALTER DATABASE [Uinits_Management] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Uinits_Management]
GO
/****** Object:  Table [dbo].[Lessones]    Script Date: 4/25/2023 2:27:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lessones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Units] [int] NOT NULL,
	[Teacher_Peresentation_Id] [int] NOT NULL,
 CONSTRAINT [PK_Lessones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 4/25/2023 2:27:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Family] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students_Courses]    Script Date: 4/25/2023 2:27:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students_Courses](
	[Student_Id] [int] NOT NULL,
	[Lesson_Id] [int] NOT NULL,
 CONSTRAINT [PK_Students_Courses] PRIMARY KEY CLUSTERED 
(
	[Student_Id] ASC,
	[Lesson_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 4/25/2023 2:27:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Family] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Lessones] ON 

INSERT [dbo].[Lessones] ([Id], [Title], [Units], [Teacher_Peresentation_Id]) VALUES (1, N'OS', 3, 1)
INSERT [dbo].[Lessones] ([Id], [Title], [Units], [Teacher_Peresentation_Id]) VALUES (2, N'DS', 2, 3)
INSERT [dbo].[Lessones] ([Id], [Title], [Units], [Teacher_Peresentation_Id]) VALUES (3, N'NP', 3, 2)
INSERT [dbo].[Lessones] ([Id], [Title], [Units], [Teacher_Peresentation_Id]) VALUES (4, N'SE', 2, 4)
INSERT [dbo].[Lessones] ([Id], [Title], [Units], [Teacher_Peresentation_Id]) VALUES (5, N'DP', 2, 4)
INSERT [dbo].[Lessones] ([Id], [Title], [Units], [Teacher_Peresentation_Id]) VALUES (6, N'DB', 3, 1)
INSERT [dbo].[Lessones] ([Id], [Title], [Units], [Teacher_Peresentation_Id]) VALUES (7, N'C#', 2, 2)
INSERT [dbo].[Lessones] ([Id], [Title], [Units], [Teacher_Peresentation_Id]) VALUES (8, N'ASM', 3, 2)
SET IDENTITY_INSERT [dbo].[Lessones] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([Id], [Name], [Family]) VALUES (1, N'maryam', N'zamani')
INSERT [dbo].[Students] ([Id], [Name], [Family]) VALUES (2, N'mohammad', N'kiyani')
INSERT [dbo].[Students] ([Id], [Name], [Family]) VALUES (3, N'mobina', N'kazemi')
INSERT [dbo].[Students] ([Id], [Name], [Family]) VALUES (4, N'arsham', N'taghipor')
INSERT [dbo].[Students] ([Id], [Name], [Family]) VALUES (5, N'kamran', N'yazdanpanah')
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
INSERT [dbo].[Students_Courses] ([Student_Id], [Lesson_Id]) VALUES (1, 2)
INSERT [dbo].[Students_Courses] ([Student_Id], [Lesson_Id]) VALUES (1, 3)
INSERT [dbo].[Students_Courses] ([Student_Id], [Lesson_Id]) VALUES (1, 4)
INSERT [dbo].[Students_Courses] ([Student_Id], [Lesson_Id]) VALUES (2, 1)
INSERT [dbo].[Students_Courses] ([Student_Id], [Lesson_Id]) VALUES (2, 4)
INSERT [dbo].[Students_Courses] ([Student_Id], [Lesson_Id]) VALUES (2, 5)
INSERT [dbo].[Students_Courses] ([Student_Id], [Lesson_Id]) VALUES (3, 2)
INSERT [dbo].[Students_Courses] ([Student_Id], [Lesson_Id]) VALUES (3, 6)
INSERT [dbo].[Students_Courses] ([Student_Id], [Lesson_Id]) VALUES (3, 7)
INSERT [dbo].[Students_Courses] ([Student_Id], [Lesson_Id]) VALUES (3, 8)
INSERT [dbo].[Students_Courses] ([Student_Id], [Lesson_Id]) VALUES (4, 1)
INSERT [dbo].[Students_Courses] ([Student_Id], [Lesson_Id]) VALUES (4, 8)
INSERT [dbo].[Students_Courses] ([Student_Id], [Lesson_Id]) VALUES (5, 4)
INSERT [dbo].[Students_Courses] ([Student_Id], [Lesson_Id]) VALUES (5, 5)
INSERT [dbo].[Students_Courses] ([Student_Id], [Lesson_Id]) VALUES (5, 8)
GO
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([Id], [Name], [Family]) VALUES (1, N'Reza', N'Alavi')
INSERT [dbo].[Teachers] ([Id], [Name], [Family]) VALUES (2, N'sina', N'Mokhtari')
INSERT [dbo].[Teachers] ([Id], [Name], [Family]) VALUES (3, N'javad', N'molayee')
INSERT [dbo].[Teachers] ([Id], [Name], [Family]) VALUES (4, N'babak', N'tehrani')
SET IDENTITY_INSERT [dbo].[Teachers] OFF
GO
ALTER TABLE [dbo].[Lessones]  WITH CHECK ADD  CONSTRAINT [FK_Lessones_Teahers] FOREIGN KEY([Teacher_Peresentation_Id])
REFERENCES [dbo].[Teachers] ([Id])
GO
ALTER TABLE [dbo].[Lessones] CHECK CONSTRAINT [FK_Lessones_Teahers]
GO
ALTER TABLE [dbo].[Students_Courses]  WITH CHECK ADD  CONSTRAINT [FK_Students_Courses_Courses] FOREIGN KEY([Lesson_Id])
REFERENCES [dbo].[Lessones] ([Id])
GO
ALTER TABLE [dbo].[Students_Courses] CHECK CONSTRAINT [FK_Students_Courses_Courses]
GO
ALTER TABLE [dbo].[Students_Courses]  WITH CHECK ADD  CONSTRAINT [FK_Students_Courses_Students] FOREIGN KEY([Student_Id])
REFERENCES [dbo].[Students] ([Id])
GO
ALTER TABLE [dbo].[Students_Courses] CHECK CONSTRAINT [FK_Students_Courses_Students]
GO
USE [master]
GO
ALTER DATABASE [Uinits_Management] SET  READ_WRITE 
GO
