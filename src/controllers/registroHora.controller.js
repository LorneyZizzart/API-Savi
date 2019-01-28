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

module.exports = {
    //este metodo es utilizado para generar informes registro de ingreso/salida de HOY y AYER
    getRegistroHorasNow: (req, res) =>{

        var query = "SELECT rh.idRegistroHora, rh.idConvenio, TRY_CONVERT(date, rh.fechaHoraEntrada) as fechaEntrada, " +
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
         "rh.Observacion as observacionRegistroHora, rh.aprovado as aprovadoRegistroHora, rh.estado as estadoRegistroHora, " +
         "pe.idPersona, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, " +
         "de.nombre as nombreDepartamento, " +
         "ar.nombre as nombreArea " +
        "FROM RegistroHora rh, Convenio co, Persona pe, Departamento de, Area ar, AsignacionArea aa " +
        "WHERE TRY_CONVERT(date, fechaHoraEntrada) = '" + date(0) + "' " +
        "AND rh.idConvenio = co.idConvenio " +
        "AND co.idPersona = pe.idPersona " +
        "AND co.idDepartamento = de.idDepartamento " +
        "AND co.idConvenio = aa.idConvenio " +
        "AND aa.idArea = ar.idArea " +
        "AND de.idDepartamento = " + req.params.idDepto ;
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
         "rh.Observacion as observacionRegistroHora, rh.aprovado as aprovadoRegistroHora, rh.estado as estadoRegistroHora, " +
         "pe.idPersona, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, " +
         "de.nombre as nombreDepartamento, " +
         "ar.nombre as nombreArea " +
        "FROM RegistroHora rh, Convenio co, Persona pe, Departamento de, Area ar, AsignacionArea aa " +
        "WHERE TRY_CONVERT(date, fechaHoraEntrada) = '" + date(-1) + "' " +
        "AND rh.idConvenio = co.idConvenio " +
        "AND co.idPersona = pe.idPersona " +
        "AND co.idDepartamento = de.idDepartamento " +
        "AND co.idConvenio = aa.idConvenio " +
        "AND aa.idArea = ar.idArea " +
        "AND de.idDepartamento = " + req.params.idDepto ;
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
            observacion + ", 0, 1)";

        cmdSQL(query, res);
    },
    //para marcar hora de salida
    updateRegistroHoraSalida: (req, res) => {
        var query = "UPDATE RegistroHora SET " +
            "fechaHoraSalida = '" + dateNow() + "' " +
            "WHERE idRegistroHora = " + req.params.id;

        cmdSQL(query, res);
    },
    deleteRegistroHora: (req, res) => {

        var query = "DELETE FROM RegistroHora " +
            "WHERE idRegistroHora = " + req.params.id;

        cmdSQL(query, res);
    }
};