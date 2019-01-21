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
    getPeoples: (req, res) => {
        var query = "SELECT * FROM Persona";
        cmdSQL(query, res);
    },
    getPeople: (req, res) => {
        var query = 'SELECT * FROM Persona WHERE idPersona = ' + req.params.id;
        cmdSQL(query, res);
    },
    addPeople: (req, res) => {

        var query = "INSERT INTO Persona VALUES('" +
            req.body.primerNombre + "', '" +
            req.body.segundoNombre + "', '" +
            req.body.primerApellido + "', '" +
            req.body.segundoApellido + "', '" +
            req.body.ci + "', '" +
            req.body.carrera + "', " +
            req.body.semestre + ", '" +
            req.body.nacionalidad + "', '" +
            req.body.direccion + "', " +
            req.body.celular + ", '1995/06/15', 1)";

        cmdSQL(query, res);
    },
    updatePeople: (req, res) => {

        var query = "UPDATE Persona SET " +
            "primerNombre = '" + req.body.primerNombre + "', " +
            "segundoNombre = '" + req.body.segundoNombre + "', " +
            "primerApellido = '" + req.body.primerApellido + "', " +
            "segundoApellido = '" + req.body.segundoApellido + "', " +
            "direccion = '" + req.body.direccion + "', " +
            "nacionalidad = '" + req.body.nacionalidad + "', " +
            "fechaNacimiento = '" + req.body.fechaNacimiento + "', " +
            "ci = '" + req.body.ci + "', " +
            "celular = " + req.body.celular + ", " +
            "estado = " + req.body.estado +
            " WHERE idPersona = " + req.params.id;

        cmdSQL(query, res);
    },
    deletePeople: (req, res) => {

        var query = "DELETE FROM Persona WHERE idPersona = " + req.params.id;

        cmdSQL(query, res);
    }
};