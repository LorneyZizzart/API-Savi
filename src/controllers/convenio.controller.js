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
    getConvenios: (req, res) => {
        var query = "SELECT co.idConvenio, pe.codEstudiante, pe.idPersona, pe.idCarrera, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, pe.semestre, pe.direccion, pe.nacionalidad, pe.fechaNacimiento, pe.ci, pe.celular, pe.estado as estadoPersona, " +
                    "de.idDepartamento, de.nombre as departamento, " +
                    "be.idBeca, be.nombre as beca, " +
                    "co.fechaInicio, co.fechaFinal, co.fotocopiaCarnet, co.solicitudTrabajo, co.estado as estadoConvenio " +
                    "FROM Convenio co, Persona pe, Departamento de, Beca be " +
                    "WHERE co.idPersona = pe.idPersona " +
                    "AND co.idDepartamento = de.idDepartamento " +
                    "AND co.idBeca = be.idBeca " + 
                    "AND co.delet IS NULL ORDER BY pe.primerApellido ASC";
        cmdSQL(query, res);
    },
    getConvenio: (req, res) => {
        var query = 'SELECT * FROM Convenio WHERE idConvenio = ' + req.params.id;
        cmdSQL(query, res);
    },
    addConvenio: (req, res) => {

        var query = "INSERT INTO Convenio VALUES(" +
            req.body.idDepartamento + ", " +
            req.body.idPersona + ", " +
            req.body.idBeca + ", '" + 
            req.body.fechaInicio + "', '" +
            req.body.fechaFinal + "', " + 
            req.body.fotocopiaCarnet + ", " +
            req.body.solicitudTrabajo + ", 1, '" +
            dateNow() + "', null, null)";

        cmdSQL(query, res);
    },
    updateConvenio: (req, res) => {
        var query = "UPDATE Convenio SET " +
            "idDepartamento = " + req.body.idDepartamento + ", " +
            "idBeca = " + req.body.idBeca + ", " +
            "fechaInicio = '" + req.body.fechaInicio + "', " +
            "fechaFinal = '" + req.body.fechaFinal + "', " +
            "fotocopiaCarnet = " + req.body.fotocopiaCarnet + ", " +
            "solicitudTrabajo = " + req.body.solicitudTrabajo + ", " +
            "edit = '" + dateNow() + "' " + 
            "WHERE idConvenio = " + req.params.id;

        cmdSQL(query, res);
    },
    updateEstadoConvenio: (req, res) => {
        var query = "UPDATE Convenio SET estado = " + req.body.estadoConvenio + ", " +
                    "edit = '" + dateNow() + "' " + 
                    "WHERE idConvenio = " + req.params.id;
        cmdSQL(query, res);
    },
    deleteConvenio: (req, res) => {

        var query = "UPDATE Convenio SET " +
                    "delet = '" + dateNow() + "' " + 
                    "WHERE idConvenio = " + req.params.id;

        cmdSQL(query, res);
    }
};