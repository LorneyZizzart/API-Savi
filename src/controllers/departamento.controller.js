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

        if (dd < 10) {
            dd = '0' + dd;
          }
          
          if (mm < 10) {
            mm = '0' + mm;
          }

          return fechaRegistro = yyyy+'/'+mm+'/'+dd;
}


module.exports = {
    getAllDepartamentos: (req, res) =>{
        var query = "SELECT idDepartamento, nombre as nombreDepartamento, fechaRegistro, estado as estadoDepartamento FROM Departamento";
        cmdSQL(query, res);
    },
    getDepartamentos: (req, res) => {
        //Departamentos con Jefe dep, y con su historial
        var query = "SELECT Distinct de.idDepartamento, " +
                    "pe.idPersona, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, pe.direccion, pe.nacionalidad, pe.fechaNacimiento, pe.ci, pe.celular, pe.estado as estadoPersona, " +
                    "org.idOrganizacion, org.fechaRegistro as fechaRegistroOrganizacion, org.estado as estadoOrganizacion, " +
                    "de.nombre as nombreDepartamento, de.fechaRegistro as fechaRegistroDepartamento, de.estado as estadoDepartamento, " +
                    "hd.costoHora, hd.limiteEstudiante, hd.fechaRegistro as fechaRegistroHistorialDep, hd.estado as estadoHistorialDepartamento " +
                    "FROM Persona pe, Organizacion org, Departamento de, HistorialDepartamento hd " +
                    "WHERE pe.idPersona = org.idPersona " +
                    "AND org.idDepartamento = de.idDepartamento " +
                    "AND de.idDepartamento = hd.idDepartamento " +
                    "ORDER BY de.nombre ASC";
        cmdSQL(query, res);
    },
    getDepartamento: (req, res) => {
        var query = 'SELECT * FROM Departamento WHERE idDepartamento = ' + req.params.id;

        cmdSQL(query, res);
    },
    addDepartamento: (req, res) => {
        console.log("'"+dateNow()+"'");
        var query = "INSERT INTO Departamento VALUES ( '" +
            req.body.nombreDepartamento + "', '" +
            dateNow() + "', 1)";
        cmdSQL(query, res);
    },
    updateDepartamento: (req, res) => {

        var query = "UPDATE Departamento SET " +
            "nombre = '" + req.body.nombre + "', " +
            "fechaRegistro = '" + dateNow() + "', " +
            "estado = " + req.body.estado +
            " WHERE idDepartamento = " + req.params.id;

        cmdSQL(query, res);
    },
    updateEstadoDepartamento: (req, res) => {
        var query = "UPDATE Departamento SET " +
                    "estado = " + req.body.estadoDepartamento + 
                    " WHERE idDepartamento = " + req.params.id;
        cmdSQL(query, res);
    },
    deleteDepartamento: (req, res) => {

        var query = "DELETE FROM Departamento WHERE idDepartamento = " + req.params.id;

        cmdSQL(query, res);
    }
};