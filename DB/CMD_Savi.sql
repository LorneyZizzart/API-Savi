SELECT * FROM Persona
SELECT * FROM Usuario
SELECT * FROM Rol

-- Carrera
INSERT INTO Carrera VALUES('Ingeniería Comercial', '2019/05/31', NULL, NULL, 1)
INSERT INTO Carrera VALUES('Contaduria Pública', '2019/05/31', NULL, NULL, 1)
INSERT INTO Carrera VALUES('Ingeniería Financiera', '2019/05/31', NULL, NULL, 1)
INSERT INTO Carrera VALUES('Adminisrtación y negocios internacionales', '2019/05/31', NULL, NULL, 1)
INSERT INTO Carrera VALUES('Enfermería', '2019/05/31', NULL, NULL, 1)
INSERT INTO Carrera VALUES('Nutrición', '2019/05/31', NULL, NULL, 1)
INSERT INTO Carrera VALUES('Fisioterapia y Kinesiología', '2019/05/31', NULL, NULL, 1)
INSERT INTO Carrera VALUES('Bioquímica', '2019/05/31', NULL, NULL, 1)
INSERT INTO Carrera VALUES('Ingeniería de Sistemas', '2019/05/31', NULL, NULL, 1)
INSERT INTO Carrera VALUES('Ingeniería Ambiental', '2019/05/31', NULL, NULL, 1)
INSERT INTO Carrera VALUES('Ingeniería en Redes y Telecomunicaciones', '2019/05/31', NULL, NULL, 1)
INSERT INTO Carrera VALUES('Psicología', '2019/05/31', NULL, NULL, 1)
INSERT INTO Carrera VALUES('Psicopedagogía', '2019/05/31', NULL, NULL, 1)
INSERT INTO Carrera VALUES('Actividad fisica y deportes', '2019/05/31', NULL, NULL, 1)
INSERT INTO Carrera VALUES('Teología', '2019/05/31', NULL, NULL, 1)

-- Departamento
INSERT INTO Departamento VALUES('Limpieza', '2019/05/31', 1, NULL, NULL);
INSERT INTO Departamento VALUES('Biblioteca', '2019/05/31', 1, NULL, NULL);

-- Persona
INSERT INTO Persona VALUES(null, null, 'Jhonny', null, 'Gutierrez', 'Villca', '8282702', null, 'Bolivia', 'Calle 1', 60607170, '1994/11/09', 1, '2019/05/27', null, null);
INSERT INTO Persona VALUES(NULL, NULL, 'Luis', 'Fernando', 'Gutierrez', 'Villca', '123456', NULL, 'Bolivia', 'Calle 2', 78932111, '1998/09/12', 1, '2019/05/27', NULL, NULL);
INSERT INTO Persona VALUES(NULL, NULL, 'Miguel', 'Angel', 'Gutierrez', 'Villca', '123456', NULL, 'Bolivia', 'Calle 2', 78932111, '1999/09/12', 1, '2019/05/27', NULL, NULL);
INSERT INTO Persona VALUES(NULL, NULL, 'Josue', NULL, 'Gutierrez', 'Villca', '123456', NULL, 'Bolivia', 'Calle 2', 78932111, '2000/09/12', 1, '2019/05/27', NULL, NULL);
INSERT INTO Persona VALUES(NULL, NULL, 'Josias', NULL, 'Gutierrez', 'Villca', '123456', NULL, 'Bolivia', 'Calle 2', 78932111, '2016/09/12', 1, '2019/05/27', NULL, NULL);
INSERT INTO Persona VALUES(NULL, NULL, 'Rut', 'Nayeli', 'Gutierrez', 'Villca', '123456', NULL, 'Bolivia', 'Calle 2', 78932111, '2006/09/12', 1, '2019/05/27', NULL, NULL);



-- Rol
INSERT INTO Rol VALUES('Jefe de GTH');
INSERT INTO Rol VALUES('Jefatura de Finanzas');
INSERT INTO Rol VALUES('Finanzas');
INSERT INTO Rol VALUES('Jefe de Departamento');
INSERT INTO Rol VALUES('Estudiante');
INSERT INTO Rol VALUES('Administrador');

-- Usuario
INSERT INTO Usuario VALUES(1, 6, 'admin123', 'admin123', 1, '2019/05/27', null, null);
INSERT INTO Usuario VALUES(2, 1, 'luis123', 'luis123', 1, '2019/05/27', NULL, NULL);
INSERT INTO Usuario VALUES(3, 2, 'miguel123', 'miguel123', 1, '2019/05/27', NULL, NULL);
INSERT INTO Usuario VALUES(4, 3, 'josue123', 'josue123', 1, '2019/05/27', NULL, NULL);
INSERT INTO Usuario VALUES(5, 4, 'josias123', 'josias123', 1, '2019/05/27', NULL, NULL);
INSERT INTO Usuario VALUES(6, 5, 'nayeli123', 'nayeli123', 1, '2019/05/27', NULL, NULL);

--Historial Departamento
INSERT INTO HistorialDepartamento VALUES(1, 33, '7', '2019/05/27', 1, NULL, NULL)

--Organizacion
INSERT INTO Organizacion VALUES(1, 5, '2019/05/27', 1, NULL, NULL)
