const userDB = require('../db/user.db');
var sql = require('mssql');
const config = require('../db/config.db');

function listBecas(res) {

    sql.connect(config, function(err) {
        if (err) {
            console.log(err);
        }
        var request = new sql.Request();
        request.query('SELECT * FROM Beca', function(err, result) {
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

function SearchBeca(req, res) {

    sql.connect(config, function(err) {
        if (err) {
            console.log(err);
        }
        var request = new sql.Request();
        var query = 'SELECT * FROM Beca WHERE idBeca = ' + req.params.id;
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
    getBecas: (req, res) => {
        listBecas(res);
    },
    getBeca: (req, res) => {
        SearchBeca(req, res);
    },
    addBeca: (req, res) => {

        var query = "INSERT INTO Beca VALUES( '" +
            req.body.nombre + "',  1)";

        cmdSQL(query, res);
    },
    updateBeca: (req, res) => {

        var query = "UPDATE Beca SET " +
            "nombre = '" + req.body.nombre + "', " +
            "estado = " + req.body.estado +
            " WHERE idBeca = " + req.params.id;

        cmdSQL(query, res);
    },
    deleteBeca: (req, res) => {

        var query = "DELETE FROM Beca WHERE idBeca = " + req.params.id;

        cmdSQL(query, res);
    }
};