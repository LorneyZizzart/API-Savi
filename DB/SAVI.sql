USE [Savi]
GO
/****** Object:  Table [dbo].[Acreedor]    Script Date: 23/12/2019 05:24:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Acreedor](
	[idAcreedor] [int] IDENTITY(1,1) NOT NULL,
	[idInformeEstudiante] [int] NOT NULL,
	[idConvenio] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[fechaAsignado] [datetime] NOT NULL,
	[montoBs] [varchar](20) NOT NULL,
	[estado] [bit] NOT NULL,
	[archivar] [datetime] NULL,
	[edit] [datetime] NULL,
	[delet] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idAcreedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AcreedorPendiente]    Script Date: 23/12/2019 05:24:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AcreedorPendiente](
	[idAcreedorPendiente] [int] IDENTITY(1,1) NOT NULL,
	[idConvenio] [int] NOT NULL,
	[idUsuario] [int] NOT NULL,
	[saldo] [varchar](20) NOT NULL,
	[register] [datetime] NOT NULL,
	[estado] [bit] NULL,
	[edit] [datetime] NULL,
	[delet] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idAcreedorPendiente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 23/12/2019 05:24:22 p. m. ******/
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
PRIMARY KEY CLUSTERED 
(
	[idArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AsignacionArea]    Script Date: 23/12/2019 05:24:22 p. m. ******/
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
PRIMARY KEY CLUSTERED 
(
	[idAsignacionArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Beca]    Script Date: 23/12/2019 05:24:22 p. m. ******/
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
PRIMARY KEY CLUSTERED 
(
	[idBeca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Carrera]    Script Date: 23/12/2019 05:24:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Carrera](
	[idCarrera] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[register] [datetime] NOT NULL,
	[edit] [datetime] NULL,
	[delet] [datetime] NULL,
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idCarrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Convenio]    Script Date: 23/12/2019 05:24:22 p. m. ******/
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
PRIMARY KEY CLUSTERED 
(
	[idConvenio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departamento]    Script Date: 23/12/2019 05:24:22 p. m. ******/
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
PRIMARY KEY CLUSTERED 
(
	[idDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Descuento]    Script Date: 23/12/2019 05:24:22 p. m. ******/
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
	[estado] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[idDescuento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dias]    Script Date: 23/12/2019 05:24:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dias](
	[idDias] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[idDias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistorialDepartamento]    Script Date: 23/12/2019 05:24:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistorialDepartamento](
	[idHistorialDepartamento] [int] IDENTITY(1,1) NOT NULL,
	[idDepartamento] [int] NOT NULL,
	[limiteEstudiante] [int] NOT NULL,
	[costoHora] [varchar](20) NOT NULL,
	[fechaRegistro] [datetime] NOT NULL,
	[estado] [bit] NOT NULL,
	[edit] [datetime] NULL,
	[delet] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idHistorialDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Horario]    Script Date: 23/12/2019 05:24:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Horario](
	[idHorario] [int] IDENTITY(1,1) NOT NULL,
	[idConvenio] [int] NOT NULL,
	[idDias] [int] NOT NULL,
	[idTurno] [int] NULL,
	[horaEntrada] [datetime] NOT NULL,
	[horaSalida] [datetime] NOT NULL,
	[register] [datetime] NULL,
	[edit] [datetime] NULL,
	[delet] [datetime] NULL,
 CONSTRAINT [PK__Turno__AA068B01E31BDF6E] PRIMARY KEY CLUSTERED 
(
	[idHorario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InformeEstudiante]    Script Date: 23/12/2019 05:24:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InformeEstudiante](
	[idInformeEstudiante] [int] IDENTITY(1,1) NOT NULL,
	[idRegistroHora] [int] NOT NULL,
	[fecha] [datetime] NOT NULL,
	[totalHoras] [varchar](12) NOT NULL,
	[totalSaldo] [varchar](12) NOT NULL,
	[aprobadoJefeDep] [datetime] NOT NULL,
	[aprobadoFinanzas] [bit] NULL,
	[revisadoFinanzas] [datetime] NULL,
	[archivar] [datetime] NULL,
	[delet] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idInformeEstudiante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InformeFinanzas]    Script Date: 23/12/2019 05:24:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InformeFinanzas](
	[idInformeFinanzas] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[idInformeEstudiante] [int] NOT NULL,
	[totalHoras] [varchar](12) NOT NULL,
	[totalSaldo] [varchar](12) NOT NULL,
	[observacion] [varchar](150) NULL,
	[fechaAprobada] [datetime] NOT NULL,
	[delet] [datetime] NULL,
	[archivar] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idInformeFinanzas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organizacion]    Script Date: 23/12/2019 05:24:22 p. m. ******/
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
PRIMARY KEY CLUSTERED 
(
	[idOrganizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 23/12/2019 05:24:22 p. m. ******/
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
	[nacionalidad] [varchar](60) NOT NULL,
	[direccion] [varchar](70) NOT NULL,
	[celular] [int] NOT NULL,
	[fechaNacimiento] [date] NOT NULL,
	[estado] [bit] NOT NULL,
	[register] [datetime] NOT NULL,
	[edit] [datetime] NULL,
	[delet] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroHora]    Script Date: 23/12/2019 05:24:22 p. m. ******/
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
PRIMARY KEY CLUSTERED 
(
	[idRegistroHora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistroUsuario]    Script Date: 23/12/2019 05:24:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistroUsuario](
	[idRegistroUsuario] [int] IDENTITY(1,1) NOT NULL,
	[idUsuario] [int] NOT NULL,
	[login] [datetime] NOT NULL,
	[singOut] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idRegistroUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 23/12/2019 05:24:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rol](
	[idRol] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](25) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[idRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Turno]    Script Date: 23/12/2019 05:24:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Turno](
	[idTurno] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_Turno] PRIMARY KEY CLUSTERED 
(
	[idTurno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 23/12/2019 05:24:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[idUsuario] [int] IDENTITY(1,1) NOT NULL,
	[idPersona] [int] NOT NULL,
	[idRol] [int] NOT NULL,
	[usuario] [varchar](40) NOT NULL,
	[password] [varchar](200) NOT NULL,
	[estado] [bit] NOT NULL,
	[register] [datetime] NOT NULL,
	[edit] [datetime] NULL,
	[delet] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Acreedor] ON 

INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (40, 43, 4, 4, CAST(N'2019-12-20T12:09:08.000' AS DateTime), N'12.48', 1, NULL, NULL, NULL)
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (41, 24, 3, 4, CAST(N'2019-12-20T12:22:32.000' AS DateTime), N'133.23', 1, NULL, CAST(N'2019-12-20T12:24:30.000' AS DateTime), NULL)
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (42, 35, 2, 4, CAST(N'2019-12-20T12:24:17.000' AS DateTime), N'107.92', 1, NULL, CAST(N'2019-12-20T12:25:12.000' AS DateTime), NULL)
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (1016, 1032, 1, 4, CAST(N'2019-12-23T11:41:11.000' AS DateTime), N'24.27', 0, NULL, CAST(N'2019-12-23T11:44:28.000' AS DateTime), NULL)
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (1017, 1032, 1, 4, CAST(N'2019-12-23T11:44:28.000' AS DateTime), N'4.27', 0, NULL, CAST(N'2019-12-23T11:44:37.000' AS DateTime), NULL)
INSERT [dbo].[Acreedor] ([idAcreedor], [idInformeEstudiante], [idConvenio], [idUsuario], [fechaAsignado], [montoBs], [estado], [archivar], [edit], [delet]) VALUES (1018, 1032, 1, 4, CAST(N'2019-12-23T11:44:37.000' AS DateTime), N'2.27', 1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Acreedor] OFF
SET IDENTITY_INSERT [dbo].[Area] ON 

INSERT [dbo].[Area] ([idArea], [idDepartamento], [nombre], [fechaRegistro], [estado], [edit], [delet]) VALUES (3, 1, N'Plaza', CAST(N'2019-09-15T11:33:01.000' AS DateTime), 1, CAST(N'2019-09-15T12:21:57.000' AS DateTime), NULL)
INSERT [dbo].[Area] ([idArea], [idDepartamento], [nombre], [fechaRegistro], [estado], [edit], [delet]) VALUES (4, 1, N'Bloque A', CAST(N'2019-09-15T11:34:54.000' AS DateTime), 1, NULL, CAST(N'2019-09-16T10:29:07.000' AS DateTime))
INSERT [dbo].[Area] ([idArea], [idDepartamento], [nombre], [fechaRegistro], [estado], [edit], [delet]) VALUES (5, 1, N'Bloque B', CAST(N'2019-09-15T11:35:50.000' AS DateTime), 1, CAST(N'2019-09-15T12:21:59.000' AS DateTime), CAST(N'2019-09-16T10:28:16.000' AS DateTime))
INSERT [dbo].[Area] ([idArea], [idDepartamento], [nombre], [fechaRegistro], [estado], [edit], [delet]) VALUES (6, 1, N'Bloque C', CAST(N'2019-09-16T10:25:03.000' AS DateTime), 1, NULL, CAST(N'2019-09-16T10:25:19.000' AS DateTime))
INSERT [dbo].[Area] ([idArea], [idDepartamento], [nombre], [fechaRegistro], [estado], [edit], [delet]) VALUES (1002, 1, N'Plaza', CAST(N'2019-10-09T16:06:29.000' AS DateTime), 1, NULL, CAST(N'2019-10-09T16:24:51.000' AS DateTime))
INSERT [dbo].[Area] ([idArea], [idDepartamento], [nombre], [fechaRegistro], [estado], [edit], [delet]) VALUES (1003, 1, N'Bloque A', CAST(N'2019-10-09T16:06:41.000' AS DateTime), 1, CAST(N'2019-10-10T09:58:09.000' AS DateTime), NULL)
INSERT [dbo].[Area] ([idArea], [idDepartamento], [nombre], [fechaRegistro], [estado], [edit], [delet]) VALUES (1004, 1, N'Bloque B', CAST(N'2019-10-10T10:04:21.000' AS DateTime), 1, NULL, CAST(N'2019-10-10T10:04:26.000' AS DateTime))
INSERT [dbo].[Area] ([idArea], [idDepartamento], [nombre], [fechaRegistro], [estado], [edit], [delet]) VALUES (1005, 1, N'Bloque B', CAST(N'2019-10-10T10:04:33.000' AS DateTime), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Area] OFF
SET IDENTITY_INSERT [dbo].[AsignacionArea] ON 

INSERT [dbo].[AsignacionArea] ([idAsignacionArea], [idConvenio], [idArea], [fechaRegistro], [estado], [edit], [delet]) VALUES (1008, 2, 3, CAST(N'2019-10-09T17:57:19.000' AS DateTime), 1, CAST(N'2019-10-16T16:02:39.000' AS DateTime), NULL)
INSERT [dbo].[AsignacionArea] ([idAsignacionArea], [idConvenio], [idArea], [fechaRegistro], [estado], [edit], [delet]) VALUES (1009, 1, 1003, CAST(N'2019-10-09T17:57:25.000' AS DateTime), 1, CAST(N'2019-10-09T20:17:31.000' AS DateTime), NULL)
INSERT [dbo].[AsignacionArea] ([idAsignacionArea], [idConvenio], [idArea], [fechaRegistro], [estado], [edit], [delet]) VALUES (1010, 3, 1003, CAST(N'2019-10-09T18:14:58.000' AS DateTime), 1, CAST(N'2019-10-09T18:30:51.000' AS DateTime), CAST(N'2019-10-09T18:37:03.000' AS DateTime))
INSERT [dbo].[AsignacionArea] ([idAsignacionArea], [idConvenio], [idArea], [fechaRegistro], [estado], [edit], [delet]) VALUES (1011, 3, 1003, CAST(N'2019-10-09T18:41:07.000' AS DateTime), 1, NULL, CAST(N'2019-10-09T18:41:16.000' AS DateTime))
INSERT [dbo].[AsignacionArea] ([idAsignacionArea], [idConvenio], [idArea], [fechaRegistro], [estado], [edit], [delet]) VALUES (1012, 1, 1005, CAST(N'2019-10-10T19:33:50.000' AS DateTime), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[AsignacionArea] OFF
SET IDENTITY_INSERT [dbo].[Beca] ON 

INSERT [dbo].[Beca] ([idBeca], [nombre], [estado], [register], [edit], [delet]) VALUES (1, N'Beca Industrial', 1, CAST(N'2019-05-31T00:00:00.000' AS DateTime), CAST(N'2019-05-31T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[Beca] ([idBeca], [nombre], [estado], [register], [edit], [delet]) VALUES (2, N'Beca Institucional', 1, CAST(N'2019-05-31T00:00:00.000' AS DateTime), CAST(N'2019-05-31T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Beca] OFF
SET IDENTITY_INSERT [dbo].[Carrera] ON 

INSERT [dbo].[Carrera] ([idCarrera], [nombre], [register], [edit], [delet], [estado]) VALUES (1, N'Ingeniería Comercial', CAST(N'2019-05-31T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Carrera] ([idCarrera], [nombre], [register], [edit], [delet], [estado]) VALUES (2, N'Contaduria Pública', CAST(N'2019-05-31T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Carrera] ([idCarrera], [nombre], [register], [edit], [delet], [estado]) VALUES (3, N'Ingeniería Financiera', CAST(N'2019-05-31T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Carrera] ([idCarrera], [nombre], [register], [edit], [delet], [estado]) VALUES (4, N'Adminisrtación y negocios internacionales', CAST(N'2019-05-31T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Carrera] ([idCarrera], [nombre], [register], [edit], [delet], [estado]) VALUES (5, N'Enfermería', CAST(N'2019-05-31T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Carrera] ([idCarrera], [nombre], [register], [edit], [delet], [estado]) VALUES (6, N'Nutrición', CAST(N'2019-05-31T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Carrera] ([idCarrera], [nombre], [register], [edit], [delet], [estado]) VALUES (7, N'Fisioterapia y Kinesiología', CAST(N'2019-05-31T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Carrera] ([idCarrera], [nombre], [register], [edit], [delet], [estado]) VALUES (8, N'Bioquímica', CAST(N'2019-05-31T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Carrera] ([idCarrera], [nombre], [register], [edit], [delet], [estado]) VALUES (9, N'Ingeniería de Sistemas', CAST(N'2019-05-31T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Carrera] ([idCarrera], [nombre], [register], [edit], [delet], [estado]) VALUES (10, N'Ingeniería Ambiental', CAST(N'2019-05-31T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Carrera] ([idCarrera], [nombre], [register], [edit], [delet], [estado]) VALUES (11, N'Ingeniería en Redes y Telecomunicaciones', CAST(N'2019-05-31T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Carrera] ([idCarrera], [nombre], [register], [edit], [delet], [estado]) VALUES (12, N'Psicología', CAST(N'2019-05-31T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Carrera] ([idCarrera], [nombre], [register], [edit], [delet], [estado]) VALUES (13, N'Psicopedagogía', CAST(N'2019-05-31T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Carrera] ([idCarrera], [nombre], [register], [edit], [delet], [estado]) VALUES (14, N'Actividad fisica y deportes', CAST(N'2019-05-31T00:00:00.000' AS DateTime), NULL, NULL, 1)
INSERT [dbo].[Carrera] ([idCarrera], [nombre], [register], [edit], [delet], [estado]) VALUES (15, N'Teología', CAST(N'2019-05-31T00:00:00.000' AS DateTime), NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Carrera] OFF
SET IDENTITY_INSERT [dbo].[Convenio] ON 

INSERT [dbo].[Convenio] ([idConvenio], [idDepartamento], [idPersona], [idBeca], [fechaInicio], [fechaFinal], [fotocopiaCarnet], [solicitudTrabajo], [estado], [register], [edit], [delet]) VALUES (1, 1, 6, 2, CAST(N'2019-01-01' AS Date), CAST(N'2019-06-28' AS Date), 1, 1, 1, CAST(N'2019-05-31T00:00:00.000' AS DateTime), CAST(N'2019-09-15T12:24:03.000' AS DateTime), NULL)
INSERT [dbo].[Convenio] ([idConvenio], [idDepartamento], [idPersona], [idBeca], [fechaInicio], [fechaFinal], [fotocopiaCarnet], [solicitudTrabajo], [estado], [register], [edit], [delet]) VALUES (2, 1, 7, 2, CAST(N'2019-01-01' AS Date), CAST(N'2019-06-29' AS Date), 0, 1, 1, CAST(N'2019-10-09T16:24:22.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Convenio] ([idConvenio], [idDepartamento], [idPersona], [idBeca], [fechaInicio], [fechaFinal], [fotocopiaCarnet], [solicitudTrabajo], [estado], [register], [edit], [delet]) VALUES (3, 1, 8, 2, CAST(N'2019-01-01' AS Date), CAST(N'2019-06-29' AS Date), 1, 0, 1, CAST(N'2019-10-09T18:14:28.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Convenio] ([idConvenio], [idDepartamento], [idPersona], [idBeca], [fechaInicio], [fechaFinal], [fotocopiaCarnet], [solicitudTrabajo], [estado], [register], [edit], [delet]) VALUES (4, 1, 9, 2, CAST(N'2019-01-15' AS Date), CAST(N'2019-06-15' AS Date), 1, 0, 1, CAST(N'2019-10-14T10:42:16.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Convenio] OFF
SET IDENTITY_INSERT [dbo].[Departamento] ON 

INSERT [dbo].[Departamento] ([idDepartamento], [nombre], [fechaRegistro], [estado], [edit], [delet]) VALUES (1, N'Limpieza', CAST(N'2019-05-31T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[Departamento] ([idDepartamento], [nombre], [fechaRegistro], [estado], [edit], [delet]) VALUES (2, N'Biblioteca', CAST(N'2019-05-31T00:00:00.000' AS DateTime), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Departamento] OFF
SET IDENTITY_INSERT [dbo].[Descuento] ON 

INSERT [dbo].[Descuento] ([idDescuento], [idAcreedor], [idUsuario], [fechaDescuento], [saldoInicial], [montoBs], [observacion], [edit], [delet], [estado]) VALUES (1006, 1016, 4, CAST(N'2019-12-23T11:44:28.000' AS DateTime), N'24.27', N'20', NULL, NULL, NULL, 1)
INSERT [dbo].[Descuento] ([idDescuento], [idAcreedor], [idUsuario], [fechaDescuento], [saldoInicial], [montoBs], [observacion], [edit], [delet], [estado]) VALUES (1007, 1017, 4, CAST(N'2019-12-23T11:44:37.000' AS DateTime), N'4.27', N'2', NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Descuento] OFF
SET IDENTITY_INSERT [dbo].[HistorialDepartamento] ON 

INSERT [dbo].[HistorialDepartamento] ([idHistorialDepartamento], [idDepartamento], [limiteEstudiante], [costoHora], [fechaRegistro], [estado], [edit], [delet]) VALUES (1, 1, 33, N'7', CAST(N'2019-05-31T00:00:00.000' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[HistorialDepartamento] ([idHistorialDepartamento], [idDepartamento], [limiteEstudiante], [costoHora], [fechaRegistro], [estado], [edit], [delet]) VALUES (2, 1, 30, N'6.50', CAST(N'2019-04-05T00:00:00.000' AS DateTime), 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[HistorialDepartamento] OFF
SET IDENTITY_INSERT [dbo].[InformeEstudiante] ON 

INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (23, 1026, CAST(N'2019-12-17T00:00:00.000' AS DateTime), N'00:04', N'0.47', CAST(N'2019-12-17T19:45:46.000' AS DateTime), 1, CAST(N'2019-12-18T12:29:06.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (24, 1027, CAST(N'2019-12-17T00:00:00.000' AS DateTime), N'17:15', N'120.75', CAST(N'2019-12-18T12:27:25.000' AS DateTime), 1, CAST(N'2019-12-20T12:24:30.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (25, 1028, CAST(N'2019-12-17T00:00:00.000' AS DateTime), N'17:15', N'120.75', CAST(N'2019-12-18T12:27:27.000' AS DateTime), 1, CAST(N'2019-12-18T15:51:06.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (26, 1029, CAST(N'2019-12-17T00:00:00.000' AS DateTime), N'17:15', N'120.75', CAST(N'2019-12-18T12:27:29.000' AS DateTime), 1, CAST(N'2019-12-20T09:38:48.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (27, 1030, CAST(N'2019-12-18T00:00:00.000' AS DateTime), N'19:18', N'135.1', CAST(N'2019-12-19T10:32:22.000' AS DateTime), 1, CAST(N'2019-12-19T19:51:12.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (28, 1031, CAST(N'2019-12-18T00:00:00.000' AS DateTime), N'19:18', N'135.1', CAST(N'2019-12-19T10:32:24.000' AS DateTime), 1, CAST(N'2019-12-19T19:56:01.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (29, 1032, CAST(N'2019-12-18T00:00:00.000' AS DateTime), N'19:18', N'135.1', CAST(N'2019-12-19T10:32:26.000' AS DateTime), 1, CAST(N'2019-12-19T19:57:22.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (30, 1033, CAST(N'2019-12-18T00:00:00.000' AS DateTime), N'19:18', N'135.1', CAST(N'2019-12-19T10:32:29.000' AS DateTime), 1, CAST(N'2019-12-20T09:36:45.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (31, 1036, CAST(N'2019-12-19T00:00:00.000' AS DateTime), N'10:30', N'73.50', CAST(N'2019-12-19T20:02:49.000' AS DateTime), 1, CAST(N'2019-12-20T09:37:47.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (32, 1035, CAST(N'2019-12-19T00:00:00.000' AS DateTime), N'02:09', N'15.05', CAST(N'2019-12-19T20:02:52.000' AS DateTime), 1, CAST(N'2019-12-20T09:37:49.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (33, 1034, CAST(N'2019-12-19T00:00:00.000' AS DateTime), N'02:09', N'15.05', CAST(N'2019-12-19T20:02:54.000' AS DateTime), 1, CAST(N'2019-12-20T09:37:51.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (34, 1037, CAST(N'2019-12-19T00:00:00.000' AS DateTime), N'10:30', N'73.50', CAST(N'2019-12-19T20:02:56.000' AS DateTime), 1, CAST(N'2019-12-20T09:37:37.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (35, 1038, CAST(N'2019-12-19T00:00:00.000' AS DateTime), N'13:54', N'97.3', CAST(N'2019-12-20T09:56:15.000' AS DateTime), 1, CAST(N'2019-12-20T12:25:12.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (36, 1039, CAST(N'2019-12-19T00:00:00.000' AS DateTime), N'13:54', N'97.3', CAST(N'2019-12-20T09:56:17.000' AS DateTime), 1, CAST(N'2019-12-20T11:25:03.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (37, 1040, CAST(N'2019-12-19T00:00:00.000' AS DateTime), N'13:54', N'97.3', CAST(N'2019-12-20T09:56:19.000' AS DateTime), 1, CAST(N'2019-12-20T11:24:43.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (38, 1041, CAST(N'2019-12-19T00:00:00.000' AS DateTime), N'13:54', N'97.3', CAST(N'2019-12-20T09:56:22.000' AS DateTime), 1, CAST(N'2019-12-20T11:24:50.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (39, 1042, CAST(N'2019-12-20T00:00:00.000' AS DateTime), N'02:17', N'15.98', CAST(N'2019-12-20T11:38:52.000' AS DateTime), 1, CAST(N'2019-12-20T11:44:52.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (40, 1043, CAST(N'2019-12-20T00:00:00.000' AS DateTime), N'02:09', N'15.05', CAST(N'2019-12-20T11:46:02.000' AS DateTime), 1, CAST(N'2019-12-20T11:46:18.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (41, 1044, CAST(N'2019-12-20T00:00:00.000' AS DateTime), N'02:00', N'14.00', CAST(N'2019-12-20T11:56:08.000' AS DateTime), 1, CAST(N'2019-12-20T12:08:08.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (42, 1045, CAST(N'2019-12-20T00:00:00.000' AS DateTime), N'03:50', N'26.83', CAST(N'2019-12-20T12:05:42.000' AS DateTime), 1, CAST(N'2019-12-20T12:05:52.000' AS DateTime), NULL, CAST(N'2019-12-20T12:08:30.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (43, 1045, CAST(N'2019-12-20T00:00:00.000' AS DateTime), N'03:50', N'26.83', CAST(N'2019-12-20T12:08:48.000' AS DateTime), 1, CAST(N'2019-12-20T12:09:08.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (44, 1046, CAST(N'2019-12-20T00:00:00.000' AS DateTime), N'01:47', N'12.48', CAST(N'2019-12-20T12:08:58.000' AS DateTime), 1, CAST(N'2019-12-20T12:23:07.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (45, 1047, CAST(N'2019-12-20T00:00:00.000' AS DateTime), N'01:31', N'10.62', CAST(N'2019-12-20T12:24:05.000' AS DateTime), 1, CAST(N'2019-12-20T12:24:17.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (1031, 2040, CAST(N'2019-12-23T00:00:00.000' AS DateTime), N'01:50', N'12.83', CAST(N'2019-12-23T09:07:17.000' AS DateTime), 0, NULL, NULL, CAST(N'2019-12-23T15:20:22.000' AS DateTime))
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (1032, 2041, CAST(N'2019-12-23T00:00:00.000' AS DateTime), N'03:28', N'24.27', CAST(N'2019-12-23T11:29:07.000' AS DateTime), 1, CAST(N'2019-12-23T11:41:11.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (1033, 2040, CAST(N'2019-12-23T00:00:00.000' AS DateTime), N'07:37', N'53.32', CAST(N'2019-12-23T15:20:26.000' AS DateTime), 0, NULL, NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (1034, 2039, CAST(N'2019-12-23T00:00:00.000' AS DateTime), N'07:37', N'53.32', CAST(N'2019-12-23T15:20:34.000' AS DateTime), 0, NULL, NULL, NULL)
INSERT [dbo].[InformeEstudiante] ([idInformeEstudiante], [idRegistroHora], [fecha], [totalHoras], [totalSaldo], [aprobadoJefeDep], [aprobadoFinanzas], [revisadoFinanzas], [archivar], [delet]) VALUES (1035, 2038, CAST(N'2019-12-23T00:00:00.000' AS DateTime), N'07:37', N'53.32', CAST(N'2019-12-23T15:20:38.000' AS DateTime), 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[InformeEstudiante] OFF
SET IDENTITY_INSERT [dbo].[InformeFinanzas] ON 

INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (19, 4, 23, N'01:60', N'14', N'null', CAST(N'2019-12-18T12:29:06.000' AS DateTime), NULL, CAST(N'2019-12-18T12:29:12.000' AS DateTime))
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (20, 4, 26, N'17:15', N'120.75', N'SD', CAST(N'2019-12-20T09:38:48.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (21, 4, 24, N'17:15', N'120.75', N'null', CAST(N'2019-12-20T12:24:30.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (22, 4, 25, N'17:15', N'120.75', NULL, CAST(N'2019-12-18T15:51:06.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (23, 3, 27, N'19:18', N'135.1', NULL, CAST(N'2019-12-19T19:51:12.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (24, 4, 28, N'19:18', N'135.1', NULL, CAST(N'2019-12-19T19:56:01.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (25, 4, 29, N'19:18', N'135.1', NULL, CAST(N'2019-12-19T19:57:22.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (26, 4, 30, N'19:18', N'135.1', NULL, CAST(N'2019-12-20T09:36:45.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (27, 4, 34, N'10:30', N'73.50', NULL, CAST(N'2019-12-20T09:37:37.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (28, 4, 31, N'10:30', N'73.50', NULL, CAST(N'2019-12-20T09:37:47.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (29, 4, 32, N'02:09', N'15.05', NULL, CAST(N'2019-12-20T09:37:49.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (30, 4, 33, N'02:09', N'15.05', NULL, CAST(N'2019-12-20T09:37:51.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (31, 4, 35, N'13:54', N'97.3', N'null', CAST(N'2019-12-20T12:25:12.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (32, 4, 36, N'13:54', N'97.3', N'null', CAST(N'2019-12-20T11:25:03.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (33, 4, 37, N'13:54', N'97.3', NULL, CAST(N'2019-12-20T11:24:43.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (34, 4, 38, N'13:54', N'97.3', NULL, CAST(N'2019-12-20T11:24:50.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (35, 4, 39, N'02:17', N'15.98', NULL, CAST(N'2019-12-20T11:44:52.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (36, 4, 40, N'02:09', N'15.05', NULL, CAST(N'2019-12-20T11:46:18.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (37, 4, 41, N'02:00', N'14.00', N'null', CAST(N'2019-12-20T12:08:08.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (38, 4, 42, N'03:50', N'26.83', NULL, CAST(N'2019-12-20T12:05:52.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (39, 4, 43, N'01:47', N'12.48', NULL, CAST(N'2019-12-20T12:09:08.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (40, 4, 44, N'01:47', N'12.48', N'null', CAST(N'2019-12-20T12:23:07.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (41, 4, 45, N'01:31', N'10.62', NULL, CAST(N'2019-12-20T12:24:17.000' AS DateTime), NULL, NULL)
INSERT [dbo].[InformeFinanzas] ([idInformeFinanzas], [idUsuario], [idInformeEstudiante], [totalHoras], [totalSaldo], [observacion], [fechaAprobada], [delet], [archivar]) VALUES (1023, 4, 1032, N'03:28', N'24.27', NULL, CAST(N'2019-12-23T11:41:11.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[InformeFinanzas] OFF
SET IDENTITY_INSERT [dbo].[Organizacion] ON 

INSERT [dbo].[Organizacion] ([idOrganizacion], [idDepartamento], [idPersona], [fechaRegistro], [estado], [edit], [delet]) VALUES (1, 1, 5, CAST(N'2019-05-31T00:00:00.000' AS DateTime), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Organizacion] OFF
SET IDENTITY_INSERT [dbo].[Persona] ON 

INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (1, NULL, NULL, N'Jhonny', NULL, N'Gutierrez', N'Villca', N'8282702', NULL, N'Bolivia', N'Calle 1', 60607170, CAST(N'1994-09-11' AS Date), 1, CAST(N'2019-05-31T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (2, NULL, NULL, N'Luis', N'Fernando', N'Gutierrez', N'Villca', N'123456', NULL, N'Bolivia', N'Calle 2', 78932111, CAST(N'1998-12-09' AS Date), 1, CAST(N'2019-05-31T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (3, NULL, NULL, N'Miguel', N'Angel', N'Gutierrez', N'Villca', N'123456', NULL, N'Bolivia', N'Calle 2', 78932111, CAST(N'1999-12-09' AS Date), 1, CAST(N'2019-05-31T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (4, NULL, NULL, N'Josue', NULL, N'Gutierrez', N'Villca', N'123456', NULL, N'Bolivia', N'Calle 2', 78932111, CAST(N'2000-12-09' AS Date), 1, CAST(N'2019-05-31T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (5, NULL, NULL, N'Josias', NULL, N'Gutierrez', N'Villca', N'123456', NULL, N'Bolivia', N'Calle 2', 78932111, CAST(N'2016-12-09' AS Date), 1, CAST(N'2019-05-31T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (6, 8, 600000005, N'Rut', N'Nayeli', N'Gutierrez', N'Villca', N'123456', 1, N'Bolivia', N'Calle 2', 78932111, CAST(N'2006-12-09' AS Date), 1, CAST(N'2019-05-31T00:00:00.000' AS DateTime), CAST(N'2019-09-15T12:39:30.000' AS DateTime), NULL)
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (7, 15, 600000001, N'Juan', N'Pablo', N'Cabrera', NULL, N'87978987', 1, N'Bolivia', N'Calle 3', 71235312, CAST(N'1999-02-15' AS Date), 1, CAST(N'2019-10-09T16:22:58.000' AS DateTime), CAST(N'2019-10-14T10:10:02.000' AS DateTime), NULL)
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (8, 2, 600000002, N'Edinson', N'', N'Cavani', NULL, N'87978987', 3, N'Bolivia', N'Calle 7', 71235313, CAST(N'2000-02-15' AS Date), 1, CAST(N'2019-10-09T18:13:26.000' AS DateTime), CAST(N'2019-10-10T19:57:47.000' AS DateTime), NULL)
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (9, 8, 600000003, N'Neymar', N'Junior', N'Do Santos', NULL, N'78788795', 3, N'Brazil', N'Calle 3', 60645656, CAST(N'1998-05-01' AS Date), 1, CAST(N'2019-10-14T09:45:28.000' AS DateTime), CAST(N'2019-12-20T12:27:00.000' AS DateTime), NULL)
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (10, 1, 600000004, N'Neymars', NULL, N'Do', NULL, N'78788795', 1, N'Brazil', N'591, Tecnología Informática', 60645656, CAST(N'1998-05-01' AS Date), 1, CAST(N'2019-10-14T10:10:28.000' AS DateTime), NULL, CAST(N'2019-10-14T10:11:25.000' AS DateTime))
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (11, 1, 600000101, N'Maria', N'Mireya', N'Acevedo', N'Marriquez', N'8954122 CB', 3, N'Bolivia', N'Quillacollo, calle 51 # 1', 60845001, CAST(N'1999-05-05' AS Date), 1, CAST(N'2019-10-15T18:52:32.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Persona] ([idPersona], [idCarrera], [codEstudiante], [primerNombre], [segundoNombre], [primerApellido], [segundoApellido], [ci], [semestre], [nacionalidad], [direccion], [celular], [fechaNacimiento], [estado], [register], [edit], [delet]) VALUES (1011, 9, 600000100, N'Antonio', NULL, N'Garcia', NULL, N'5050781 LP', 2, N'Bolivia', N'Calle Simon Bolivar  # 3', 70510263, CAST(N'1995-01-12' AS Date), 1, CAST(N'2019-11-19T17:26:43.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Persona] OFF
SET IDENTITY_INSERT [dbo].[RegistroHora] ON 

INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (1026, 2, CAST(N'2019-12-17T19:41:58.000' AS DateTime), CAST(N'2019-12-17T19:45:43.000' AS DateTime), NULL, 1, 1, CAST(N'2019-12-17T19:45:46.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (1027, 3, CAST(N'2019-12-17T19:42:03.000' AS DateTime), CAST(N'2019-12-18T12:27:21.000' AS DateTime), NULL, 1, 1, CAST(N'2019-12-18T12:27:25.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (1028, 4, CAST(N'2019-12-17T19:42:05.000' AS DateTime), CAST(N'2019-12-18T12:27:22.000' AS DateTime), NULL, 1, 1, CAST(N'2019-12-18T12:27:27.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (1029, 1, CAST(N'2019-12-17T19:42:08.000' AS DateTime), CAST(N'2019-12-18T12:27:22.000' AS DateTime), NULL, 1, 1, CAST(N'2019-12-18T12:27:29.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (1030, 2, CAST(N'2019-12-18T15:50:22.000' AS DateTime), CAST(N'2019-12-19T10:32:17.000' AS DateTime), NULL, 1, 1, CAST(N'2019-12-19T10:32:22.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (1031, 3, CAST(N'2019-12-18T15:50:26.000' AS DateTime), CAST(N'2019-12-19T10:32:18.000' AS DateTime), NULL, 1, 1, CAST(N'2019-12-19T10:32:24.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (1032, 4, CAST(N'2019-12-18T15:50:30.000' AS DateTime), CAST(N'2019-12-19T10:32:19.000' AS DateTime), NULL, 1, 1, CAST(N'2019-12-19T10:32:26.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (1033, 1, CAST(N'2019-12-18T15:50:40.000' AS DateTime), CAST(N'2019-12-19T10:32:20.000' AS DateTime), NULL, 1, 1, CAST(N'2019-12-19T10:32:29.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (1034, 2, CAST(N'2019-12-19T10:32:38.000' AS DateTime), CAST(N'2019-12-19T12:23:29.000' AS DateTime), NULL, 1, 1, CAST(N'2019-12-19T20:02:54.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (1035, 3, CAST(N'2019-12-19T10:32:40.000' AS DateTime), CAST(N'2019-12-19T12:23:31.000' AS DateTime), NULL, 1, 1, CAST(N'2019-12-19T20:02:52.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (1036, 4, CAST(N'2019-12-19T10:32:42.000' AS DateTime), CAST(N'2019-12-19T20:02:45.000' AS DateTime), NULL, 1, 1, CAST(N'2019-12-19T20:02:49.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (1037, 1, CAST(N'2019-12-19T10:32:47.000' AS DateTime), CAST(N'2019-12-19T20:02:46.000' AS DateTime), NULL, 1, 1, CAST(N'2019-12-19T20:02:56.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (1038, 2, CAST(N'2019-12-19T20:02:26.000' AS DateTime), CAST(N'2019-12-20T09:56:08.000' AS DateTime), NULL, 1, 1, CAST(N'2019-12-20T09:56:15.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (1039, 3, CAST(N'2019-12-19T20:02:27.000' AS DateTime), CAST(N'2019-12-20T09:56:09.000' AS DateTime), NULL, 1, 1, CAST(N'2019-12-20T09:56:17.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (1040, 1, CAST(N'2019-12-19T20:02:29.000' AS DateTime), CAST(N'2019-12-20T09:56:10.000' AS DateTime), NULL, 1, 1, CAST(N'2019-12-20T09:56:19.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (1041, 4, CAST(N'2019-12-19T20:02:33.000' AS DateTime), CAST(N'2019-12-20T09:56:13.000' AS DateTime), NULL, 1, 1, CAST(N'2019-12-20T09:56:22.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (1042, 3, CAST(N'2019-12-20T09:55:51.000' AS DateTime), CAST(N'2019-12-20T11:38:35.000' AS DateTime), N'ingreso puntual', 1, 1, CAST(N'2019-12-20T11:38:52.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (1043, 2, CAST(N'2019-12-20T09:55:54.000' AS DateTime), CAST(N'2019-12-20T11:46:00.000' AS DateTime), NULL, 1, 1, CAST(N'2019-12-20T11:46:02.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (1044, 1, CAST(N'2019-12-20T09:55:57.000' AS DateTime), CAST(N'2019-12-20T11:55:26.000' AS DateTime), NULL, 1, 1, CAST(N'2019-12-20T11:56:08.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (1045, 4, CAST(N'2019-12-20T09:55:59.000' AS DateTime), CAST(N'2019-12-20T12:05:39.000' AS DateTime), NULL, 1, 1, CAST(N'2019-12-20T12:08:48.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (1046, 3, CAST(N'2019-12-20T11:55:55.000' AS DateTime), CAST(N'2019-12-20T12:08:54.000' AS DateTime), NULL, 1, 1, CAST(N'2019-12-20T12:08:58.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (1047, 2, CAST(N'2019-12-20T11:55:59.000' AS DateTime), CAST(N'2019-12-20T12:24:03.000' AS DateTime), NULL, 1, 1, CAST(N'2019-12-20T12:24:05.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (2038, 2, CAST(N'2019-12-23T08:57:07.000' AS DateTime), CAST(N'2019-12-23T15:20:35.000' AS DateTime), NULL, 1, 0, CAST(N'2019-12-23T15:20:38.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (2039, 3, CAST(N'2019-12-23T08:57:09.000' AS DateTime), CAST(N'2019-12-23T15:20:30.000' AS DateTime), NULL, 1, 0, CAST(N'2019-12-23T15:20:34.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (2040, 4, CAST(N'2019-12-23T08:57:11.000' AS DateTime), CAST(N'2019-12-23T15:20:22.000' AS DateTime), NULL, 1, 0, CAST(N'2019-12-23T15:20:26.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (2041, 1, CAST(N'2019-12-23T08:57:14.000' AS DateTime), CAST(N'2019-12-23T11:29:04.000' AS DateTime), NULL, 1, 1, CAST(N'2019-12-23T11:29:07.000' AS DateTime), NULL)
INSERT [dbo].[RegistroHora] ([idRegistroHora], [idConvenio], [fechaHoraEntrada], [fechaHoraSalida], [observacion], [aprobado], [aprobadoFinanzas], [edit], [delet]) VALUES (2042, 1, CAST(N'2019-12-23T15:21:23.000' AS DateTime), NULL, NULL, 0, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[RegistroHora] OFF
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([idRol], [nombre]) VALUES (1, N'Jefe de GTH')
INSERT [dbo].[Rol] ([idRol], [nombre]) VALUES (2, N'Jefatura de Finanzas')
INSERT [dbo].[Rol] ([idRol], [nombre]) VALUES (3, N'Finanzas')
INSERT [dbo].[Rol] ([idRol], [nombre]) VALUES (4, N'Jefe de Departamento')
INSERT [dbo].[Rol] ([idRol], [nombre]) VALUES (5, N'Estudiante')
INSERT [dbo].[Rol] ([idRol], [nombre]) VALUES (6, N'Administrador')
SET IDENTITY_INSERT [dbo].[Rol] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (1, 1, 6, N'admin123', N'admin123', 1, CAST(N'2019-05-31T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (2, 2, 1, N'luis123', N'luis123', 1, CAST(N'2019-05-31T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (3, 3, 2, N'miguel123', N'miguel123', 1, CAST(N'2019-05-31T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (4, 4, 3, N'josue123', N'josue123', 1, CAST(N'2019-05-31T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (5, 5, 4, N'josias123', N'josias123', 1, CAST(N'2019-05-31T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (6, 6, 5, N'nayeli123', N'nayeli123', 1, CAST(N'2019-05-31T00:00:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (7, 7, 5, N'juanca', N'cab879', 1, CAST(N'2019-10-09T16:23:25.000' AS DateTime), NULL, NULL)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (8, 8, 5, N'edinso', N'cav879', 1, CAST(N'2019-10-09T18:13:45.000' AS DateTime), CAST(N'2019-10-09T18:14:08.000' AS DateTime), NULL)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (9, 9, 5, N'neymar', N'dos787', 1, CAST(N'2019-10-14T10:08:46.000' AS DateTime), CAST(N'2019-10-14T10:11:31.000' AS DateTime), NULL)
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (10, 10, 5, N'neymars', N'dos787', 1, CAST(N'2019-10-14T10:11:16.000' AS DateTime), NULL, CAST(N'2019-10-14T10:11:25.000' AS DateTime))
INSERT [dbo].[Usuario] ([idUsuario], [idPersona], [idRol], [usuario], [password], [estado], [register], [edit], [delet]) VALUES (11, 1011, 5, N'antoni', N'gar505', 1, CAST(N'2019-11-19T17:27:23.000' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
ALTER TABLE [dbo].[Acreedor]  WITH CHECK ADD FOREIGN KEY([idConvenio])
REFERENCES [dbo].[Convenio] ([idConvenio])
GO
ALTER TABLE [dbo].[Acreedor]  WITH CHECK ADD FOREIGN KEY([idInformeEstudiante])
REFERENCES [dbo].[InformeEstudiante] ([idInformeEstudiante])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Acreedor]  WITH CHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[AcreedorPendiente]  WITH CHECK ADD FOREIGN KEY([idConvenio])
REFERENCES [dbo].[Convenio] ([idConvenio])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AcreedorPendiente]  WITH CHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[Area]  WITH CHECK ADD FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[Departamento] ([idDepartamento])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AsignacionArea]  WITH CHECK ADD FOREIGN KEY([idArea])
REFERENCES [dbo].[Area] ([idArea])
GO
ALTER TABLE [dbo].[AsignacionArea]  WITH CHECK ADD FOREIGN KEY([idConvenio])
REFERENCES [dbo].[Convenio] ([idConvenio])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Convenio]  WITH CHECK ADD FOREIGN KEY([idBeca])
REFERENCES [dbo].[Beca] ([idBeca])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Convenio]  WITH CHECK ADD FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[Departamento] ([idDepartamento])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Convenio]  WITH CHECK ADD FOREIGN KEY([idPersona])
REFERENCES [dbo].[Persona] ([idPersona])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Descuento]  WITH CHECK ADD FOREIGN KEY([idAcreedor])
REFERENCES [dbo].[Acreedor] ([idAcreedor])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Descuento]  WITH CHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
GO
ALTER TABLE [dbo].[HistorialDepartamento]  WITH CHECK ADD FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[Departamento] ([idDepartamento])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Horario]  WITH CHECK ADD  CONSTRAINT [FK__Turno__delet__2E1BDC42] FOREIGN KEY([idConvenio])
REFERENCES [dbo].[Convenio] ([idConvenio])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Horario] CHECK CONSTRAINT [FK__Turno__delet__2E1BDC42]
GO
ALTER TABLE [dbo].[Horario]  WITH CHECK ADD  CONSTRAINT [FK__Turno__idDias__2F10007B] FOREIGN KEY([idDias])
REFERENCES [dbo].[Dias] ([idDias])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Horario] CHECK CONSTRAINT [FK__Turno__idDias__2F10007B]
GO
ALTER TABLE [dbo].[Horario]  WITH CHECK ADD  CONSTRAINT [FK_Horario_Turno] FOREIGN KEY([idTurno])
REFERENCES [dbo].[Turno] ([idTurno])
GO
ALTER TABLE [dbo].[Horario] CHECK CONSTRAINT [FK_Horario_Turno]
GO
ALTER TABLE [dbo].[InformeEstudiante]  WITH CHECK ADD FOREIGN KEY([idRegistroHora])
REFERENCES [dbo].[RegistroHora] ([idRegistroHora])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InformeFinanzas]  WITH CHECK ADD FOREIGN KEY([idInformeEstudiante])
REFERENCES [dbo].[InformeEstudiante] ([idInformeEstudiante])
GO
ALTER TABLE [dbo].[InformeFinanzas]  WITH CHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Organizacion]  WITH CHECK ADD FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[Departamento] ([idDepartamento])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Organizacion]  WITH CHECK ADD FOREIGN KEY([idPersona])
REFERENCES [dbo].[Persona] ([idPersona])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RegistroHora]  WITH CHECK ADD FOREIGN KEY([idConvenio])
REFERENCES [dbo].[Convenio] ([idConvenio])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RegistroUsuario]  WITH CHECK ADD FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuario] ([idUsuario])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([idPersona])
REFERENCES [dbo].[Persona] ([idPersona])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD FOREIGN KEY([idRol])
REFERENCES [dbo].[Rol] ([idRol])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
