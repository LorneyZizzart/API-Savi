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
        var hh = fechaRegistro.getHours();
        var min = fechaRegistro.getMinutes();
        var ss = fechaRegistro.getSeconds();

        if (dd < 10) { dd = '0' + dd; }
        if (mm < 10) { mm = '0' + mm; }
        if (hh < 10) { hh = '0' + hh;   }
        if (min < 10) { min = '0' + min;   }
        if (ss < 10) { ss = '0' + ss;   }

        return fechaRegistro = yyyy+'/'+mm+'/'+dd+' '+hh+':'+min+':'+ss+'.000';
}

module.exports = {
    //para registrar estudiante
    getCarreras: (req, res) => {
        var query = "SELECT idCarrera, nombre as nombreCarrera, estado as estadoCarrera FROM Carrera WHERE delet IS NULL AND estado = 1 ORDER BY nombre ASC";
        cmdSQL(query, res);
    },
    //
    getCarrera: (req, res) =>{
        var query = "SELECT idCarrera, nombre as nombreCarrera, estado as estadoCarrera, register as registerCarrera " +
                    "FROM Carrera " +
                    "WHERE idCarrera = " + req.params.idCarrera;
        cmdSQL(query, res);
    },
    addCarrera: (req, res) => {

        var query = "INSERT INTO Carrera VALUES( '" +
            req.body.nombreCarrera + "', '" +
            dateNow() + "', null, null, 1)";

        cmdSQL(query, res);
    },
    updateCarrera: (req, res) => {

        var query = "UPDATE Carrera SET " +
                    "nombre = '" + req.body.nombreCarrera + "', " +
                    "edit = '" + dateNow() + "' " +
                    "WHERE idCarrera = " + req.params.idCarrera; 

        cmdSQL(query, res);
    },
    updateEstadoCarrera: (req, res) => {

        var query = "UPDATE Carrera SET " +
                    "estado = '" + req.body.estadoCarrera + "', " +
                    "edit = '" + dateNow() + "' " +
                    "WHERE idCarrera = " + req.params.idCarrera; 

        cmdSQL(query, res);
    },
    deleteCarrera: (req, res) => {
        var query = "UPDATE Carrera SET " +
                    "delet = '" + dateNow() + "' " +
                    "WHERE idCarrera = " + req.params.idCarrera;      

        cmdSQL(query, res);
    }
};