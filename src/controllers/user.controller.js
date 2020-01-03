const cryptoJS =  require('../class/crypto');
const {querySQL, authToken} = require("../db/cmdSQL");
const {dateNow} = require('../class/date');


module.exports = {
    //VER LOS USUARIOS PARA FINANZAS
    getUsers: (req, res) => {
        var query = null;
        if(req.params.idRol == 6){
            query = "SELECT pe.idPersona, pe.idCarrera, us.idUsuario, us.idRol, pe.codEstudiante, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, pe.semestre, pe.direccion, pe.nacionalidad, pe.fechaNacimiento, pe.ci, pe.celular, " +
                    "pe.estado as estadoPersona, us.estado as estadoUsuario, us.usuario, us.password " +
                    "FROM Persona pe, Usuario us " +
                    "WHERE pe.idPersona = us.idPersona " +
                    "AND us.idRol != 4 " +
                    "AND us.idRol != 5 " +
                    "AND us.delet IS NULL " +
                    "ORDER BY pe.primerApellido ASC ";
        }else if(req.params.idRol == 2 || req.params.idRol == 3){
            query = "SELECT pe.idPersona, pe.idCarrera, us.idUsuario, us.idRol, pe.codEstudiante, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, pe.semestre, pe.direccion, pe.nacionalidad, pe.fechaNacimiento, pe.ci, pe.celular, " +
                    "pe.estado as estadoPersona, us.estado as estadoUsuario, us.usuario, us.password " +
                    "FROM Persona pe, Usuario us " +
                    "WHERE pe.idPersona = us.idPersona " +
                    "AND us.idRol != 1 " +
                    "AND us.idRol != 6 " +
                    "AND us.delet IS NULL " +
                    "ORDER BY pe.primerApellido ASC ";
        }
        
        querySQL(query, res);
    },//obtener datos del usuario para el navbar
    getUser: (req, res) => {

        var query = "SELECT pe.idPersona, us.idUsuario, us.idRol, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, " +
                    "rl.nombre as rol, us.estado as estadoUsuario " +
                    "FROM Usuario us, Rol rl, Persona pe " +
                    "WHERE pe.idPersona = us.idPersona " +
                    "AND us.idRol = rl.idRol " +
                    "AND idUsuario = " + req.params.id;
        querySQL(query, res);
    },//para el login 
    getVerificarUser: (req, res) => {
        // var query = "SELECT idUsuario, idPersona, idRol, usuario, password, estado FROM Usuario WHERE usuario = '" + req.body.usuario + "' AND password = '" + req.body.password + "' AND delet IS NULL";
        var query = "SELECT idUsuario, idPersona, idRol, usuario, password, estado FROM Usuario WHERE usuario = '" + cryptoJS.get(req.body.usuario) + "' AND password = '" + cryptoJS.get(req.body.password) + "' AND delet IS NULL";
        authToken(query, res);
    },//para verificar si el nombre de usuario existe
    searchUser: (req, res) => {
        var query = "SELECT * FROM Usuario WHERE usuario = '" + req.params.usuario + "' AND delet IS NULL";
        cmdSQL(query, res);
    },
    addUser: (req, res) => {

        var query = "INSERT INTO Usuario VALUES(" +
            req.body.idPersona + "," +
            req.body.idRol + ", '" +
            req.body.usuario + "', '" +
            req.body.password + "', 1, '" +
            dateNow + "', null, null)";

        querySQL(query, res);
    },
    updateUser: (req, res) => {   
        var query = "UPDATE Usuario SET " +
            "idRol = " + req.body.idRol + ", " +
            "usuario = '" + req.body.usuario + "', " +
            "password = '" + req.body.password + "', " +
            "estado = " + req.body.estado + ", " +
            "edit = '" + dateNow + "' "+
            "WHERE idUsuario = " + req.params.id + "AND idPersona = " + req.params.idPersona;

        querySQL(query, res);
    },
    updateEstadoUser: (req, res) => {
        var query = "UPDATE Usuario SET " +
            "estado = " + req.body.estado + ", " +
            "edit = '" + dateNow+ "' "+
            "WHERE idUsuario = " + req.params.id;

        querySQL(query, res);
    },
    deleteUser: (req, res) => {

        var query = "UPDATE Usuario SET " +
                    "delet = '" + dateNow + "' "+
                    "WHERE idUsuario = " + req.params.id;

        querySQL(query, res);
    }
};