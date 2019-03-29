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
    //Consulta solo de la tabla de acreedores
    getListAcreedr: (req, res) => {
        var query = "SELECT * FROM Acreedor WHERE delet IS NULL";

        cmdSQL(query, res);

    },
    //Informes aprobados en finanzas
    getAcreedor: (req, res) =>{
        var query = "SELECT pe.codEstudiante, pe.idPersona, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, ca.idCarrera, ca.nombre as carrera, pe.semestre, pe.direccion, pe.nacionalidad, pe.fechaNacimiento, pe.ci, pe.celular, pe.estado as estadoPersona, " + 
                    "de.idDepartamento, de.nombre as departamento, " +
                    "be.idBeca, be.nombre as beca, " +
                    "co.fechaInicio, co.fechaFinal, co.fotocopiaCarnet, co.solicitudTrabajo, co.estado as estadoConvenio, " +
                    "ac.idAcreedor, ac.idConvenio, ac.idInformeEstudiante, ac.idUsuario, ac.fechaAsignado, ac.montoBs, ac.estado " +
                    "FROM Acreedor ac, Convenio co, Beca be, Departamento de, Persona pe, Carrera ca " +
                    "WHERE ac.idConvenio = co.idConvenio " +
                    "AND pe.idCarrera = ca.idCarrera " +
                    "AND co.idPersona = pe.idPersona " +
                    "AND co.idBeca = be.idBeca " +
                    "AND co.idDepartamento = de.idDepartamento " +
                    "AND co.delet IS NULL " +
                    "AND ac.delet IS NULL " +
                    "ORDER BY ac.fechaAsignado ASC";

        cmdSQL(query, res);
    },
    addAcreedor: (req, res) => {

        var query = "INSERT INTO Acreedor VALUES( " +
            req.body.idInformeEstudiante + ", " +
            req.body.idConvenio + ", " +
            req.body.idUsuario + ", '" +
            dateNow() + "', '" + 
            req.body.montoBs + "', 1, null, null, null)";

        cmdSQL(query, res);
    },
    updateAcreedorSaldo: (req, res) => {

        var query = "UPDATE Acreedor SET " +
                    "idInformeEstudiante = " + req.body.idInformeEstudiante + ", " +
                    "montoBs = '" + req.body.montoBs + "', " +
                    "edit = '" + dateNow() + "' " +
                    "WHERE idConvenio = " + req.params.id + "AND delet IS NULL"; 

        cmdSQL(query, res);
    },
    updateDevolverSaldo: (req, res) => {

        var query = "UPDATE Acreedor SET " +
                    "montoBs = '" + req.body.montoBs + "', " +
                    "edit = '" + dateNow() + "' " +
                    "WHERE idConvenio = " + req.params.id + "AND delet IS NULL"; 

        cmdSQL(query, res);
    },
    deleteAcreedor: (req, res) => {
        var query = "UPDATE Acreedor SET " +
                    "delet = '" + dateNow() + "' " +
                    "WHERE idInformeEstudiante = " + req.params.id;      

        cmdSQL(query, res);
    }
};