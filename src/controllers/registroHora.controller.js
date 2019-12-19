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
function option(){
    var fecha=new Date();
 
	// Cogemos la fecha actual en formato milisegundos desde 1/1/1970 y le 
	// restamos tantos milisegundos como tiene un dia.
	var ayer=new Date(fecha.getTime() - 24*60*60*1000);
 
	// Sumamos los milisegundos que tiene un dia
	var manana=new Date(fecha.getTime() + 24*60*60*1000);
 
	// Sumamos los milisegundos que tiene una semana
	var laProximaSemana=new Date(fecha.getTime() + (24*60*60*1000)*7);
 
	// Restamos los milisegundos que tiene una semana
	var HaceUnaSemana=new Date(fecha.getTime() - (24*60*60*1000)*7);
 
	console.log("La Fecha de hoy es: "+fecha.getDate()+"/"+fecha.getMonth()+"/"+fecha.getFullYear());
 
	console.log("La Fecha de ayer es: "+ayer.getDate()+"/"+ayer.getMonth()+"/"+ayer.getFullYear());
 
    console.log("La Fecha de mañana es: "+manana.getDate()+"/"+manana.getMonth()+"/"+manana.getFullYear());
 
	console.log("La Fecha de la próxima semana es: "+laProximaSemana.getDate()+"/"+laProximaSemana.getMonth()+"/"+laProximaSemana.getFullYear());
    console.log("La Fecha de hace una semana es: "+HaceUnaSemana.getDate()+"/"+HaceUnaSemana.getMonth()+"/"+HaceUnaSemana.getFullYear());
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
        cmdSQL(query, res);
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
        cmdSQL(query, res);
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
        cmdSQL(query, res);
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
        cmdSQL(query, res);
    },
    //para marcar hora de entrada
    addRegistroHora: (req, res) => {
        var observacion = null;
        if(req.body.observacionRegistroHora != null){
            observacion = "'" + req.body.observacionRegistroHora+"'";
        }
        var query = "INSERT INTO RegistroHora VALUES( " +
            req.body.idConvenio + ", '" +
            dateNow() + "', null, " +
            observacion + ", 0, 0, null, null)";

        cmdSQL(query, res);
    },
    //para marcar hora de salida
    updateRegistroHoraSalida: (req, res) => {
        var query = "UPDATE RegistroHora SET " +
            "aprobado = '0', " +
            "fechaHoraSalida = '" + dateNow() + "' " +
            "WHERE idRegistroHora = " + req.params.id;

        cmdSQL(query, res);
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
        "edit = '" + dateNow() + "' " +
        "WHERE idRegistroHora = "+ req.params.id;

        cmdSQL(query, res);
    },
    //se registrara la aprobacion de Finanzas para que luego no pueda cambiar de aprobacion el
    //jefe de departamento o eliminar
    updateRegistroHoraAprobarFinanzas: (req, res) => {
        var query = "UPDATE RegistroHora SET " +
        "aprobadoFinanzas = " + req.body.aprobadoFinanzas + " " +
        "WHERE idRegistroHora = "+ req.params.id;

        cmdSQL(query, res);
    },
    //Se cambiara de estado una vez que se haya registrado en informeEstudiante
    updateRegistroHoraEstado: (req, res) => {
        var query = "UPDATE RegistroHora SET " +
            "estado = '" + req.body.aprovadoRegistroHora + "', " +
            "edit = '" + dateNow() + "' " +
            "WHERE idRegistroHora = " + req.params.id;

        cmdSQL(query, res);
    },
    updateRegistroHoraArchivar: (req, res) => {

        var query = "UPDATE RegistroHora SET " +
                    "archivar = '" + dateNow() + "' " +
                    "WHERE idRegistroHora = " + req.params.id;

        cmdSQL(query, res);
    },
    deleteRegistroHora: (req, res) => {

        var observacion = null;
        if(req.body.observacionRegistroHora != null ){
            observacion = "'" + req.body.observacionRegistroHora + "'";
        }

        var query = "UPDATE RegistroHora SET " +
                    "observacion = " + observacion + ", " +
                    "delet = '" + dateNow() + "' " +
                    "WHERE idRegistroHora = " + req.params.id;

        cmdSQL(query, res);
    }
};