const userDB = require('../db/user.db');
var sql = require('mssql');
var moment = require('moment');
const config = require('../db/config.db');

function listConvenio(res) {

    sql.connect(config, function(err) {
        if (err) {
            console.log(err);
        }
        var request = new sql.Request();
        request.query('SELECT co.idConvenio, pe.idPersona, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, de.idDepartamento, de.nombre as departamento, be.idBeca, be.nombre as beca, co.fechaInicio, co.fechaFinal, co.fotocopiaCarnet, co.solicitudTrabajo, co.estado FROM Convenio co, Persona pe, Departamento de, Beca be WHERE co.idPersona = pe.idPersona AND co.idDepartamento = de.idDepartamento AND co.idBeca = be.idBeca',
            function(err, result) {
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

function SearchConvenio(req, res) {

    sql.connect(config, function(err) {
        if (err) {
            console.log(err);
        }
        var request = new sql.Request();
        var query = 'SELECT * FROM Convenio WHERE idConvenio = ' + req.params.id;
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

function formateDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) month = '0' + month;
    if (day.length < 2) day = '0' + day;

    return [year, month, day].join('/');
}


module.exports = {
    getConvenios: (req, res) => {
        listConvenio(res);
    },
    getConvenio: (req, res) => {
        SearchConvenio(req, res);
    },
    addConvenio: (req, res) => {
        // var d = new Date();

        // console.log("Fecha convertida: ", req.body.fechaInicio.toString());
        // var fecham = req.body.fechaInicio.toString();
        // console.log("Fecha year: ", d.getFullYear(fecham));
        // console.log("Fecha month: ", d.getMonth(fecham));
        // console.log("Fecha day: ", d.getDay(fecham));
        // console.log("Fecha now: ", Date.now());

        console.log(req.body);

        // console.log("fechaInicio: ", moment(req.body.fechaInicio, ["DD-MM-YYYY", "YYYY-MM-DD"]));
        // console.log(" fechaFinal: ", moment(req.body.fechaFinal, ["DD-MM-YYYY", "YYYY-MM-DD"]));

        var query = "INSERT INTO Convenio (idPersona, idDepartamento, idBeca, fechaInicio, fechaFinal, fotocopiaCarnet, solicitudTrabajo, estado ) VALUES(" +
            req.body.idPersona + ", " +
            req.body.idDepartamento + ", " +
            req.body.idBeca + ", '2018/11/16', '2018/12/31', 1, 0, 1)";

        cmdSQL(query, res);
    },
    updateConvenio: (req, res) => {

        var query = "UPDATE Convenio SET " +
            "idDepartamento = " + req.body.idDepartamento + ", " +
            "idPersona = " + req.body.idPersona + ", " +
            "idBeca = " + req.body.idBeca + ", " +
            "fechaInicio = '" + req.body.fechaInicio + "', " +
            "fechaFinal = '" + req.body.fechaFinal + "', " +
            "fotocopiaCarnet = " + req.body.fotocopiaCarnet + ", " +
            "solicitudTrabajo = " + req.body.solicitudTrabajo + ", " +
            "estado = " + req.body.estado +
            " WHERE idConvenio = " + req.params.id;

        cmdSQL(query, res);
    },
    deleteConvenio: (req, res) => {

        var query = "DELETE FROM Convenio WHERE idConvenio = " + req.params.id;

        cmdSQL(query, res);
    }
};