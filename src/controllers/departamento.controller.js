const {querySQL} = require("../db/cmdSQL");
const {dateNow} = require('../class/date');

module.exports = {
    getDepartamentoById: (req, res) =>{
        var query = "SELECT idDepartamento, nombre as nombreDepartamento, fechaRegistro, estado as estadoDepartamento FROM Departamento WHERE estado = 1 AND delet IS NULL "+
                    "AND idDepartamento = " +  req.params.idDepartamento;
                    querySQL(query, res);
    },
    //se utiliza para realizar el convenio
    getAllDepartamentos: (req, res) =>{
        var query = "SELECT idDepartamento, nombre as nombreDepartamento, fechaRegistro, estado as estadoDepartamento FROM Departamento WHERE estado = 1 AND delet IS NULL ORDER BY nombre ASC";
        querySQL(query, res);
    },
    getDepartamentos: (req, res) => {
        //Lista de los departamentos [Modulo Departamento]
        var query = "SELECT idDepartamento, nombre as nombreDepartamento, fechaRegistro as fechaRegistroDepartamento, estado as estadoDepartamento, edit as fechaEditDepartamento FROM Departamento WHERE delet IS NULL ORDER BY nombre ASC";
        querySQL(query, res);
    },
    getDepartamentoName: (req, res) => {
        var query = "SELECT * FROM Departamento WHERE nombre = '" + req.params.nameDepto +"' AND delet IS NULL";
        querySQL(query, res);
    },
    //Obtener todos los departamentos del jefe de departamento
    getDepartamentosUser: (req, res) => {
        var query = "SELECT de.idDepartamento, de.nombre as nombreDepartamento, de.estado as estadoDepartamento, de.edit as editDepartamento " +
                    "FROM Departamento de, Usuario us, Rol ro, Persona pe, Organizacion org " +
                    "WHERE us.idRol = ro.idRol " +
                    "AND us.idPersona = pe.idPersona " +
                    "AND pe.idPersona = org.idPersona " +
                    "AND org.idDepartamento = de.idDepartamento " +
                    "AND de.delet IS NULL " +
                    "AND org.delet IS NULL " +
                    "AND org.estado = 1 " +
                    "AND ro.idRol = " + req.params.idRol + " " +
                    "AND us.idUsuario = " + req.params.idUser + " AND de.estado = 1";
                    querySQL(query, res);
    },
    //Obtener todos los datos de un departamento -> se lo utiliza en informe de hoy
    getDepartamento: (req, res) => {
        var query = "SELECT de.idDepartamento, de.nombre as nombreDepartamento, de.fechaRegistro as fechaRegistroDepartamento, de.estado as estadoDepartamento, " +
                    "pe.idPersona, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, pe.direccion, pe.nacionalidad, pe.fechaNacimiento, pe.ci, pe.celular, pe.estado as estadoPersona, " +
                    "hd.limiteEstudiante, hd.costoHora, hd.fechaRegistro as fechaRegistroHistorialDepartamento, hd.edit as editHistorialDepartamento, " +
                    "org.idOrganizacion, org.fechaRegistro as fechaRegistroOrganizacion, org.estado as estadoOrganizacion " +
                    "FROM Departamento de, Persona pe, Organizacion org, HistorialDepartamento hd " +
                    "WHERE hd.idDepartamento = de.idDepartamento " +
                    "AND de.idDepartamento = org.idDepartamento " +
                    "AND org.idPersona = pe.idPersona " +
                    "AND hd.estado = 1 " +
                    'AND de.idDepartamento = ' + req.params.id;

                    querySQL(query, res);
    },
    addDepartamento: (req, res) => {
        var query = "INSERT INTO Departamento VALUES ( '" +
            req.body.nombreDepartamento + "', '" +
            dateNow() + "', 1, '"+dateNow+"', null)";
            querySQL(query, res);
    },
    updateDepartamento: (req, res) => {

        var query = "UPDATE Departamento SET " +
            "nombre = '" + req.body.nombreDepartamento + "', " +
            "estado = " + req.body.estadoDepartamento + ", " +
            "edit = '" + dateNow + "' "+
            " WHERE idDepartamento = " + req.params.id;

            querySQL(query, res);
    },
    updateEstadoDepartamento: (req, res) => {
        var query = "UPDATE Departamento SET " +
                    "estado = " + req.body.estadoDepartamento + ", " +
                    "edit = '" + dateNow + "' "+
                    "WHERE idDepartamento = " + req.params.id;
                    querySQL(query, res);
    },
    deleteDepartamento: (req, res) => {

        var query = "UPDATE Departamento SET " +
            "delet = '" + dateNow + "' "+
            "WHERE idDepartamento = " + req.params.id;

            querySQL(query, res);
    }
};