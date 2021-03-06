USE [Savi]
GO
/****** Object:  Table [dbo].[Acreedor]    Script Date: 02/09/2019 13:02:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Acreedor](
	[idAcreedor] [int] IDENTITY(1,1) NOT NULL,
	[idInformeEstudiante] [int] NOT NULL,
	[idConvenio] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[fechaAsignado] [datetime] NULL,
	[montoBs] [varchar](25) NOT NULL,
	[estado] [bit] NOT NULL,
	[archivar] [datetime] NULL,
	[edit] [datetime] NULL,
	[delet] [datetime] NULL,
 CONSTRAINT [PK_Acreedor] PRIMARY KEY CLUSTERED 
(
	[idAcreedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AcreedorPendiente]    Script Date: 02/09/2019 13:02:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcreedorPendiente](
	[idAcreedorPendiente] [int] IDENTITY(1,1) NOT NULL,
	[idAcreedor] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[saldo] [varchar](25) NOT NULL,
	[register] [datetime] NOT NULL,
	[estado] [bit] NULL,
	[edit] [datetime] NULL,
	[delet] [datetime] NULL,
 CONSTRAINT [PK_AcreedorPendiente] PRIMARY KEY CLUSTERED 
(
	[idAcreedorPendiente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 02/09/2019 13:02:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[idArea] [int] IDENTITY(1,1) NOT NULL,
	[idDepartamento] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[fechaRegistro] [datetime] NOT NULL,
	[estado] [bit] NOT NULL,
	[edit] [datetime] NULL,
	[delet] [datetime] NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[idArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AsignacionArea]    Script Date: 02/09/2019 13:02:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AsignacionArea](
	[idAsignacionArea] [int] IDENTITY(1,1) NOT NULL,
	[idConvenio] [int] NOT NULL,
	[idArea] [int] NOT NULL,
	[fechaRegistro] [datetime] NOT NULL,
	[estado] [bit] NOT NULL,
	[edit] [datetime] NULL,
	[delet] [datetime] NULL,
 CONSTRAINT [PK_AsignacionArea] PRIMARY KEY CLUSTERED 
(
	[idAsignacionArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Beca]    Script Date: 02/09/2019 13:02:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Beca](
	[idBeca] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[estado] [bit] NOT NULL,
	[register] [datetime] NULL,
	[edit] [datetime] NULL,
	[delet] [datetime] NULL,
 CONSTRAINT [PK_Beca] PRIMARY KEY CLUSTERED 
(
	[idBeca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carrera]    Script Date: 02/09/2019 13:02:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrera](
	[idCarrera] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](90) NOT NULL,
	[register] [datetime] NOT NULL,
	[edit] [datetime] NULL,
	[delet] [datetime] NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_Carrera] PRIMARY KEY CLUSTERED 
(
	[idCarrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Convenio]    Script Date: 02/09/2019 13:02:39 ******/
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
	[register] [datetime] NULL,
	[edit] [datetime] NULL,
	[delet] [datetime] NULL,
 CONSTRAINT [PK_Convenio] PRIMARY KEY CLUSTERED 
