var sql = require('mssql');
const config = require('../db/config.db');

function listDepartamentos(res) {
    sql.close();
    sql.connect(config, function(err) {
        if (err) {
            console.log(err);
            sql.close();
        }
        var request = new sql.Request();
        var query = "SELECT pe.idPersona, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, pe.direccion, pe.nacionalidad, pe.fechaNacimiento, pe.ci, pe.celular, " +
            "org.idOrganizacion, org.fechaRegistro as fechaRegistroOrganizacion, org.estado as estadoOrganizacion, " +
            "de.idDepartamento, de.nombre as nombreDepartamento, de.fechaRegistro as fechaRegistroDepartamento, de.estado as estadoDepartamento, " +
            "hd.costoHora, hd.limiteEstudiante, hd.fechaRegistro as fechaRegistroHistorialDep, hd.estado as estadoHistorialDepartamento " +
            "FROM Persona pe, Organizacion org, Departamento de, HistorialDepartamento hd " +
            "WHERE pe.idPersona = org.idPersona " +
            "AND org.idDepartamento = de.idDepartamento " +
            "AND de.idDepartamento = hd.idDepartamento ";
        request.query(query, function(err, result) {
            if (err) {
                console.log(err);
                sql.close();
                return;
            }
            var data = {};
            data = result.recordset;
            res.send(data);

        })
    })
}

function SearchDepartamento(req, res) {

    sql.connect(config, function(err) {
        if (err) {
            console.log(err);
        }
        var request = new sql.Request();
        var query = 'SELECT * FROM Departamento WHERE idDepartamento = ' + req.params.id;
        request.query(query, function(err, result) {
            if (err) {
                console.log(err);
                sql.close();
                return;
            }
            var data = {};
            data = result.recordset;
            res.send(data);
            sql.close();
        })
    })

}

function cmdSQL(query, res) {
    sql.connect(config, function(err) {
        if (err) {
            console.log("Error while connecting database :- " + err);
            res.send(err);
        } else {
            // create Request object
            var request = new sql.Request();
            // query to the database
            request.query(query, function(err, resp) {
                if (err) {
                    console.log("Error while querying database :- " + err);
                    res.send(err);
                } else {
                    res.send(resp);
                }

                sql.close();
            });
        }
    });
}


module.exports = {
    getDepartamentos: (req, res) => {
        listDepartamentos(res);
    },
    getDepartamento: (req, res) => {
        SearchDepartamento(req, res);
    },
    addDepartamento: (req, res) => {

        var query = "INSERT INTO Departamento VALUES ( '" +
            req.body.nombreDepartamento + "', '2018/11/20', 1)";
        cmdSQL(query, res);
    },
    updateDepartamento: (req, res) => {

        var query = "UPDATE Departamento SET " +
            "nombre = '" + req.body.nombre + "', " +
            "limiteEstudiante = " + req.body.limiteEstudiante + ", " +
            "fechaRegistro = '" + req.body.fechaRegistro + "', " +
            "estado = " + req.body.estado +
            " WHERE idDepartamento = " + req.params.id;

        cmdSQL(query, res);
    },
    deleteDepartamento: (req, res) => {

        var query = "DELETE FROM Departamento WHERE idDepartamento = " + req.params.id;

        cmdSQL(query, res);
    }
};