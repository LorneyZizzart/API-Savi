var sql = require('mssql');
const config = require('../db/config.db');

function listarTipoPersona(req, res) {

    sql.connect(config, function(err) {
        if (err) {
            console.log(err);
        }
        var request = new sql.Request();
        var query = 'SELECT pe.idPersona, us.idUsuario, us.idRol, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, pe.direccion, pe.nacionalidad, pe.fechaNacimiento, pe.ci, pe.celular, ' +
            'pe.estado as estadoPersona, us.estado as estadoUsuario ' +
            'FROM Persona pe, Usuario us ' +
            'WHERE pe.idPersona = us.idPersona ' +
            "AND us.idRol = " + "'" + req.params.idRol + "'";

        request.query(query, function(err, result) {
            if (err) {
                console.log(err);
                sql.close();

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
                    res.send(resp);
                }

                sql.close();
            });
        }
    });
}

function maxIdPersona(res) {

    sql.connect(config, function(err) {
        if (err) {
            console.log(err);
        }
        var request = new sql.Request();
        var query = "SELECT max(idPersona) as idPersona FROM Persona";

        request.query(query, function(err, result) {
            if (err) {
                console.log(err);
                sql.close();

                return;
            }
            var data = {};
            data = result.recordset;
            res.send(data);
            sql.close();
        })
    })
}


module.exports = {
    getTipoPersona: (req, res) => {
        listarTipoPersona(req, res);
    },
    getMaxIdPersona: (req, res) => {
        maxIdPersona(res);
    },
    addTipoPersona: (req, res) => {

        var query = "INSERT INTO Persona VALUES('" +
            req.body.primerNombre + "', '" +
            req.body.segundoNombre + "', '" +
            req.body.primerApellido + "', '" +
            req.body.segundoApellido + "', '" +
            req.body.direccion + "', '" +
            req.body.nacionalidad + "', '" +
            req.body.fechaNacimiento + "', '" +
            req.body.ci + "', " +
            req.body.celular + ", 1)";

        cmdSQL(query, res);
        sql.close();
        var query2 = "INSERT INTO TipoPersona VALUES (" +
            req.body.idTipo + ", " +
            req.body.idPersona + ", 1)";

        cmdSQL(query2, res);
    },
    updateTipoPersona: (req, res) => {
        //codigo no valido
        var query = "UPDATE Usuario SET " +
            "idRol =" + req.body.idRol + ", " +
            "usuario = '" + req.body.usuario + "', " +
            "password = '" + req.body.password + "', " +
            "estado = " + req.body.estado +
            " WHERE idUsuario = " + req.params.id;

        cmdSQL(query, res);
    }
};