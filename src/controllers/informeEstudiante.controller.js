const {querySQL} = require("../db/cmdSQL");
const {dateNow} = require('../class/date');

module.exports = {    
    //Generar informe x departamento
    getInformeEstudiante: (req, res) =>{
        var query = "SELECT ie.idInformeEstudiante, ie.idRegistroHora, co.idConvenio, pe.codEstudiante, pe.idPersona, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, ca.idCarrera, ca.nombre as carrera, pe.semestre, pe.direccion, pe.nacionalidad, pe.fechaNacimiento, pe.ci, pe.celular, pe.estado as estadoPersona, " +
                    "rh.idRegistroHora, rh.Observacion as observacionRegistroHora, " +
                    "de.idDepartamento, de.nombre as departamento, " +
                    "be.idBeca, be.nombre as beca, " +
                    "co.fechaInicio, co.fechaFinal, co.fotocopiaCarnet, co.solicitudTrabajo, co.estado as estadoConvenio, " +
                    "ie.fecha, ie.totalHoras, ie.totalSaldo, ie.aprobadoJefeDep, ie.aprobadoFinanzas " +
                    "FROM Persona pe, Convenio co, Departamento de, Beca be, InformeEstudiante ie, RegistroHora rh, Carrera ca " +
                    "WHERE ie.idRegistroHora = rh.idRegistroHora " +
                    "AND rh.idConvenio = co.idConvenio " +
                    "AND co.idPersona = pe.idPersona " +
                    "AND pe.idCarrera = ca.idCarrera " +
                    "AND co.idDepartamento = de.idDepartamento " +
                    "AND co.idBeca = be.idBeca " +
                    "AND ie.delet IS NULL " +
                    "AND ie.archivar IS NULL " +
                    "AND de.idDepartamento = " + req.params.idDepto + " " +
                    "ORDER BY ie.fecha ASC";

                    querySQL(query, res);
    },
    getInformeEstudianteArchivados: (req, res) =>{
        var query = "SELECT ie.idInformeEstudiante, co.idConvenio, pe.codEstudiante, pe.idPersona, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, ca.idCarrera, ca.nombre as carrera, pe.semestre, pe.direccion, pe.nacionalidad, pe.fechaNacimiento, pe.ci, pe.celular, pe.estado as estadoPersona, " +
                    "rh.idRegistroHora, rh.Observacion as observacionRegistroHora, " +
                    "de.idDepartamento, de.nombre as departamento, " +
                    "be.idBeca, be.nombre as beca, " +
                    "co.fechaInicio, co.fechaFinal, co.fotocopiaCarnet, co.solicitudTrabajo, co.estado as estadoConvenio, " +
                    "ie.fecha, ie.totalHoras, ie.totalSaldo, ie.aprobadoJefeDep, ie.aprobadoFinanzas " +
                    "FROM Persona pe, Convenio co, Departamento de, Beca be, InformeEstudiante ie, RegistroHora rh, Carrera ca " +
                    "WHERE ie.idRegistroHora = rh.idRegistroHora " +
                    "AND rh.idConvenio = co.idConvenio " +
                    "AND co.idPersona = pe.idPersona " +
                    "AND pe.idCarrera = ca.idCarrera " +
                    "AND co.idDepartamento = de.idDepartamento " +
                    "AND co.idBeca = be.idBeca " +
                    "AND ie.delet IS NULL " +
                    "AND ie.archivar IS NOT NULL " +
                    "AND de.idDepartamento =" + req.params.id + " " +
                    "ORDER BY ie.fecha ASC";

                    querySQL(query, res);
    },//Generar informe para finanzas de todos los departamentos
    getInformeEstudianteAll: (req, res) =>{

        var query = "SELECT ie.idInformeEstudiante, co.idConvenio, pe.codEstudiante, pe.idPersona, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, " +
                    "rh.idRegistroHora, rh.Observacion as observacionRegistroHora, " +
                    "de.idDepartamento, de.nombre as departamento, " +
                    "ie.fecha, ie.totalHoras, ie.totalSaldo, ie.aprobadoJefeDep, ie.aprobadoFinanzas " +
                    "FROM Persona pe, Convenio co, Departamento de, Beca be, InformeEstudiante ie, RegistroHora rh " +
                    "WHERE ie.idRegistroHora = rh.idRegistroHora " +
                    "AND rh.idConvenio = co.idConvenio " +
                    "AND co.idPersona = pe.idPersona " +
                    "AND co.idDepartamento = de.idDepartamento " +
                    "AND co.idBeca = be.idBeca " +
                    "AND ie.delet IS NULL " +
                    "AND ie.aprobadoJefeDep IS NOT NULL " +
                    "AND ie.revisadoFinanzas IS NULL " +
                    "ORDER BY ie.fecha ASC";

                    querySQL(query, res);
    },
    //lista los informes estudiante por numero de convenio
    getAcreedorHistorial: (req, res) =>{
        var query = "SELECT inE.idInformeEstudiante, inE.idRegistroHora, inE.fecha , inE.totalHoras, inE.totalSaldo, inE.aprobadoJefeDep, inE.aprobadoFinanzas, inE.revisadoFinanzas, inE.archivar, " +
                    "reH.idConvenio, reH.fechaHoraEntrada, reH.fechaHoraSalida, reH.observacion, reH.aprobado, reH.edit " + 
                    "FROM InformeEstudiante inE, RegistroHora reH " +
                    "WHERE reH.idRegistroHora = inE.idRegistroHora " +
                    "AND reH.idConvenio = " + req.params.idConvenio + " " +
                    "AND reH.delet IS NULL " +
                    "AND inE.delet IS NULL " +
                    "AND reH.aprobado = 1";
                    
                    querySQL(query, res);
    },
    getInformeEstudianteDelete: (req, res) =>{

        var query = "SELECT pe.idPersona, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, " +
                    "co.idConvenio, " +
                    "de.idDepartamento, " +
                    "rh.idRegistroHora, " +
                    "ie.idInformeEstudiante, ie.fecha, ie.totalHoras, ie.totalSaldo, ie.aprobadoJefeDep, ie.aprobadoFinanzas, ie.revisadoFinanzas " +
                    "FROM Departamento de, Convenio co, RegistroHora rh, InformeEstudiante ie, Persona pe " +
                    "WHERE de.idDepartamento = co.idDepartamento " +
                    "AND co.idPersona = pe.idPersona " +
                    "AND co.idConvenio =  rh.idConvenio " +
                    "AND rh.idRegistroHora = ie.idRegistroHora " +
                    "AND ie.delet IS NOT NULL " +
                    "AND de.idDepartamento = " + req.params.id
                    "ORDER BY ie.fecha ASC";
                    
                    querySQL(query, res);
    },
    //para generar un informe del jefe
    addInformeEstudiante: (req, res) => {

        var query = "INSERT INTO InformeEstudiante VALUES( " +
            req.body.idRegistroHora + ", '" +
            req.body.fecha + "', '" +
            req.body.totalHoras + "', '" +
            req.body.totalSaldo + "', '" + 
            dateNow + "', 0, null, null, null)";

            querySQL(query, res);
    },
    updateAprobarFinanzas: (req, res) => {
        var query = "UPDATE InformeEstudiante SET " +
            "aprobadoFinanzas = " + req.body.aprobadoFinanzas + ", " +
            "revisadoFinanzas = '" + dateNow + "' " +
            "WHERE idInformeEstudiante = " + req.params.id;

            querySQL(query, res);
    },
    updateInformeArchivar: (req, res) => {
        var query;
        if(req.body.archivar == "SI"){
            query = "UPDATE InformeEstudiante SET " +
            "archivar = '" + dateNow+ "' " +
            "WHERE idInformeEstudiante = " + req.params.id;
        }else if(req.body.archivar == "NO"){
            query = "UPDATE InformeEstudiante SET " +
            "archivar = NULL " +
            "WHERE idInformeEstudiante = " + req.params.id;
        }       

        querySQL(query, res);
    },
    // para eliminar el informe del jefe de departamento
    bajaInformeEstudiante: (req, res) => {

        var query = "UPDATE InformeEstudiante SET " +
                    "delet = '" + dateNow + "' " +
                    "WHERE idInformeEstudiante = " + req.params.idDepto; /* en si es el id del informe para eliminar el informe del jefe de departamento para el usuario jefe de departamento */

                    querySQL(query, res);
    },
    deleteInformeEstudiante: (req, res) => {

        var query = "UPDATE InformeEstudiante SET " +
                    "delet = '" + dateNow + "' " +
                    "WHERE fecha = '" + req.params.fecha + "' " +
                    "AND idRegistroHora = " + req.params.idRH;

                    querySQL(query, res);
    }
};