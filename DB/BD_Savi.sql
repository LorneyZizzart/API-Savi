USE master
drop database Savi;
CREATE DATABASE Savi
USE Savi

-- 1 
CREATE TABLE Persona (
  idPersona int not null IDENTITY(1,1) PRIMARY KEY,
  idCarrera INT NULL,
  codEstudiante INT NULL,
  primerNombre VARCHAR(50) NOT NULL,
  segundoNombre VARCHAR(50) NULL,
  primerApellido VARCHAR(50) NOT NULL,
  segundoApellido VARCHAR(50) NULL,
  ci VARCHAR(25) NOT NULL,
  semestre INT NULL,
  nacionalidad VARCHAR(60) NOT NULL,
  direccion VARCHAR(70) NOT NULL,
  celular INT NOT NULL,
  fechaNacimiento DATE NOT NULL,
  estado BIT NOT NULL,
  register DATETIME NOT NULL,
  edit DATETIME NULL,
  delet DATETIME NULL
);

-- 2
CREATE TABLE Carrera (
    idCarrera INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    register DATETIME NOT NULL,
    edit DATETIME NULL,
    delet DATETIME NULL,
    estado BIT NULL
);

-- 3
CREATE TABLE Departamento(
    idDepartamento INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    fechaRegistro DATETIME NOT NULL,
    estado BIT NOT NULL,
    edit DATETIME NULL,
    delet DATETIME NULL,
);

-- 4 
CREATE TABLE Beca (
    idBeca INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    estado BIT NOT NULL,
    register DATETIME NULL,
    edit DATETIME NULL,
    delet DATETIME NULL
);

-- 5
CREATE TABLE Dias (
    idDias INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(20)
);

-- 6
CREATE TABLE Rol (
    idRol INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(25) NOT NULL
);

-- 7 
CREATE TABLE HistorialDepartamento (
    idHistorialDepartamento INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    idDepartamento INT NOT NULL,
    limiteEstudiante INT NOT NULL,
    costoHora VARCHAR(20) NOT NULL,
    fechaRegistro DATETIME NOT NULL,
    estado BIT NOT NULL,
    edit DATETIME NULL,
    delet DATETIME NULL,
    FOREIGN KEY(idDepartamento) REFERENCES Departamento(idDepartamento) ON UPDATE CASCADE ON DELETE CASCADE
);

-- 8
CREATE TABLE Area (
    idArea INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    idDepartamento INT NOT NULL,
    nombre VARCHAR (50) NOT NULL,
    fechaRegistro DATETIME NOT NULL, 
    estado BIT NOT NULL,
    edit DATETIME NULL,
    delet DATETIME NULL,
    FOREIGN KEY(idDepartamento) REFERENCES Departamento(idDepartamento) ON UPDATE CASCADE ON DELETE CASCADE
);

-- 9
CREATE TABLE Organizacion (
    idOrganizacion INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    idDepartamento INT NOT NULL,
    idPersona INT NOT NULL,
    fechaRegistro DATETIME NOT NULL,
    estado BIT NOT NULL,
    edit DATETIME NULL,
    delet DATETIME NULL,
    FOREIGN KEY(idDepartamento) REFERENCES Departamento(idDepartamento) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(idPersona) REFERENCES Persona(idPersona) ON UPDATE CASCADE ON DELETE CASCADE
);

-- 10 
CREATE TABLE Convenio (
    idConvenio INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    idDepartamento INT NOT NULL,
    idPersona INT NOT NULL,
    idBeca INT NOT NULL,
    fechaInicio DATE NOT NULL,
    fechaFinal DATE  NULL,
    fotocopiaCarnet BIT NULL,
    solicitudTrabajo BIT NULL,
    estado BIT NULL,
    register DATETIME NULL,
    edit DATETIME NULL,
    delet DATETIME NULL,
    FOREIGN KEY(idDepartamento) REFERENCES Departamento(idDepartamento) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(idPersona) REFERENCES Persona(idPersona) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(idBeca) REFERENCES Beca(idBeca) ON UPDATE CASCADE ON DELETE CASCADE
);

-- 11
CREATE TABLE AsignacionArea (
    idAsignacionArea INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    idConvenio INT NOT NULL,
    idArea INT NOT NULL,
    fechaRegistro DATETIME NOT NULL,
    estado BIT NOT NULL,
    edit DATETIME NULL,
    delet DATETIME NULL,
    FOREIGN KEY(idConvenio) REFERENCES Convenio(idConvenio) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(idArea) REFERENCES Area(idArea)
);

-- 12 
CREATE TABLE Turno (
    idTurno INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    idConvenio INT NOT NULL,
    idDias INT NOT NULL,
    horaEntrada DATETIME NOT NULL,
    horaSalida DATETIME NOT NULL,
    register DATETIME NULL,
    edit DATETIME NULL,
    delet DATETIME NULL
    FOREIGN KEY(idConvenio) REFERENCES Convenio(idConvenio) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(idDias) REFERENCES Dias(idDias) ON UPDATE CASCADE ON DELETE CASCADE
);

