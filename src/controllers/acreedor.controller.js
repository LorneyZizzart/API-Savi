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

async function requestSQL(query){
    sql.connect(config).then(() => {
        return sql.query(query)
    }).then(result => {
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

function descuentoCreditos(req, res){

    var queryState = "UPDATE Acreedor SET " +
                "estado = " + req.body.estadoAcreedor + ", " +
                "edit = '" + dateNow() + "' " +
                "WHERE idAcreedor = " + req.body.idAcreedor;
                console.log("query: "+queryState);
    requestSQL(queryState);
    var query = "INSERT INTO Acreedor VALUES( " +
                req.body.idInformeEstudiante + ", " +
                req.body.idConvenio + ", " +
                req.body.idUsuario + ", '" +
                dateNow() + "', '" + 
                req.body.montoBs + "', 1, null, null, null)";

    cmdSQL(query, res);
}

module.exports = {   
    getAcreedorById : (req, res) => {
        var query = "SELECT idAcreedor, idInformeEstudiante, idConvenio, idUsuario, fechaAsignado, montoBs, estado, archivar, edit  " +
                    "FROM Acreedor " +
                    "WHERE delet IS NULL " +
                    "AND idAcreedor = " + req.params.id;
        cmdSQL(query, res);
    },
    //se utiliza acreditar en el modulo de descuentos
    getAcreedorByIdConvenio: (req, res) => {
        var query = "SELECT idAcreedor, idInformeEstudiante, idConvenio, idUsuario, fechaAsignado, montoBs, estado, archivar, edit  " +
                    "FROM Acreedor " +
                    "WHERE delet IS NULL " +
                    "AND estado = 1 " +
                    "AND idConvenio = " + req.params.idConvenio;
        cmdSQL(query, res);
    },
    //Consulta solo de la tabla de acreedores
    getListAcreedor: (req, res) => {
        var query = "SELECT idAcreedor, idInformeEstudiante, idConvenio, idUsuario, fechaAsignado, montoBs, estado, archivar, edit " +
                    "FROM Acreedor " +
                    "WHERE delet IS NULL";

        cmdSQL(query, res);

    },
    //Informes aprobados en finanzas [posibles errores probar]
    getAcreedores: (req, res) =>{
        var query = "SELECT pe.codEstudiante, pe.idPersona, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, pe.semestre, pe.direccion, pe.nacionalidad, pe.fechaNacimiento, pe.ci, pe.celular, pe.estado as estadoPersona, " +
                    "de.idDepartamento, de.nombre as departamento, " +
                    "co.fechaInicio, co.fechaFinal, co.fotocopiaCarnet, co.solicitudTrabajo, co.estado as estadoConvenio, " +
                    "ac.idAcreedor, ac.idConvenio, ac.idInformeEstudiante, ac.idUsuario, ac.fechaAsignado, ac.montoBs, ac.estado  " +
                    "FROM Acreedor ac, Convenio co,  Departamento de, Persona pe " +
                    "WHERE ac.idConvenio = co.idConvenio " +
                    "AND co.idPersona = pe.idPersona " +
                    "AND co.idDepartamento = de.idDepartamento " +
                    "AND ac.delet IS NULL " +
                    "AND ac.estado = 1 " + 
                    "ORDER BY ac.fechaAsignado ASC";

        cmdSQL(query, res);
    },
    //URI DE CONSUMO PARA EL SISTEMA FINANCIERO
    getAcreedorForCod: (req, res) =>{
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
                    "AND pe.codEstudiante = " + req.params.codEstudiante;

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
    }, //Para cuando se le haga un descuento para pagar sus estudios
    updateAcreedor: (req, res) => {
        descuentoCreditos(req, res)        
    },
    //ya no lo vamos a utilizar esperar para eliminar
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