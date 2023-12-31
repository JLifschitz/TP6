USE [master]
GO
/****** Object:  Database [Elecciones2023]    Script Date: 7/7/2023 09:28:11 ******/
CREATE DATABASE [Elecciones2023]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Elecciones2023', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Elecciones2023.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Elecciones2023_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Elecciones2023_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Elecciones2023] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Elecciones2023].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Elecciones2023] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Elecciones2023] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Elecciones2023] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Elecciones2023] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Elecciones2023] SET ARITHABORT OFF 
GO
ALTER DATABASE [Elecciones2023] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Elecciones2023] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Elecciones2023] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Elecciones2023] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Elecciones2023] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Elecciones2023] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Elecciones2023] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Elecciones2023] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Elecciones2023] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Elecciones2023] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Elecciones2023] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Elecciones2023] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Elecciones2023] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Elecciones2023] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Elecciones2023] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Elecciones2023] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Elecciones2023] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Elecciones2023] SET RECOVERY FULL 
GO
ALTER DATABASE [Elecciones2023] SET  MULTI_USER 
GO
ALTER DATABASE [Elecciones2023] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Elecciones2023] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Elecciones2023] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Elecciones2023] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Elecciones2023] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Elecciones2023', N'ON'
GO
ALTER DATABASE [Elecciones2023] SET QUERY_STORE = OFF
GO
USE [Elecciones2023]
GO
/****** Object:  User [alumno]    Script Date: 7/7/2023 09:28:12 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Candidatos]    Script Date: 7/7/2023 09:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidatos](
	[IdCandidato] [int] IDENTITY(1,1) NOT NULL,
	[IdPartido] [int] NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL,
	[Foto] [varchar](50) NOT NULL,
	[Postulacion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Candidatos] PRIMARY KEY CLUSTERED 
(
	[IdCandidato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Partidos]    Script Date: 7/7/2023 09:28:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Partidos](
	[IdPartido] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Logo] [varchar](50) NOT NULL,
	[SitioWeb] [varchar](50) NOT NULL,
	[FechaFundacion] [date] NOT NULL,
	[CantDiputados] [int] NOT NULL,
	[CantSenadores] [int] NOT NULL,
 CONSTRAINT [PK_Partidos] PRIMARY KEY CLUSTERED 
(
	[IdPartido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Candidatos] ON 

INSERT [dbo].[Candidatos] ([IdCandidato], [IdPartido], [Apellido], [Nombre], [FechaNacimiento], [Foto], [Postulacion]) VALUES (3, 1, N'Blaustein', N'Felipe', CAST(N'2007-03-12' AS Date), N'/img/Candidato1.JPEG', N'Dipuatdo')
INSERT [dbo].[Candidatos] ([IdCandidato], [IdPartido], [Apellido], [Nombre], [FechaNacimiento], [Foto], [Postulacion]) VALUES (5, 1, N'Krystal', N'Leonardo', CAST(N'1990-07-05' AS Date), N'/img/CandidatoA.JPG', N'Senador')
INSERT [dbo].[Candidatos] ([IdCandidato], [IdPartido], [Apellido], [Nombre], [FechaNacimiento], [Foto], [Postulacion]) VALUES (6, 3, N'Alvear', N'Marcelo Torcuato', CAST(N'1868-10-12' AS Date), N'/img/Candidato2.JPG', N'Diputado')
INSERT [dbo].[Candidatos] ([IdCandidato], [IdPartido], [Apellido], [Nombre], [FechaNacimiento], [Foto], [Postulacion]) VALUES (9, 3, N'Yrigoyen', N'Hipolito', CAST(N'1852-07-12' AS Date), N'/img/Candidato3.JPG', N'Diputado')
INSERT [dbo].[Candidatos] ([IdCandidato], [IdPartido], [Apellido], [Nombre], [FechaNacimiento], [Foto], [Postulacion]) VALUES (10, 3, N'Martinez', N'Enrique', CAST(N'1887-07-25' AS Date), N'/img/Candidato4.JPG', N'Senador')
INSERT [dbo].[Candidatos] ([IdCandidato], [IdPartido], [Apellido], [Nombre], [FechaNacimiento], [Foto], [Postulacion]) VALUES (11, 5, N'Fernandez', N'Ignacio', CAST(N'2018-12-09' AS Date), N'/img/Candidato8.JPG', N'Diputado')
INSERT [dbo].[Candidatos] ([IdCandidato], [IdPartido], [Apellido], [Nombre], [FechaNacimiento], [Foto], [Postulacion]) VALUES (12, 5, N'Beltran', N'Lucas', CAST(N'2018-12-09' AS Date), N'/img/Candidato7.JPG', N'Dipuatdo')
INSERT [dbo].[Candidatos] ([IdCandidato], [IdPartido], [Apellido], [Nombre], [FechaNacimiento], [Foto], [Postulacion]) VALUES (13, 5, N'Aliendro', N'Rodrigo', CAST(N'2018-12-09' AS Date), N'/img/Candidato29.JPG', N'Senador')
INSERT [dbo].[Candidatos] ([IdCandidato], [IdPartido], [Apellido], [Nombre], [FechaNacimiento], [Foto], [Postulacion]) VALUES (14, 5, N'Barco', N'Esequiel', CAST(N'2018-12-09' AS Date), N'/img/Candidato10.JPG', N'Senador')
INSERT [dbo].[Candidatos] ([IdCandidato], [IdPartido], [Apellido], [Nombre], [FechaNacimiento], [Foto], [Postulacion]) VALUES (15, 21, N'Frank', N'Jacob', CAST(N'2007-03-28' AS Date), N'/img/Candidato12.JPG', N'Dipuatdo')
INSERT [dbo].[Candidatos] ([IdCandidato], [IdPartido], [Apellido], [Nombre], [FechaNacimiento], [Foto], [Postulacion]) VALUES (17, 21, N'Shabtai', N'Tzvi', CAST(N'2006-09-10' AS Date), N'/img/Candidato11.JPG', N'Senador')
SET IDENTITY_INSERT [dbo].[Candidatos] OFF
GO
SET IDENTITY_INSERT [dbo].[Partidos] ON 

INSERT [dbo].[Partidos] ([IdPartido], [Nombre], [Logo], [SitioWeb], [FechaFundacion], [CantDiputados], [CantSenadores]) VALUES (1, N'PSG', N'/img/Partido1.JPG', N'https://es.psg.fr/', CAST(N'1789-05-05' AS Date), 1, 1)
INSERT [dbo].[Partidos] ([IdPartido], [Nombre], [Logo], [SitioWeb], [FechaFundacion], [CantDiputados], [CantSenadores]) VALUES (3, N'YPF', N'/img/Partido2.JPG', N'https://fundacionypf.org/', CAST(N'1922-06-03' AS Date), 2, 1)
INSERT [dbo].[Partidos] ([IdPartido], [Nombre], [Logo], [SitioWeb], [FechaFundacion], [CantDiputados], [CantSenadores]) VALUES (5, N'CARP', N'/img/Partido3.JPG', N'https://www.cariverplate.com.ar/', CAST(N'2018-12-09' AS Date), 2, 2)
INSERT [dbo].[Partidos] ([IdPartido], [Nombre], [Logo], [SitioWeb], [FechaFundacion], [CantDiputados], [CantSenadores]) VALUES (21, N'PJM', N'/img/Part4.JPG', N'https://es.wikipedia.org/wiki/Shabtai_Tzvi', CAST(N'1971-11-29' AS Date), 1, 2)
SET IDENTITY_INSERT [dbo].[Partidos] OFF
GO
ALTER TABLE [dbo].[Candidatos]  WITH CHECK ADD  CONSTRAINT [FK_Candidatos_Partidos] FOREIGN KEY([IdPartido])
REFERENCES [dbo].[Partidos] ([IdPartido])
GO
ALTER TABLE [dbo].[Candidatos] CHECK CONSTRAINT [FK_Candidatos_Partidos]
GO
USE [master]
GO
ALTER DATABASE [Elecciones2023] SET  READ_WRITE 
GO
