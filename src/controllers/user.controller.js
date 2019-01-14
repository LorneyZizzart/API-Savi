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


module.exports = {
    getUsers: (req, res) => {
        var query = "SELECT pe.idPersona, us.idUsuario, us.idRol, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, pe.carrera, pe.semestre, pe.direccion, pe.nacionalidad, pe.fechaNacimiento, pe.ci, pe.celular, " +
        "pe.estado as estadoPersona, us.estado as estadoUsuario, us.usuario, us.password " +
        "FROM Persona pe, Usuario us " +
        "WHERE pe.idPersona = us.idPersona ORDER BY pe.primerNombre ASC"
        cmdSQL(query, res);
    },
    getUser: (req, res) => {
        var query = 'SELECT * FROM Usuario WHERE idUsuario = ' + req.params.id;
        cmdSQL(query, res);
    },
    addUser: (req, res) => {

        var query = "INSERT INTO Usuario VALUES(" +
            req.body.idPersona + "," +
            req.body.idRol + ", '" +
            req.body.usuario + "', '" +
            req.body.password + "', 1)";

        cmdSQL(query, res);
    },
    updateUser: (req, res) => {

        var query = "UPDATE Usuario SET " +
            "idRol =" + req.body.idRol + ", " +
            "usuario = '" + req.body.usuario + "', " +
            "password = '" + req.body.password + "', " +
            "estado = " + req.body.estado +
            " WHERE idUsuario = " + req.params.id;

        cmdSQL(query, res);
    },
    deleteUser: (req, res) => {

        var query = "DELETE FROM Usuario WHERE idUsuario = " + req.params.id;

        cmdSQL(query, res);
    }
};