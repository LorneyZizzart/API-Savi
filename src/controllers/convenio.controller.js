const {querySQL} = require("../db/cmdSQL");
const {dateNow} = require('../class/date');

module.exports = {
    getConvenios: (req, res) => {
        var query = "SELECT co.idConvenio, pe.codEstudiante, pe.idPersona, pe.idCarrera, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, pe.semestre, pe.direccion, pe.nacionalidad, pe.fechaNacimiento, pe.ci, pe.celular, pe.estado as estadoPersona, " +
                    "de.idDepartamento, de.nombre as departamento, " +
                    "be.idBeca, be.nombre as beca, " +
                    "co.fechaInicio, co.fechaFinal, co.fotocopiaCarnet, co.solicitudTrabajo, co.estado as estadoConvenio " +
                    "FROM Convenio co, Persona pe, Departamento de, Beca be " +
                    "WHERE co.idPersona = pe.idPersona " +
                    "AND co.idDepartamento = de.idDepartamento " +
                    "AND co.idBeca = be.idBeca " + 
                    "AND co.delet IS NULL ORDER BY pe.primerApellido ASC";
                    querySQL(query, res);
    },
    getConvenio: (req, res) => {
        var query = "SELECT co.idConvenio, pe.codEstudiante, pe.idPersona, pe.idCarrera, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, pe.semestre, pe.direccion, pe.nacionalidad, pe.fechaNacimiento, pe.ci, pe.celular, pe.estado as estadoPersona, " +
                    "de.idDepartamento, de.nombre as departamento, " +
                    "be.idBeca, be.nombre as beca, " +
                    "co.fechaInicio, co.fechaFinal, co.fotocopiaCarnet, co.solicitudTrabajo, co.estado as estadoConvenio " +
                    "FROM Convenio co, Persona pe, Departamento de, Beca be " +
                    "WHERE co.idPersona = pe.idPersona " +
                    "AND co.idDepartamento = de.idDepartamento " +
                    "AND co.idBeca = be.idBeca " + 
                    "AND co.delet IS NULL AND idConvenio = " + req.params.id;
                    querySQL(query, res);
    },
    getConvenioByUsuario : (req, res ) => {
        var query = "SELECT co.idConvenio, co.idDepartamento, co.idPersona, co.idBeca, co.fechaInicio, co.fechaFinal, co.fotocopiaCarnet, co.solicitudTrabajo, co.estado, co.register, co.edit " +
                    "FROM Convenio co, Persona pe, Usuario us " +
                    "WHERE us.idPersona = pe.idPersona "+ 
                    "AND pe.idPersona = co.idPersona " +
                    "AND us.delet IS NULL " + 
                    "and pe.delet  IS NULL " + 
                    "AND co.delet IS NULL " +
                    "AND us.idUsuario = " + req.params.idUsuario;
                    querySQL(query, res);
    },
    addConvenio: (req, res) => {

        var query = "INSERT INTO Convenio VALUES(" +
            req.body.idDepartamento + ", " +
            req.body.idPersona + ", " +
            req.body.idBeca + ", '" + 
            req.body.fechaInicio + "', '" +
            req.body.fechaFinal + "', " + 
            req.body.fotocopiaCarnet + ", " +
            req.body.solicitudTrabajo + ", 1, '" +
            dateNow + "', null, null)";

            querySQL(query, res);
    },
    updateConvenio: (req, res) => {
        var query = "UPDATE Convenio SET " +
            "idDepartamento = " + req.body.idDepartamento + ", " +
            "idBeca = " + req.body.idBeca + ", " +
            "fechaInicio = '" + req.body.fechaInicio + "', " +
            "fechaFinal = '" + req.body.fechaFinal + "', " +
            "fotocopiaCarnet = " + req.body.fotocopiaCarnet + ", " +
            "solicitudTrabajo = " + req.body.solicitudTrabajo + ", " +
            "edit = '" + dateNow + "' " + 
            "WHERE idConvenio = " + req.params.id;

            querySQL(query, res);
    },
    updateEstadoConvenio: (req, res) => {
        var query = "UPDATE Convenio SET estado = " + req.body.estadoConvenio + ", " +
                    "edit = '" + dateNow + "' " + 
                    "WHERE idConvenio = " + req.params.id;
                    querySQL(query, res);
    },
    deleteConvenio: (req, res) => {

        var query = "UPDATE Convenio SET " +
                    "delet = '" + dateNow + "' " + 
                    "WHERE idConvenio = " + req.params.id;

                    querySQL(query, res);
    }
};