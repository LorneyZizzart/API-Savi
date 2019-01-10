var sql = require('mssql');
const config = require('../db/config.db');

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
                    res.send(resp.recordset);
                }

                sql.close();
            });
        }
    });
}


module.exports = {
    getHistorialDepartamentos: (req, res) => {
        var query = "SELECT * FROM Departamento";
        cmdSQL(query, res);
    },
    getHistorialDepartamento: (req, res) => {},
    addHistorialDepartamento: (req, res) => {

        var query = "INSERT INTO HistorialDepartamento VALUES (" +
            req.body.idDepartamento + ", " +
            req.body.limiteEstudiante + ", '" +
            req.body.costoHora + "', '2018/11/20', 1)";
        cmdSQL(query, res);
    },
    updateHistorialDepartamento: (req, res) => {},
    deleteHistorialDepartamento: (req, res) => {}
};