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