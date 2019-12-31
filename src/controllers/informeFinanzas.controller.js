const {querySQL} = require("../db/cmdSQL");
const {dateNow} = require('../class/date');

module.exports = {
    // obtenemos un informe de finanzas
    getInformeFinanzas : (req, res) =>{
        var query = "SELECT idInformeFinanzas, idUsuario, idInformeEstudiante, totalHoras, totalSaldo, observacion, fechaAprobada, archivar " +
                    "FROM InformeFinanzas " +
                    "WHERE delet IS NULL " +
                    "AND idInformeFinanzas = " +req.params.id;

                    querySQL(query, res);
    },
    //Informes revisados en finanzas
    getInformesFinanzas: (req, res) =>{
        var query = "SELECT pe.idPersona, pe.codEstudiante, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, " +
                    "de.idDepartamento, de.nombre as departamento, " +
                    "co.idConvenio, " +
                    "rh.idRegistroHora, " +
                    "ie.idInformeEstudiante, ie.fecha, ie.totalHoras, ie.totalSaldo, ie.aprobadoJefeDep, ie.aprobadoFinanzas, " +
                    "fi.idInformeFinanzas, fi.fechaAprobada, fi.idUsuario, fi.totalHoras as totalHorasF, fi.totalSaldo as totalSaldoF, fi.observacion as obsrevacionFinanzas " +
                    "FROM Persona pe, Departamento de, Convenio co, RegistroHora rh, InformeEstudiante ie, InformeFinanzas fi " +
                    "WHERE pe.idPersona = co.idPersona " +
                    "AND co.idDepartamento = de.idDepartamento " +
                    "AND co.idConvenio = rh.idConvenio " +
                    "AND rh.idRegistroHora = ie.idRegistroHora " +
                    "AND ie.idInformeEstudiante = fi.idInformeEstudiante " +
                    "AND fi.delet IS NULL " +
                    "AND ie.delet IS NULL " +
                    "AND fi.archivar IS NULL " +
                    "ORDER BY ie.fecha ASC";

                    querySQL(query, res);
    },
    getInformeFinanzasArchivadas: (req, res) =>{
        var query = "SELECT pe.idPersona, pe.codEstudiante, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, " +
                    "de.idDepartamento, de.nombre as departamento, " +
                    "ie.idInformeEstudiante, ie.fecha, ie.totalHoras, ie.totalSaldo, ie.aprobadoJefeDep, ie.aprobadoFinanzas, " +
                    "fi.idInformeFinanzas, fi.fechaAprobada, fi.idUsuario, fi.totalHoras as totalHorasF, fi.totalSaldo as totalSaldoF, fi.observacion as obsrevacionFinanzas " +
                    "FROM Persona pe, Departamento de, Convenio co, RegistroHora rh, InformeEstudiante ie, InformeFinanzas fi " +
                    "WHERE pe.idPersona = co.idPersona " +
                    "AND co.idDepartamento = de.idDepartamento " +
                    "AND co.idConvenio = rh.idConvenio " +
                    "AND rh.idRegistroHora = ie.idRegistroHora " +
                    "AND ie.idInformeEstudiante = fi.idInformeEstudiante " +
                    "AND fi.delet IS NULL " +
                    "AND ie.delet IS NULL " +
                    "AND fi.archivar IS NOT NULL " +
                    "ORDER BY ie.fecha ASC";

                    querySQL(query, res);
    },
    addInformeFinanzas: (req, res) => {

        
        var observacion = null;
        if(req.body.observacionFinanzas == null || req.body.observacionFinanzas == undefined){
            observacion = "NULL";
        }else{
            observacion = "'" + req.body.observacionFinanzas + "'";
        }
        var query = "INSERT INTO InformeFinanzas VALUES( " +
            req.body.idUsuario + ", " +
            req.body.idInformeEstudiante + ", '" +
            req.body.totalHorasF + "', '" +
            req.body.totalSaldoF + "', " +
            observacion + ", '" +
            dateNow + "', null, null)";
            
            querySQL(query, res);
    },
    updateInformeFinanzas: (req, res) => {
        var observacion = null;
        if(req.body.observacionFinanzas == null || req.body.observacionFinanzas == undefined){
            observacion = "NULL";
        }else{
            observacion = "'" + req.body.observacionFinanzas + "'";
        }

        var query = "UPDATE InformeFinanzas SET " +
            "idUsuario = " + req.body.idUsuario + ", " +
            "totalHoras = '" + req.body.totalHorasF + "', " +
            "totalSaldo = '" + req.body.totalSaldoF + "', " +
            "observacion = '" + req.body.observacionFinanzas + "', " +
            "fechaAprobada = '" + dateNow + "' " +
            "WHERE idInformeFinanzas = " + req.params.id;               

            querySQL(query, res);
    },
    updateInformeFinanzasArchivar: (req, res) => {
        var query;
        if(req.body.archivar == "SI"){
            query = "UPDATE InformeFinanzas SET " +
            "archivar = '" + dateNow + "' " +
            "WHERE idInformeFinanzas = " + req.params.id;
        }else if(req.body.archivar == "NO"){
            query = "UPDATE InformeFinanzas SET " +
            "archivar = NULL " +
            "WHERE idInformeFinanzas = " + req.params.id;
        }        

        querySQL(query, res);
    },
    deleteInformeFinanzas: (req, res) => {

        var query = "UPDATE InformeFinanzas SET " +
                    "delet = '" + dateNow + "' " +
                    "WHERE idInformeEstudiante = " + req.params.id;

                    querySQL(query, res);
    }
};