-- 13
CREATE TABLE RegistroHora (
    idRegistroHora INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    idConvenio INT NULL,
    fechaHoraEntrada DATETIME NULL,
    fechaHoraSalida DATETIME NULL,
    observacion VARCHAR(200) NULL,
    aprobado BIT NULL,
    aprobadoFinanzas BIT NULL,
    edit DATETIME NULL,
    delet DATETIME NULL
    FOREIGN KEY(idConvenio) REFERENCES Convenio(idConvenio) ON UPDATE CASCADE ON DELETE CASCADE
);

-- 14
CREATE TABLE InformeEstudiante (
    idInformeEstudiante INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    idRegistroHora INT NOT NULL,
    fecha DATETIME NOT NULL,
    totalHoras VARCHAR(12) NOT NULL,
    totalSaldo VARCHAR(12) NOT NULL,
    aprobadoJefeDep DATETIME NOT NULL,
    aprobadoFinanzas BIT NULL,
    revisadoFinanzas DATETIME NULL,
    archivar DATETIME NULL, 
    delet DATETIME NULL,
    FOREIGN KEY(idRegistroHora) REFERENCES RegistroHora(idRegistroHora) ON UPDATE CASCADE ON DELETE CASCADE
);

-- 15 
CREATE TABLE Usuario (
    idUsuario INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    idPersona INT NOT NULL,
    idRol INT NOT NULL,
    usuario VARCHAR(40) NOT NULL,
    password VARCHAR(200) NOT NULL,
    estado BIT NOT NULL,
    register DATETIME NOT NULL,
    edit DATETIME NULL,
    delet DATETIME NULL,
    FOREIGN KEY(idPersona) REFERENCES Persona(idPersona) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(idRol) REFERENCES Rol(idRol) ON UPDATE CASCADE ON DELETE CASCADE
);

-- 16
CREATE TABLE InformeFinanzas (
    idInformeFinanzas INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    idUsuario INT NOT NULL,
    idInformeEstudiante INT NOT NULL,
    totalHoras VARCHAR(12) NOT NULL,
    totalSaldo VARCHAR(12) NOT NULL,
    observacion VARCHAR(150) NULL,
    fechaAprobada DATETIME NOT NULL,
    delet DATETIME NULL,
    archivar DATETIME NULL,
    FOREIGN KEY(idUsuario) REFERENCES Usuario(idUsuario) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(idInformeEstudiante) REFERENCES InformeEstudiante(idInformeEstudiante)
);

-- 17
CREATE TABLE Acreedor (
    idAcreedor INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    idInformeEstudiante INT NOT NULL, 
    idConvenio INT NOT NULL,
    idUsuario INT NOT NULL,
    fechaAsignado DATETIME NOT NULL,
    montoBs VARCHAR(20) NOT NULL,
    estado BIT NOT NULL,
    archivar DATETIME NULL,
    edit DATETIME NULL,
    delet DATETIME NULL,
    FOREIGN KEY(idInformeEstudiante) REFERENCES InformeEstudiante(idInformeEstudiante) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(idConvenio) REFERENCES Convenio(idConvenio),
    FOREIGN KEY(idUsuario) REFERENCES Usuario(idUsuario)
);

-- 18
CREATE TABLE AcreedorPendiente (
    idAcreedorPendiente INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    idConvenio INT NOT NULL,
    idUsuario INT NOT NULL,
    saldo VARCHAR(20) NOT NULL,
    register DATETIME NOT NULL,
    estado BIT NULL,
    edit DATETIME NULL,
    delet DATETIME NULL,
    FOREIGN KEY(idConvenio) REFERENCES Convenio(idConvenio) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(idUsuario) REFERENCES Usuario(idUsuario)
);

-- 19
CREATE TABLE Descuento (
    idDescuento INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    idAcreedor INT NOT NULL,
    idUsuario INT NOT NULL,
    fechaDescuento DATETIME NOT NULL,
    saldoInicial VARCHAR(25) NULL,
    montoBs VARCHAR(25) NOT NULL,
    observacion TEXT NULL,
    edit DATETIME NULL,
    delet DATETIME NULL,
    FOREIGN KEY(idAcreedor) REFERENCES Acreedor(idAcreedor) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY(idUsuario) REFERENCES Usuario(idUsuario)
);

-- 20
CREATE TABLE RegistroUsuario (
    idRegistroUsuario INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    idUsuario INT NOT NULL,
    login DATETIME NOT NULL,
    singOut DATETIME NULL,
    FOREIGN KEY(idUsuario) REFERENCES Usuario(idUsuario) ON UPDATE CASCADE ON DELETE CASCADE
);