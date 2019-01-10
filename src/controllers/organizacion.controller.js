var sql = require('mssql');
const config = require('../db/config.db');

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
    getOrganizacion: (req, res) => {},
    getOrganizacion: (req, res) => {},
    addOrganizacion: (req, res) => {

        var query = "INSERT INTO Organizacion VALUES (" +
            req.body.idDepartamento + ", " +
            req.body.idPersona + ", '2018/11/20', 1)";
        cmdSQL(query, res);
    },
    updateOrganizacion: (req, res) => {},
    deleteOrganizacion: (req, res) => {}
};