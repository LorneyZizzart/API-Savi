const {querySQL} = require("../db/cmdSQL");
const {dateNow} = require('../class/date');

module.exports = {
    getDescuentos: (req, res) => {
        var query = "SELECT  pe.codEstudiante, pe.idPersona, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, ca.idCarrera, ca.nombre as carrera, pe.semestre, pe.direccion, pe.nacionalidad, pe.fechaNacimiento, pe.ci, pe.celular, pe.estado as estadoPersona, " +
                    "de.idDepartamento, de.nombre as departamento, " +
                    "be.idBeca, be.nombre as beca, " +
                    "co.fechaInicio, co.fechaFinal, co.fotocopiaCarnet, co.solicitudTrabajo, co.estado as estadoConvenio, " +
                    "descu.idDescuento, descu.idAcreedor, co.idConvenio, descu.idUsuario, descu.fechaDescuento, descu.saldoInicial as saldoInicialDescuento, descu.montoBs as montoDescuento, descu.observacion as observacionDescuento , descu.estado as estadoDescuento " +
                    "FROM Descuento descu, Convenio co, Beca be, Departamento de, Persona pe, Acreedor ac, Carrera ca " +
                    "WHERE descu.idAcreedor = ac.idAcreedor " +
                    "AND ac.idConvenio = co.idConvenio " +
                    "AND co.idPersona = pe.idPersona " +
                    "AND pe.idCarrera = ca.idCarrera " +
                    "AND co.idBeca = be.idBeca " +
                    "AND co.idDepartamento = de.idDepartamento " +
                    "AND ac.delet IS NULL " +
                    "AND descu.delet IS NULL " +
                    "ORDER BY ac.fechaAsignado ASC";
                    querySQL(query, res);
    },
    getDescuentosByConvenio : (req, res) => {
        var query = "SELECT ac .idAcreedor, ac.idInformeEstudiante, ac.idConvenio, ac.idUsuario, ac.fechaAsignado, ac.montoBs, ac.estado, " +
                    "de.idDescuento, de.fechaDescuento, de.saldoInicial as saldoInicialDescuento, de.montoBs as montoBsDescuento, de.observacion as observacionDescuento, de.estado as estadoDescuento " +
                    "FROM Acreedor ac, Descuento de " +
                    "WHERE ac.idAcreedor = de.idAcreedor " +
                    "AND idConvenio = " + req.params.idConvenio + " "
                    "AND ac.delet IS NULL " +
                    "AND de.delet IS NULL";
                    querySQL(query, res);
    },
    addDescuento: (req, res) => {
        var observacion = null;
        if(req.body.observacionDescuento == null || req.body.observacionDescuento == undefined){
            observacion = "NULL";
        }else{
            observacion = "'"+req.body.observacionDescuento+"'";
        }
        var query = "INSERT INTO Descuento VALUES( " +
            req.body.idAcreedor + ", " +
            req.body.idUsuario + ", '" +
            dateNow + "', '" +
            req.body.saldoInicialDescuento + "', '" +
            req.body.montoDescuento + "', " + observacion + ", null, null, 1)";

            querySQL(query, res);
    },
    updateDescuento: (req, res) => {

        var observacion = null;
        if(req.body.observacionDescuento == null || req.body.observacionDescuento == undefined){
            observacion = "NULL";
        }else{
            observacion = "'"+req.body.observacionDescuento+"'";
        }

        var query = "UPDATE Descuento SET " +
            "idUsuario = " + req.body.idUsuario + ", " +
            "saldoInicial = '" + req.body.saldoInicialDescuento + "', " +
            "montoBs = '" + req.body.montoDescuento + "', " +
            "observacion = " + observacion + ", " +
            "estado = " + req.body.estadoDescuento + ", " +
            "edit = '" + dateNow + "' " +
            "WHERE idDescuento = " + req.params.id;
        querySQL(query, res);
    },
    deleteDescuento: (req, res) => {
        var query = "UPDATE Descuento SET " +
            "delet = '" + dateNow + "' " +
            "WHERE idDescuento = " + req.params.id;

            querySQL(query, res);
    }
};