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
    getAreas: (req, res) => {
        var query = "SELECT idArea, idDepartamento, nombre as nombreArea, fechaRegistro as fechaRegistroArea, estado as estadoArea FROM Area WHERE delet IS NULL ORDER BY nombre ASC";
        cmdSQL(query, res);
    },
    getArea: (req, res) => {
        var query = "SELECT idArea, idDepartamento, nombre as nombreArea, fechaRegistro as fechaRegistroArea, estado as estadoArea " +
                    "FROM Area " +
                    "WHERE idArea = " + req.params.id;
        cmdSQL(query, res);
    },
    getAreasDepartamento: (req, res) => {
        var query = "SELECT ar.idDepartamento, ar.idArea, de.nombre as nombreDepartamento, de.fechaRegistro as fechaRegistroDepartamento, de.estado as estadoDepartamento, ar.nombre as nombreArea, ar.fechaRegistro as fechaRegistroArea, ar.estado as estadoArea " +
                    "FROM Area ar, Departamento de " +
                    "WHERE ar.idDepartamento = de.idDepartamento " +
                    "AND ar.delet IS NULL AND de.delet IS NULL " +
                    "AND ar.idDepartamento = " + req.params.idDepartamento +
                    " ORDER BY ar.nombre ASC";
        cmdSQL(query, res);
    },
    addArea: (req, res) => {

        var query = "INSERT INTO Area VALUES( " +
            req.body.idDepartamento + ", '" +
            req.body.nombreArea + "', '" +
            dateNow() + "', 1, null, null)";

        cmdSQL(query, res);
    },
    updateArea: (req, res) => {

        var query = "UPDATE Area SET " +
            "nombre = '" + req.body.nombreArea + "', " +
            "edit = '" + dateNow() + "' " +
            "WHERE idArea = " + req.params.id;

        cmdSQL(query, res);
    },
    updateEstadoArea: (req, res) => {
        var query = "UPDATE Area SET " +
            "estado = " + req.body.estadoArea + ", " +
            "edit = '" + dateNow() + "' " +
            "WHERE idArea = " + req.params.idArea;

        cmdSQL(query, res);
    },
    deleteArea: (req, res) => {
        var query = "UPDATE Area SET " +
            "delet = '" + dateNow() + "' " +
            "WHERE idArea = " + req.params.id;

        cmdSQL(query, res);
    },
    //LISTAR LOS ESTUDIANTES X DEPARTAMENTO
    getAsignacionArea: (req, res) => {
        var query = "SELECT aa.idAsignacionArea, aa.idConvenio, aa.idArea, aa.fechaRegistro as fechaRegistroAsignacion, aa.estado as estadoAsignacion, " +
                    "de.idDepartamento, " +
                    "ar.nombre as nombreArea, " +
                    "pe.idPersona, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido " +
                    "FROM AsignacionArea aa, Persona pe, Departamento de, Convenio co, Area ar " +
                    "WHERE ar.idArea = aa.idArea " +
                    "AND aa.idConvenio = co.idConvenio " +
                    "AND co.idDepartamento = de.idDepartamento " +
                    "AND co.idPersona = pe.idPersona " +
                    "AND aa.idArea = " + req.params.idArea + " " +
                    "AND aa.delet IS NULL " +
                    "ORDER BY pe.primerApellido ASC";

        cmdSQL(query, res);
    },
    getAreByConvenio: (req, res) => {
        var query = "SELECT ar.idArea, ar.idDepartamento, ar.nombre as nombreArea, ar.estado as estadoArea " +
                    "FROM AsignacionArea aa, Area ar " +
                    "WHERE aa.idArea = ar.idArea " +
                    "AND aa.idConvenio = " + req.params.idConvenio + " " +
                    "AND aa.delet IS NULL " +
                    "ORDER BY ar.nombre ASC";

        cmdSQL(query, res);
    },
    addAsigancionArea: (req, res) => {
        var query = "INSERT INTO AsignacionArea VALUES( " +
        req.body.idConvenio + ", " +
        req.body.idArea + ", '" +
        dateNow() + "', 1, null, null)";

        cmdSQL(query, res);
    },
    updateAsignacionArea: (req, res) => {
        var query = "UPDATE AsignacionArea SET " +
        "estado = " + req.body.estadoAsignacion + ", " +
        "edit = '" + dateNow() + "' " +
        "WHERE idAsignacionArea = " + req.params.idArea;

        cmdSQL(query, res);
    },
    updateCambiarArea: (req, res) => {
        var query = "UPDATE AsignacionArea SET " +
        "idArea = " + req.body.idArea + ", " +
        "edit = '" + dateNow() + "' " +
        "WHERE idAsignacionArea = " + req.params.idAsignacion;

        cmdSQL(query, res);
    },
    deleteAsignacionArea: (req, res) => {
        var query = "UPDATE AsignacionArea SET " +
            "delet = '" + dateNow() + "' " +
            "WHERE idAsignacionArea = " + req.params.idArea;

    cmdSQL(query, res);
    }
};