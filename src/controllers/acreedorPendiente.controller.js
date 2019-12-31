const {querySQL} = require("../db/cmdSQL");
const {dateNow} = require('../class/date')

module.exports = {    
    getAcreedoresPendientes: (req, res) => {
        var query = "SELECT * FROM AcreedorPendiente";
        querySQL(query, res);
    },
    addAcreedorPendiente: (req, res) => {
        var query = "INSERT INTO AcreedorPendiente VALUES( " +
            req.body.idAcreedor + ", " +
            req.body.idUsuario + ", '" +
            req.body.saldo + "', '" +
            dateNow + "', 1, null, null)";

            querySQL(query, res);
    },
    updateAcreedorPendiente: (req, res) => {
    },
    deleteAcreedorPendiente: (req, res) => {
    }
};