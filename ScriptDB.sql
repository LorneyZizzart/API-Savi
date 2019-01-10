USE [master]
GO
/****** Object:  Database [Savi]    Script Date: 10/01/2019 4:20:27 ******/
CREATE DATABASE [Savi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Savi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Savi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Savi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Savi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Savi] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Savi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Savi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Savi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Savi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Savi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Savi] SET ARITHABORT OFF 
GO
ALTER DATABASE [Savi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Savi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Savi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Savi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Savi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Savi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Savi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Savi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Savi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Savi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Savi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Savi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Savi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Savi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Savi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Savi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Savi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Savi] SET RECOVERY FULL 
GO
ALTER DATABASE [Savi] SET  MULTI_USER 
GO
ALTER DATABASE [Savi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Savi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Savi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Savi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Savi] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Savi', N'ON'
GO
ALTER DATABASE [Savi] SET QUERY_STORE = OFF
GO
USE [Savi]
GO
/****** Object:  Table [dbo].[Acreedor]    Script Date: 10/01/2019 4:20:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Acreedor](
	[idAcreedor] [int] IDENTITY(1,1) NOT NULL,
	[idInformeFinanzas] [int] NULL,
	[idConvenio] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[fechaAsignado] [date] NOT NULL,
	[montoBs] [varchar](25) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_Acreedor] PRIMARY KEY CLUSTERED 
(
	[idAcreedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 10/01/2019 4:20:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[idArea] [int] IDENTITY(1,1) NOT NULL,
	[idDepartamento] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[fechaRegistro] [date] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[idArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AsignacionArea]    Script Date: 10/01/2019 4:20:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AsignacionArea](
	[idAsignacionArea] [int] IDENTITY(1,1) NOT NULL,
	[idConvenio] [int] NOT NULL,
	[idArea] [int] NOT NULL,
	[fechaRegistro] [date] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_AsignacionArea] PRIMARY KEY CLUSTERED 
(
	[idAsignacionArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Beca]    Script Date: 10/01/2019 4:20:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Beca](
	[idBeca] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_Beca] PRIMARY KEY CLUSTERED 
(
	[idBeca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Convenio]    Script Date: 10/01/2019 4:20:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Convenio](
	[idConvenio] [int] IDENTITY(1,1) NOT NULL,
	[idDepartamento] [int] NOT NULL,
	[idPersona] [int] NOT NULL,
	[idBeca] [int] NOT NULL,
	[fechaInicio] [date] NOT NULL,
	[fechaFinal] [date] NULL,
	[fotocopiaCarnet] [bit] NULL,
	[solicitudTrabajo] [bit] NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_Convenio] PRIMARY KEY CLUSTERED 
(
	[idConvenio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 10/01/2019 4:20:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[idDepartamento] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[fechaRegistro] [date] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_Departamento] PRIMARY KEY CLUSTERED 
(
	[idDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Descuento]    Script Date: 10/01/2019 4:20:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Descuento](
	[idDescuento] [int] IDENTITY(1,1) NOT NULL,
	[idAcreedor] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[fechaDescuento] [date] NOT NULL,
	[montoBs] [varchar](25) NOT NULL,
 CONSTRAINT [PK_Descuento] PRIMARY KEY CLUSTERED 
(
	[idDescuento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dias]    Script Date: 10/01/2019 4:20:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dias](
	[idDias] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dias] PRIMARY KEY CLUSTERED 
(
	[idDias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistorialDepartamento]    Script Date: 10/01/2019 4:20:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistorialDepartamento](
	[idHistorialDepartamento] [int] IDENTITY(1,1) NOT NULL,
	[idDepartamento] [int] NOT NULL,
	[limiteEstudiante] [int] NOT NULL,
	[costoHora] [varchar](25) NOT NULL,
	[fechaRegistro] [date] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_HistorialDepartamento] PRIMARY KEY CLUSTERED 
(
	[idHistorialDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InformeEstudiante]    Script Date: 10/01/2019 4:20:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InformeEstudiante](
	[idInformeEstudiante] [int] IDENTITY(1,1) NOT NULL,
	[idInformeJefe] [int] NOT NULL,
	[idConvenio] [int] NOT NULL,
	[fechaInicio] [date] NOT NULL,
	[fechaFinal] [date] NOT NULL,
	[totalSaldo] [varchar](25) NOT NULL,
	[observacion] [text] NULL,
	[aprobadoJefeDep] [bit] NULL,
	[aprobadoFinanzas] [bit] NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_InformeEstudiante] PRIMARY KEY CLUSTERED 
(
	[idInformeEstudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InformeFinanzas]    Script Date: 10/01/2019 4:20:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InformeFinanzas](
	[idInformeFinanzas] [int] IDENTITY(1,1) NOT NULL,
	[idInformeJefe] [int] NOT NULL,
	[fechaRecivida] [date] NOT NULL,
	[darBaja] [bit] NOT NULL,
 CONSTRAINT [PK_InformeFinanzas] PRIMARY KEY CLUSTERED 
(
	[idInformeFinanzas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InformeJefe]    Script Date: 10/01/2019 4:20:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InformeJefe](
	[idInformeJefe] [int] IDENTITY(1,1) NOT NULL,
	[idDepartamento] [int] NOT NULL,
	[fechaRegistro] [date] NOT NULL,
	[detalle] [varchar](100) NULL,
	[observacion] [text] NULL,
 CONSTRAINT [PK_InformeJefe] PRIMARY KEY CLUSTERED 
(
	[idInformeJefe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organizacion]    Script Date: 10/01/2019 4:20:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organizacion](
	[idOrganizacion] [int] IDENTITY(1,1) NOT NULL,
	[idDepartamento] [int] NOT NULL,
	[idPersona] [int] NOT NULL,
	[fechaRegistro] [date] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_Organizacion] PRIMARY KEY CLUSTERED 
(
	[idOrganizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 10/01/2019 4:20:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[idPersona] [int] IDENTITY(1,1) NOT NULL,
	[primerNombre] [varchar](50) NOT NULL,
	[segundoNombre] [varchar](50) NULL,
	[primerApellido] [varchar](50) NOT NULL,
	[segundoApellido] [varchar](50) NOT NULL,
	[ci] [varchar](25) NOT NULL,
	[carrera] [varchar](100) NULL,
	[semestre] [int] NULL,
	[nacionalidad] [varchar](100) NOT NULL,
	[direccion] [varchar](150) NOT NULL,
	[celular] [int] NOT NULL,
	[fechaNacimiento] [date] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroHora]    Script Date: 10/01/2019 4:20:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroHora](
	[idRegistroHora] [int] IDENTITY(1,1) NOT NULL,
	[idConvenio] [int] NULL,
	[fechaHoraEntrada] [date] NULL,
	[fechaHoraSalida] [date] NULL,
	[observacion] [text] NULL,
	[aprovado] [bit] NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_RegistroHora] PRIMARY KEY CLUSTERED 
(
	[idRegistroHora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroUsuario]    Script Date: 10/01/2019 4:20:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroUsuario](
	[idRegistroLogin] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[login] [date] NOT NULL,
	[singOut] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 10/01/2019 4:20:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turno]    Script Date: 10/01/2019 4:20:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turno](
	[idTurno] [int] IDENTITY(1,1) NOT NULL,
	[idConvenio] [int] NOT NULL,
	[idDias] [int] NOT NULL,
	[horaEntrada] [date] NOT NULL,
	[horaSalida] [date] NOT NULL,
 CONSTRAINT [PK_Turno] PRIMARY KEY CLUSTERED 
(
	[idTurno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 10/01/2019 4:20:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[idPersona] [int] NOT NULL,
	[idRol] [int] NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Departamento] ON 

INSERT [dbo].[Departamento] ([idDepartamento], [nombre], [fechaRegistro], [estado]) VALUES (1, N'Limpieza', CAST(N'2018-11-15' AS Date), 1)
INSERT [dbo].[Departamento] ([idDepartamento], [nombre], [fechaRegistro], [estado]) VALUES (2, N'Comedor', CAST(N'2018-11-15' AS Date), 1)
INSERT [dbo].[Departamento] ([idDepartamento], [nombre], [fechaRegistro], [estado]) VALUES (3, N'Biblioteca', CAST(N'2018-11-15' AS Date), 1)
INSERT [dbo].[Departamento] ([idDepartamento], [nombre], [fechaRegistro], [estado]) VALUES (4, N'Carpinteria', CAST(N'2018-11-15' AS Date), 1)
INSERT [dbo].[Departamento] ([idDepartamento], [nombre], [fechaRegistro], [estado]) VALUES (5, N'Guardia', CAST(N'2018-11-15' AS Date), 1)
INSERT [dbo].[Departamento] ([idDepartamento], [nombre], [fechaRegistro], [estado]) VALUES (6, N'Almacen', CAST(N'2018-11-02' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Departamento] OFF
SET IDENTITY_INSERT [dbo].[HistorialDepartamento] ON 

INSERT [dbo].[HistorialDepartamento] ([idHistorialDepartamento], [idDepartamento], [limiteEstudiante], [costoHora], [fechaRegistro], [estado]) VALUES (1, 1, 31, N'06.00', CAST(N'2019-01-10' AS Date), 1)
INSERT [dbo].[HistorialDepartamento] ([idHistorialDepartamento], [idDepartamento], [limiteEstudiante], [costoHora], [fechaRegistro], [estado]) VALUES (2, 2, 28, N'07.00', CAST(N'2019-01-10' AS Date), 1)
INSERT [dbo].[HistorialDepartamento] ([idHistorialDepartamento], [idDepartamento], [limiteEstudiante], [costoHora], [fechaRegistro], [estado]) VALUES (3, 3, 11, N'08.50', CAST(N'2019-01-10' AS Date), 1)
INSERT [dbo].[HistorialDepartamento] ([idHistorialDepartamento], [idDepartamento], [limiteEstudiante], [costoHora], [fechaRegistro], [estado]) VALUES (4, 4, 3, N'09.50', CAST(N'2019-01-10' AS Date), 1)
SET IDENTITY_INSERT [dbo].[HistorialDepartamento] OFF
SET IDENTITY_INSERT [dbo].[Organizacion] ON 

INSERT [dbo].[Organizacion] ([idOrganizacion], [idDepartamento], [idPersona], [fechaRegistro], [estado]) VALUES (1, 1, 6, CAST(N'2019-01-10' AS Date), 1)
INSERT [dbo].[Organizacion] ([idOrganizacion], [idDepartamento], [idPersona], [fechaRegistro], [estado]) VALUES (2, 2, 7, CAST(N'2019-01-10' AS Date), 1)
INSERT [dbo].[Organizacion] ([idOrganizacion], [idDepartamento], [idPersona], [fechaRegistro], [estado]) VALUES (3, 3, 8, CAST(N'2019-01-10' AS Date), 1)
INSERT [dbo].[Organizacion] ([idOrganizacion], [idDepartamento], [idPersona], [fechaRegistro], [estado]) VALUES (4, 4, 10, CAST(N'2019-01-10' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Organizacion] OFF
SET IDENTITY_INSERT [dbo].[Persona] ON 

INSERT [dbo].[Persona] ([idPersona], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [carrera], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado]) VALUES (1, N'Jhonny', N'San', N'Gutierrez', N'Villca', N'79861222', N'Ingenieria de Sistemas', 9, N'Bolivia', N'Calle 1 #3446', 7894563, CAST(N'1994-11-09' AS Date), 1)
INSERT [dbo].[Persona] ([idPersona], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [carrera], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado]) VALUES (2, N'Luis', N'Fernando', N'Gutierrez', N'Estrada', N'96396333', N'Ingenieria de Telecomunicaciones', 4, N'Chile', N'Calle 1 #3446', 7652233, CAST(N'1997-11-09' AS Date), 1)
INSERT [dbo].[Persona] ([idPersona], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [carrera], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado]) VALUES (3, N'Josue', NULL, N'Gutierrez', N'Villca', N'12012011', N'Administracion de Empresas', 6, N'Bolivia', N'Calle 1 #3446', 7894563, CAST(N'1994-11-09' AS Date), 1)
INSERT [dbo].[Persona] ([idPersona], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [carrera], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado]) VALUES (4, N'Miguel', N'Angel', N'Gutierrez', N'Villca', N'54564464', N'Emfermeria', 1, N'Bolivia', N'Calle 1 #3446', 7894563, CAST(N'1994-11-09' AS Date), 1)
INSERT [dbo].[Persona] ([idPersona], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [carrera], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado]) VALUES (5, N'Ruth', N'Nayeli', N'Gutierrez', N'Villca', N'231654674', N'Enfermeria', 1, N'Bolivia', N'Calle 1 #3446', 7894563, CAST(N'1994-11-09' AS Date), 1)
INSERT [dbo].[Persona] ([idPersona], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [carrera], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado]) VALUES (6, N'Leila', NULL, N'Palma', N'Suares', N'644654654', NULL, NULL, N'Bolivia', N'Calle 1 #3446', 7894563, CAST(N'1994-11-09' AS Date), 1)
INSERT [dbo].[Persona] ([idPersona], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [carrera], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado]) VALUES (7, N'Jhazmin', NULL, N'Oshinaga', N'Velazques', N'65465423', NULL, NULL, N'Bolivia', N'Calle 1 #3446', 7894563, CAST(N'1994-11-09' AS Date), 1)
INSERT [dbo].[Persona] ([idPersona], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [carrera], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado]) VALUES (8, N'Juan', N'Carlos', N'Quispe', N'Calle', N'12231021', NULL, NULL, N'Bolivia', N'Calle 1 #3446', 7894563, CAST(N'1994-11-09' AS Date), 1)
INSERT [dbo].[Persona] ([idPersona], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [carrera], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado]) VALUES (9, N'Carla', NULL, N'Martines', N'Velazques', N'516465132', NULL, NULL, N'Bolivia', N'Calle 1 #3446', 7894563, CAST(N'1994-11-09' AS Date), 1)
INSERT [dbo].[Persona] ([idPersona], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [carrera], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado]) VALUES (10, N'Carmen', NULL, N'Perez', N'Ramirez', N'516465132', NULL, NULL, N'Bolivia', N'Calle 1 #3446', 7894563, CAST(N'1994-11-09' AS Date), 1)
INSERT [dbo].[Persona] ([idPersona], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [carrera], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado]) VALUES (11, N'Avelino', N'Sans', N'Gutierrez', N'Estrada', N'564132132', NULL, NULL, N'Bolivia', N'Calle 1 #3446', 7894563, CAST(N'1994-11-09' AS Date), 1)
INSERT [dbo].[Persona] ([idPersona], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [carrera], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado]) VALUES (12, N'Metthe', N'Marcos', N'Gutierrez', N'Villca', N'789456', N'psicologia', 3, N'Bolivia', N'calle', 64578911, CAST(N'1995-06-15' AS Date), 1)
INSERT [dbo].[Persona] ([idPersona], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [carrera], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado]) VALUES (15, N'Vinicius', N'Javier', N'JR', N'Villca', N'9454598', N'psicologia', 3, N'Bolivia', N'calle', 132456, CAST(N'2018-07-18' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Persona] OFF
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([idRol], [nombre]) VALUES (1, N'Jefe de GTH')
INSERT [dbo].[Rol] ([idRol], [nombre]) VALUES (2, N'Jefatura de Finanzas')
INSERT [dbo].[Rol] ([idRol], [nombre]) VALUES (3, N'Finanzas')
INSERT [dbo].[Rol] ([idRol], [nombre]) VALUES (4, N'Jefe de Departamento')
INSERT [dbo].[Rol] ([idRol], [nombre]) VALUES (5, N'Estudiante')
SET IDENTITY_INSERT [dbo].[Rol] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado]) VALUES (1, 6, 1, N'leila', N'leila123', 1)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado]) VALUES (2, 7, 2, N'jhazmin', N'jhazmin333', 0)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado]) VALUES (3, 8, 3, N'juan', N'juan222', 1)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado]) VALUES (4, 10, 4, N'carmen', N'carmen111', 1)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado]) VALUES (5, 1, 5, N'jhonny', N'jhonny123', 0)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado]) VALUES (6, 2, 5, N'luis', N'luis321', 1)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado]) VALUES (7, 3, 5, N'josue', N'josue456', 1)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado]) VALUES (8, 4, 5, N'miguel', N'miguel654', 1)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado]) VALUES (9, 12, 5, N'metthe', N'mete111', 1)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado]) VALUES (15, 15, 5, N'viniciusJR', N'12345', 1)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
ALTER TABLE [dbo].[Acreedor]  WITH CHECK ADD  CONSTRAINT [FK_Acreedor_Convenio] FOREIGN KEY([idConvenio])
REFERENCES [dbo].[Convenio] ([idConvenio])
GO
ALTER TABLE [dbo].[Acreedor] CHECK CONSTRAINT [FK_Acreedor_Convenio]
GO
ALTER TABLE [dbo].[Acreedor]  WITH CHECK ADD  CONSTRAINT [FK_Acreedor_InformeFinanzas] FOREIGN KEY([idInformeFinanzas])
REFERENCES [dbo].[InformeFinanzas] ([idInformeFinanzas])
GO
ALTER TABLE [dbo].[Acreedor] CHECK CONSTRAINT [FK_Acreedor_InformeFinanzas]
GO
ALTER TABLE [dbo].[Acreedor]  WITH CHECK ADD  CONSTRAINT [FK_Acreedor_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Acreedor] CHECK CONSTRAINT [FK_Acreedor_Usuario]
GO
ALTER TABLE [dbo].[Area]  WITH CHECK ADD  CONSTRAINT [FK_Area_Departamento] FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[Departamento] ([idDepartamento])
GO
ALTER TABLE [dbo].[Area] CHECK CONSTRAINT [FK_Area_Departamento]
GO
ALTER TABLE [dbo].[AsignacionArea]  WITH CHECK ADD  CONSTRAINT [FK_AsignacionArea_Area] FOREIGN KEY([idArea])
REFERENCES [dbo].[Area] ([idArea])
GO
ALTER TABLE [dbo].[AsignacionArea] CHECK CONSTRAINT [FK_AsignacionArea_Area]
GO
ALTER TABLE [dbo].[AsignacionArea]  WITH CHECK ADD  CONSTRAINT [FK_AsignacionArea_Convenio] FOREIGN KEY([idConvenio])
REFERENCES [dbo].[Convenio] ([idConvenio])
GO
ALTER TABLE [dbo].[AsignacionArea] CHECK CONSTRAINT [FK_AsignacionArea_Convenio]
GO
ALTER TABLE [dbo].[Convenio]  WITH CHECK ADD  CONSTRAINT [FK_Convenio_Beca] FOREIGN KEY([idBeca])
REFERENCES [dbo].[Beca] ([idBeca])
GO
ALTER TABLE [dbo].[Convenio] CHECK CONSTRAINT [FK_Convenio_Beca]
GO
ALTER TABLE [dbo].[Convenio]  WITH CHECK ADD  CONSTRAINT [FK_Convenio_Departamento] FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[Departamento] ([idDepartamento])
GO
ALTER TABLE [dbo].[Convenio] CHECK CONSTRAINT [FK_Convenio_Departamento]
GO
ALTER TABLE [dbo].[Convenio]  WITH CHECK ADD  CONSTRAINT [FK_Convenio_Persona] FOREIGN KEY([idPersona])
REFERENCES [dbo].[Persona] ([idPersona])
GO
ALTER TABLE [dbo].[Convenio] CHECK CONSTRAINT [FK_Convenio_Persona]
GO
ALTER TABLE [dbo].[Descuento]  WITH CHECK ADD  CONSTRAINT [FK_Descuento_Acreedor] FOREIGN KEY([idAcreedor])
REFERENCES [dbo].[Acreedor] ([idAcreedor])
GO
ALTER TABLE [dbo].[Descuento] CHECK CONSTRAINT [FK_Descuento_Acreedor]
GO
ALTER TABLE [dbo].[Descuento]  WITH CHECK ADD  CONSTRAINT [FK_Descuento_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Descuento] CHECK CONSTRAINT [FK_Descuento_Usuario]
GO
ALTER TABLE [dbo].[HistorialDepartamento]  WITH CHECK ADD  CONSTRAINT [FK_HistorialDepartamento_Departamento] FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[Departamento] ([idDepartamento])
GO
ALTER TABLE [dbo].[HistorialDepartamento] CHECK CONSTRAINT [FK_HistorialDepartamento_Departamento]
GO
ALTER TABLE [dbo].[InformeEstudiante]  WITH CHECK ADD  CONSTRAINT [FK_InformeEstudiante_Convenio] FOREIGN KEY([idConvenio])
REFERENCES [dbo].[Convenio] ([idConvenio])
GO
ALTER TABLE [dbo].[InformeEstudiante] CHECK CONSTRAINT [FK_InformeEstudiante_Convenio]
GO
ALTER TABLE [dbo].[InformeEstudiante]  WITH CHECK ADD  CONSTRAINT [FK_InformeEstudiante_InformeJefe] FOREIGN KEY([idInformeJefe])
REFERENCES [dbo].[InformeJefe] ([idInformeJefe])
GO
ALTER TABLE [dbo].[InformeEstudiante] CHECK CONSTRAINT [FK_InformeEstudiante_InformeJefe]
GO
ALTER TABLE [dbo].[InformeFinanzas]  WITH CHECK ADD  CONSTRAINT [FK_InformeFinanzas_InformeJefe] FOREIGN KEY([idInformeJefe])
REFERENCES [dbo].[InformeJefe] ([idInformeJefe])
GO
ALTER TABLE [dbo].[InformeFinanzas] CHECK CONSTRAINT [FK_InformeFinanzas_InformeJefe]
GO
ALTER TABLE [dbo].[InformeJefe]  WITH CHECK ADD  CONSTRAINT [FK_InformeJefe_Departamento] FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[Departamento] ([idDepartamento])
GO
ALTER TABLE [dbo].[InformeJefe] CHECK CONSTRAINT [FK_InformeJefe_Departamento]
GO
ALTER TABLE [dbo].[Organizacion]  WITH CHECK ADD  CONSTRAINT [FK_Organizacion_Departamento] FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[Departamento] ([idDepartamento])
GO
ALTER TABLE [dbo].[Organizacion] CHECK CONSTRAINT [FK_Organizacion_Departamento]
GO
ALTER TABLE [dbo].[Organizacion]  WITH CHECK ADD  CONSTRAINT [FK_Organizacion_Persona] FOREIGN KEY([idPersona])
REFERENCES [dbo].[Persona] ([idPersona])
GO
ALTER TABLE [dbo].[Organizacion] CHECK CONSTRAINT [FK_Organizacion_Persona]
GO
ALTER TABLE [dbo].[RegistroHora]  WITH CHECK ADD  CONSTRAINT [FK_RegistroHora_Convenio] FOREIGN KEY([idConvenio])
REFERENCES [dbo].[Convenio] ([idConvenio])
GO
ALTER TABLE [dbo].[RegistroHora] CHECK CONSTRAINT [FK_RegistroHora_Convenio]
GO
ALTER TABLE [dbo].[RegistroUsuario]  WITH CHECK ADD  CONSTRAINT [FK_RegistroUsuario_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[RegistroUsuario] CHECK CONSTRAINT [FK_RegistroUsuario_Usuario]
GO
ALTER TABLE [dbo].[Turno]  WITH CHECK ADD  CONSTRAINT [FK_Turno_Convenio] FOREIGN KEY([idConvenio])
REFERENCES [dbo].[Convenio] ([idConvenio])
GO
ALTER TABLE [dbo].[Turno] CHECK CONSTRAINT [FK_Turno_Convenio]
GO
ALTER TABLE [dbo].[Turno]  WITH CHECK ADD  CONSTRAINT [FK_Turno_Dias] FOREIGN KEY([idDias])
REFERENCES [dbo].[Dias] ([idDias])
GO
ALTER TABLE [dbo].[Turno] CHECK CONSTRAINT [FK_Turno_Dias]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Persona] FOREIGN KEY([idPersona])
REFERENCES [dbo].[Persona] ([idPersona])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Persona]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Rol] FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([idRol])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Rol]
GO
USE [master]
GO
ALTER DATABASE [Savi] SET  READ_WRITE 
GO
