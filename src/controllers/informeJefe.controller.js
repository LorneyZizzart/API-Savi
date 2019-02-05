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
    //Obtencion del ultimo registrado por el jefe del departamento
    getMaxIdJefe: (req, res) =>{

        var query = "SELECT MAX(ij.idInformeJefe) AS idInformeJefe " +
                    "FROM InformeJefe ij, Usuario us, Departamento de " +
                    "WHERE de.idDepartamento = ij.idDepartamento " + 
                    "AND us.idUsuario = ij.idUsuario " +
                    "AND ij.idUsuario = " + req.params.idUser + " " +
                    "AND de.idDepartamento = " + req.params.idDept;

        cmdSQL(query, res);
    },
    //para generar un informe del jefe
    addInformeJefe: (req, res) => {
        var observacion = null;
        var detalle = null;
        if(req.body.observacion != null){
            observacion = "'" + req.body.observacion+"'";
        }
        if(req.body.detalle != null){
            detalle = "'" + req.body.detalle+"'";
        }
        var query = "INSERT INTO InformeJefe VALUES( " +
            req.body.idDepartamento + ", '" +
            dateNow() + "', " + 
            detalle + ", " +
            observacion + ", null, null)";

        cmdSQL(query, res);
    },
    updateInformeJefe: (req, res) => {
        var query = "UPDATE RegistroHora SET " +
            "fechaHoraSalida = '" + dateNow() + "' " +
            "WHERE idRegistroHora = " + req.params.id;

        cmdSQL(query, res);
    },
    deleteInformeJefe: (req, res) => {

        var query = "UPDATE RegistroHora SET " +
                    "delet = '" + dateNow() + "' " +
                    "WHERE idRegistroHora = " + req.params.id;

        cmdSQL(query, res);
    }
};