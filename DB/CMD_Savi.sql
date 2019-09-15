-- Carrera
INSERT INTO Carrera VALUES('Ingeniería Comercial', '31/05/2019', NULL, NULL, 1)
INSERT INTO Carrera VALUES('Contaduria Pública', '31/05/2019', NULL, NULL, 1)
INSERT INTO Carrera VALUES('Ingeniería Financiera', '31/05/2019', NULL, NULL, 1)
INSERT INTO Carrera VALUES('Adminisrtación y negocios internacionales', '31/05/2019', NULL, NULL, 1)
INSERT INTO Carrera VALUES('Enfermería', '31/05/2019', NULL, NULL, 1)
INSERT INTO Carrera VALUES('Nutrición', '31/05/2019', NULL, NULL, 1)
INSERT INTO Carrera VALUES('Fisioterapia y Kinesiología', '31/05/2019', NULL, NULL, 1)
INSERT INTO Carrera VALUES('Bioquímica', '31/05/2019', NULL, NULL, 1)
INSERT INTO Carrera VALUES('Ingeniería de Sistemas', '31/05/2019', NULL, NULL, 1)
INSERT INTO Carrera VALUES('Ingeniería Ambiental', '31/05/2019', NULL, NULL, 1)
INSERT INTO Carrera VALUES('Ingeniería en Redes y Telecomunicaciones', '31/05/2019', NULL, NULL, 1)
INSERT INTO Carrera VALUES('Psicología', '31/05/2019', NULL, NULL, 1)
INSERT INTO Carrera VALUES('Psicopedagogía', '31/05/2019', NULL, NULL, 1)
INSERT INTO Carrera VALUES('Actividad fisica y deportes', '31/05/2019', NULL, NULL, 1)
INSERT INTO Carrera VALUES('Teología', '31/05/2019', NULL, NULL, 1)

-- Departamento
INSERT INTO Departamento VALUES('Limpieza', '31/05/2019', 1, NULL, NULL);
INSERT INTO Departamento VALUES('Biblioteca', '31/05/2019', 1, NULL, NULL);

-- Persona
INSERT INTO Persona VALUES(null, null, 'Jhonny', null, 'Gutierrez', 'Villca', '8282702', null, 'Bolivia', 'Calle 1', 60607170, '11/09/1994', 1, '31/05/2019', null, null);
INSERT INTO Persona VALUES(NULL, NULL, 'Luis', 'Fernando', 'Gutierrez', 'Villca', '123456', NULL, 'Bolivia', 'Calle 2', 78932111, '09/12/1998', 1, '31/05/2019', NULL, NULL);
INSERT INTO Persona VALUES(NULL, NULL, 'Miguel', 'Angel', 'Gutierrez', 'Villca', '123456', NULL, 'Bolivia', 'Calle 2', 78932111, '09/12/1999', 1, '31/05/2019', NULL, NULL);
INSERT INTO Persona VALUES(NULL, NULL, 'Josue', NULL, 'Gutierrez', 'Villca', '123456', NULL, 'Bolivia', 'Calle 2', 78932111, '09/12/2000', 1, '31/05/2019', NULL, NULL);
INSERT INTO Persona VALUES(NULL, NULL, 'Josias', NULL, 'Gutierrez', 'Villca', '123456', NULL, 'Bolivia', 'Calle 2', 78932111, '09/12/2016', 1, '31/05/2019', NULL, NULL);
INSERT INTO Persona VALUES(NULL, NULL, 'Rut', 'Nayeli', 'Gutierrez', 'Villca', '123456', NULL, 'Bolivia', 'Calle 2', 78932111, '09/12/2006', 1, '31/05/2019', NULL, NULL);



-- Rol
INSERT INTO Rol VALUES('Jefe de GTH');
INSERT INTO Rol VALUES('Jefatura de Finanzas');
INSERT INTO Rol VALUES('Finanzas');
INSERT INTO Rol VALUES('Jefe de Departamento');
INSERT INTO Rol VALUES('Estudiante');
INSERT INTO Rol VALUES('Administrador');

-- Usuario
INSERT INTO Usuario VALUES(1, 6, 'admin123', 'admin123', 1, '31/05/2019', null, null);
INSERT INTO Usuario VALUES(2, 1, 'luis123', 'luis123', 1, '31/05/2019', NULL, NULL);
INSERT INTO Usuario VALUES(3, 2, 'miguel123', 'miguel123', 1, '31/05/2019', NULL, NULL);
INSERT INTO Usuario VALUES(4, 3, 'josue123', 'josue123', 1, '31/05/2019', NULL, NULL);
INSERT INTO Usuario VALUES(5, 4, 'josias123', 'josias123', 1, '31/05/2019', NULL, NULL);
INSERT INTO Usuario VALUES(6, 5, 'nayeli123', 'nayeli123', 1, '31/05/2019', NULL, NULL);

--Historial Departamento
INSERT INTO HistorialDepartamento VALUES(1, 33, '7', '31/05/2019', 1, NULL, NULL)
INSERT INTO HistorialDepartamento VALUES(1, 30, '6.50', '31/05/2019', 0, NULL, NULL)

-- Organizacion
INSERT INTO Organizacion VALUES(1, 5, '31/05/2019', 1, NULL, NULL)

-- BECA
INSERT INTO Beca VALUES ('Beca Industrial', 1, '31/05/2019', '31/05/2019', NULL)
INSERT INTO Beca VALUES ('Beca Institucional', 1, '31/05/2019', '31/05/2019', NULL)

-- Convenio
INSERT INTO Convenio VALUES(1, 6, 2, '01/01/2019', '28/06/2019', 1, 1, 1, '31/05/2019', '31/05/2019', NULL)
