const {querySQL} = require("../db/cmdSQL");
const {dateNow} = require('../class/date');

function date(days){
    milisegundos=parseInt(35*24*60*60*1000);
 
    fecha=new Date();
    day=fecha.getDate();
    // el mes es devuelto entre 0 y 11
    month=fecha.getMonth()+1;
    year=fecha.getFullYear();

    if (day < 10) {
        day = '0' + day;
      }
      
      if (month < 10) {
        month = '0' + month;
      }
    //aqui se puede cortar y que retorne la fecha de hoy
    //Obtenemos los milisegundos desde media noche del 1/1/1970
    tiempo=fecha.getTime();
    //Calculamos los milisegundos sobre la fecha que hay que sumar o restar...
    milisegundos=parseInt(days*24*60*60*1000);
    //Modificamos la fecha actual
    total=fecha.setTime(tiempo+milisegundos);
    day=fecha.getDate();
    month=fecha.getMonth()+1;
    year=fecha.getFullYear();

    if (day < 10) {
        day = '0' + day;
      }
      
      if (month < 10) {
        month = '0' + month;
      }
    return year+"/"+month+"/"+day;
}

function startWeek(){
    var fecha=new Date();
    var haceUnaSemana=new Date(fecha.getTime() - (24*60*60*1000)*7);
    var dd = haceUnaSemana.getDate();
    var mm = haceUnaSemana.getMonth() + 1;
    var yyy = haceUnaSemana.getFullYear();
    if (dd < 10) { dd = '0' + dd; }
    if (mm < 10) { mm = '0' + mm; }
    return yyy+"/"+mm+"/"+dd;
}

function startMonth(){
    var fecha=new Date();
    var haceUnaSemana=new Date(fecha.getTime() - (24*60*60*1000)*30);
    var dd = haceUnaSemana.getDate();
    var mm = haceUnaSemana.getMonth() + 1;
    var yyy = haceUnaSemana.getFullYear();
    if (dd < 10) { dd = '0' + dd; }
    if (mm < 10) { mm = '0' + mm; }
    return yyy+"/"+mm+"/"+dd;
}

