const userDB = require('../db/user.db');
var sql = require('mssql');
const config = require('../db/config.db');

function listAreas(res) {

    sql.connect(config, function(err) {
        if (err) {
            console.log(err);
        }
        var request = new sql.Request();
        request.query('SELECT * FROM Area', function(err, result) {
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

function SearchArea(req, res) {

    sql.connect(config, function(err) {
        if (err) {
            console.log(err);
        }
        var request = new sql.Request();
        var query = 'SELECT * FROM Area WHERE idArea = ' + req.params.id;
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
                    res.send(resp);
                }

                sql.close();
            });
        }
    });
}


module.exports = {
    getAreas: (req, res) => {
        listAreas(res);
    },
    getArea: (req, res) => {
        SearchArea(req, res);
    },
    addArea: (req, res) => {

        var query = "INSERT INTO Area VALUES( " +
            req.body.idDepartamento + ", '" +
            req.body.nombre + "', '" +
            req.body.fechaRegistro + "', 1)";

        cmdSQL(query, res);
    },
    updateArea: (req, res) => {

        var query = "UPDATE Area SET " +
            "idDepartamento = " + req.body.idDepartamento + ", " +
            "nombre = '" + req.body.nombre + "', " +
            "fechaRegistro = '" + req.body.fechaRegistro + "', " +
            "estado = " + req.body.estado +
            " WHERE idArea = " + req.params.id;

        cmdSQL(query, res);
    },
    deleteArea: (req, res) => {

        var query = "DELETE FROM Area WHERE idArea = " + req.params.id;

        cmdSQL(query, res);
    }
};