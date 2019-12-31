const {querySQL, requestSQL} = require("../db/cmdSQL");
const {dateNow} = require('../class/date')

module.exports = {   
    getAcreedorById : (req, res) => {
        var query = "SELECT idAcreedor, idInformeEstudiante, idConvenio, idUsuario, fechaAsignado, montoBs, estado, archivar, edit  " +
                    "FROM Acreedor " +
                    "WHERE delet IS NULL " +
                    "AND idAcreedor = " + req.params.id;
                    querySQL(query, res);
    },
    //se utiliza acreditar en el modulo de descuentos
    getAcreedorByIdConvenio: (req, res) => {
        var query = "SELECT idAcreedor, idInformeEstudiante, idConvenio, idUsuario, fechaAsignado, montoBs, estado, archivar, edit  " +
                    "FROM Acreedor " +
                    "WHERE delet IS NULL " +
                    "AND estado = 1 " +
                    "AND idConvenio = " + req.params.idConvenio;
                    querySQL(query, res);
    },
    //Consulta solo de la tabla de acreedores
    getListAcreedor: (req, res) => {
        var query = "SELECT idAcreedor, idInformeEstudiante, idConvenio, idUsuario, fechaAsignado, montoBs, estado, archivar, edit " +
                    "FROM Acreedor " +
                    "WHERE delet IS NULL";

                    querySQL(query, res);

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

                    querySQL(query, res);
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

                    querySQL(query, res);
    },
    addAcreedor: (req, res) => {

        var query = "INSERT INTO Acreedor VALUES( " +
            req.body.idInformeEstudiante + ", " +
            req.body.idConvenio + ", " +
            req.body.idUsuario + ", '" +
            dateNow + "', '" + 
            req.body.montoBs + "', 1, null, null, null)";

            querySQL(query, res);
    }, //Para cuando se le haga un descuento para pagar sus estudios
    updateAcreedor: (req, res) => {
        var queryState = "UPDATE Acreedor SET " +
                "estado = " + req.body.estadoAcreedor + ", " +
                "edit = '" + dateNow + "' " +
                "WHERE idAcreedor = " + req.body.idAcreedor;

        requestSQL(queryState);

        var query = "INSERT INTO Acreedor VALUES( " +
                    req.body.idInformeEstudiante + ", " +
                    req.body.idConvenio + ", " +
                    req.body.idUsuario + ", '" +
                    dateNow + "', '" + 
                    req.body.montoBs + "', 1, null, null, null)";

        querySQL(query, res);      
    },
    //ya no lo vamos a utilizar esperar para eliminar
    updateAcreedorSaldo: (req, res) => {

        var query = "UPDATE Acreedor SET " +
                    "idInformeEstudiante = " + req.body.idInformeEstudiante + ", " +
                    "montoBs = '" + req.body.montoBs + "', " +
                    "edit = '" + dateNow + "' " +
                    "WHERE idConvenio = " + req.params.id + "AND delet IS NULL"; 

                    querySQL(query, res);
    },
    updateDevolverSaldo: (req, res) => {

        var query = "UPDATE Acreedor SET " +
                    "montoBs = '" + req.body.montoBs + "', " +
                    "edit = '" + dateNow + "' " +
                    "WHERE idConvenio = " + req.params.id + "AND delet IS NULL"; 

                    querySQL(query, res);
    },
    deleteAcreedor: (req, res) => {
        var query = "UPDATE Acreedor SET " +
                    "delet = '" + dateNow + "' " +
                    "WHERE idInformeEstudiante = " + req.params.id;      

                    querySQL(query, res);
    }
};