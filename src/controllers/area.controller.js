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

          return fechaRegistro = yyyy+'/'+mm+'/'+dd;
}

module.exports = {
    getAreas: (req, res) => {
        var query = "SELECT idArea, idDepartamento, nombre as nombreArea, fechaRegistro as fechaRegistroArea, estado as estadoArea FROM Area ORDER BY nombre ASC";
        cmdSQL(query, res);
    },
    getArea: (req, res) => {
        var query = "SELECT idArea, idDepartamento, nombre as nombreArea, fechaRegistro as fechaRegistroArea, estado as estadoArea " +
                    "FROM Area " +
                    "WHERE idArea = " + req.params.idArea;
        cmdSQL(query, res);
    },
    getAreasDepartamento: (req, res) => {
        var query = "SELECT ar.idDepartamento, ar.idArea, de.nombre as nombreDepartamento, de.fechaRegistro as fechaRegistroDepartamento, de.estado as estadoDepartamento, ar.nombre as nombreArea, ar.fechaRegistro as fechaRegistroArea, ar.estado as estadoArea " +
                    "FROM Area ar, Departamento de " +
                    "WHERE ar.idDepartamento = de.idDepartamento " +
                    "AND ar.idDepartamento = " + req.params.idDepartamento +
                    " ORDER BY ar.nombre ASC";
        cmdSQL(query, res);
    },
    addArea: (req, res) => {

        var query = "INSERT INTO Area VALUES( " +
            req.body.idDepartamento + ", '" +
            req.body.nombreArea + "', '" +
            dateNow() + "', 1)";

        cmdSQL(query, res);
    },
    updateArea: (req, res) => {

        var query = "UPDATE Area SET " +
            "nombre = '" + req.body.nombreArea + "', " +
            "fechaRegistro = '" + dateNow() + "', " +
            "estado = " + req.body.estadoArea +
            " WHERE idArea = " + req.params.idArea;

        cmdSQL(query, res);
    },
    updateEstadoArea: (req, res) => {
        var query = "UPDATE Area SET " +
            "estado = " + req.body.estadoArea +
            " WHERE idArea = " + req.params.idArea;

        cmdSQL(query, res);
    },
    deleteArea: (req, res) => {

        var query = "DELETE FROM Area WHERE idArea = " + req.params.idArea;

        cmdSQL(query, res);
    }
};