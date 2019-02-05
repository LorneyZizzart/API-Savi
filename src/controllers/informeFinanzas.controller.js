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
    //Informes aprobados en finanzas
    getInformeFinanzas: (req, res) =>{
        var query = "SELECT fi.idInformeFinanzas, fi.fechaAprobada, fi.idUsuario, " +
                    "ie.idInformeEstudiante, ie.fecha, ie.totalHoras, ie.totalSaldo, ie.aprobadoJefeDep, ie.aprobadoFinanzas, " +
                    "co.idConvenio, co.fechaInicio, co.fechaFinal, co.fotocopiaCarnet, co.solicitudTrabajo, co.estado as estadoConvenio, " +
                    "be.idBeca, be.nombre as beca, " +
                    "de.idDepartamento, de.nombre as departamento, " +
                    "pe.idPersona, pe.codEstudiante, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, pe.carrera, pe.semestre, pe.direccion, pe.nacionalidad, pe.fechaNacimiento, pe.ci, pe.celular, pe.estado as estadoPersona " +
                    "FROM InformeFinanzas fi, InformeEstudiante ie, RegistroHora rh, Convenio co, Persona pe, Beca be, Departamento de, Usuario us " +
                    "WHERE fi.idInformeEstudiante = ie.idInformeEstudiante " +
                    "AND ie.idRegistroHora = rh.idRegistroHora " +
                    "AND rh.idConvenio = co.idConvenio " +
                    "AND co.idPersona =pe.idPersona " +
                    "AND co.idBeca = be.idBeca " +
                    "AND co.idDepartamento = de.idDepartamento " +
                    "AND us.idPersona = pe.idPersona " +
                    "AND fi.delet IS NULL " +
                    "AND fi.fechaAprobada IS NOT NULL " +
                    "AND fi.archivar IS NULL " +
                    "ORDER BY ie.fecha ASC";

        cmdSQL(query, res);
    },
    getInformeFinanzasArchivadas: (req, res) =>{
        var query = "SELECT fi.idInformeFinanzas, fi.fechaAprobada, fi.idUsuario, " +
                    "ie.idInformeEstudiante, ie.fecha, ie.totalHoras, ie.totalSaldo, ie.aprobadoJefeDep, ie.aprobadoFinanzas, " +
                    "co.idConvenio, co.fechaInicio, co.fechaFinal, co.fotocopiaCarnet, co.solicitudTrabajo, co.estado as estadoConvenio, " +
                    "be.idBeca, be.nombre as beca, " +
                    "de.idDepartamento, de.nombre as departamento, " +
                    "pe.idPersona, pe.codEstudiante, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, pe.carrera, pe.semestre, pe.direccion, pe.nacionalidad, pe.fechaNacimiento, pe.ci, pe.celular, pe.estado as estadoPersona " +
                    "FROM InformeFinanzas fi, InformeEstudiante ie, RegistroHora rh, Convenio co, Persona pe, Beca be, Departamento de, Usuario us " +
                    "WHERE fi.idInformeEstudiante = ie.idInformeEstudiante " +
                    "AND ie.idRegistroHora = rh.idRegistroHora " +
                    "AND rh.idConvenio = co.idConvenio " +
                    "AND co.idPersona =pe.idPersona " +
                    "AND co.idBeca = be.idBeca " +
                    "AND co.idDepartamento = de.idDepartamento " +
                    "AND us.idPersona = pe.idPersona " +
                    "AND fi.delet IS NULL " +
                    "AND fi.fechaAprobada IS NOT NULL " +
                    "AND fi.archivar IS NOT NULL " +
                    "ORDER BY ie.fecha ASC";

        cmdSQL(query, res);
    },
    addInformeFinanzas: (req, res) => {

        var query = "INSERT INTO InformeFinanzas VALUES( " +
            req.body.idUsuario + ", " +
            req.body.idInformeEstudiante + ", '" +
            dateNow() + "', null, null)";

        cmdSQL(query, res);
    },
    updateInformeFinanzasArchivar: (req, res) => {
        var query;
        if(req.body.archivar == "SI"){
            query = "UPDATE InformeFinanzas SET " +
            "archivar = '" + dateNow() + "' " +
            "WHERE idInformeFinanzas = " + req.params.id;
        }else if(req.body.archivar == "NO"){
            query = "UPDATE InformeFinanzas SET " +
            "archivar = NULL " +
            "WHERE idInformeFinanzas = " + req.params.id;
        }        

        cmdSQL(query, res);
    },
    deleteInformeFinanzas: (req, res) => {

        var query = "UPDATE InformeFinanzas SET " +
                    "delet = '" + dateNow() + "' " +
                    "WHERE idInformeEstudiante = " + req.params.id;

        cmdSQL(query, res);
    }
};