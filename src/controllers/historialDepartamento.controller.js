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
//un auxiliar cmd 
async function requestSQL(query){
    sql.connect(config).then(() => {
        return sql.query(query)
    }).then(result => {
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
    //Obtencion de todo el historial de un solo departamento
    getHistorialDepartamentos: (req, res) => {
        var query = "SELECT idHistorialDepartamento, idDepartamento, limiteEstudiante, costoHora, fechaRegistro as fechaRegistroHistorialDepartamento, estado as estadoHistorialDepartamento, edit as editHistorialDepartamento " +
                    "FROM HistorialDepartamento " +
                    "WHERE idDepartamento = " + req.params.id;
        cmdSQL(query, res);
    },
    getHistorialDepartamento: (req, res) => {
        var query = "SELECT idHistorialDepartamento, idDepartamento, limiteEstudiante, costoHora, fechaRegistro as fechaRegistroHistotialDepartamento, estado as estadoHistorialDepartamento, edit as editHistorialDepartamento " +
                    "FROM HistorialDepartamento " +
                    "WHERE estado = 1 AND idDepartamento = " + req.params.id;
        cmdSQL(query, res);
    },
    addHistorialDepartamento: (req, res) => {

        var query = "INSERT INTO HistorialDepartamento VALUES (" +
            req.body.idDepartamento + ", " +
            req.body.limiteEstudiante + ", '" +
            req.body.costoHora + "', '" + 
            dateNow() + "', 1, null, null)";
        cmdSQL(query, res);
    },
    //cuando se actualize al registro anterior se pondra en estado false
    updateEstadoHistorialDepartamento: (req, res) => {

        if(req.body.estadoHistorialDepartamento == '1'){
            var queryAux = "UPDATE HistorialDepartamento SET " +
                        "estado = 0 " +
                        "WHERE idDepartamento = " + req.body.idDepartamento;
            requestSQL(queryAux);
        }

        console.log(req.body);

        var query = "UPDATE HistorialDepartamento SET " +
                    "estado = " + req.body.estadoHistorialDepartamento + ", " +
                    "edit = '" + dateNow() + "' "+
                    "WHERE idHistorialDepartamento = " + req.params.id;

        cmdSQL(query, res);
    },
    deleteHistorialDepartamento: (req, res) => {}
};