(
	[idConvenio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 02/09/2019 13:02:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departamento](
	[idDepartamento] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[fechaRegistro] [datetime] NOT NULL,
	[estado] [bit] NOT NULL,
	[edit] [datetime] NULL,
	[delet] [datetime] NULL,
 CONSTRAINT [PK_Departamento] PRIMARY KEY CLUSTERED 
(
	[idDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Descuento]    Script Date: 02/09/2019 13:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Descuento](
	[idDescuento] [int] IDENTITY(1,1) NOT NULL,
	[idAcreedor] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[fechaDescuento] [datetime] NOT NULL,
	[saldoInicial] [varchar](25) NULL,
	[montoBs] [varchar](25) NOT NULL,
	[observacion] [text] NULL,
	[edit] [datetime] NULL,
	[delet] [datetime] NULL,
 CONSTRAINT [PK_Descuento] PRIMARY KEY CLUSTERED 
(
	[idDescuento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dias]    Script Date: 02/09/2019 13:02:40 ******/
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
/****** Object:  Table [dbo].[HistorialDepartamento]    Script Date: 02/09/2019 13:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistorialDepartamento](
	[idHistorialDepartamento] [int] IDENTITY(1,1) NOT NULL,
	[idDepartamento] [int] NOT NULL,
	[limiteEstudiante] [int] NOT NULL,
	[costoHora] [varchar](25) NOT NULL,
	[fechaRegistro] [datetime] NOT NULL,
	[estado] [bit] NOT NULL,
	[edit] [datetime] NULL,
	[delet] [datetime] NULL,
 CONSTRAINT [PK_HistorialDepartamento] PRIMARY KEY CLUSTERED 
(
	[idHistorialDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InformeEstudiante]    Script Date: 02/09/2019 13:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InformeEstudiante](
	[idInformeEstudiante] [int] IDENTITY(1,1) NOT NULL,
	[idRegistroHora] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[totalHoras] [varchar](12) NOT NULL,
	[totalSaldo] [varchar](25) NOT NULL,
	[aprobadoJefeDep] [datetime] NOT NULL,
	[aprobadoFinanzas] [bit] NULL,
	[revisadoFinanzas] [datetime] NULL,
	[archivar] [datetime] NULL,
	[delet] [datetime] NULL,
 CONSTRAINT [PK_InformeEstudiante] PRIMARY KEY CLUSTERED 
(
	[idInformeEstudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InformeFinanzas]    Script Date: 02/09/2019 13:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InformeFinanzas](
	[idInformeFinanzas] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[idInformeEstudiante] [int] NOT NULL,
	[totalHoras] [varchar](10) NULL,
	[totalSaldo] [varchar](10) NULL,
	[observacion] [varchar](150) NULL,
	[fechaAprobada] [datetime] NOT NULL,
	[delet] [datetime] NULL,
	[archivar] [datetime] NULL,
 CONSTRAINT [PK_InformeFinanzas] PRIMARY KEY CLUSTERED 
(
	[idInformeFinanzas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organizacion]    Script Date: 02/09/2019 13:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organizacion](
	[idOrganizacion] [int] IDENTITY(1,1) NOT NULL,
	[idDepartamento] [int] NOT NULL,
	[idPersona] [int] NOT NULL,
	[fechaRegistro] [datetime] NOT NULL,
	[estado] [bit] NOT NULL,
	[edit] [datetime] NULL,
	[delet] [datetime] NULL,
 CONSTRAINT [PK_Organizacion] PRIMARY KEY CLUSTERED 
(
	[idOrganizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 02/09/2019 13:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[idPersona] [int] IDENTITY(1,1) NOT NULL,
	[idCarrera] [int] NULL,
	[codEstudiante] [int] NULL,
	[primerNombre] [varchar](50) NOT NULL,
	[segundoNombre] [varchar](50) NULL,
	[primerApellido] [varchar](50) NOT NULL,
	[segundoApellido] [varchar](50) NULL,
	[ci] [varchar](25) NOT NULL,
	[semestre] [int] NULL,
	[nacionalidad] [varchar](100) NOT NULL,
	[direccion] [varchar](150) NOT NULL,
	[celular] [int] NOT NULL,
	[fechaNacimiento] [date] NOT NULL,
	[estado] [bit] NOT NULL,
	[register] [datetime] NULL,
	[edit] [datetime] NULL,
	[delet] [datetime] NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroHora]    Script Date: 02/09/2019 13:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroHora](
	[idRegistroHora] [int] IDENTITY(1,1) NOT NULL,
	[idConvenio] [int] NULL,
	[fechaHoraEntrada] [datetime] NULL,
	[fechaHoraSalida] [datetime] NULL,
	[observacion] [varchar](200) NULL,
	[aprobado] [bit] NULL,
	[aprobadoFinanzas] [bit] NULL,
	[edit] [datetime] NULL,
	[delet] [datetime] NULL,
 CONSTRAINT [PK_RegistroHora] PRIMARY KEY CLUSTERED 
(
	[idRegistroHora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroUsuario]    Script Date: 02/09/2019 13:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroUsuario](
	[idRegistroLogin] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[login] [datetime] NULL,
	[singOut] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 02/09/2019 13:02:40 ******/
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
/****** Object:  Table [dbo].[Turno]    Script Date: 02/09/2019 13:02:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turno](
	[idTurno] [int] IDENTITY(1,1) NOT NULL,
	[idConvenio] [int] NOT NULL,
	[idDias] [int] NOT NULL,
	[horaEntrada] [datetime] NOT NULL,
	[horaSalida] [datetime] NOT NULL,
	[register] [datetime] NULL,
	[edit] [datetime] NULL,
	[delet] [datetime] NULL,
 CONSTRAINT [PK_Turno] PRIMARY KEY CLUSTERED 
(
	[idTurno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 02/09/2019 13:02:41 ******/
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
	[register] [datetime] NULL,
	[edit] [datetime] NULL,
	[delet] [datetime] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Acreedor] ON 

INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (1, 41, 1, 4, CAST(N'2019-02-05T09:12:35.000' AS DateTime), N'10', 1, NULL, CAST(N'2019-02-10T00:00:00.000' AS DateTime), CAST(N'2019-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (2, 39, 2, 4, CAST(N'2019-02-05T10:57:01.000' AS DateTime), N'88', 1, NULL, NULL, CAST(N'2019-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (3, 42, 3, 4, CAST(N'2019-02-05T11:16:41.000' AS DateTime), N'126', 1, NULL, NULL, CAST(N'2019-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (4, 35, 3, 4, CAST(N'2019-02-05T11:20:36.000' AS DateTime), N'6', 1, NULL, NULL, CAST(N'2019-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (5, 32, 4, 4, CAST(N'2019-02-05T11:20:56.000' AS DateTime), N'18', 1, NULL, NULL, CAST(N'2019-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (6, 42, 3, 4, CAST(N'2019-02-05T11:22:42.000' AS DateTime), N'126', 1, NULL, NULL, CAST(N'2019-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (7, 41, 1, 4, CAST(N'2019-02-05T11:35:41.000' AS DateTime), N'10', 1, NULL, CAST(N'2019-02-10T00:00:00.000' AS DateTime), CAST(N'2019-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (8, 49, 3, 4, CAST(N'2019-02-07T17:12:34.000' AS DateTime), N'147.82', 1, NULL, NULL, CAST(N'2019-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (9, 86, 1, 4, CAST(N'2019-02-07T17:12:37.000' AS DateTime), N'10', 1, NULL, CAST(N'2019-02-10T00:00:00.000' AS DateTime), CAST(N'2019-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (10, 90, 1, 4, CAST(N'2019-02-07T18:19:43.000' AS DateTime), N'10', 1, NULL, CAST(N'2019-02-10T00:00:00.000' AS DateTime), CAST(N'2019-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (11, 87, 3, 4, CAST(N'2019-02-07T21:55:13.000' AS DateTime), N'0.58', 1, NULL, NULL, CAST(N'2019-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (12, 89, 2, 4, CAST(N'2019-02-07T23:01:43.000' AS DateTime), N'29.98', 1, NULL, NULL, CAST(N'2019-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (13, 90, 1, 4, CAST(N'2019-02-07T23:27:34.000' AS DateTime), N'10', 1, NULL, CAST(N'2019-02-10T00:00:00.000' AS DateTime), CAST(N'2019-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (14, 84, 16, 4, CAST(N'2019-02-07T23:40:24.000' AS DateTime), N'21.82', 1, NULL, NULL, CAST(N'2019-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (15, 83, 1, 4, CAST(N'2019-02-07T23:40:56.000' AS DateTime), N'10', 1, NULL, CAST(N'2019-02-10T00:00:00.000' AS DateTime), CAST(N'2019-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (16, 91, 1, 4, CAST(N'2019-02-08T12:31:11.000' AS DateTime), N'10', 1, NULL, CAST(N'2019-02-10T00:00:00.000' AS DateTime), CAST(N'2019-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (17, 92, 1, 4, CAST(N'2019-02-08T12:50:16.000' AS DateTime), N'10', 1, NULL, CAST(N'2019-02-10T00:00:00.000' AS DateTime), CAST(N'2019-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (18, 93, 1, 4, CAST(N'2019-02-08T13:03:24.000' AS DateTime), N'10', 1, NULL, CAST(N'2019-02-10T00:00:00.000' AS DateTime), CAST(N'2019-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (19, 94, 17, 4, CAST(N'2019-02-08T14:53:05.000' AS DateTime), N'0.35', 1, NULL, NULL, CAST(N'2019-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (20, 86, 1, 4, CAST(N'2019-02-08T14:54:14.000' AS DateTime), N'10', 1, NULL, CAST(N'2019-02-10T00:00:00.000' AS DateTime), CAST(N'2019-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (21, 89, 2, 4, CAST(N'2019-02-10T23:23:36.000' AS DateTime), N'58.33', 0, NULL, CAST(N'2019-04-10T17:15:16.000' AS DateTime), NULL)
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (22, 36, 2, 4, CAST(N'2019-02-11T00:14:20.000' AS DateTime), N'7', 1, NULL, NULL, CAST(N'2019-02-10T00:00:00.000' AS DateTime))
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (23, 141, 1, 4, CAST(N'2019-02-11T00:18:25.000' AS DateTime), N'599.65', 0, NULL, CAST(N'2019-05-16T11:31:03.000' AS DateTime), NULL)
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (24, 137, 16, 4, CAST(N'2019-02-11T00:18:41.000' AS DateTime), N'203.62', 1, NULL, CAST(N'2019-05-16T10:04:32.000' AS DateTime), NULL)
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (25, 124, 3, 4, CAST(N'2019-02-11T00:21:06.000' AS DateTime), N'2.52', 1, NULL, CAST(N'2019-03-22T08:24:53.000' AS DateTime), NULL)
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (26, 120, 15, 4, CAST(N'2019-02-11T09:02:09.000' AS DateTime), N'129.39', 1, NULL, CAST(N'2019-02-15T13:57:18.000' AS DateTime), NULL)
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (27, 141, 1, 2, NULL, N'599.65', 0, NULL, CAST(N'2019-05-16T11:31:03.000' AS DateTime), NULL)
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (28, 141, 1, 2, NULL, N'599.65', 0, NULL, CAST(N'2019-05-16T11:31:03.000' AS DateTime), NULL)
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (29, 141, 1, 2, NULL, N'599.65', 0, NULL, CAST(N'2019-05-16T11:31:03.000' AS DateTime), NULL)
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (30, 141, 1, 2, CAST(N'2019-04-02T18:22:03.000' AS DateTime), N'599.65', 0, NULL, CAST(N'2019-05-16T11:31:03.000' AS DateTime), NULL)
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (31, 141, 1, 2, CAST(N'2019-04-02T18:28:08.000' AS DateTime), N'599.65', 0, NULL, CAST(N'2019-05-16T11:31:03.000' AS DateTime), NULL)
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (32, 141, 1, 2, CAST(N'2019-04-02T18:33:25.000' AS DateTime), N'599.65', 0, NULL, CAST(N'2019-05-16T11:31:03.000' AS DateTime), NULL)
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (33, 141, 1, 2, CAST(N'2019-04-02T18:40:47.000' AS DateTime), N'599.65', 0, NULL, CAST(N'2019-05-16T11:31:03.000' AS DateTime), NULL)
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (34, 141, 1, 2, CAST(N'2019-04-02T23:37:16.000' AS DateTime), N'599.65', 0, NULL, CAST(N'2019-05-16T11:31:03.000' AS DateTime), NULL)
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (35, 141, 1, 2, CAST(N'2019-04-02T23:38:55.000' AS DateTime), N'599.65', 0, NULL, CAST(N'2019-05-16T11:31:03.000' AS DateTime), NULL)
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (36, 141, 1, 2, CAST(N'2019-04-02T23:42:17.000' AS DateTime), N'599.65', 0, NULL, CAST(N'2019-05-16T11:31:03.000' AS DateTime), NULL)
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (37, 141, 1, 2, CAST(N'2019-04-02T23:44:34.000' AS DateTime), N'599.65', 0, NULL, CAST(N'2019-05-16T11:31:03.000' AS DateTime), NULL)
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (38, 141, 1, 2, CAST(N'2019-04-02T23:49:37.000' AS DateTime), N'599.65', 0, NULL, CAST(N'2019-05-16T11:31:03.000' AS DateTime), NULL)
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (39, 141, 1, 2, CAST(N'2019-04-02T23:52:05.000' AS DateTime), N'599.65', 0, NULL, CAST(N'2019-05-16T11:31:03.000' AS DateTime), NULL)
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (40, 141, 1, 2, CAST(N'2019-04-02T23:58:06.000' AS DateTime), N'599.65', 0, NULL, CAST(N'2019-05-16T11:31:03.000' AS DateTime), NULL)
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (41, 141, 1, 2, CAST(N'2019-04-02T23:58:22.000' AS DateTime), N'599.65', 0, NULL, CAST(N'2019-05-16T11:31:03.000' AS DateTime), NULL)
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (42, 141, 1, 2, CAST(N'2019-04-02T23:58:32.000' AS DateTime), N'599.65', 0, NULL, CAST(N'2019-05-16T11:31:03.000' AS DateTime), NULL)
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (43, 141, 1, 2, CAST(N'2019-04-03T09:10:51.000' AS DateTime), N'599.65', 1, NULL, CAST(N'2019-05-16T11:31:03.000' AS DateTime), NULL)
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (44, 89, 2, 2, CAST(N'2019-04-10T17:03:00.000' AS DateTime), N'58.33', 1, NULL, CAST(N'2019-04-10T17:15:16.000' AS DateTime), NULL)
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (45, 136, 18, 4, CAST(N'2019-05-16T09:48:14.000' AS DateTime), N'108.27', 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Acreedor] OFF
SET IDENTITY_INSERT [dbo].[Area] ON 

INSERT [dbo].[Area] ([idArea], [idDepartamento], [nombre], [fechaRegistro], [estado], [edit], [delet]) VALUES (2, 1, N'Pasillos Bloque B', CAST(N'2019-01-17T00:00:00.000' AS DateTime), 1, CAST(N'2019-01-28T14:26:42.000' AS DateTime), NULL)
INSERT [dbo].[Area] ([idArea], [idDepartamento], [nombre], [fechaRegistro], [estado], [edit], [delet]) VALUES (3, 1, N'Pasillos Bloque C', CAST(N'2019-01-17T00:00:00.000' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[Area] ([idArea], [idDepartamento], [nombre], [fechaRegistro], [estado], [edit], [delet]) VALUES (4, 1, N'Plazas y Aceras', CAST(N'2019-01-17T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Area] ([idArea], [idDepartamento], [nombre], [fechaRegistro], [estado], [edit], [delet]) VALUES (14, 1, N'Sanitarios', CAST(N'2019-01-18T00:00:00.000' AS DateTime), 0, CAST(N'2019-01-27T23:24:50.000' AS DateTime), NULL)
INSERT [dbo].[Area] ([idArea], [idDepartamento], [nombre], [fechaRegistro], [estado], [edit], [delet]) VALUES (15, 1, N'canchas', CAST(N'2019-01-21T00:00:00.000' AS DateTime), 0, NULL, CAST(N'2019-01-27T23:23:25.000' AS DateTime))
INSERT [dbo].[Area] ([idArea], [idDepartamento], [nombre], [fechaRegistro], [estado], [edit], [delet]) VALUES (16, 1, N'Canchas', CAST(N'2019-01-27T23:25:23.000' AS DateTime), 1, CAST(N'2019-01-28T14:15:02.000' AS DateTime), NULL)
INSERT [dbo].[Area] ([idArea], [idDepartamento], [nombre], [fechaRegistro], [estado], [edit], [delet]) VALUES (17, 1, N'Coliseo', CAST(N'2019-01-28T14:28:53.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Area] ([idArea], [idDepartamento], [nombre], [fechaRegistro], [estado], [edit], [delet]) VALUES (18, 25, N'Pasantes', CAST(N'2019-07-12T20:02:31.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Area] ([idArea], [idDepartamento], [nombre], [fechaRegistro], [estado], [edit], [delet]) VALUES (19, 25, N'Developers', CAST(N'2019-07-12T20:33:41.000' AS DateTime), 0, CAST(N'2019-07-18T07:33:51.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Area] OFF
SET IDENTITY_INSERT [dbo].[AsignacionArea] ON 

INSERT [dbo].[AsignacionArea] ([idAsignacionArea], [idConvenio], [idArea], [fechaRegistro], [estado], [edit], [delet]) VALUES (2, 2, 2, CAST(N'2018-01-22T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[AsignacionArea] ([idAsignacionArea], [idConvenio], [idArea], [fechaRegistro], [estado], [edit], [delet]) VALUES (3, 3, 3, CAST(N'2018-01-22T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[AsignacionArea] ([idAsignacionArea], [idConvenio], [idArea], [fechaRegistro], [estado], [edit], [delet]) VALUES (4, 4, 4, CAST(N'2018-01-22T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[AsignacionArea] ([idAsignacionArea], [idConvenio], [idArea], [fechaRegistro], [estado], [edit], [delet]) VALUES (7, 1, 4, CAST(N'2018-01-22T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[AsignacionArea] ([idAsignacionArea], [idConvenio], [idArea], [fechaRegistro], [estado], [edit], [delet]) VALUES (11, 7, 14, CAST(N'2018-01-22T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[AsignacionArea] ([idAsignacionArea], [idConvenio], [idArea], [fechaRegistro], [estado], [edit], [delet]) VALUES (12, 8, 14, CAST(N'2019-01-24T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[AsignacionArea] ([idAsignacionArea], [idConvenio], [idArea], [fechaRegistro], [estado], [edit], [delet]) VALUES (13, 15, 16, CAST(N'2019-01-28T00:36:07.000' AS DateTime), 1, CAST(N'2019-01-29T00:08:20.000' AS DateTime), CAST(N'2019-01-29T00:06:06.000' AS DateTime))
INSERT [dbo].[AsignacionArea] ([idAsignacionArea], [idConvenio], [idArea], [fechaRegistro], [estado], [edit], [delet]) VALUES (14, 4, 14, CAST(N'2019-01-28T00:47:05.000' AS DateTime), 1, NULL, CAST(N'2019-01-29T00:11:09.000' AS DateTime))
INSERT [dbo].[AsignacionArea] ([idAsignacionArea], [idConvenio], [idArea], [fechaRegistro], [estado], [edit], [delet]) VALUES (15, 15, 2, CAST(N'2019-01-28T14:19:17.000' AS DateTime), 1, NULL, CAST(N'2019-01-29T00:09:38.000' AS DateTime))
INSERT [dbo].[AsignacionArea] ([idAsignacionArea], [idConvenio], [idArea], [fechaRegistro], [estado], [edit], [delet]) VALUES (16, 3, 17, CAST(N'2019-01-28T14:30:29.000' AS DateTime), 1, NULL, CAST(N'2019-01-29T00:12:04.000' AS DateTime))
INSERT [dbo].[AsignacionArea] ([idAsignacionArea], [idConvenio], [idArea], [fechaRegistro], [estado], [edit], [delet]) VALUES (17, 2, 17, CAST(N'2019-01-28T14:40:57.000' AS DateTime), 1, NULL, CAST(N'2019-01-29T00:11:29.000' AS DateTime))
INSERT [dbo].[AsignacionArea] ([idAsignacionArea], [idConvenio], [idArea], [fechaRegistro], [estado], [edit], [delet]) VALUES (18, 16, 14, CAST(N'2019-02-01T11:28:52.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[AsignacionArea] ([idAsignacionArea], [idConvenio], [idArea], [fechaRegistro], [estado], [edit], [delet]) VALUES (19, 1, 14, CAST(N'2019-02-08T11:04:39.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[AsignacionArea] ([idAsignacionArea], [idConvenio], [idArea], [fechaRegistro], [estado], [edit], [delet]) VALUES (20, 17, 16, CAST(N'2019-02-08T14:45:04.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[AsignacionArea] ([idAsignacionArea], [idConvenio], [idArea], [fechaRegistro], [estado], [edit], [delet]) VALUES (21, 18, 3, CAST(N'2019-02-08T15:37:06.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[AsignacionArea] ([idAsignacionArea], [idConvenio], [idArea], [fechaRegistro], [estado], [edit], [delet]) VALUES (22, 15, 17, CAST(N'2019-02-10T22:49:38.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[AsignacionArea] ([idAsignacionArea], [idConvenio], [idArea], [fechaRegistro], [estado], [edit], [delet]) VALUES (23, 15, 16, CAST(N'2019-02-10T22:50:05.000' AS DateTime), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[AsignacionArea] OFF
SET IDENTITY_INSERT [dbo].[Beca] ON 

INSERT [dbo].[Beca] ([idBeca], [nombre], [estado], [register], [edit], [delet]) VALUES (1, N'Industrial', 1, NULL, NULL, NULL)
INSERT [dbo].[Beca] ([idBeca], [nombre], [estado], [register], [edit], [delet]) VALUES (2, N'Institucional', 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Beca] OFF
SET IDENTITY_INSERT [dbo].[Carrera] ON 

INSERT [dbo].[Carrera] ([idCarrera], [nombre], [register], [edit], [delet], [estado]) VALUES (17, N'Ingeniería Comercial', CAST(N'2019-03-21T14:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Carrera] ([idCarrera], [nombre], [register], [edit], [delet], [estado]) VALUES (18, N'Contaduría Pública', CAST(N'2019-03-21T14:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Carrera] ([idCarrera], [nombre], [register], [edit], [delet], [estado]) VALUES (19, N'Ingeniería Financiera', CAST(N'2019-03-21T14:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Carrera] ([idCarrera], [nombre], [register], [edit], [delet], [estado]) VALUES (20, N'Administración y Negocios Internacionales', CAST(N'2019-03-21T14:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Carrera] ([idCarrera], [nombre], [register], [edit], [delet], [estado]) VALUES (21, N'Enfermeria', CAST(N'2019-03-21T14:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Carrera] ([idCarrera], [nombre], [register], [edit], [delet], [estado]) VALUES (22, N'Fisioterapia y Kinesiologia', CAST(N'2019-03-21T14:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Carrera] ([idCarrera], [nombre], [register], [edit], [delet], [estado]) VALUES (23, N'Nutrición y Dietética', CAST(N'2019-03-21T14:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Carrera] ([idCarrera], [nombre], [register], [edit], [delet], [estado]) VALUES (24, N'Bioquímica', CAST(N'2019-03-21T14:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Carrera] ([idCarrera], [nombre], [register], [edit], [delet], [estado]) VALUES (25, N'Ingenieria de Sistemas', CAST(N'2019-03-21T14:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Carrera] ([idCarrera], [nombre], [register], [edit], [delet], [estado]) VALUES (26, N'Ingeniería ambiental', CAST(N'2019-03-21T14:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Carrera] ([idCarrera], [nombre], [register], [edit], [delet], [estado]) VALUES (27, N'Ingeniería en redes y telecomunicaciones', CAST(N'2019-03-21T14:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Carrera] ([idCarrera], [nombre], [register], [edit], [delet], [estado]) VALUES (28, N'Psicología', CAST(N'2019-03-21T14:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Carrera] ([idCarrera], [nombre], [register], [edit], [delet], [estado]) VALUES (29, N'Psicopedagocía', CAST(N'2019-03-21T14:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Carrera] ([idCarrera], [nombre], [register], [edit], [delet], [estado]) VALUES (30, N'Actividad Física y Deportes', CAST(N'2019-03-21T14:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Carrera] ([idCarrera], [nombre], [register], [edit], [delet], [estado]) VALUES (31, N'Teología', CAST(N'2019-03-21T14:00:00.000' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Carrera] OFF
SET IDENTITY_INSERT [dbo].[Convenio] ON 

INSERT [dbo].[Convenio] ([idConvenio], [idDepartamento], [idPersona], [idBeca], [fechaInicio], [fechaFinal], [fotocopiaCarnet], [solicitudTrabajo], [estado], [register], [edit], [delet]) VALUES (1, 1, 1, 2, CAST(N'2019-02-01' AS Date), CAST(N'2019-06-01' AS Date), 1, 0, 1, NULL, CAST(N'2019-02-11T12:10:41.000' AS DateTime), NULL)
INSERT [dbo].[Convenio] ([idConvenio], [idDepartamento], [idPersona], [idBeca], [fechaInicio], [fechaFinal], [fotocopiaCarnet], [solicitudTrabajo], [estado], [register], [edit], [delet]) VALUES (2, 1, 2, 2, CAST(N'2019-02-01' AS Date), CAST(N'2019-06-01' AS Date), 1, 1, 1, NULL, CAST(N'2019-01-28T12:03:56.000' AS DateTime), NULL)
INSERT [dbo].[Convenio] ([idConvenio], [idDepartamento], [idPersona], [idBeca], [fechaInicio], [fechaFinal], [fotocopiaCarnet], [solicitudTrabajo], [estado], [register], [edit], [delet]) VALUES (3, 1, 3, 2, CAST(N'2019-02-01' AS Date), CAST(N'2019-06-01' AS Date), 1, 0, 1, NULL, NULL, NULL)
INSERT [dbo].[Convenio] ([idConvenio], [idDepartamento], [idPersona], [idBeca], [fechaInicio], [fechaFinal], [fotocopiaCarnet], [solicitudTrabajo], [estado], [register], [edit], [delet]) VALUES (4, 1, 4, 2, CAST(N'2019-02-01' AS Date), CAST(N'2019-06-01' AS Date), 1, 1, 1, NULL, CAST(N'2019-01-28T12:04:01.000' AS DateTime), NULL)
INSERT [dbo].[Convenio] ([idConvenio], [idDepartamento], [idPersona], [idBeca], [fechaInicio], [fechaFinal], [fotocopiaCarnet], [solicitudTrabajo], [estado], [register], [edit], [delet]) VALUES (5, 3, 5, 2, CAST(N'2019-02-01' AS Date), CAST(N'2019-06-01' AS Date), 1, 1, 1, NULL, NULL, NULL)
INSERT [dbo].[Convenio] ([idConvenio], [idDepartamento], [idPersona], [idBeca], [fechaInicio], [fechaFinal], [fotocopiaCarnet], [solicitudTrabajo], [estado], [register], [edit], [delet]) VALUES (6, 4, 12, 2, CAST(N'2019-02-01' AS Date), CAST(N'2019-06-01' AS Date), 1, 0, 0, NULL, NULL, CAST(N'2019-01-27T21:53:21.000' AS DateTime))
INSERT [dbo].[Convenio] ([idConvenio], [idDepartamento], [idPersona], [idBeca], [fechaInicio], [fechaFinal], [fotocopiaCarnet], [solicitudTrabajo], [estado], [register], [edit], [delet]) VALUES (7, 1, 6, 2, CAST(N'2019-01-01' AS Date), CAST(N'2019-06-29' AS Date), 1, 0, 0, NULL, NULL, CAST(N'2019-01-28T00:08:29.000' AS DateTime))
INSERT [dbo].[Convenio] ([idConvenio], [idDepartamento], [idPersona], [idBeca], [fechaInicio], [fechaFinal], [fotocopiaCarnet], [solicitudTrabajo], [estado], [register], [edit], [delet]) VALUES (8, 1, 12, 2, CAST(N'2019-01-01' AS Date), CAST(N'2019-06-29' AS Date), 1, 0, 1, NULL, NULL, NULL)
INSERT [dbo].[Convenio] ([idConvenio], [idDepartamento], [idPersona], [idBeca], [fechaInicio], [fechaFinal], [fotocopiaCarnet], [solicitudTrabajo], [estado], [register], [edit], [delet]) VALUES (9, 5, 15, 1, CAST(N'2019-01-15' AS Date), CAST(N'2019-11-18' AS Date), 1, 0, 1, NULL, CAST(N'2019-01-28T12:04:07.000' AS DateTime), NULL)
INSERT [dbo].[Convenio] ([idConvenio], [idDepartamento], [idPersona], [idBeca], [fechaInicio], [fechaFinal], [fotocopiaCarnet], [solicitudTrabajo], [estado], [register], [edit], [delet]) VALUES (10, 25, 15, 2, CAST(N'2019-01-15' AS Date), CAST(N'2019-05-18' AS Date), 1, 0, 1, NULL, NULL, CAST(N'2019-01-27T21:49:15.000' AS DateTime))
INSERT [dbo].[Convenio] ([idConvenio], [idDepartamento], [idPersona], [idBeca], [fechaInicio], [fechaFinal], [fotocopiaCarnet], [solicitudTrabajo], [estado], [register], [edit], [delet]) VALUES (13, 1, 28, 2, CAST(N'2019-02-01' AS Date), CAST(N'2019-06-01' AS Date), 0, 0, 0, CAST(N'2019-01-27T21:04:33.000' AS DateTime), CAST(N'2019-01-27T21:10:14.000' AS DateTime), CAST(N'2019-01-27T21:10:27.000' AS DateTime))
INSERT [dbo].[Convenio] ([idConvenio], [idDepartamento], [idPersona], [idBeca], [fechaInicio], [fechaFinal], [fotocopiaCarnet], [solicitudTrabajo], [estado], [register], [edit], [delet]) VALUES (14, 25, 22, 2, CAST(N'2019-01-15' AS Date), CAST(N'2019-05-18' AS Date), 1, 1, 1, CAST(N'2019-01-27T21:45:14.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Convenio] ([idConvenio], [idDepartamento], [idPersona], [idBeca], [fechaInicio], [fechaFinal], [fotocopiaCarnet], [solicitudTrabajo], [estado], [register], [edit], [delet]) VALUES (15, 1, 27, 2, CAST(N'2019-01-15' AS Date), CAST(N'2019-05-18' AS Date), 1, 1, 1, CAST(N'2019-01-28T00:04:29.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Convenio] ([idConvenio], [idDepartamento], [idPersona], [idBeca], [fechaInicio], [fechaFinal], [fotocopiaCarnet], [solicitudTrabajo], [estado], [register], [edit], [delet]) VALUES (16, 1, 29, 2, CAST(N'2019-01-15' AS Date), CAST(N'2019-05-18' AS Date), 1, 0, 1, CAST(N'2019-02-01T11:27:51.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Convenio] ([idConvenio], [idDepartamento], [idPersona], [idBeca], [fechaInicio], [fechaFinal], [fotocopiaCarnet], [solicitudTrabajo], [estado], [register], [edit], [delet]) VALUES (17, 1, 30, 2, CAST(N'2019-01-15' AS Date), CAST(N'2019-05-18' AS Date), 1, 0, 1, CAST(N'2019-02-08T14:24:55.000' AS DateTime), CAST(N'2019-02-08T14:27:29.000' AS DateTime), NULL)
INSERT [dbo].[Convenio] ([idConvenio], [idDepartamento], [idPersona], [idBeca], [fechaInicio], [fechaFinal], [fotocopiaCarnet], [solicitudTrabajo], [estado], [register], [edit], [delet]) VALUES (18, 1, 31, 1, CAST(N'2019-02-08' AS Date), CAST(N'2019-05-18' AS Date), 1, 1, 1, CAST(N'2019-02-08T15:34:49.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Convenio] ([idConvenio], [idDepartamento], [idPersona], [idBeca], [fechaInicio], [fechaFinal], [fotocopiaCarnet], [solicitudTrabajo], [estado], [register], [edit], [delet]) VALUES (21, 6, 53, 2, CAST(N'2019-01-01' AS Date), CAST(N'2019-06-01' AS Date), 1, 0, 1, CAST(N'2019-04-29T16:19:27.000' AS DateTime), NULL, CAST(N'2019-04-29T16:25:58.000' AS DateTime))
INSERT [dbo].[Convenio] ([idConvenio], [idDepartamento], [idPersona], [idBeca], [fechaInicio], [fechaFinal], [fotocopiaCarnet], [solicitudTrabajo], [estado], [register], [edit], [delet]) VALUES (22, 5, 53, 1, CAST(N'2019-01-01' AS Date), CAST(N'2019-06-01' AS Date), 1, 1, 1, CAST(N'2019-04-29T16:26:49.000' AS DateTime), NULL, CAST(N'2019-05-07T11:53:07.000' AS DateTime))
INSERT [dbo].[Convenio] ([idConvenio], [idDepartamento], [idPersona], [idBeca], [fechaInicio], [fechaFinal], [fotocopiaCarnet], [solicitudTrabajo], [estado], [register], [edit], [delet]) VALUES (24, 3, 53, 2, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-06' AS Date), 0, 1, 1, CAST(N'2019-05-07T11:54:22.000' AS DateTime), NULL, CAST(N'2019-05-07T12:03:18.000' AS DateTime))
INSERT [dbo].[Convenio] ([idConvenio], [idDepartamento], [idPersona], [idBeca], [fechaInicio], [fechaFinal], [fotocopiaCarnet], [solicitudTrabajo], [estado], [register], [edit], [delet]) VALUES (25, 4, 53, 2, CAST(N'2019-01-01' AS Date), CAST(N'2019-01-20' AS Date), 0, 1, 1, CAST(N'2019-05-07T12:04:04.000' AS DateTime), NULL, CAST(N'2019-05-07T22:57:11.000' AS DateTime))
INSERT [dbo].[Convenio] ([idConvenio], [idDepartamento], [idPersona], [idBeca], [fechaInicio], [fechaFinal], [fotocopiaCarnet], [solicitudTrabajo], [estado], [register], [edit], [delet]) VALUES (27, 2, 53, 1, CAST(N'2019-01-15' AS Date), CAST(N'2019-06-25' AS Date), 1, 0, 1, CAST(N'2019-05-07T22:57:36.000' AS DateTime), NULL, CAST(N'2019-05-07T23:05:24.000' AS DateTime))
INSERT [dbo].[Convenio] ([idConvenio], [idDepartamento], [idPersona], [idBeca], [fechaInicio], [fechaFinal], [fotocopiaCarnet], [solicitudTrabajo], [estado], [register], [edit], [delet]) VALUES (28, 5, 53, 2, CAST(N'2019-01-12' AS Date), CAST(N'2019-06-23' AS Date), 1, 0, 1, CAST(N'2019-05-07T23:05:50.000' AS DateTime), NULL, CAST(N'2019-05-09T11:26:09.000' AS DateTime))
INSERT [dbo].[Convenio] ([idConvenio], [idDepartamento], [idPersona], [idBeca], [fechaInicio], [fechaFinal], [fotocopiaCarnet], [solicitudTrabajo], [estado], [register], [edit], [delet]) VALUES (29, 2, 53, 1, CAST(N'2019-02-15' AS Date), CAST(N'2019-06-12' AS Date), 0, 1, 0, CAST(N'2019-05-09T11:26:44.000' AS DateTime), CAST(N'2019-05-15T22:00:21.000' AS DateTime), CAST(N'2019-05-15T22:07:47.000' AS DateTime))
INSERT [dbo].[Convenio] ([idConvenio], [idDepartamento], [idPersona], [idBeca], [fechaInicio], [fechaFinal], [fotocopiaCarnet], [solicitudTrabajo], [estado], [register], [edit], [delet]) VALUES (30, 6, 53, 2, CAST(N'2019-02-14' AS Date), CAST(N'2019-06-14' AS Date), 0, 1, 1, CAST(N'2019-05-17T09:48:31.000' AS DateTime), NULL, CAST(N'2019-05-26T21:10:34.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Convenio] OFF
SET IDENTITY_INSERT [dbo].[Departamento] ON 

INSERT [dbo].[Departamento] ([idDepartamento], [nombre], [fechaRegistro], [estado], [edit], [delet]) VALUES (1, N'Limpieza', CAST(N'2018-11-15T00:00:00.000' AS DateTime), 1, CAST(N'2019-02-12T18:46:36.000' AS DateTime), NULL)
INSERT [dbo].[Departamento] ([idDepartamento], [nombre], [fechaRegistro], [estado], [edit], [delet]) VALUES (2, N'Comedor', CAST(N'2018-11-15T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Departamento] ([idDepartamento], [nombre], [fechaRegistro], [estado], [edit], [delet]) VALUES (3, N'Biblioteca', CAST(N'2018-11-15T00:00:00.000' AS DateTime), 1, CAST(N'2019-02-12T18:04:20.000' AS DateTime), NULL)
INSERT [dbo].[Departamento] ([idDepartamento], [nombre], [fechaRegistro], [estado], [edit], [delet]) VALUES (4, N'Carpinteria', CAST(N'2018-11-15T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Departamento] ([idDepartamento], [nombre], [fechaRegistro], [estado], [edit], [delet]) VALUES (5, N'Guardia', CAST(N'2018-11-15T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Departamento] ([idDepartamento], [nombre], [fechaRegistro], [estado], [edit], [delet]) VALUES (6, N'Almacen', CAST(N'2018-11-02T00:00:00.000' AS DateTime), 1, CAST(N'2019-02-12T18:04:23.000' AS DateTime), NULL)
INSERT [dbo].[Departamento] ([idDepartamento], [nombre], [fechaRegistro], [estado], [edit], [delet]) VALUES (12, N'Lavanderia', CAST(N'2019-01-16T00:00:00.000' AS DateTime), 0, CAST(N'2019-02-12T00:00:00.000' AS DateTime), CAST(N'2019-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Departamento] ([idDepartamento], [nombre], [fechaRegistro], [estado], [edit], [delet]) VALUES (21, N'Piscina', CAST(N'2019-01-17T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Departamento] ([idDepartamento], [nombre], [fechaRegistro], [estado], [edit], [delet]) VALUES (24, N'Tecnologia', CAST(N'2019-01-17T00:00:00.000' AS DateTime), 0, CAST(N'2019-02-12T00:00:00.000' AS DateTime), CAST(N'2019-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Departamento] ([idDepartamento], [nombre], [fechaRegistro], [estado], [edit], [delet]) VALUES (25, N'TI', CAST(N'2019-01-21T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Departamento] ([idDepartamento], [nombre], [fechaRegistro], [estado], [edit], [delet]) VALUES (26, N'Lavanderia', CAST(N'2019-02-08T15:47:07.000' AS DateTime), 0, NULL, CAST(N'2019-02-12T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Departamento] OFF
SET IDENTITY_INSERT [dbo].[Descuento] ON 

INSERT [dbo].[Descuento] ([idDescuento], [idAcreedor], [idUsuario], [fechaDescuento], [saldoInicial], [montoBs], [observacion], [edit], [delet]) VALUES (4, 21, 4, CAST(N'2019-02-27T07:43:50.000' AS DateTime), N'250', N'20', N'prueba1', NULL, NULL)
INSERT [dbo].[Descuento] ([idDescuento], [idAcreedor], [idUsuario], [fechaDescuento], [saldoInicial], [montoBs], [observacion], [edit], [delet]) VALUES (5, 23, 4, CAST(N'2019-02-27T11:18:25.000' AS DateTime), N'250', N'70.00', N'DESCUENTO Y YA', NULL, NULL)
INSERT [dbo].[Descuento] ([idDescuento], [idAcreedor], [idUsuario], [fechaDescuento], [saldoInicial], [montoBs], [observacion], [edit], [delet]) VALUES (6, 25, 4, CAST(N'2019-03-22T08:24:53.000' AS DateTime), N'250', N'90', N'undefined', NULL, NULL)
INSERT [dbo].[Descuento] ([idDescuento], [idAcreedor], [idUsuario], [fechaDescuento], [saldoInicial], [montoBs], [observacion], [edit], [delet]) VALUES (7, 23, 4, CAST(N'2019-03-22T09:44:34.000' AS DateTime), N'250', N'500', N'undefined', NULL, NULL)
INSERT [dbo].[Descuento] ([idDescuento], [idAcreedor], [idUsuario], [fechaDescuento], [saldoInicial], [montoBs], [observacion], [edit], [delet]) VALUES (8, 21, 4, CAST(N'2019-03-27T16:43:27.000' AS DateTime), N'250', N'300', N'undefined', NULL, NULL)
INSERT [dbo].[Descuento] ([idDescuento], [idAcreedor], [idUsuario], [fechaDescuento], [saldoInicial], [montoBs], [observacion], [edit], [delet]) VALUES (9, 39, 2, CAST(N'2019-04-02T23:58:06.000' AS DateTime), N'250', N'10.00', N'asd', NULL, NULL)
INSERT [dbo].[Descuento] ([idDescuento], [idAcreedor], [idUsuario], [fechaDescuento], [saldoInicial], [montoBs], [observacion], [edit], [delet]) VALUES (10, 40, 2, CAST(N'2019-04-02T23:58:22.000' AS DateTime), N'250', N'10.00', N'asd', NULL, NULL)
INSERT [dbo].[Descuento] ([idDescuento], [idAcreedor], [idUsuario], [fechaDescuento], [saldoInicial], [montoBs], [observacion], [edit], [delet]) VALUES (11, 41, 2, CAST(N'2019-04-02T23:58:32.000' AS DateTime), N'250', N'10.00', N'', NULL, NULL)
INSERT [dbo].[Descuento] ([idDescuento], [idAcreedor], [idUsuario], [fechaDescuento], [saldoInicial], [montoBs], [observacion], [edit], [delet]) VALUES (12, 42, 2, CAST(N'2019-04-03T09:10:51.000' AS DateTime), N'250', N'10.00', N'undefined', NULL, NULL)
INSERT [dbo].[Descuento] ([idDescuento], [idAcreedor], [idUsuario], [fechaDescuento], [saldoInicial], [montoBs], [observacion], [edit], [delet]) VALUES (13, 21, 2, CAST(N'2019-04-10T17:03:00.000' AS DateTime), N'28.35', N'10', N'undefined', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Descuento] OFF
SET IDENTITY_INSERT [dbo].[HistorialDepartamento] ON 

INSERT [dbo].[HistorialDepartamento] ([idHistorialDepartamento], [idDepartamento], [limiteEstudiante], [costoHora], [fechaRegistro], [estado], [edit], [delet]) VALUES (1, 1, 31, N'7', CAST(N'2019-01-10T00:00:00.000' AS DateTime), 1, CAST(N'2019-07-14T23:05:30.000' AS DateTime), NULL)
INSERT [dbo].[HistorialDepartamento] ([idHistorialDepartamento], [idDepartamento], [limiteEstudiante], [costoHora], [fechaRegistro], [estado], [edit], [delet]) VALUES (2, 2, 28, N'7', CAST(N'2019-01-10T00:00:00.000' AS DateTime), 1, CAST(N'2019-10-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[HistorialDepartamento] ([idHistorialDepartamento], [idDepartamento], [limiteEstudiante], [costoHora], [fechaRegistro], [estado], [edit], [delet]) VALUES (3, 3, 11, N'8.50', CAST(N'2019-01-10T00:00:00.000' AS DateTime), 1, CAST(N'2019-10-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[HistorialDepartamento] ([idHistorialDepartamento], [idDepartamento], [limiteEstudiante], [costoHora], [fechaRegistro], [estado], [edit], [delet]) VALUES (4, 4, 3, N'9.50', CAST(N'2019-01-10T00:00:00.000' AS DateTime), 1, CAST(N'2019-10-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[HistorialDepartamento] ([idHistorialDepartamento], [idDepartamento], [limiteEstudiante], [costoHora], [fechaRegistro], [estado], [edit], [delet]) VALUES (5, 5, 3, N'7', CAST(N'2019-01-10T00:00:00.000' AS DateTime), 1, CAST(N'2019-10-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[HistorialDepartamento] ([idHistorialDepartamento], [idDepartamento], [limiteEstudiante], [costoHora], [fechaRegistro], [estado], [edit], [delet]) VALUES (6, 6, 1, N'6', CAST(N'2019-01-10T00:00:00.000' AS DateTime), 1, CAST(N'2019-10-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[HistorialDepartamento] ([idHistorialDepartamento], [idDepartamento], [limiteEstudiante], [costoHora], [fechaRegistro], [estado], [edit], [delet]) VALUES (8, 21, 3, N'6', CAST(N'2019-01-17T00:00:00.000' AS DateTime), 1, CAST(N'2019-10-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[HistorialDepartamento] ([idHistorialDepartamento], [idDepartamento], [limiteEstudiante], [costoHora], [fechaRegistro], [estado], [edit], [delet]) VALUES (9, 24, 3, N'6', CAST(N'2019-01-17T00:00:00.000' AS DateTime), 0, CAST(N'2019-10-01T00:00:00.000' AS DateTime), CAST(N'2019-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[HistorialDepartamento] ([idHistorialDepartamento], [idDepartamento], [limiteEstudiante], [costoHora], [fechaRegistro], [estado], [edit], [delet]) VALUES (10, 25, 7, N'6', CAST(N'2019-01-21T00:00:00.000' AS DateTime), 1, CAST(N'2019-10-01T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[HistorialDepartamento] ([idHistorialDepartamento], [idDepartamento], [limiteEstudiante], [costoHora], [fechaRegistro], [estado], [edit], [delet]) VALUES (11, 26, 3, N'8', CAST(N'2019-02-08T15:47:24.000' AS DateTime), 0, CAST(N'2019-10-01T00:00:00.000' AS DateTime), CAST(N'2019-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[HistorialDepartamento] ([idHistorialDepartamento], [idDepartamento], [limiteEstudiante], [costoHora], [fechaRegistro], [estado], [edit], [delet]) VALUES (12, 1, 30, N'8', CAST(N'2019-02-12T00:00:00.000' AS DateTime), 0, CAST(N'2019-10-01T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[HistorialDepartamento] OFF
SET IDENTITY_INSERT [dbo].[InformeEstudiante] ON 

INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (31, 36, CAST(N'2019-01-25T00:00:00.000' AS DateTime), N'01:09', N'7', CAST(N'2019-02-01T16:33:53.000' AS DateTime), 1, CAST(N'2019-02-11T08:51:56.000' AS DateTime), CAST(N'2019-07-18T07:10:09.000' AS DateTime), NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (32, 38, CAST(N'2019-01-25T00:00:00.000' AS DateTime), N'03:05', N'18', CAST(N'2019-02-01T16:34:12.000' AS DateTime), 0, CAST(N'2019-02-08T00:02:11.000' AS DateTime), CAST(N'2019-02-04T03:35:30.000' AS DateTime), NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (33, 44, CAST(N'2019-01-29T00:00:00.000' AS DateTime), N'15:34', N'94', CAST(N'2019-02-01T16:34:16.000' AS DateTime), 0, CAST(N'2019-02-13T14:04:19.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (34, 45, CAST(N'2019-01-29T00:00:00.000' AS DateTime), N'00:39', N'4', CAST(N'2019-02-01T16:34:20.000' AS DateTime), 1, CAST(N'2019-02-11T08:56:37.000' AS DateTime), CAST(N'2019-07-18T07:10:17.000' AS DateTime), NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (35, 46, CAST(N'2019-01-29T00:00:00.000' AS DateTime), N'01:02', N'6', CAST(N'2019-02-01T16:34:23.000' AS DateTime), 0, CAST(N'2019-02-08T00:19:42.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (36, 36, CAST(N'2019-01-25T00:00:00.000' AS DateTime), N'01:09', N'7', CAST(N'2019-02-01T16:39:00.000' AS DateTime), 1, CAST(N'2019-02-11T00:14:19.000' AS DateTime), CAST(N'2019-07-18T07:10:12.000' AS DateTime), NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (37, 59, CAST(N'2019-02-01T00:00:00.000' AS DateTime), N'09:18', N'56', CAST(N'2019-02-01T17:32:25.000' AS DateTime), 1, CAST(N'2019-02-11T09:01:16.000' AS DateTime), CAST(N'2019-07-18T07:10:24.000' AS DateTime), NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (38, 59, CAST(N'2019-02-01T00:00:00.000' AS DateTime), N'09:18', N'56', CAST(N'2019-02-01T17:41:39.000' AS DateTime), 1, CAST(N'2019-02-11T00:18:24.000' AS DateTime), CAST(N'2019-02-08T15:51:27.000' AS DateTime), NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (39, 61, CAST(N'2019-02-01T00:00:00.000' AS DateTime), N'14:39', N'88', CAST(N'2019-02-01T17:41:53.000' AS DateTime), 1, CAST(N'2019-02-11T08:59:03.000' AS DateTime), CAST(N'2019-07-18T07:10:26.000' AS DateTime), NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (40, 67, CAST(N'2019-02-04T00:00:00.000' AS DateTime), N'undefined', N'undefined', CAST(N'2019-02-04T11:51:00.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (41, 67, CAST(N'2019-02-04T00:00:00.000' AS DateTime), N'02:32', N'16', CAST(N'2019-02-04T11:51:30.000' AS DateTime), 0, CAST(N'2019-02-15T14:10:32.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (42, 70, CAST(N'2019-02-04T00:00:00.000' AS DateTime), N'21:07', N'126', CAST(N'2019-02-05T11:15:32.000' AS DateTime), 0, CAST(N'2019-02-13T14:04:06.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (43, 72, CAST(N'2019-02-05T00:00:00.000' AS DateTime), N'00:00', N'0', CAST(N'2019-02-05T17:21:30.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (44, 73, CAST(N'2019-02-05T00:00:00.000' AS DateTime), N'07:25', N'51.92', CAST(N'2019-02-05T17:21:46.000' AS DateTime), 1, CAST(N'2019-02-11T09:02:08.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (45, 72, CAST(N'2019-02-05T00:00:00.000' AS DateTime), N'07:25', N'51.92', CAST(N'2019-02-05T17:22:26.000' AS DateTime), 0, CAST(N'2019-02-13T14:03:14.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (46, 74, CAST(N'2019-02-05T00:00:00.000' AS DateTime), N'00:03', N'0.35', CAST(N'2019-02-05T17:22:29.000' AS DateTime), 1, CAST(N'2019-02-13T12:24:17.000' AS DateTime), CAST(N'2019-07-18T07:10:35.000' AS DateTime), NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (47, 71, CAST(N'2019-02-05T00:00:00.000' AS DateTime), N'01:05', N'7.58', CAST(N'2019-02-05T17:22:33.000' AS DateTime), 1, CAST(N'2019-02-13T12:21:11.000' AS DateTime), CAST(N'2019-07-18T07:10:38.000' AS DateTime), NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (48, 67, CAST(N'2019-02-04T00:00:00.000' AS DateTime), N'02:32', N'17.73', CAST(N'2019-02-05T17:27:13.000' AS DateTime), 0, CAST(N'2019-02-13T14:03:58.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (49, 70, CAST(N'2019-02-04T00:00:00.000' AS DateTime), N'21:07', N'147.82', CAST(N'2019-02-05T17:27:55.000' AS DateTime), 0, CAST(N'2019-02-13T14:03:37.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (50, 69, CAST(N'2019-02-04T00:00:00.000' AS DateTime), N'09:55', N'69.42', CAST(N'2019-02-05T17:28:49.000' AS DateTime), 0, CAST(N'2019-02-13T14:03:25.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (51, 68, CAST(N'2019-02-04T00:00:00.000' AS DateTime), N'09:55', N'69.42', CAST(N'2019-02-05T17:29:23.000' AS DateTime), 1, CAST(N'2019-02-13T12:29:33.000' AS DateTime), CAST(N'2019-07-18T07:10:31.000' AS DateTime), NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (52, 59, CAST(N'2019-02-01T00:00:00.000' AS DateTime), N'09:18', N'65.1', CAST(N'2019-02-05T17:41:41.000' AS DateTime), 0, CAST(N'2019-02-13T14:04:15.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (53, 75, CAST(N'2019-02-05T00:00:00.000' AS DateTime), N'00:01', N'0.12', CAST(N'2019-02-05T17:54:14.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (54, 76, CAST(N'2019-02-05T00:00:00.000' AS DateTime), N'00:17', N'1.98', CAST(N'2019-02-05T18:19:49.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (55, 76, CAST(N'2019-02-05T00:00:00.000' AS DateTime), N'00:17', N'1.98', CAST(N'2019-02-05T23:39:29.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (56, 76, CAST(N'2019-02-05T00:00:00.000' AS DateTime), N'00:17', N'1.98', CAST(N'2019-02-05T23:47:56.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (57, 76, CAST(N'2019-02-05T00:00:00.000' AS DateTime), N'00:17', N'1.98', CAST(N'2019-02-05T23:48:03.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (58, 76, CAST(N'2019-02-05T00:00:00.000' AS DateTime), N'00:17', N'1.98', CAST(N'2019-02-05T23:49:13.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (59, 77, CAST(N'2019-02-06T00:00:00.000' AS DateTime), N'00:03', N'0.35', CAST(N'2019-02-06T10:27:03.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (60, 77, CAST(N'2019-02-06T00:00:00.000' AS DateTime), N'00:03', N'0.35', CAST(N'2019-02-06T10:28:51.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (61, 77, CAST(N'2019-02-06T00:00:00.000' AS DateTime), N'00:03', N'0.35', CAST(N'2019-02-06T10:29:15.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (62, 77, CAST(N'2019-02-06T00:00:00.000' AS DateTime), N'00:03', N'0.35', CAST(N'2019-02-06T10:42:27.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (63, 77, CAST(N'2019-02-06T00:00:00.000' AS DateTime), N'00:03', N'0.35', CAST(N'2019-02-06T10:43:13.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (64, 77, CAST(N'2019-02-06T00:00:00.000' AS DateTime), N'00:03', N'0.35', CAST(N'2019-02-06T10:44:29.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (65, 77, CAST(N'2019-02-06T00:00:00.000' AS DateTime), N'00:03', N'0.35', CAST(N'2019-02-06T10:46:04.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (66, 77, CAST(N'2019-02-06T00:00:00.000' AS DateTime), N'00:03', N'0.35', CAST(N'2019-02-06T10:48:00.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (67, 77, CAST(N'2019-02-06T00:00:00.000' AS DateTime), N'00:03', N'0.35', CAST(N'2019-02-06T10:49:21.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (68, 77, CAST(N'2019-02-06T00:00:00.000' AS DateTime), N'00:03', N'0.35', CAST(N'2019-02-06T11:05:46.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (69, 77, CAST(N'2019-02-06T00:00:00.000' AS DateTime), N'00:03', N'0.35', CAST(N'2019-02-06T11:06:35.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (70, 77, CAST(N'2019-02-06T00:00:00.000' AS DateTime), N'00:03', N'0.35', CAST(N'2019-02-06T11:06:54.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (71, 77, CAST(N'2019-02-06T00:00:00.000' AS DateTime), N'00:03', N'0.35', CAST(N'2019-02-06T11:07:11.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (72, 77, CAST(N'2019-02-06T00:00:00.000' AS DateTime), N'00:03', N'0.35', CAST(N'2019-02-06T11:07:31.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (73, 77, CAST(N'2019-02-06T00:00:00.000' AS DateTime), N'00:03', N'0.35', CAST(N'2019-02-06T11:41:03.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (74, 77, CAST(N'2019-02-06T00:00:00.000' AS DateTime), N'00:03', N'0.35', CAST(N'2019-02-06T11:43:35.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (75, 77, CAST(N'2019-02-06T00:00:00.000' AS DateTime), N'00:03', N'0.35', CAST(N'2019-02-06T12:09:40.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (76, 77, CAST(N'2019-02-06T00:00:00.000' AS DateTime), N'00:03', N'0.35', CAST(N'2019-02-06T12:37:56.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (77, 77, CAST(N'2019-02-06T00:00:00.000' AS DateTime), N'00:03', N'0.35', CAST(N'2019-02-06T12:38:50.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (78, 77, CAST(N'2019-02-06T00:00:00.000' AS DateTime), N'00:03', N'0.35', CAST(N'2019-02-06T12:39:55.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (79, 77, CAST(N'2019-02-06T00:00:00.000' AS DateTime), N'00:03', N'0.35', CAST(N'2019-02-06T12:41:22.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (80, 79, CAST(N'2019-02-06T00:00:00.000' AS DateTime), N'00:29', N'3.38', CAST(N'2019-02-06T13:01:56.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (82, 83, CAST(N'2019-02-07T00:00:00.000' AS DateTime), N'undefined', N'undefined', CAST(N'2019-02-07T11:32:57.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-08T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (83, 81, CAST(N'2019-02-06T00:00:00.000' AS DateTime), N'22:19', N'156.22', CAST(N'2019-02-07T14:32:18.000' AS DateTime), 1, CAST(N'2019-02-14T00:10:15.000' AS DateTime), CAST(N'2019-07-18T07:10:42.000' AS DateTime), NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (84, 78, CAST(N'2019-02-06T00:00:00.000' AS DateTime), N'03:07', N'21.82', CAST(N'2019-02-07T16:47:50.000' AS DateTime), 1, CAST(N'2019-02-07T23:40:23.000' AS DateTime), CAST(N'2019-07-18T07:10:50.000' AS DateTime), NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (85, 68, CAST(N'2019-02-04T00:00:00.000' AS DateTime), N'10:05', N'70.58', CAST(N'2019-02-07T16:51:00.000' AS DateTime), 1, CAST(N'2019-02-11T00:18:40.000' AS DateTime), CAST(N'2019-07-18T07:10:32.000' AS DateTime), NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (86, 82, CAST(N'2019-02-07T00:00:00.000' AS DateTime), N'00:01', N'0.12', CAST(N'2019-02-07T17:06:35.000' AS DateTime), 1, CAST(N'2019-02-08T14:54:13.000' AS DateTime), CAST(N'2019-02-07T17:12:58.000' AS DateTime), NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (87, 83, CAST(N'2019-02-07T00:00:00.000' AS DateTime), N'00:05', N'0.58', CAST(N'2019-02-07T17:22:44.000' AS DateTime), 0, CAST(N'2019-02-07T23:27:46.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (88, 13, CAST(N'2019-01-23T00:00:00.000' AS DateTime), N'04:05', N'28.58', CAST(N'2019-02-07T17:27:07.000' AS DateTime), 0, CAST(N'2019-02-15T11:29:12.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (89, 30, CAST(N'2019-01-24T00:00:00.000' AS DateTime), N'04:17', N'29.98', CAST(N'2019-02-07T17:27:15.000' AS DateTime), 1, CAST(N'2019-04-10T17:15:16.000' AS DateTime), CAST(N'2019-07-18T07:10:06.000' AS DateTime), NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (90, 82, CAST(N'2019-02-07T00:00:00.000' AS DateTime), N'00:01', N'0.12', CAST(N'2019-02-07T18:19:30.000' AS DateTime), 1, CAST(N'2019-02-07T23:27:33.000' AS DateTime), CAST(N'2019-07-18T07:10:44.000' AS DateTime), NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (91, 85, CAST(N'2019-02-08T00:00:00.000' AS DateTime), N'11:05', N'77.58', CAST(N'2019-02-08T12:30:38.000' AS DateTime), 1, CAST(N'2019-02-08T12:31:10.000' AS DateTime), NULL, CAST(N'2019-02-08T13:02:47.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (92, 85, CAST(N'2019-02-08T00:00:00.000' AS DateTime), N'11:05', N'77.58', CAST(N'2019-02-08T12:48:30.000' AS DateTime), 1, CAST(N'2019-02-08T12:50:15.000' AS DateTime), NULL, CAST(N'2019-02-08T13:02:47.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (93, 85, CAST(N'2019-02-08T00:00:00.000' AS DateTime), N'11:05', N'77.58', CAST(N'2019-02-08T13:02:59.000' AS DateTime), 1, CAST(N'2019-02-08T13:03:23.000' AS DateTime), CAST(N'2019-07-18T07:10:48.000' AS DateTime), NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (94, 88, CAST(N'2019-02-08T00:00:00.000' AS DateTime), N'00:03', N'0.35', CAST(N'2019-02-08T14:52:16.000' AS DateTime), 1, CAST(N'2019-02-08T14:53:04.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (95, 89, CAST(N'2019-02-10T00:00:00.000' AS DateTime), N'04:11', N'29.28', CAST(N'2019-02-11T00:20:54.000' AS DateTime), 1, CAST(N'2019-02-11T00:21:05.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (96, 91, CAST(N'2019-02-12T00:00:00.000' AS DateTime), N'07:37', N'53.32', CAST(N'2019-02-13T01:17:37.000' AS DateTime), 1, CAST(N'2019-02-13T12:16:21.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (97, 92, CAST(N'2019-02-13T00:00:00.000' AS DateTime), N'11:27', N'80.15', CAST(N'2019-02-13T14:06:11.000' AS DateTime), 1, CAST(N'2019-02-17T01:07:58.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (98, 93, CAST(N'2019-02-13T00:00:00.000' AS DateTime), N'02:37', N'18.32', CAST(N'2019-02-13T14:08:05.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-13T22:41:56.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (99, 93, CAST(N'2019-02-13T00:00:00.000' AS DateTime), N'03:31', N'24.62', CAST(N'2019-02-13T15:13:11.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-13T22:41:56.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (100, 93, CAST(N'2019-02-13T00:00:00.000' AS DateTime), N'03:17', N'22.98', CAST(N'2019-02-13T15:27:17.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-13T22:41:56.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (101, 93, CAST(N'2019-02-13T00:00:00.000' AS DateTime), N'03:17', N'22.98', CAST(N'2019-02-13T15:28:27.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-13T22:41:56.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (102, 93, CAST(N'2019-02-13T00:00:00.000' AS DateTime), N'03:17', N'22.98', CAST(N'2019-02-13T15:28:59.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-13T22:41:56.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (103, 93, CAST(N'2019-02-13T00:00:00.000' AS DateTime), N'03:17', N'22.98', CAST(N'2019-02-13T15:36:08.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-13T22:41:56.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (104, 93, CAST(N'2019-02-13T00:00:00.000' AS DateTime), N'03:17', N'22.98', CAST(N'2019-02-13T15:44:02.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-13T22:41:56.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (105, 93, CAST(N'2019-02-13T00:00:00.000' AS DateTime), N'03:17', N'22.98', CAST(N'2019-02-13T15:46:07.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-13T22:41:56.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (106, 93, CAST(N'2019-02-13T00:00:00.000' AS DateTime), N'03:17', N'22.98', CAST(N'2019-02-13T16:05:14.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-13T22:41:56.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (107, 93, CAST(N'2019-02-13T00:00:00.000' AS DateTime), N'03:17', N'22.98', CAST(N'2019-02-13T16:09:53.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-13T22:41:56.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (108, 94, CAST(N'2019-02-13T00:00:00.000' AS DateTime), N'01:28', N'10.27', CAST(N'2019-02-13T16:11:44.000' AS DateTime), 1, CAST(N'2019-02-14T12:33:07.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (109, 93, CAST(N'2019-02-13T00:00:00.000' AS DateTime), N'03:17', N'22.98', CAST(N'2019-02-13T22:17:49.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-13T22:41:56.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (110, 93, CAST(N'2019-02-13T00:00:00.000' AS DateTime), N'03:17', N'22.98', CAST(N'2019-02-13T22:19:50.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-13T22:41:56.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (111, 93, CAST(N'2019-02-13T00:00:00.000' AS DateTime), N'03:17', N'22.98', CAST(N'2019-02-13T22:30:40.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-13T22:41:56.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (112, 93, CAST(N'2019-02-13T00:00:00.000' AS DateTime), N'03:17', N'22.98', CAST(N'2019-02-13T22:31:17.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-13T22:41:56.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (113, 93, CAST(N'2019-02-13T00:00:00.000' AS DateTime), N'03:17', N'22.98', CAST(N'2019-02-13T22:32:05.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-13T22:41:56.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (114, 93, CAST(N'2019-02-13T00:00:00.000' AS DateTime), N'03:17', N'22.98', CAST(N'2019-02-13T22:38:24.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-13T22:41:56.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (115, 93, CAST(N'2019-02-13T00:00:00.000' AS DateTime), N'03:17', N'22.98', CAST(N'2019-02-13T22:39:32.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-13T22:41:56.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (116, 93, CAST(N'2019-02-13T00:00:00.000' AS DateTime), N'03:17', N'22.98', CAST(N'2019-02-13T22:40:04.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-13T22:41:56.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (117, 93, CAST(N'2019-02-13T00:00:00.000' AS DateTime), N'03:17', N'22.98', CAST(N'2019-02-13T22:41:08.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-13T22:41:56.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (118, 93, CAST(N'2019-02-13T00:00:00.000' AS DateTime), N'03:17', N'22.98', CAST(N'2019-02-13T22:41:28.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-13T22:41:56.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (119, 93, CAST(N'2019-02-13T00:00:00.000' AS DateTime), N'03:17', N'22.98', CAST(N'2019-02-13T22:41:50.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-02-13T22:41:56.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (120, 93, CAST(N'2019-02-13T00:00:00.000' AS DateTime), N'03:17', N'22.98', CAST(N'2019-02-13T22:42:04.000' AS DateTime), 1, CAST(N'2019-02-15T13:57:18.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (121, 98, CAST(N'2019-02-25T00:00:00.000' AS DateTime), N'00:02', N'0.23', CAST(N'2019-02-25T23:08:09.000' AS DateTime), 1, CAST(N'2019-03-22T08:25:57.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (122, 102, CAST(N'2019-03-20T00:00:00.000' AS DateTime), N'00:01', N'0.12', CAST(N'2019-03-20T10:56:25.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-03-21T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (123, 102, CAST(N'2019-03-20T00:00:00.000' AS DateTime), N'12:27', N'87.15', CAST(N'2019-03-20T22:28:46.000' AS DateTime), 0, CAST(N'2019-05-16T10:03:54.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (124, 103, CAST(N'2019-03-20T00:00:00.000' AS DateTime), N'01:24', N'9.8', CAST(N'2019-03-20T23:51:39.000' AS DateTime), 1, CAST(N'2019-03-22T08:24:37.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (125, 104, CAST(N'2019-03-20T00:00:00.000' AS DateTime), N'01:08', N'7.93', CAST(N'2019-03-20T23:51:46.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-03-21T00:00:00.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (126, 104, CAST(N'2019-03-20T00:00:00.000' AS DateTime), N'01:09', N'8.05', CAST(N'2019-03-20T23:52:25.000' AS DateTime), 0, CAST(N'2019-05-16T09:48:23.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (127, 105, CAST(N'2019-03-20T00:00:00.000' AS DateTime), N'00:02', N'0.23', CAST(N'2019-03-20T23:55:42.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-03-21T13:07:17.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (128, 105, CAST(N'2019-03-20T00:00:00.000' AS DateTime), N'14:46', N'103.37', CAST(N'2019-03-21T13:07:37.000' AS DateTime), 1, CAST(N'2019-03-22T08:17:48.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (129, 106, CAST(N'2019-03-21T00:00:00.000' AS DateTime), N'01:51', N'12.95', CAST(N'2019-03-22T09:40:12.000' AS DateTime), 1, CAST(N'2019-03-22T09:44:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (130, 108, CAST(N'2019-03-25T00:00:00.000' AS DateTime), N'00:08', N'0.93', CAST(N'2019-03-25T11:45:53.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-03-25T12:02:07.000' AS DateTime))
GO
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (131, 108, CAST(N'2019-03-25T00:00:00.000' AS DateTime), N'00:16', N'1.87', CAST(N'2019-03-25T11:51:26.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-03-25T12:02:07.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (132, 110, CAST(N'2019-04-04T00:00:00.000' AS DateTime), N'06:06', N'42.70', CAST(N'2019-04-04T23:49:39.000' AS DateTime), 1, CAST(N'2019-04-05T00:31:07.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (133, 111, CAST(N'2019-04-04T00:00:00.000' AS DateTime), N'01:22', N'9.57', CAST(N'2019-04-04T23:49:57.000' AS DateTime), 0, CAST(N'2019-05-16T10:03:53.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (134, 112, CAST(N'2019-04-04T00:00:00.000' AS DateTime), N'06:17', N'43.98', CAST(N'2019-04-04T23:50:16.000' AS DateTime), 0, CAST(N'2019-05-16T10:03:52.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (135, 113, CAST(N'2019-04-05T00:00:00.000' AS DateTime), N'00:41', N'4.78', CAST(N'2019-04-05T15:38:09.000' AS DateTime), 1, CAST(N'2019-05-16T10:02:58.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (136, 115, CAST(N'2019-04-05T00:00:00.000' AS DateTime), N'15:28', N'108.27', CAST(N'2019-04-05T15:38:11.000' AS DateTime), 1, CAST(N'2019-05-16T09:48:13.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (137, 116, CAST(N'2019-04-05T00:00:00.000' AS DateTime), N'15:28', N'108.27', CAST(N'2019-04-05T15:38:13.000' AS DateTime), 0, CAST(N'2019-05-16T10:04:40.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (138, 116, CAST(N'2019-04-05T00:00:00.000' AS DateTime), N'15:28', N'108.27', CAST(N'2019-04-05T15:38:15.000' AS DateTime), 0, CAST(N'2019-05-16T00:10:09.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (139, 122, CAST(N'2019-05-16T00:00:00.000' AS DateTime), N'00:07', N'0.82', CAST(N'2019-05-16T11:06:25.000' AS DateTime), 1, CAST(N'2019-05-16T11:09:26.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (140, 123, CAST(N'2019-05-16T00:00:00.000' AS DateTime), N'01:19', N'9.22', CAST(N'2019-05-16T11:22:03.000' AS DateTime), 1, CAST(N'2019-05-16T11:27:05.000' AS DateTime), NULL, CAST(N'2019-05-16T11:26:18.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (141, 123, CAST(N'2019-05-16T00:00:00.000' AS DateTime), N'01:19', N'9.22', CAST(N'2019-05-16T11:26:24.000' AS DateTime), 1, CAST(N'2019-05-16T11:31:03.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (142, 124, CAST(N'2019-05-16T00:00:00.000' AS DateTime), N'01:19', N'9.22', CAST(N'2019-05-16T12:00:51.000' AS DateTime), 0, NULL, NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (143, 125, CAST(N'2019-05-16T00:00:00.000' AS DateTime), N'22:08', N'154.93', CAST(N'2019-05-17T09:30:06.000' AS DateTime), 0, NULL, NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (144, 126, CAST(N'2019-05-16T00:00:00.000' AS DateTime), N'22:08', N'154.93', CAST(N'2019-05-17T09:30:11.000' AS DateTime), 0, NULL, NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (145, 139, CAST(N'2019-07-18T00:00:00.000' AS DateTime), N'01:44', N'NaN', CAST(N'2019-07-18T06:04:53.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-07-18T06:11:32.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (146, 139, CAST(N'2019-07-18T00:00:00.000' AS DateTime), N'01:37', N'11.32', CAST(N'2019-07-18T06:26:13.000' AS DateTime), 0, NULL, NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (147, 140, CAST(N'2019-07-18T00:00:00.000' AS DateTime), N'00:10', N'1.17', CAST(N'2019-07-18T06:26:46.000' AS DateTime), 0, NULL, NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (148, 142, CAST(N'2019-07-18T00:00:00.000' AS DateTime), N'00:25', N'2.92', CAST(N'2019-07-18T06:27:05.000' AS DateTime), 0, NULL, NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (149, 135, CAST(N'2019-07-14T00:00:00.000' AS DateTime), N'01:36', N'11.2', CAST(N'2019-07-18T07:15:00.000' AS DateTime), 0, NULL, NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (150, 143, CAST(N'2019-07-18T00:00:00.000' AS DateTime), N'00:20', N'2.33', CAST(N'2019-07-18T07:28:49.000' AS DateTime), 0, NULL, NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (151, 144, CAST(N'2019-07-18T00:00:00.000' AS DateTime), N'00:20', N'2.33', CAST(N'2019-07-18T07:28:51.000' AS DateTime), 0, NULL, NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (152, 145, CAST(N'2019-07-18T00:00:00.000' AS DateTime), N'00:20', N'2.33', CAST(N'2019-07-18T07:28:53.000' AS DateTime), 0, NULL, NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (153, 146, CAST(N'2019-07-18T00:00:00.000' AS DateTime), N'00:20', N'2.33', CAST(N'2019-07-18T07:28:56.000' AS DateTime), 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[InformeEstudiante] OFF
SET IDENTITY_INSERT [dbo].[InformeFinanzas] ON 

INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (3, 4, 32, NULL, NULL, NULL, CAST(N'2019-02-04T01:01:54.000' AS DateTime), CAST(N'2019-02-05T10:26:33.000' AS DateTime), NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (4, 4, 32, NULL, NULL, NULL, CAST(N'2019-02-04T01:10:08.000' AS DateTime), CAST(N'2019-02-05T10:26:33.000' AS DateTime), NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (5, 4, 36, NULL, NULL, NULL, CAST(N'2019-02-04T11:32:07.000' AS DateTime), CAST(N'2019-02-05T06:23:11.000' AS DateTime), NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (6, 4, 36, NULL, NULL, NULL, CAST(N'2019-02-04T11:39:47.000' AS DateTime), CAST(N'2019-02-05T06:23:11.000' AS DateTime), NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (7, 4, 33, NULL, NULL, NULL, CAST(N'2019-02-04T11:40:43.000' AS DateTime), CAST(N'2019-02-05T10:26:39.000' AS DateTime), NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (8, 4, 33, NULL, NULL, NULL, CAST(N'2019-02-04T11:41:34.000' AS DateTime), CAST(N'2019-02-05T10:26:39.000' AS DateTime), NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (9, 4, 33, NULL, NULL, NULL, CAST(N'2019-02-04T11:49:01.000' AS DateTime), CAST(N'2019-02-05T10:26:39.000' AS DateTime), NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (10, 4, 38, NULL, NULL, NULL, CAST(N'2019-02-04T11:49:05.000' AS DateTime), NULL, CAST(N'2019-02-04T23:53:42.000' AS DateTime))
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (11, 4, 41, NULL, NULL, NULL, CAST(N'2019-02-04T11:55:11.000' AS DateTime), CAST(N'2019-02-05T11:21:54.000' AS DateTime), NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (12, 4, 32, NULL, NULL, NULL, CAST(N'2019-02-04T22:48:23.000' AS DateTime), CAST(N'2019-02-05T10:26:33.000' AS DateTime), NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (13, 4, 41, NULL, NULL, NULL, CAST(N'2019-02-04T23:17:04.000' AS DateTime), CAST(N'2019-02-05T11:21:54.000' AS DateTime), NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (14, 4, 34, NULL, NULL, NULL, CAST(N'2019-02-05T06:21:26.000' AS DateTime), CAST(N'2019-02-05T06:23:10.000' AS DateTime), NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (15, 4, 41, NULL, NULL, NULL, CAST(N'2019-02-05T06:25:28.000' AS DateTime), CAST(N'2019-02-05T11:21:54.000' AS DateTime), NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (16, 4, 39, NULL, NULL, NULL, CAST(N'2019-02-05T09:07:42.000' AS DateTime), CAST(N'2019-02-05T09:12:24.000' AS DateTime), NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (17, 4, 35, NULL, NULL, NULL, CAST(N'2019-02-05T09:10:18.000' AS DateTime), CAST(N'2019-02-05T10:26:35.000' AS DateTime), NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (18, 4, 41, NULL, NULL, NULL, CAST(N'2019-02-05T09:12:35.000' AS DateTime), CAST(N'2019-02-05T11:21:54.000' AS DateTime), NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (19, 4, 39, NULL, NULL, NULL, CAST(N'2019-02-05T10:57:01.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (20, 4, 42, NULL, NULL, NULL, CAST(N'2019-02-05T11:16:41.000' AS DateTime), CAST(N'2019-02-05T11:18:29.000' AS DateTime), NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (21, 4, 35, NULL, NULL, NULL, CAST(N'2019-02-05T11:20:36.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (22, 4, 32, NULL, NULL, NULL, CAST(N'2019-02-05T11:20:56.000' AS DateTime), NULL, CAST(N'2019-04-10T17:16:47.000' AS DateTime))
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (23, 4, 42, NULL, NULL, NULL, CAST(N'2019-02-05T11:22:42.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (24, 4, 41, N'00:00', N'0', NULL, CAST(N'2019-02-15T14:10:32.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (25, 4, 49, NULL, NULL, NULL, CAST(N'2019-02-07T17:12:34.000' AS DateTime), NULL, CAST(N'2019-02-08T00:24:13.000' AS DateTime))
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (26, 4, 86, NULL, NULL, NULL, CAST(N'2019-02-07T17:12:37.000' AS DateTime), CAST(N'2019-02-07T18:20:10.000' AS DateTime), NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (27, 4, 90, NULL, NULL, NULL, CAST(N'2019-02-07T18:19:43.000' AS DateTime), CAST(N'2019-02-07T18:19:59.000' AS DateTime), NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (28, 4, 87, NULL, NULL, NULL, CAST(N'2019-02-07T21:55:13.000' AS DateTime), NULL, CAST(N'2019-02-08T00:24:05.000' AS DateTime))
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (29, 4, 89, NULL, NULL, NULL, CAST(N'2019-02-07T23:01:43.000' AS DateTime), NULL, CAST(N'2019-04-10T17:16:03.000' AS DateTime))
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (30, 4, 90, NULL, NULL, NULL, CAST(N'2019-02-07T23:27:34.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (31, 4, 84, NULL, NULL, NULL, CAST(N'2019-02-07T23:40:24.000' AS DateTime), NULL, CAST(N'2019-02-08T00:24:09.000' AS DateTime))
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (32, 4, 83, NULL, NULL, NULL, CAST(N'2019-02-07T23:40:56.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (34, 4, 92, NULL, NULL, NULL, CAST(N'2019-02-08T12:50:16.000' AS DateTime), CAST(N'2019-02-08T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (35, 4, 93, NULL, NULL, NULL, CAST(N'2019-02-08T13:03:24.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (36, 4, 94, NULL, NULL, NULL, CAST(N'2019-02-08T14:53:05.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (37, 4, 86, NULL, NULL, NULL, CAST(N'2019-02-08T14:54:14.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (38, 4, 88, NULL, NULL, NULL, CAST(N'2019-02-10T23:23:36.000' AS DateTime), NULL, CAST(N'2019-03-22T08:15:59.000' AS DateTime))
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (39, 4, 36, NULL, NULL, NULL, CAST(N'2019-02-11T00:14:20.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (40, 4, 31, NULL, NULL, NULL, CAST(N'2019-02-11T08:51:57.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (41, 4, 34, N'02:32', N'16', N'no se incremento nada', CAST(N'2019-02-15T14:09:53.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (42, 4, 39, NULL, NULL, NULL, CAST(N'2019-02-11T08:59:04.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (43, 4, 37, NULL, NULL, NULL, CAST(N'2019-02-11T09:01:17.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (44, 4, 44, NULL, NULL, NULL, CAST(N'2019-02-11T09:02:09.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (45, 4, 96, N'07:37', N'53.32', NULL, CAST(N'2019-02-13T12:16:21.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (46, 4, 47, N'01:05', N'7.58', NULL, CAST(N'2019-02-13T12:21:12.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (47, 4, 46, N'00:03', N'0.35', N'prueba1', CAST(N'2019-02-13T12:24:18.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (48, 4, 51, N'09:55', N'69.42', NULL, CAST(N'2019-02-13T12:29:34.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (49, 4, 97, N'00:00', N'0', NULL, CAST(N'2019-02-17T00:56:22.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (50, 4, 83, N'22:30', N'157.5', N'se incrementó 00:11 min', CAST(N'2019-02-13T23:56:11.000' AS DateTime), CAST(N'2019-02-14T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (51, 4, 83, N'22:40', N'158.67', N'SE INCREMENTO 00:21 MIN', CAST(N'2019-02-14T00:10:15.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (52, 4, 108, N'01:28', N'10.27', NULL, CAST(N'2019-02-14T11:18:35.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (53, 4, 120, N'03:17', N'22.98', NULL, CAST(N'2019-02-14T11:18:48.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (54, 4, 128, N'14:46', N'103.37', N'null', CAST(N'2019-03-22T08:10:58.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (55, 4, 124, N'01:24', N'9.8', N'null', CAST(N'2019-03-22T08:24:06.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (56, 4, 121, N'00:02', N'0.23', N'null', CAST(N'2019-03-22T08:25:58.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (57, 4, 129, N'01:51', N'12.95', N'null', CAST(N'2019-03-22T09:44:01.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (58, 4, 132, N'06:06', N'42.70', N'null', CAST(N'2019-04-05T00:31:08.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (59, 4, 138, N'15:28', N'108.27', N'null', CAST(N'2019-05-16T00:10:09.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (60, 4, 137, N'15:28', N'108.27', N'null', CAST(N'2019-05-16T00:10:29.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (61, 4, 136, N'15:28', N'108.27', N'null', CAST(N'2019-05-16T09:48:14.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (62, 4, 126, N'01:09', N'8.05', N'null', CAST(N'2019-05-16T09:48:24.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (63, 4, 135, N'00:21', N'2.45', N'null', CAST(N'2019-05-16T10:02:59.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (64, 4, 134, N'06:17', N'43.98', N'null', CAST(N'2019-05-16T10:03:52.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (65, 4, 133, N'01:22', N'9.57', N'null', CAST(N'2019-05-16T10:03:53.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (66, 4, 123, N'12:27', N'87.15', N'null', CAST(N'2019-05-16T10:03:54.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (67, 4, 139, N'undefined', N'undefined', N'null', CAST(N'2019-05-16T11:09:27.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (68, 4, 140, N'01:00', N'7', N'null', CAST(N'2019-05-16T11:27:05.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (69, 4, 141, N'01:00', N'7', N'restado 19minutos', CAST(N'2019-05-16T11:31:03.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[InformeFinanzas] OFF
SET IDENTITY_INSERT [dbo].[Organizacion] ON 

INSERT [dbo].[Organizacion] ([idOrganizacion], [idDepartamento], [idPersona], [fechaRegistro], [estado], [edit], [delet]) VALUES (1, 1, 6, CAST(N'2019-01-10T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Organizacion] ([idOrganizacion], [idDepartamento], [idPersona], [fechaRegistro], [estado], [edit], [delet]) VALUES (2, 2, 7, CAST(N'2019-01-10T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Organizacion] ([idOrganizacion], [idDepartamento], [idPersona], [fechaRegistro], [estado], [edit], [delet]) VALUES (3, 3, 8, CAST(N'2019-01-10T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Organizacion] ([idOrganizacion], [idDepartamento], [idPersona], [fechaRegistro], [estado], [edit], [delet]) VALUES (4, 4, 10, CAST(N'2019-01-10T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Organizacion] ([idOrganizacion], [idDepartamento], [idPersona], [fechaRegistro], [estado], [edit], [delet]) VALUES (5, 5, 9, CAST(N'2019-01-10T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Organizacion] ([idOrganizacion], [idDepartamento], [idPersona], [fechaRegistro], [estado], [edit], [delet]) VALUES (6, 6, 11, CAST(N'2019-01-10T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Organizacion] ([idOrganizacion], [idDepartamento], [idPersona], [fechaRegistro], [estado], [edit], [delet]) VALUES (8, 21, 10, CAST(N'2019-01-17T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Organizacion] ([idOrganizacion], [idDepartamento], [idPersona], [fechaRegistro], [estado], [edit], [delet]) VALUES (9, 24, 10, CAST(N'2019-01-17T00:00:00.000' AS DateTime), 0, NULL, CAST(N'2019-02-12T00:00:00.000' AS DateTime))
INSERT [dbo].[Organizacion] ([idOrganizacion], [idDepartamento], [idPersona], [fechaRegistro], [estado], [edit], [delet]) VALUES (10, 25, 10, CAST(N'2019-01-21T00:00:00.000' AS DateTime), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Organizacion] OFF
SET IDENTITY_INSERT [dbo].[Persona] ON 

INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (1, 25, 650000121, N'Jhonny', N'San', N'Gutierrez', N'Villca', N'79861222', 9, N'Bolivia', N'Calle 1 #3446', 7894563, CAST(N'1994-11-09' AS Date), 1, NULL, CAST(N'2019-03-28T12:00:17.000' AS DateTime), NULL)
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (2, 27, 650000122, N'Luis', N'Fernando', N'Gutierrez', N'Estrada', N'96396333', 4, N'Chile', N'Calle 1 #3446', 7652233, CAST(N'1997-11-09' AS Date), 1, NULL, NULL, NULL)
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (3, 20, 650000123, N'Josue', NULL, N'Gutierrez', N'Villca', N'12012011', 6, N'Bolivia', N'Calle 1 #3446', 7894563, CAST(N'1994-11-09' AS Date), 1, NULL, NULL, NULL)
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (4, 21, NULL, N'Miguel', N'Angel', N'Gutierrez', N'Villca', N'54564464', 1, N'Bolivia', N'Calle 1 #3446', 7894563, CAST(N'1994-11-09' AS Date), 1, NULL, NULL, NULL)
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (5, 21, NULL, N'Ruth', N'Nayeli', N'Gutierrez', N'Villca', N'231654674', 1, N'Bolivia', N'Calle 1 #3446', 7894563, CAST(N'1994-11-09' AS Date), 1, NULL, NULL, NULL)
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (6, NULL, NULL, N'Leila', NULL, N'Palma', N'Suares', N'644654654', NULL, N'Bolivia', N'Calle 1 #3446', 7894563, CAST(N'1994-11-09' AS Date), 1, NULL, NULL, NULL)
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (7, NULL, NULL, N'Jhazmin', NULL, N'Oshinaga', N'Velazques', N'65465423', NULL, N'Bolivia', N'Calle 1 #3446', 7894563, CAST(N'1994-11-09' AS Date), 1, NULL, NULL, NULL)
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (8, NULL, NULL, N'Juan', N'Carlos', N'Quispe', N'Calle', N'12231021', NULL, N'Bolivia', N'Calle 1 #3446', 7894563, CAST(N'1994-11-09' AS Date), 1, NULL, NULL, NULL)
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (9, NULL, NULL, N'Carla', NULL, N'Martines', N'Velazques', N'516465132', NULL, N'Bolivia', N'Calle 1 #3446', 7894563, CAST(N'1994-11-09' AS Date), 1, NULL, NULL, NULL)
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (10, NULL, NULL, N'Carmen', NULL, N'Perez', N'Ramirez', N'516465132', NULL, N'Bolivia', N'Calle 1 #3446', 7894563, CAST(N'1994-11-09' AS Date), 1, NULL, NULL, NULL)
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (11, NULL, NULL, N'Avelino', N'Sans', N'Gutierrez', N'Estrada', N'564132132', NULL, N'Bolivia', N'Calle 1 #3446', 7894563, CAST(N'1994-11-09' AS Date), 1, NULL, NULL, NULL)
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (12, 28, NULL, N'Metthe', N'Marcos', N'Gutierrez', N'Villca', N'789456', 3, N'Bolivia', N'calle', 64578911, CAST(N'1995-06-15' AS Date), 1, NULL, NULL, NULL)
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (15, 28, NULL, N'Vinicius', N'Javier', N'JR', N'Villca', N'9454598', 3, N'Bolivia', N'calle', 132456, CAST(N'2018-07-18' AS Date), 1, NULL, NULL, CAST(N'2019-01-27T20:40:59.000' AS DateTime))
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (22, 25, NULL, N'Neymar', N'Junior', N'Do', N'Santos', N'79861222', 9, N'Bolivia', N'Calle 1 #3446', 7894563, CAST(N'1994-11-09' AS Date), 1, CAST(N'2019-01-27T16:27:55.000' AS DateTime), CAST(N'2019-01-27T18:10:25.000' AS DateTime), CAST(N'2019-01-27T18:12:03.000' AS DateTime))
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (27, NULL, NULL, N'Sergio', NULL, N'Ramos', N'Fernandez', N'79861222', NULL, N'Bolivia', N'Calle 1 #3446', 7894563, CAST(N'1994-11-09' AS Date), 1, CAST(N'2019-01-27T19:11:32.000' AS DateTime), CAST(N'2019-01-27T19:23:54.000' AS DateTime), CAST(N'2019-05-20T09:21:46.000' AS DateTime))
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (28, NULL, NULL, N'Joseft', NULL, N'Pedrenol', NULL, N'789456', NULL, N'Bolivia', N'calle 1', 75612365, CAST(N'1995-06-15' AS Date), 1, CAST(N'2019-01-27T20:44:50.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (29, 25, 650000124, N'Sergio', NULL, N'Perez', NULL, N'789456', 9, N'Bolivia', N'calle', 64578911, CAST(N'1995-06-15' AS Date), 1, CAST(N'2019-02-01T11:26:50.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (30, 28, 650000125, N'Maria', NULL, N'Hurtado', NULL, N'789456', 9, N'Bolivia', N'calle', 73453455, CAST(N'1995-06-15' AS Date), 1, CAST(N'2019-02-08T14:21:28.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (31, 18, 650000126, N'Carlos', NULL, N'Lampe', NULL, N'789456-1f', 5, N'Bolivia', N'calle 1', 73453455, CAST(N'1995-06-15' AS Date), 1, CAST(N'2019-02-08T15:22:58.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (50, 24, 650000127, N'Griesman', NULL, N'Laute', NULL, N'894321', 3, N'Chileno', N'calle 1', 7132132, CAST(N'2000-02-24' AS Date), 1, CAST(N'2019-03-25T02:39:39.000' AS DateTime), NULL, CAST(N'2019-03-25T02:45:08.000' AS DateTime))
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (51, 28, 650000128, N'Griesman', N'Sans', N'Laute', NULL, N'8465413', 5, N'Chileno', N'calle 2', 76131311, CAST(N'1995-12-31' AS Date), 1, CAST(N'2019-03-25T02:46:42.000' AS DateTime), CAST(N'2019-03-26T00:51:31.000' AS DateTime), NULL)
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (53, NULL, 650000130, N'Edinson', NULL, N'Cavani', NULL, N'598751', NULL, N'Uruguay', N'Vinto', 68513213, CAST(N'1989-02-14' AS Date), 1, CAST(N'2019-04-17T18:30:44.000' AS DateTime), CAST(N'2019-04-24T17:08:27.000' AS DateTime), CAST(N'2019-05-20T09:22:32.000' AS DateTime))
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (54, 21, 650000129, N'Karin', N'San', N'Benzema', NULL, N'132541-a', 3, N'Francia', N'Vinto', 3516131, CAST(N'1987-12-19' AS Date), 1, CAST(N'2019-04-17T18:47:10.000' AS DateTime), CAST(N'2019-04-24T14:25:11.000' AS DateTime), CAST(N'2019-05-20T09:21:56.000' AS DateTime))
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (55, 650000129, 650000129, N'Marco', N'Asencio', N'Willemsen', NULL, N'63465461', 3, N'España', N'Quillacollo, calle 15 #234', 60609874, CAST(N'1996-01-21' AS Date), 1, CAST(N'2019-04-22T17:04:56.000' AS DateTime), NULL, CAST(N'2019-04-24T11:20:32.000' AS DateTime))
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (60, NULL, 650000131, N'Leonardo', NULL, N'Vidas', N'Sanchez', N'62146541', 2, N'Bolivia', N'Calle 1', 132461, CAST(N'1990-02-15' AS Date), 1, CAST(N'2019-05-20T09:11:08.000' AS DateTime), CAST(N'2019-05-20T09:19:33.000' AS DateTime), CAST(N'2019-05-20T09:20:09.000' AS DateTime))
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (61, NULL, 650000129, N'Edinson', NULL, N'Cavani', NULL, N'654321326', 3, N'Bolivia', N'Calle 3', 678, CAST(N'1990-02-15' AS Date), 1, CAST(N'2019-05-20T09:24:35.000' AS DateTime), NULL, CAST(N'2019-05-20T09:26:04.000' AS DateTime))
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (62, NULL, 650000129, N'Edinson', NULL, N'Cavani', NULL, N'324611345', 3, N'Bolivia', N'Calle 3', 60752136, CAST(N'1990-02-15' AS Date), 1, CAST(N'2019-05-20T09:27:25.000' AS DateTime), NULL, CAST(N'2019-05-20T09:28:34.000' AS DateTime))
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (1063, 650000129, 650000129, N'Edinson', NULL, N'Cavani', NULL, N'8282702', 3, N'Bolivia', N'Calle 1', 3132161, CAST(N'2019-01-15' AS Date), 1, CAST(N'2019-05-21T22:05:41.000' AS DateTime), NULL, CAST(N'2019-05-21T22:40:15.000' AS DateTime))
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (1064, NULL, NULL, N'Edinson', NULL, N'Cavani', N'', N'2134651', 3, N'Bolivia', N'Calle 1', 60746451, CAST(N'1994-02-15' AS Date), 1, CAST(N'2019-05-21T22:42:20.000' AS DateTime), NULL, CAST(N'2019-05-21T22:43:05.000' AS DateTime))
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (1065, NULL, NULL, N'Edinson', NULL, N'Cavani', NULL, N'81541111', 3, N'Bolivia', N'Calle 3', 60546541, CAST(N'1999-06-15' AS Date), 1, CAST(N'2019-05-21T22:43:58.000' AS DateTime), NULL, CAST(N'2019-05-21T22:44:18.000' AS DateTime))
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (1066, NULL, 650000129, N'Edinson', NULL, N'Cavani', NULL, N'56464130', 3, N'Bolivia', N'Calle 11', 61646465, CAST(N'1996-05-06' AS Date), 1, CAST(N'2019-05-21T22:51:59.000' AS DateTime), CAST(N'2019-05-21T22:52:30.000' AS DateTime), CAST(N'2019-05-21T23:04:35.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Persona] OFF
SET IDENTITY_INSERT [dbo].[RegistroHora] ON 

INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (5, 1, CAST(N'2019-01-22T07:00:10.000' AS DateTime), NULL, NULL, 0, 0, NULL, CAST(N'2019-01-30T03:51:52.000' AS DateTime))
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (6, 2, CAST(N'2019-01-22T07:05:10.000' AS DateTime), NULL, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (7, 3, CAST(N'2019-01-22T07:10:10.000' AS DateTime), NULL, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (8, 4, CAST(N'2019-01-22T07:15:10.000' AS DateTime), NULL, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (12, 1, CAST(N'2019-01-23T07:00:30.000' AS DateTime), CAST(N'2019-01-23T11:30:00.000' AS DateTime), NULL, 0, 0, CAST(N'2019-02-05T17:35:41.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (13, 2, CAST(N'2019-01-23T07:10:30.000' AS DateTime), CAST(N'2019-01-23T11:15:00.000' AS DateTime), N'prueba de observación Luis', 0, 1, CAST(N'2019-02-07T17:45:55.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (14, 3, CAST(N'2019-01-23T08:10:00.000' AS DateTime), CAST(N'2019-01-23T12:00:00.000' AS DateTime), NULL, 0, 0, CAST(N'2019-02-05T17:36:36.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (15, 4, CAST(N'2019-01-23T08:15:00.000' AS DateTime), CAST(N'2019-01-23T11:15:00.000' AS DateTime), NULL, 0, 0, CAST(N'2019-02-05T17:36:35.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (30, 2, CAST(N'2019-01-24T12:59:53.000' AS DateTime), CAST(N'2019-01-24T16:42:25.000' AS DateTime), N'horas extras2', 1, 1, CAST(N'2019-02-07T17:27:14.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (33, 4, CAST(N'2019-01-24T17:29:31.000' AS DateTime), CAST(N'2019-01-24T17:29:44.000' AS DateTime), NULL, 0, 0, CAST(N'2019-02-01T02:39:42.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (35, 8, CAST(N'2019-01-24T22:27:37.000' AS DateTime), CAST(N'2019-01-24T22:30:02.000' AS DateTime), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (36, 2, CAST(N'2019-01-25T08:07:06.000' AS DateTime), CAST(N'2019-01-25T09:16:37.000' AS DateTime), NULL, 0, 1, CAST(N'2019-02-05T17:36:24.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (38, 4, CAST(N'2019-01-25T09:15:24.000' AS DateTime), CAST(N'2019-01-25T12:20:24.000' AS DateTime), NULL, 0, 0, CAST(N'2019-02-05T17:36:26.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (39, 8, CAST(N'2019-01-25T09:58:58.000' AS DateTime), CAST(N'2019-01-25T10:08:05.000' AS DateTime), NULL, 0, 0, CAST(N'2019-02-05T17:36:27.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (40, 15, CAST(N'2019-01-28T16:51:10.000' AS DateTime), NULL, NULL, 0, 0, NULL, CAST(N'2019-01-29T18:34:43.000' AS DateTime))
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (41, 4, CAST(N'2019-01-28T16:51:34.000' AS DateTime), CAST(N'2019-01-28T16:52:10.000' AS DateTime), NULL, 0, 0, CAST(N'2019-02-05T17:36:27.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (42, 15, CAST(N'2019-01-29T00:09:02.000' AS DateTime), CAST(N'2019-01-29T10:03:50.000' AS DateTime), NULL, 1, 0, CAST(N'2019-01-29T16:22:00.000' AS DateTime), CAST(N'2019-01-29T16:34:04.000' AS DateTime))
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (43, 4, CAST(N'2019-01-29T00:12:27.000' AS DateTime), NULL, NULL, 0, 0, NULL, CAST(N'2019-01-29T00:52:09.000' AS DateTime))
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (44, 4, CAST(N'2019-01-29T00:53:09.000' AS DateTime), CAST(N'2019-01-29T16:27:31.000' AS DateTime), NULL, 0, 0, CAST(N'2019-02-05T17:36:29.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (45, 2, CAST(N'2019-01-29T16:31:30.000' AS DateTime), CAST(N'2019-01-29T17:10:38.000' AS DateTime), NULL, 0, 1, CAST(N'2019-02-05T17:36:29.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (46, 3, CAST(N'2019-01-29T16:32:31.000' AS DateTime), CAST(N'2019-01-29T17:34:15.000' AS DateTime), NULL, 0, 0, CAST(N'2019-02-05T17:36:30.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (47, 15, CAST(N'2019-01-29T16:54:55.000' AS DateTime), NULL, NULL, 0, 0, NULL, CAST(N'2019-01-29T16:57:53.000' AS DateTime))
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (48, 15, CAST(N'2019-01-29T16:58:28.000' AS DateTime), NULL, NULL, 0, 0, NULL, CAST(N'2019-01-29T17:00:27.000' AS DateTime))
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (49, 15, CAST(N'2019-01-29T17:01:25.000' AS DateTime), NULL, NULL, 0, 0, NULL, CAST(N'2019-01-29T17:03:01.000' AS DateTime))
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (50, 15, CAST(N'2019-01-29T17:03:42.000' AS DateTime), NULL, NULL, 0, 0, NULL, CAST(N'2019-01-29T17:04:04.000' AS DateTime))
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (51, 15, CAST(N'2019-01-29T17:04:23.000' AS DateTime), NULL, NULL, 0, 0, NULL, CAST(N'2019-01-29T17:05:10.000' AS DateTime))
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (52, 15, CAST(N'2019-01-29T17:07:56.000' AS DateTime), NULL, NULL, 0, 0, NULL, CAST(N'2019-01-29T17:09:58.000' AS DateTime))
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (53, 15, CAST(N'2019-01-29T17:10:16.000' AS DateTime), NULL, NULL, 0, 0, NULL, CAST(N'2019-01-29T17:34:04.000' AS DateTime))
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (54, 15, CAST(N'2019-01-29T18:02:49.000' AS DateTime), NULL, NULL, 0, 0, NULL, CAST(N'2019-01-29T18:37:32.000' AS DateTime))
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (55, 15, CAST(N'2019-01-29T18:37:44.000' AS DateTime), NULL, NULL, 0, 0, NULL, CAST(N'2019-01-30T03:13:43.000' AS DateTime))
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (56, 1, CAST(N'2019-01-30T03:08:00.000' AS DateTime), NULL, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (57, 3, CAST(N'2019-01-30T03:08:07.000' AS DateTime), NULL, N'registro basura', 0, 0, NULL, CAST(N'2019-02-13T14:21:44.000' AS DateTime))
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (58, 15, CAST(N'2019-01-30T03:08:11.000' AS DateTime), NULL, NULL, 0, 0, NULL, CAST(N'2019-02-01T04:46:04.000' AS DateTime))
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (59, 1, CAST(N'2019-02-01T02:11:33.000' AS DateTime), CAST(N'2019-02-01T11:29:14.000' AS DateTime), N'Error de registro', 0, 1, CAST(N'2019-02-05T17:42:53.000' AS DateTime), CAST(N'2019-02-07T16:54:32.000' AS DateTime))
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (60, 3, CAST(N'2019-02-01T02:30:30.000' AS DateTime), CAST(N'2019-02-01T17:09:15.000' AS DateTime), NULL, 0, 0, CAST(N'2019-02-05T17:42:53.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (61, 2, CAST(N'2019-02-01T02:30:36.000' AS DateTime), CAST(N'2019-02-01T17:09:24.000' AS DateTime), NULL, 0, 1, CAST(N'2019-02-05T17:42:53.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (62, 15, CAST(N'2019-02-01T02:30:42.000' AS DateTime), CAST(N'2019-02-01T17:09:32.000' AS DateTime), NULL, 0, 0, CAST(N'2019-02-05T17:42:52.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (63, 16, CAST(N'2019-02-01T11:29:04.000' AS DateTime), CAST(N'2019-02-01T17:09:41.000' AS DateTime), NULL, 0, 0, CAST(N'2019-02-05T17:42:51.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (64, 1, CAST(N'2019-02-03T21:26:37.000' AS DateTime), NULL, N'registro basura', 0, 0, NULL, CAST(N'2019-02-13T14:21:50.000' AS DateTime))
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (65, 16, CAST(N'2019-02-03T21:26:49.000' AS DateTime), NULL, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (66, 4, CAST(N'2019-02-03T21:26:56.000' AS DateTime), NULL, N'registro basura', 0, 0, NULL, CAST(N'2019-02-13T14:21:35.000' AS DateTime))
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (67, 1, CAST(N'2019-02-04T01:35:15.000' AS DateTime), CAST(N'2019-02-04T04:07:55.000' AS DateTime), NULL, 0, 1, CAST(N'2019-02-05T17:27:48.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (68, 16, CAST(N'2019-02-04T01:35:19.000' AS DateTime), CAST(N'2019-02-04T11:30:12.000' AS DateTime), NULL, 1, 1, CAST(N'2019-02-07T16:50:59.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (69, 15, CAST(N'2019-02-04T01:35:21.000' AS DateTime), CAST(N'2019-02-04T11:30:17.000' AS DateTime), NULL, 1, 0, CAST(N'2019-02-05T17:28:48.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (70, 3, CAST(N'2019-02-04T01:35:24.000' AS DateTime), CAST(N'2019-02-04T22:42:19.000' AS DateTime), NULL, 1, 0, CAST(N'2019-02-05T17:27:54.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (71, 1, CAST(N'2019-02-05T09:56:39.000' AS DateTime), CAST(N'2019-02-05T11:01:43.000' AS DateTime), N'OBS1', 0, 1, CAST(N'2019-02-06T23:49:29.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (72, 3, CAST(N'2019-02-05T09:56:47.000' AS DateTime), CAST(N'2019-02-05T17:21:32.000' AS DateTime), NULL, 1, 0, CAST(N'2019-02-05T17:22:25.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (73, 15, CAST(N'2019-02-05T09:56:50.000' AS DateTime), CAST(N'2019-02-05T17:21:36.000' AS DateTime), NULL, 1, 1, CAST(N'2019-02-05T17:21:45.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (74, 16, CAST(N'2019-02-05T10:58:33.000' AS DateTime), CAST(N'2019-02-05T11:01:31.000' AS DateTime), NULL, 1, 1, CAST(N'2019-02-05T17:22:28.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (75, 4, CAST(N'2019-02-05T17:52:10.000' AS DateTime), CAST(N'2019-02-05T17:53:59.000' AS DateTime), NULL, 1, 0, CAST(N'2019-02-05T17:54:13.000' AS DateTime), CAST(N'2019-02-05T17:56:01.000' AS DateTime))
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (76, 4, CAST(N'2019-02-05T18:02:32.000' AS DateTime), CAST(N'2019-02-05T18:19:44.000' AS DateTime), N'null', 1, 0, CAST(N'2019-02-05T23:48:25.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (77, 1, CAST(N'2019-02-06T10:23:41.000' AS DateTime), CAST(N'2019-02-06T10:26:07.000' AS DateTime), N'pruebaDelet', 0, 0, CAST(N'2019-02-06T12:41:41.000' AS DateTime), CAST(N'2019-02-06T12:59:42.000' AS DateTime))
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (78, 16, CAST(N'2019-02-06T10:23:48.000' AS DateTime), CAST(N'2019-02-06T13:16:52.000' AS DateTime), N'Horas extras', 1, 0, CAST(N'2019-02-07T16:47:50.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (79, 2, CAST(N'2019-02-06T10:24:00.000' AS DateTime), CAST(N'2019-02-06T10:53:57.000' AS DateTime), N'pruebaapro', 1, 0, CAST(N'2019-02-06T13:01:55.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (80, 1, CAST(N'2019-02-06T13:18:57.000' AS DateTime), NULL, NULL, 0, 0, NULL, CAST(N'2019-02-06T13:19:47.000' AS DateTime))
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (81, 1, CAST(N'2019-02-06T13:20:24.000' AS DateTime), CAST(N'2019-02-07T11:39:24.000' AS DateTime), N'entrada 06/02/2019
salida 07/02/2019', 1, 1, CAST(N'2019-02-07T14:32:17.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (82, 1, CAST(N'2019-02-07T11:25:14.000' AS DateTime), CAST(N'2019-02-07T11:26:37.000' AS DateTime), NULL, 1, 1, CAST(N'2019-02-07T18:19:29.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (83, 3, CAST(N'2019-02-07T11:25:41.000' AS DateTime), CAST(N'2019-02-07T11:30:01.000' AS DateTime), N'Horas de extras por limpiar las barandas', 1, 0, CAST(N'2019-02-07T17:22:43.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (84, 15, CAST(N'2019-02-07T17:06:43.000' AS DateTime), NULL, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (85, 1, CAST(N'2019-02-08T00:38:10.000' AS DateTime), CAST(N'2019-02-08T11:43:34.000' AS DateTime), NULL, 1, 1, CAST(N'2019-02-08T13:02:58.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (86, 15, CAST(N'2019-02-08T00:39:23.000' AS DateTime), CAST(N'2019-02-08T14:03:19.000' AS DateTime), N'horarios nocturnos', 0, 0, NULL, NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (87, 3, CAST(N'2019-02-08T11:42:30.000' AS DateTime), NULL, N'horas adelantadas', 0, 0, NULL, NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (88, 17, CAST(N'2019-02-08T14:45:54.000' AS DateTime), CAST(N'2019-02-08T14:48:05.000' AS DateTime), NULL, 1, 1, CAST(N'2019-02-08T14:52:15.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (89, 3, CAST(N'2019-02-10T19:25:33.000' AS DateTime), CAST(N'2019-02-10T23:14:59.000' AS DateTime), NULL, 1, 1, CAST(N'2019-02-11T00:20:53.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (90, 17, CAST(N'2019-02-10T19:25:52.000' AS DateTime), NULL, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (91, 15, CAST(N'2019-02-12T18:48:38.000' AS DateTime), CAST(N'2019-02-13T01:11:54.000' AS DateTime), NULL, 1, 1, CAST(N'2019-02-13T01:17:36.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (92, 1, CAST(N'2019-02-13T01:16:58.000' AS DateTime), CAST(N'2019-02-13T12:43:14.000' AS DateTime), NULL, 1, 1, CAST(N'2019-02-13T14:06:10.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (93, 15, CAST(N'2019-02-13T12:42:13.000' AS DateTime), CAST(N'2019-02-13T15:25:41.000' AS DateTime), N'observacion3 / observacion2 / observacion1', 1, 1, CAST(N'2019-02-13T22:42:03.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (94, 3, CAST(N'2019-02-13T14:04:47.000' AS DateTime), CAST(N'2019-02-13T15:32:10.000' AS DateTime), NULL, 1, 1, CAST(N'2019-02-13T16:11:43.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (95, 18, CAST(N'2019-02-13T15:03:19.000' AS DateTime), NULL, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (96, 1, CAST(N'2019-02-14T11:12:19.000' AS DateTime), NULL, N'horas extras', 0, 0, NULL, NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (97, 2, CAST(N'2019-02-14T11:12:40.000' AS DateTime), NULL, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (98, 1, CAST(N'2019-02-25T23:05:28.000' AS DateTime), CAST(N'2019-02-25T23:07:27.000' AS DateTime), N'prueba1 / asd', 1, 1, CAST(N'2019-02-25T23:08:08.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (99, 2, CAST(N'2019-02-25T23:07:34.000' AS DateTime), NULL, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (100, 3, CAST(N'2019-02-25T23:07:41.000' AS DateTime), NULL, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (101, 18, CAST(N'2019-02-25T23:07:50.000' AS DateTime), NULL, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (102, 18, CAST(N'2019-03-20T10:55:15.000' AS DateTime), CAST(N'2019-03-20T22:28:33.000' AS DateTime), NULL, 1, 0, CAST(N'2019-03-20T22:28:45.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (103, 3, CAST(N'2019-03-20T22:27:50.000' AS DateTime), CAST(N'2019-03-20T23:51:05.000' AS DateTime), N'salida temprana / horas extras', 1, 1, CAST(N'2019-03-20T23:51:38.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (104, 15, CAST(N'2019-03-20T22:43:48.000' AS DateTime), CAST(N'2019-03-20T23:52:08.000' AS DateTime), N'asd / asd / asd', 1, 0, CAST(N'2019-03-20T23:52:24.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (105, 2, CAST(N'2019-03-20T23:53:50.000' AS DateTime), CAST(N'2019-03-21T13:07:17.000' AS DateTime), NULL, 1, 1, CAST(N'2019-03-21T13:07:36.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (106, 1, CAST(N'2019-03-21T12:56:32.000' AS DateTime), CAST(N'2019-03-21T13:05:01.000' AS DateTime), NULL, 1, 1, CAST(N'2019-03-22T09:40:11.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (107, 1, CAST(N'2019-03-22T09:28:49.000' AS DateTime), NULL, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (108, 1, CAST(N'2019-03-25T11:35:11.000' AS DateTime), CAST(N'2019-03-25T12:02:07.000' AS DateTime), N'llego tarde', 0, 0, CAST(N'2019-03-25T11:51:25.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (109, 3, CAST(N'2019-03-25T11:47:29.000' AS DateTime), NULL, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (110, 1, CAST(N'2019-04-04T17:31:53.000' AS DateTime), CAST(N'2019-04-04T23:37:21.000' AS DateTime), N'con horas extras', 1, 1, CAST(N'2019-04-04T23:49:38.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (111, 2, CAST(N'2019-04-04T17:31:57.000' AS DateTime), CAST(N'2019-04-04T18:09:31.000' AS DateTime), N'horas correspondientes', 1, 0, CAST(N'2019-04-04T23:49:56.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (112, 3, CAST(N'2019-04-04T17:32:01.000' AS DateTime), CAST(N'2019-04-04T23:49:59.000' AS DateTime), N'dos turnos', 1, 0, CAST(N'2019-04-04T23:50:15.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (113, 1, CAST(N'2019-04-05T00:09:21.000' AS DateTime), CAST(N'2019-04-05T00:50:55.000' AS DateTime), NULL, 1, 1, CAST(N'2019-04-05T15:38:09.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (114, 2, CAST(N'2019-04-05T00:09:27.000' AS DateTime), CAST(N'2019-04-05T00:51:46.000' AS DateTime), NULL, 1, 0, CAST(N'2019-04-05T15:38:10.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (115, 18, CAST(N'2019-04-05T00:09:31.000' AS DateTime), CAST(N'2019-04-05T15:37:16.000' AS DateTime), NULL, 1, 1, CAST(N'2019-04-05T15:38:12.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (116, 16, CAST(N'2019-04-05T00:09:34.000' AS DateTime), CAST(N'2019-04-05T15:37:26.000' AS DateTime), NULL, 1, 1, CAST(N'2019-04-05T15:38:14.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (117, 1, CAST(N'2019-04-10T16:42:13.000' AS DateTime), NULL, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (118, 2, CAST(N'2019-04-10T16:42:17.000' AS DateTime), NULL, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (119, 3, CAST(N'2019-04-10T16:42:20.000' AS DateTime), NULL, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (120, 16, CAST(N'2019-04-10T16:42:26.000' AS DateTime), NULL, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (121, 18, CAST(N'2019-04-10T16:42:29.000' AS DateTime), NULL, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (122, 18, CAST(N'2019-05-16T10:40:43.000' AS DateTime), CAST(N'2019-05-16T10:47:44.000' AS DateTime), NULL, 1, 1, CAST(N'2019-05-16T11:06:24.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (123, 1, CAST(N'2019-05-16T10:40:47.000' AS DateTime), CAST(N'2019-05-16T11:21:48.000' AS DateTime), NULL, 1, 1, CAST(N'2019-05-16T11:26:22.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (124, 2, CAST(N'2019-05-16T10:40:49.000' AS DateTime), CAST(N'2019-05-16T11:59:36.000' AS DateTime), NULL, 1, 0, CAST(N'2019-05-16T12:00:50.000' AS DateTime), NULL)
GO
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (125, 3, CAST(N'2019-05-16T11:21:39.000' AS DateTime), CAST(N'2019-05-17T09:29:54.000' AS DateTime), NULL, 1, 0, CAST(N'2019-05-17T09:30:06.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (126, 4, CAST(N'2019-05-16T11:21:41.000' AS DateTime), CAST(N'2019-05-17T09:29:57.000' AS DateTime), NULL, 1, 0, CAST(N'2019-05-17T09:30:11.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (127, 17, CAST(N'2019-05-16T11:21:45.000' AS DateTime), NULL, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (128, 18, CAST(N'2019-05-16T12:00:12.000' AS DateTime), NULL, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (129, 1, CAST(N'2019-05-17T09:14:21.000' AS DateTime), NULL, NULL, 0, 0, NULL, CAST(N'2019-05-17T09:52:47.000' AS DateTime))
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (130, 2, CAST(N'2019-05-17T09:14:27.000' AS DateTime), CAST(N'2019-05-17T09:55:33.000' AS DateTime), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (131, 3, CAST(N'2019-05-17T09:14:29.000' AS DateTime), CAST(N'2019-05-17T09:57:39.000' AS DateTime), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (132, 17, CAST(N'2019-05-17T09:14:31.000' AS DateTime), CAST(N'2019-05-17T09:57:41.000' AS DateTime), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (133, 18, CAST(N'2019-05-17T09:14:34.000' AS DateTime), CAST(N'2019-05-17T09:57:42.000' AS DateTime), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (134, 1, CAST(N'2019-05-17T09:52:58.000' AS DateTime), CAST(N'2019-05-17T09:53:07.000' AS DateTime), NULL, 0, 0, NULL, NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (135, 1, CAST(N'2019-07-14T21:40:03.000' AS DateTime), CAST(N'2019-07-14T22:04:48.000' AS DateTime), NULL, 1, 0, CAST(N'2019-07-18T07:14:59.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (136, 2, CAST(N'2019-07-14T21:58:28.000' AS DateTime), CAST(N'2019-07-15T00:02:50.000' AS DateTime), NULL, 0, 0, NULL, CAST(N'2019-07-18T05:48:13.000' AS DateTime))
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (137, 3, CAST(N'2019-07-14T22:04:07.000' AS DateTime), CAST(N'2019-07-15T00:02:57.000' AS DateTime), NULL, 0, 0, NULL, CAST(N'2019-07-18T05:48:10.000' AS DateTime))
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (138, 2, CAST(N'2019-07-15T00:02:31.000' AS DateTime), NULL, NULL, 0, 0, NULL, NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (139, 1, CAST(N'2019-07-18T05:48:28.000' AS DateTime), CAST(N'2019-07-18T06:11:32.000' AS DateTime), N'horas / horas extras', 1, 0, CAST(N'2019-07-18T06:26:12.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (140, 2, CAST(N'2019-07-18T05:48:31.000' AS DateTime), CAST(N'2019-07-18T05:58:41.000' AS DateTime), N' horas adeudadas', 1, 0, CAST(N'2019-07-18T06:26:46.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (141, 4, CAST(N'2019-07-18T05:48:34.000' AS DateTime), NULL, NULL, 0, 0, NULL, CAST(N'2019-07-18T06:00:08.000' AS DateTime))
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (142, 4, CAST(N'2019-07-18T06:01:02.000' AS DateTime), CAST(N'2019-07-18T06:26:56.000' AS DateTime), N' horas', 1, 0, CAST(N'2019-07-18T06:27:04.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (143, 3, CAST(N'2019-07-18T07:08:25.000' AS DateTime), CAST(N'2019-07-18T07:28:32.000' AS DateTime), NULL, 1, 0, CAST(N'2019-07-18T07:28:49.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (144, 17, CAST(N'2019-07-18T07:08:27.000' AS DateTime), CAST(N'2019-07-18T07:28:41.000' AS DateTime), NULL, 1, 0, CAST(N'2019-07-18T07:28:51.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (145, 18, CAST(N'2019-07-18T07:08:30.000' AS DateTime), CAST(N'2019-07-18T07:28:44.000' AS DateTime), NULL, 1, 0, CAST(N'2019-07-18T07:28:53.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (146, 16, CAST(N'2019-07-18T07:08:33.000' AS DateTime), CAST(N'2019-07-18T07:28:45.000' AS DateTime), NULL, 1, 0, CAST(N'2019-07-18T07:28:56.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (147, 16, CAST(N'2019-07-18T07:08:37.000' AS DateTime), NULL, NULL, 0, 0, NULL, CAST(N'2019-07-18T07:08:50.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[RegistroHora] OFF
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([idRol], [nombre]) VALUES (1, N'Jefe de GTH')
INSERT [dbo].[Rol] ([idRol], [nombre]) VALUES (2, N'Jefatura de Finanzas')
INSERT [dbo].[Rol] ([idRol], [nombre]) VALUES (3, N'Finanzas')
INSERT [dbo].[Rol] ([idRol], [nombre]) VALUES (4, N'Jefe de Departamento')
INSERT [dbo].[Rol] ([idRol], [nombre]) VALUES (5, N'Estudiante')
INSERT [dbo].[Rol] ([idRol], [nombre]) VALUES (6, N'admin')
SET IDENTITY_INSERT [dbo].[Rol] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (1, 6, 5, N'jhonnysan', N'jhonny123', 1, NULL, CAST(N'2019-03-25T00:33:00.000' AS DateTime), CAST(N'2019-01-28T00:08:01.000' AS DateTime))
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (2, 7, 2, N'jhazmin', N'jhazmin333', 1, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (3, 8, 3, N'juan', N'juan222', 1, NULL, CAST(N'2019-04-24T11:07:08.000' AS DateTime), NULL)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (4, 10, 4, N'carmen', N'carmen111', 1, NULL, CAST(N'2019-04-24T11:07:18.000' AS DateTime), NULL)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (5, 1, 5, N'jhonny', N'jhonny123', 1, NULL, CAST(N'2019-03-25T23:46:38.000' AS DateTime), NULL)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (6, 2, 5, N'luis', N'luis321', 1, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (7, 3, 5, N'josue', N'josue456', 1, NULL, CAST(N'2019-01-28T00:08:20.000' AS DateTime), NULL)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (8, 4, 5, N'miguel', N'miguel654', 1, NULL, NULL, NULL)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (9, 12, 5, N'metthe', N'mete111', 0, NULL, CAST(N'2019-01-27T23:59:23.000' AS DateTime), NULL)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (15, 15, 5, N'viniciusJR', N'12345', 1, NULL, NULL, CAST(N'2019-01-27T20:41:00.000' AS DateTime))
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (21, 22, 5, N'neymar', N'123456', 0, CAST(N'2019-01-27T18:37:59.000' AS DateTime), CAST(N'2019-01-27T18:39:11.000' AS DateTime), CAST(N'2019-01-27T18:39:24.000' AS DateTime))
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (22, 28, 1, N'jose123', N'jose123', 1, CAST(N'2019-01-27T20:45:47.000' AS DateTime), CAST(N'2019-01-27T20:46:20.000' AS DateTime), NULL)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (23, 27, 2, N'sergi', N'123', 1, CAST(N'2019-01-27T23:52:05.000' AS DateTime), NULL, CAST(N'2019-01-27T23:52:23.000' AS DateTime))
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (24, 27, 2, N'sergi', N'12345', 1, CAST(N'2019-01-28T00:00:18.000' AS DateTime), NULL, CAST(N'2019-01-28T00:00:36.000' AS DateTime))
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (26, 27, 5, N'sergio', N'12345', 1, CAST(N'2019-01-28T00:02:07.000' AS DateTime), CAST(N'2019-04-24T17:08:02.000' AS DateTime), CAST(N'2019-05-20T09:21:46.000' AS DateTime))
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (27, 29, 5, N'sergoasd', N'54321', 1, CAST(N'2019-02-01T11:27:10.000' AS DateTime), CAST(N'2019-04-24T11:07:16.000' AS DateTime), NULL)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (28, 30, 5, N'maria', N'12345', 1, CAST(N'2019-02-08T14:21:46.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (30, 31, 5, N'carlos123', N'12345', 1, CAST(N'2019-02-08T15:30:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (31, 1, 6, N'admin', N'admin', 1, CAST(N'2018-03-15T13:12:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (1031, 50, 5, N'griss', N'12345', 1, CAST(N'2019-03-25T02:40:06.000' AS DateTime), CAST(N'2019-03-25T02:41:01.000' AS DateTime), CAST(N'2019-03-25T02:45:08.000' AS DateTime))
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (1032, 51, 5, N'griesman', N'54321', 0, CAST(N'2019-03-25T02:48:01.000' AS DateTime), CAST(N'2019-03-26T00:51:09.000' AS DateTime), NULL)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (1033, 53, 5, N'edinso', N'cav598', 1, CAST(N'2019-04-19T13:14:45.000' AS DateTime), CAST(N'2019-04-29T00:18:36.000' AS DateTime), CAST(N'2019-05-20T09:22:32.000' AS DateTime))
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (1034, 54, 5, N'karinz', N'asd12345', 1, CAST(N'2019-04-22T00:16:55.000' AS DateTime), CAST(N'2019-05-20T09:01:32.000' AS DateTime), CAST(N'2019-05-20T09:21:56.000' AS DateTime))
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (1035, 55, 5, N'marcow', N'wil634', 1, CAST(N'2019-04-22T17:05:21.000' AS DateTime), CAST(N'2019-04-24T11:20:25.000' AS DateTime), CAST(N'2019-04-24T11:20:32.000' AS DateTime))
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (1036, 60, 5, N'leonar', N'vid621', 1, CAST(N'2019-05-20T09:11:44.000' AS DateTime), NULL, CAST(N'2019-05-20T09:20:09.000' AS DateTime))
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (1037, 61, 5, N'edinso', N'cav654', 1, CAST(N'2019-05-20T09:24:59.000' AS DateTime), NULL, CAST(N'2019-05-20T09:26:04.000' AS DateTime))
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (1038, 62, 3, N'edinso', N'cav324', 1, CAST(N'2019-05-20T09:27:38.000' AS DateTime), NULL, CAST(N'2019-05-20T09:28:34.000' AS DateTime))
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (2036, 1063, 5, N'edinso', N'cav828', 1, CAST(N'2019-05-21T22:06:12.000' AS DateTime), NULL, CAST(N'2019-05-21T22:40:15.000' AS DateTime))
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (2037, 1064, 5, N'edinso', N'cav213', 1, CAST(N'2019-05-21T22:42:45.000' AS DateTime), NULL, CAST(N'2019-05-21T22:43:05.000' AS DateTime))
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (2038, 1065, 5, N'edinso', N'cav815', 1, CAST(N'2019-05-21T22:44:08.000' AS DateTime), NULL, CAST(N'2019-05-21T22:44:18.000' AS DateTime))
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (2039, 1066, 5, N'edinso', N'cav564', 1, CAST(N'2019-05-21T22:52:08.000' AS DateTime), NULL, CAST(N'2019-05-21T23:04:35.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Usuario] OFF
ALTER TABLE [dbo].[Acreedor]  WITH CHECK ADD  CONSTRAINT [FK_Acreedor_Convenio] FOREIGN KEY([idConvenio])
REFERENCES [dbo].[Convenio] ([idConvenio])
GO
ALTER TABLE [dbo].[Acreedor] CHECK CONSTRAINT [FK_Acreedor_Convenio]
GO
ALTER TABLE [dbo].[Acreedor]  WITH CHECK ADD  CONSTRAINT [FK_Acreedor_InformeEstudiante] FOREIGN KEY([idInformeEstudiante])
REFERENCES [dbo].[InformeEstudiante] ([idInformeEstudiante])
GO
ALTER TABLE [dbo].[Acreedor] CHECK CONSTRAINT [FK_Acreedor_InformeEstudiante]
GO
ALTER TABLE [dbo].[Acreedor]  WITH CHECK ADD  CONSTRAINT [FK_Acreedor_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Acreedor] CHECK CONSTRAINT [FK_Acreedor_Usuario]
GO
ALTER TABLE [dbo].[AcreedorPendiente]  WITH CHECK ADD  CONSTRAINT [FK_AcreedorPendiente_Acreedor] FOREIGN KEY([idAcreedor])
REFERENCES [dbo].[Acreedor] ([idAcreedor])
GO
ALTER TABLE [dbo].[AcreedorPendiente] CHECK CONSTRAINT [FK_AcreedorPendiente_Acreedor]
GO
ALTER TABLE [dbo].[AcreedorPendiente]  WITH CHECK ADD  CONSTRAINT [FK_AcreedorPendiente_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[AcreedorPendiente] CHECK CONSTRAINT [FK_AcreedorPendiente_Usuario]
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
ALTER TABLE [dbo].[InformeEstudiante]  WITH CHECK ADD  CONSTRAINT [FK_InformeEstudiante_RegistroHora] FOREIGN KEY([idRegistroHora])
REFERENCES [dbo].[RegistroHora] ([idRegistroHora])
GO
ALTER TABLE [dbo].[InformeEstudiante] CHECK CONSTRAINT [FK_InformeEstudiante_RegistroHora]
GO
ALTER TABLE [dbo].[InformeFinanzas]  WITH CHECK ADD  CONSTRAINT [FK_InformeFinanzas_InformeEstudiante] FOREIGN KEY([idInformeEstudiante])
REFERENCES [dbo].[InformeEstudiante] ([idInformeEstudiante])
GO
ALTER TABLE [dbo].[InformeFinanzas] CHECK CONSTRAINT [FK_InformeFinanzas_InformeEstudiante]
GO
ALTER TABLE [dbo].[InformeFinanzas]  WITH CHECK ADD  CONSTRAINT [FK_InformeFinanzas_Usuario] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[InformeFinanzas] CHECK CONSTRAINT [FK_InformeFinanzas_Usuario]
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
