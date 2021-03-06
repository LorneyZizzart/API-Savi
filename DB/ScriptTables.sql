USE [Savi]
GO
/****** Object:  Table [dbo].[Acreedor]    Script Date: 02/09/2019 13:35:38 ******/
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
/****** Object:  Table [dbo].[AcreedorPendiente]    Script Date: 02/09/2019 13:35:40 ******/
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
/****** Object:  Table [dbo].[Area]    Script Date: 02/09/2019 13:35:41 ******/
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
/****** Object:  Table [dbo].[AsignacionArea]    Script Date: 02/09/2019 13:35:42 ******/
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
/****** Object:  Table [dbo].[Beca]    Script Date: 02/09/2019 13:35:43 ******/
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
/****** Object:  Table [dbo].[Carrera]    Script Date: 02/09/2019 13:35:43 ******/
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
/****** Object:  Table [dbo].[Convenio]    Script Date: 02/09/2019 13:35:43 ******/
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
/****** Object:  Table [dbo].[Departamento]    Script Date: 02/09/2019 13:35:44 ******/
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
/****** Object:  Table [dbo].[Descuento]    Script Date: 02/09/2019 13:35:44 ******/
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
/****** Object:  Table [dbo].[Dias]    Script Date: 02/09/2019 13:35:45 ******/
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
/****** Object:  Table [dbo].[HistorialDepartamento]    Script Date: 02/09/2019 13:35:45 ******/
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
/****** Object:  Table [dbo].[InformeEstudiante]    Script Date: 02/09/2019 13:35:46 ******/
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
/****** Object:  Table [dbo].[InformeFinanzas]    Script Date: 02/09/2019 13:35:47 ******/
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
/****** Object:  Table [dbo].[Organizacion]    Script Date: 02/09/2019 13:35:47 ******/
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
/****** Object:  Table [dbo].[Persona]    Script Date: 02/09/2019 13:35:47 ******/
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
/****** Object:  Table [dbo].[RegistroHora]    Script Date: 02/09/2019 13:35:48 ******/
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
/****** Object:  Table [dbo].[RegistroUsuario]    Script Date: 02/09/2019 13:35:49 ******/
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
/****** Object:  Table [dbo].[Rol]    Script Date: 02/09/2019 13:35:50 ******/
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
/****** Object:  Table [dbo].[Turno]    Script Date: 02/09/2019 13:35:50 ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 02/09/2019 13:35:51 ******/
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
