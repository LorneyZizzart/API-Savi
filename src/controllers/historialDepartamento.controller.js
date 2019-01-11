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

function dateNow(){
    var fechaRegistro = new Date();
        var dd = fechaRegistro.getDate();
        var mm = fechaRegistro.getMonth() + 1;
        var yyyy = fechaRegistro.getFullYear();

        if (dd < 10) {
            dd = '0' + dd;
          }
          
          if (mm < 10) {
            mm = '0' + mm;
          }

          return fechaRegistro = dd+'/'+mm+'/'+yyyy;
}


module.exports = {
    getHistorialDepartamentos: (req, res) => {
        var query = "SELECT MAX(idDepartamento) as idDepartamento FROM Departamento";
        cmdSQL(query, res);
    },
    addHistorialDepartamento: (req, res) => {

        var query = "INSERT INTO HistorialDepartamento VALUES (" +
            req.body.idDepartamento + ", " +
            req.body.limiteEstudiante + ", '" +
            req.body.costoHora + "', '" + 
            dateNow() + "', 1)";
        cmdSQL(query, res);
    },
    updateHistorialDepartamento: (req, res) => {},
    deleteHistorialDepartamento: (req, res) => {}
};