module.exports = {
    //este metodo es utilizado para generar informes registro de ingreso/salida de HOY y AYER
    getRegistroHorasNow: (req, res) =>{

        var query = "SELECT rh.idRegistroHora, rh.idConvenio, TRY_CONVERT(date, rh.fechaHoraEntrada) as fechaEntrada, TRY_CONVERT(date, rh.fechaHoraSalida) as fechaSalida, " +
                    "DATEPART(yy, rh.fechaHoraEntrada) as yearEntrada, " +
                    "DATEPART(mm, rh.fechaHoraEntrada) as monthEntrada, " +
                    "DATEPART(dd, rh.fechaHoraEntrada) as dayEntrada, " +
                    "DATEPART(hh, rh.fechaHoraEntrada) as horaEntrada, " +
                    "DATEPART(n, rh.fechaHoraEntrada) as minutoEntrada, " +
                    "DATEPART(ss, rh.fechaHoraEntrada) as segundoEntrada, " +
                    "DATEPART(yy, rh.fechaHoraSalida) as yearSalida, " +
                    "DATEPART(mm, rh.fechaHoraSalida) as monthSalida, " +
                    "DATEPART(dd, rh.fechaHoraSalida) as daySalida, " +
                    "DATEPART(hh, rh.fechaHoraSalida) as horaSalida, " +
                    "DATEPART(n, rh.fechaHoraSalida) as minutoSalida, " +
                    "DATEPART(ss, rh.fechaHoraSalida) as segundoSalida, " +
                    "rh.observacion as observacionRegistroHora, rh.aprobado as aprobadoRegistroHora, rh.aprobadoFinanzas, " +
                    "pe.idPersona, pe.codEstudiante, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, " +
                    "de.nombre as nombreDepartamento " +
                    "FROM RegistroHora rh, Persona pe, Convenio co, Departamento de " +
                    "WHERE TRY_CONVERT(date, fechaHoraEntrada) = '" + date(0) + "' " +
                    "AND rh.idConvenio = co.idConvenio " +
                    "AND co.idPersona = pe.idPersona " +
                    "AND co.idDepartamento = de.idDepartamento " +
                    "AND rh.delet IS NULL " +
                    "AND co.delet IS NULL " +
                    "AND de.idDepartamento = " + req.params.idDepto;
                    querySQL(query, res);
    },
    getRegistroHorasYesterday: (req, res) =>{

        var query = "SELECT rh.idRegistroHora, rh.idConvenio, TRY_CONVERT(date, rh.fechaHoraEntrada) as fechaEntrada, TRY_CONVERT(date, rh.fechaHoraSalida) as fechaSalida, " +
                    "DATEPART(yy, rh.fechaHoraEntrada) as yearEntrada, " +
                    "DATEPART(mm, rh.fechaHoraEntrada) as monthEntrada, " +
                    "DATEPART(dd, rh.fechaHoraEntrada) as dayEntrada, " +
                    "DATEPART(hh, rh.fechaHoraEntrada) as horaEntrada, " +
                    "DATEPART(n, rh.fechaHoraEntrada) as minutoEntrada, " +
                    "DATEPART(ss, rh.fechaHoraEntrada) as segundoEntrada, " +
                    "DATEPART(yy, rh.fechaHoraSalida) as yearSalida, " +
                    "DATEPART(mm, rh.fechaHoraSalida) as monthSalida, " +
                    "DATEPART(dd, rh.fechaHoraSalida) as daySalida, " +
                    "DATEPART(hh, rh.fechaHoraSalida) as horaSalida, " +
                    "DATEPART(n, rh.fechaHoraSalida) as minutoSalida, " +
                    "DATEPART(ss, rh.fechaHoraSalida) as segundoSalida, " +
                    "rh.Observacion as observacionRegistroHora, rh.aprobado as aprobadoRegistroHora, rh.aprobadoFinanzas, " +
                    "pe.idPersona, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, " +
                    "de.nombre as nombreDepartamento " +
                    "FROM RegistroHora rh, Persona pe, Convenio co, Departamento de " +
                    "WHERE TRY_CONVERT(date, fechaHoraEntrada) = '" + date(-1) + "' " +
                    "AND rh.idConvenio = co.idConvenio " +
                    "AND co.idPersona = pe.idPersona " +
                    "AND co.idDepartamento = de.idDepartamento " +
                    "AND rh.delet IS NULL " +
                    "AND co.delet IS NULL " +
                    "AND de.idDepartamento = " + req.params.idDepto;
                    querySQL(query, res);
    },
    getRegistroHorasWeek: (req, res) => {
        var query = "SELECT rh.idRegistroHora, rh.idConvenio, TRY_CONVERT(date, rh.fechaHoraEntrada) as fechaEntrada, TRY_CONVERT(date, rh.fechaHoraSalida) as fechaSalida, " +
                    "DATEPART(yy, rh.fechaHoraEntrada) as yearEntrada, " +
                    "DATEPART(mm, rh.fechaHoraEntrada) as monthEntrada, " +
                    "DATEPART(dd, rh.fechaHoraEntrada) as dayEntrada, " +
                    "DATEPART(hh, rh.fechaHoraEntrada) as horaEntrada, " +
                    "DATEPART(n, rh.fechaHoraEntrada) as minutoEntrada, " +
                    "DATEPART(ss, rh.fechaHoraEntrada) as segundoEntrada, " +
                    "DATEPART(yy, rh.fechaHoraSalida) as yearSalida, " +
                    "DATEPART(mm, rh.fechaHoraSalida) as monthSalida, " +
                    "DATEPART(dd, rh.fechaHoraSalida) as daySalida, " +
                    "DATEPART(hh, rh.fechaHoraSalida) as horaSalida, " +
                    "DATEPART(n, rh.fechaHoraSalida) as minutoSalida, " +
                    "DATEPART(ss, rh.fechaHoraSalida) as segundoSalida, " +
                    "rh.Observacion as observacionRegistroHora, rh.aprobado as aprobadoRegistroHora, rh.aprobadoFinanzas, " +
                    "pe.idPersona, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, " +
                    "de.nombre as nombreDepartamento " +
                    "FROM RegistroHora rh, Persona pe, Convenio co, Departamento de " +
                    "WHERE TRY_CONVERT(date, fechaHoraEntrada) BETWEEN '" + startWeek() + "' AND '" + date(-1) + "' " +
                    "AND rh.idConvenio = co.idConvenio " +
                    "AND co.idPersona = pe.idPersona " +
                    "AND co.idDepartamento = de.idDepartamento " +
                    "AND rh.delet IS NULL " +
                    "AND co.delet IS NULL " +
                    "AND de.idDepartamento = " + req.params.idDepto;
                    querySQL(query, res);
    },
    getRegistroHorasMonth: (req, res) => {
        var query = "SELECT rh.idRegistroHora, rh.idConvenio, TRY_CONVERT(date, rh.fechaHoraEntrada) as fechaEntrada, TRY_CONVERT(date, rh.fechaHoraSalida) as fechaSalida, " +
                    "DATEPART(yy, rh.fechaHoraEntrada) as yearEntrada, " +
                    "DATEPART(mm, rh.fechaHoraEntrada) as monthEntrada, " +
                    "DATEPART(dd, rh.fechaHoraEntrada) as dayEntrada, " +
                    "DATEPART(hh, rh.fechaHoraEntrada) as horaEntrada, " +
                    "DATEPART(n, rh.fechaHoraEntrada) as minutoEntrada, " +
                    "DATEPART(ss, rh.fechaHoraEntrada) as segundoEntrada, " +
                    "DATEPART(yy, rh.fechaHoraSalida) as yearSalida, " +
                    "DATEPART(mm, rh.fechaHoraSalida) as monthSalida, " +
                    "DATEPART(dd, rh.fechaHoraSalida) as daySalida, " +
                    "DATEPART(hh, rh.fechaHoraSalida) as horaSalida, " +
                    "DATEPART(n, rh.fechaHoraSalida) as minutoSalida, " +
                    "DATEPART(ss, rh.fechaHoraSalida) as segundoSalida, " +
                    "rh.Observacion as observacionRegistroHora, rh.aprobado as aprobadoRegistroHora, rh.aprobadoFinanzas, " +
                    "pe.idPersona, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, " +
                    "de.nombre as nombreDepartamento " +
                    "FROM RegistroHora rh, Persona pe, Convenio co, Departamento de " +
                    "WHERE TRY_CONVERT(date, fechaHoraEntrada) BETWEEN '" + startMonth() + "' AND '" + date(-1) + "' " +
                    "AND rh.idConvenio = co.idConvenio " +
                    "AND co.idPersona = pe.idPersona " +
                    "AND co.idDepartamento = de.idDepartamento " +
                    "AND rh.delet IS NULL " +
                    "AND co.delet IS NULL " +
                    "AND de.idDepartamento = " + req.params.idDepto;
                    querySQL(query, res);
    },
    //para marcar hora de entrada
    addRegistroHora: (req, res) => {
        var observacion = null;
        if(req.body.observacionRegistroHora != null){
            observacion = "'" + req.body.observacionRegistroHora+"'";
        }
        var query = "INSERT INTO RegistroHora VALUES( " +
            req.body.idConvenio + ", '" +
            dateNow + "', null, " +
            observacion + ", 0, 0, null, null)";

            querySQL(query, res);
    },
    //para marcar hora de salida
    updateRegistroHoraSalida: (req, res) => {
        var query = "UPDATE RegistroHora SET " +
            "aprobado = '0', " +
            "fechaHoraSalida = '" + dateNow + "' " +
            "WHERE idRegistroHora = " + req.params.id;

            querySQL(query, res);
    },
    //se registrara la aprobacion y edit sera la fecha de aprovacion 
    updateRegistroHoraAprovado: (req, res) => {
        var observacion = null;
        if(req.body.observacionRegistroHora != null ){
            observacion = "'" + req.body.observacionRegistroHora + "'";
        }

        var query = "UPDATE RegistroHora SET " +
        "observacion = " + observacion + ", " +
        "aprobado = " + req.body.aprobadoRegistroHora + ", " +
        "edit = '" + dateNow + "' " +
        "WHERE idRegistroHora = "+ req.params.id;

        querySQL(query, res);
    },
    //se registrara la aprobacion de Finanzas para que luego no pueda cambiar de aprobacion el
    //jefe de departamento o eliminar
    updateRegistroHoraAprobarFinanzas: (req, res) => {
        var query = "UPDATE RegistroHora SET " +
        "aprobadoFinanzas = " + req.body.aprobadoFinanzas + " " +
        "WHERE idRegistroHora = "+ req.params.id;

        querySQL(query, res);
    },
    //Se cambiara de estado una vez que se haya registrado en informeEstudiante
    updateRegistroHoraEstado: (req, res) => {
        var query = "UPDATE RegistroHora SET " +
            "estado = '" + req.body.aprovadoRegistroHora + "', " +
            "edit = '" + dateNow + "' " +
            "WHERE idRegistroHora = " + req.params.id;

            querySQL(query, res);
    },
    updateRegistroHoraArchivar: (req, res) => {

        var query = "UPDATE RegistroHora SET " +
                    "archivar = '" + dateNow + "' " +
                    "WHERE idRegistroHora = " + req.params.id;

                    querySQL(query, res);
    },
    deleteRegistroHora: (req, res) => {

        var observacion = null;
        if(req.body.observacionRegistroHora != null ){
            observacion = "'" + req.body.observacionRegistroHora + "'";
        }

        var query = "UPDATE RegistroHora SET " +
                    "observacion = " + observacion + ", " +
                    "delet = '" + dateNow + "' " +
                    "WHERE idRegistroHora = " + req.params.id;

                    querySQL(query, res);
    }
};