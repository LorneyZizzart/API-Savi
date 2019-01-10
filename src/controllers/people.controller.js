var sql = require('mssql');

var config = {
    user: 'sa',
    password: "password",
    server: "127.0.0.1",
    database: "Savi"
};

function listPeople(res) {

    sql.connect(config, function(err) {
        if (err) {
            console.log(err);
        }
        var request = new sql.Request();
        request.query('SELECT * FROM Persona', function(err, result) {
            if (err) {
                console.log(err);
                return;
            }
            var data = {};
            data = result.recordset;
            res.send(data);
            sql.close();
        })
    })

}

function SearchPeople(req, res) {

    sql.connect(config, function(err) {
        if (err) {
            console.log(err);
        }
        var request = new sql.Request();
        var query = 'SELECT * FROM Persona WHERE idPersona = ' + req.params.id;
        request.query(query, function(err, result) {
            if (err) {
                console.log(err);
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
    getPeoples: (req, res) => {
        listPeople(res);
    },
    getPeople: (req, res) => {
        SearchPeople(req, res);
    },
    addPeople: (req, res) => {

        var query = "INSERT INTO Persona VALUES('" +
            req.body.primerNombre + "', '" +
            req.body.segundoNombre + "', '" +
            req.body.primerApellido + "', '" +
            req.body.segundoApellido + "', '" +
            req.body.ci + "', '" +
            req.body.carrera + "', " +
            req.body.semestre + ", '" +
            req.body.nacionalidad + "', '" +
            req.body.direccion + "', " +
            req.body.celular + ", '1995/06/15', 1)";

        cmdSQL(query, res);
    },
    updatePeople: (req, res) => {

        var query = "UPDATE Persona SET " +
            "primerNombre = '" + req.body.primerNombre + "', " +
            "segundoNombre = '" + req.body.segundoNombre + "', " +
            "primerApellido = '" + req.body.primerApellido + "', " +
            "segundoApellido = '" + req.body.segundoApellido + "', " +
            "direccion = '" + req.body.direccion + "', " +
            "nacionalidad = '" + req.body.nacionalidad + "', " +
            "fechaNacimiento = '" + req.body.fechaNacimiento + "', " +
            "ci = '" + req.body.ci + "', " +
            "celular = " + req.body.celular + ", " +
            "estado = " + req.body.estado +
            " WHERE idPersona = " + req.params.id;

        cmdSQL(query, res);
    },
    deletePeople: (req, res) => {

        var query = "DELETE FROM Persona WHERE idPersona = " + req.params.id;

        cmdSQL(query, res);
    }
};