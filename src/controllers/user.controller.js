const userDB = require('../db/user.db');
var sql = require('mssql');

var config = {
    user: 'sa',
    password: "password",
    server: "127.0.0.1",
    database: "Savi"
};

function listUser(res) {

    sql.connect(config, function(err) {
        if (err) {
            console.log(err);
        }
        var request = new sql.Request();
        var query = "SELECT pe.idPersona, us.idUsuario, us.idRol, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, pe.carrera, pe.semestre, pe.direccion, pe.nacionalidad, pe.fechaNacimiento, pe.ci, pe.celular, " +
            "pe.estado as estadoPersona, us.estado as estadoUsuario, us.usuario, us.password " +
            "FROM Persona pe, Usuario us " +
            "WHERE pe.idPersona = us.idPersona ORDER BY pe.primerNombre ASC"
        request.query(query, function(err, result) {
            if (err) {
                console.log(err);
                return;
            }
            var data = {};
            data = result.recordset;
            res.send(data);
            sql.close();
        })
    })

}

function SearchUser(req, res) {

    sql.connect(config, function(err) {
        if (err) {
            console.log(err);
        }
        var request = new sql.Request();
        var query = 'SELECT * FROM Usuario WHERE idUsuario = ' + req.params.id;
        request.query(query, function(err, result) {
            if (err) {
                console.log(err);
                return;
            }
            var data = {};
            data = result.recordset;
            res.send(data);
            sql.close();
        })
    })

}

function cmdSQL(query, res) {
    sql.connect(config, function(err) {
        if (err) {
            console.log("Error while connecting database :- " + err);
            res.send(err);
        } else {
            // create Request object
            var request = new sql.Request();
            // query to the database
            request.query(query, function(err, resp) {
                if (err) {
                    console.log("Error while querying database :- " + err);
                    res.send(err);
                } else {
                    var data = {};
                    data = resp.recordset;
                    res.send(data);
                }

                sql.close();
            });
        }
    });
}


module.exports = {
    getUsers: (req, res) => {
        listUser(res);
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