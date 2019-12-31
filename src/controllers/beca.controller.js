const {querySQL} = require("../db/cmdSQL");

module.exports = {
    getBecas: (req, res) => {
        var query = "SELECT * FROM Beca";
        querySQL(query, res);
    },
    getBeca: (req, res) => {
        var query = 'SELECT * FROM Beca WHERE idBeca = ' + req.params.id;
        querySQL(query, res);
    },
    addBeca: (req, res) => {

        var query = "INSERT INTO Beca VALUES( '" +
            req.body.nombre + "',  1)";

            querySQL(query, res);
    },
    updateBeca: (req, res) => {

        var query = "UPDATE Beca SET " +
            "nombre = '" + req.body.nombre + "', " +
            "estado = " + req.body.estado +
            " WHERE idBeca = " + req.params.id;

            querySQL(query, res);
    },
    deleteBeca: (req, res) => {

        var query = "DELETE FROM Beca WHERE idBeca = " + req.params.id;

        querySQL(query, res);
    }
};