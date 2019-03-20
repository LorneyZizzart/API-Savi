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
    getDescuentos: (req, res) => {
        var query = "SELECT  pe.codEstudiante, pe.idPersona, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, pe.carrera, pe.semestre, pe.direccion, pe.nacionalidad, pe.fechaNacimiento, pe.ci, pe.celular, pe.estado as estadoPersona, " +
                    "de.idDepartamento, de.nombre as departamento, " +
                    "be.idBeca, be.nombre as beca, " +
                    "co.fechaInicio, co.fechaFinal, co.fotocopiaCarnet, co.solicitudTrabajo, co.estado as estadoConvenio, " +
                    "descu.idDescuento, descu.idAcreedor, co.idConvenio, descu.idUsuario, descu.fechaDescuento, descu.montoBs as montoDescuento, descu.observacion " +
                    "FROM Descuento descu, Convenio co, Beca be, Departamento de, Persona pe, Acreedor ac " +
                    "WHERE descu.idAcreedor = ac.idAcreedor " +
                    "AND ac.idConvenio = co.idConvenio " +
                    "AND co.idPersona = pe.idPersona " +
                    "AND co.idBeca = be.idBeca " +
                    "AND co.idDepartamento = de.idDepartamento " +
                    "AND ac.delet IS NULL " +
                    "AND descu.delet IS NULL " +
                    "ORDER BY ac.fechaAsignado ASC";
        cmdSQL(query, res);
    },
    addDescuento: (req, res) => {

        var query = "INSERT INTO Descuento VALUES( " +
            req.body.idAcreedor + ", " +
            req.body.idUsuario + ", '" +
            dateNow() + "', '" +
            req.body.montoDescuento + "', '" +
            req.body.observacion + "', null, null)";

        cmdSQL(query, res);
    },
    updateDescuento: (req, res) => {

        var query = "UPDATE Descuento SET " +
            "idUsuario = " + req.body.idUsuario + ", " +
            "montoBs = '" + req.body.montoDescuento + "', " +
            "edit = '" + dateNow() + "' " +
            "WHERE idDescuento = " + req.params.id;

        cmdSQL(query, res);
    },
    deleteDescuento: (req, res) => {
        var query = "UPDATE Descuento SET " +
            "delet = '" + dateNow() + "' " +
            "WHERE idDescuento = " + req.params.id;

        cmdSQL(query, res);
    }
};