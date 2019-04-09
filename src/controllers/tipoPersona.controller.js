var sql = require('mssql');
const config = require('../db/config.db');

async function cmdSQL(query, res) {

    new sql.ConnectionPool(config).connect().then(pool => {
        return pool.request().query(query)
    }).then(result => {
        let rows = result.recordset
        res.setHeader('Access-Control-Allow-Origin', '*');
        res.status(200).json(rows);
        sql.close();
    }).catch(err => {
        res.status(500).send({ message: "${err}"})
        sql.close();
    })
}

function dateNow(){
    var fechaRegistro = new Date();
        var dd = fechaRegistro.getDate();
        var mm = fechaRegistro.getMonth() + 1;
        var yyyy = fechaRegistro.getFullYear();

        if (dd < 10) {
            dd = '0' + dd;
          }
          
          if (mm < 10) {
            mm = '0' + mm;
          }

          return fechaRegistro = yyyy+'/'+mm+'/'+dd;
}

module.exports = {
    getTipoPersona: (req, res) => {
        //se utiliza para realizar el convenio se lista a todos los estudiantes
        var query = "SELECT pe.idPersona, us.idUsuario, us.idRol, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, pe.ci, ca.idCarrera, ca.nombre as carrera, pe.semestre, pe.nacionalidad, pe.direccion, pe.celular, pe.fechaNacimiento, " +
                    "pe.estado as estadoPersona, us.estado as estadoUsuario " +
                    "FROM Persona pe, Usuario us, Carrera ca " +
                    "WHERE pe.idPersona = us.idPersona " +
                    "AND pe.idCarrera = ca.idCarrera " +
                    "AND us.delet IS NULL " +
                    "AND us.idRol = " + req.params.idRol;
        cmdSQL(query, res);
    },
    //Listar los estudiantes x departamento que estan activos 
    getEstudianteDepartamento: (req, res) => {
        var query = "SELECT pe.idPersona, us.idUsuario, us.idRol, co.idConvenio, de.idDepartamento, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, ca.idCarrera, ca.nombre as carrera, pe.direccion, pe.nacionalidad, pe.fechaNacimiento, pe.ci, pe.celular, pe.estado as estadoPersona, " +
                    "us.estado as estadoUsuario, " +
                    "de.idDepartamento, de.nombre as departamento, " +
                    "be.idBeca, be.nombre as beca, " +
                    "co.fechaInicio, co.fechaFinal, co.fotocopiaCarnet, co.solicitudTrabajo, co.estado as estadoConvenio " +
                    "FROM Persona pe, Usuario us, Convenio co, Departamento de, Beca be, Carrera ca " +
                    "WHERE pe.idPersona = us.idPersona " +
                    "AND pe.idPersona = co.idPersona " +
                    "AND pe.idCarrera = ca.idCarrera " +
                    "AND co.idDepartamento = de.idDepartamento " +
                    "AND co.idBeca = be.idBeca  " +
                    "AND us.idRol = 5 " +
                    "AND de.idDepartamento = " + req.params.idDep + " " +
                    "AND us.estado = 1 " +
                    "AND co.estado = 1 " +
                    "AND us.delet IS NULL " +
                    "AND co.delet IS NULL " +
                    "ORDER BY pe.primerApellido ASC";
        cmdSQL(query, res);
    },
    //Listar los estudiantes x departamento para informacion
    getEstudianteInfo: (req, res) => {
        var query = "SELECT pe.idPersona, us.idUsuario, us.idRol, co.idConvenio, de.idDepartamento, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, ca.idCarrera, ca.nombre as carrera, pe.semestre, pe.direccion, pe.nacionalidad, pe.fechaNacimiento, pe.ci, pe.celular, pe.estado as estadoPersona, " +
                    "us.estado as estadoUsuario, " +
                    "de.idDepartamento, de.nombre as departamento, " +
                    "ar. nombre as nombreArea, " +
                    "be.idBeca, be.nombre as beca, " + 
                    "co.fechaInicio, co.fechaFinal, co.fotocopiaCarnet, co.solicitudTrabajo, co.estado as estadoConvenio " +
                    "FROM Persona pe, Usuario us, Convenio co, Departamento de, Beca be, Area ar, AsignacionArea aa, Carrera ca " +
                    "WHERE pe.idPersona = us.idPersona " +
                    "AND pe.idPersona = co.idPersona " +
                    "AND pe.idCarrera = ca.idCarrera " +
                    "AND co.idDepartamento = de.idDepartamento " +
                    "AND co.idBeca = be.idBeca " +
                    "AND de.idDepartamento = ar.idDepartamento " +
                    "AND ar.idArea = aa.idArea " +
                    "AND aa.idConvenio = co.idConvenio " +
                    "AND us.idRol = 5 " +
                    "AND aa.delet IS NULL " +
                    "AND de.idDepartamento = " + req.params.idDep + " " +
                    "ORDER BY pe.primerApellido ASC";
        cmdSQL(query, res);
    },
    //Listar los estudiantes para finanzas para la informacion de los estudiantes
    getEstudianteInfoFinanzas: (req, res) => {
        var query = "SELECT pe.idPersona, pe.codEstudiante, us.idUsuario, us.idRol, co.idConvenio, de.idDepartamento, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, ca.idCarrera, ca.nombre as carrera, pe.semestre, pe.direccion, pe.nacionalidad, pe.fechaNacimiento, pe.ci, pe.celular, pe.estado as estadoPersona, " +
                    "us.estado as estadoUsuario, " +
                    "de.idDepartamento, de.nombre as departamento, " +
                    "ar. nombre as nombreArea, " +
                    "be.idBeca, be.nombre as beca, " + 
                    "co.fechaInicio, co.fechaFinal, co.fotocopiaCarnet, co.solicitudTrabajo, co.estado as estadoConvenio " +
                    "FROM Persona pe, Usuario us, Convenio co, Departamento de, Beca be, Area ar, AsignacionArea aa, Carrera ca " +
                    "WHERE pe.idPersona = us.idPersona " +
                    "AND pe.idPersona = co.idPersona " +
                    "AND pe.idCarrera = ca.idCarrera " +
                    "AND co.idDepartamento = de.idDepartamento " +
                    "AND co.idBeca = be.idBeca " +
                    "AND de.idDepartamento = ar.idDepartamento " +
                    "AND ar.idArea = aa.idArea " +
                    "AND aa.idConvenio = co.idConvenio " +
                    "AND us.idRol = 5 " +
                    "AND aa.delet IS NULL " +
                    "ORDER BY pe.primerApellido ASC";
        cmdSQL(query, res);
    },
    //Buscar estudiante con datos para finanzas
    getEstudianteInfoF: (req, res) => {
        var query = "SELECT pe.idPersona, pe.codEstudiante, us.idUsuario, us.idRol, co.idConvenio, de.idDepartamento, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, ca.idCarrera, ca.nombre as carrera, pe.semestre, pe.direccion, pe.nacionalidad, pe.fechaNacimiento, pe.ci, pe.celular, pe.estado as estadoPersona, " +
                    "us.estado as estadoUsuario, " +
                    "de.idDepartamento, de.nombre as departamento, " +
                    "ar. nombre as nombreArea, " +
                    "be.idBeca, be.nombre as beca, " + 
                    "co.fechaInicio, co.fechaFinal, co.fotocopiaCarnet, co.solicitudTrabajo, co.estado as estadoConvenio " +
                    "FROM Persona pe, Usuario us, Convenio co, Departamento de, Beca be, Area ar, AsignacionArea aa, Carrera ca " +
                    "WHERE pe.idPersona = us.idPersona " +
                    "AND pe.idPersona = co.idPersona " +
                    "AND pe.idCarrera = ca.idCarrera " +
                    "AND co.idDepartamento = de.idDepartamento " +
                    "AND co.idBeca = be.idBeca " +
                    "AND de.idDepartamento = ar.idDepartamento " +
                    "AND ar.idArea = aa.idArea " +
                    "AND aa.idConvenio = co.idConvenio " +
                    "AND pe.idPersona = " + req.params.id
                    "AND us.idRol = 5 " +
                    "AND aa.delet IS NULL " +
                    "ORDER BY pe.primerApellido ASC";
        cmdSQL(query, res);
    },
    //Buscar estudiante X EL idConvenio PARA ver su historial de acreedor
    getConvenioHistorial: (req, res) => {
        var query = "SELECT pe.idPersona, pe.codEstudiante, us.idUsuario, us.idRol, co.idConvenio, de.idDepartamento, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, ca.idCarrera, ca.nombre as carrera, pe.semestre, pe.direccion, pe.nacionalidad, pe.fechaNacimiento, pe.ci, pe.celular, pe.estado as estadoPersona, " +
                    "us.estado as estadoUsuario, " +
                    "de.idDepartamento, de.nombre as departamento, " +
                    "ar. nombre as nombreArea, " +
                    "be.idBeca, be.nombre as beca, " + 
                    "co.fechaInicio, co.fechaFinal, co.fotocopiaCarnet, co.solicitudTrabajo, co.estado as estadoConvenio " +
                    "FROM Persona pe, Usuario us, Convenio co, Departamento de, Beca be, Area ar, AsignacionArea aa, Carrera ca  " +
                    "WHERE pe.idPersona = us.idPersona " +
                    "AND pe.idPersona = co.idPersona " +
                    "AND pe.idCarrera = ca.idCarrera " +
                    "AND co.idDepartamento = de.idDepartamento " +
                    "AND co.idBeca = be.idBeca " +
                    "AND de.idDepartamento = ar.idDepartamento " +
                    "AND ar.idArea = aa.idArea " +
                    "AND aa.idConvenio = co.idConvenio " +
                    "AND co.idConvenio = " + req.params.idConvenio + " " +
                    "AND us.idRol = 5 " +
                    "AND aa.delet IS NULL ";
        cmdSQL(query, res);
    },
    getMaxIdPersona: (req, res) => {
        var query = "SELECT max(idPersona) as idPersona FROM Persona";
        cmdSQL(query, res);
    },
    addTipoPersona: (req, res) => {},
    updateTipoPersona: (req, res) => { }
};