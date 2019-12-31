const {querySQL, requestSQL} = require("../db/cmdSQL");
const {dateNow} = require('../class/date');

module.exports = {
    //Obtencion todo el historial de un solo departamento
    getHistorialDepartamentos: (req, res) => {
        var query = "SELECT de.idDepartamento, de.nombre as nombreDepartamento, de.fechaRegistro as fechaRegistroDepartamento, de.estado as estadoDepartameto, de.edit as editDepartamento, de.delet as deletDepartamento, " +
                    "hd.idHistorialDepartamento, hd.limiteEstudiante, hd.costoHora, hd.fechaRegistro as fechaRegistroHistorialDepartamento, hd.estado as estadoHistorialDepartamento, hd.edit as editHistorialDepartamento, hd.delet as deletHistorialDepartamento " +
                    "FROM Departamento de, HistorialDepartamento hd " +
                    "WHERE de.idDepartamento = hd.idDepartamento " +
                    "AND hd.delet IS NULL AND de.idDepartamento = " + req.params.id + " ORDER BY hd.fechaRegistro aSC";

                    querySQL(query, res);
    },
    getHistorialDepartamento: (req, res) => {
        var query = "SELECT idHistorialDepartamento, idDepartamento, limiteEstudiante, costoHora, fechaRegistro as fechaRegistroHistorialDepartamento, estado as estadoHistorialDepartamento, edit as editHistorialDepartamento " +
                    "FROM HistorialDepartamento " +
                    "WHERE estado = 1 AND idDepartamento = " + req.params.id;
                    querySQL(query, res);
    },
    addHistorialDepartamento: (req, res) => {

        var queryAux = "UPDATE HistorialDepartamento SET " +
                        "estado = 0 " +
                        "WHERE idDepartamento = " + req.body.idDepartamento;
        
        if(requestSQL(queryAux)){
            var query = "INSERT INTO HistorialDepartamento VALUES (" +
            req.body.idDepartamento + ", " +
            req.body.limiteEstudiante + ", '" +
            req.body.costoHora + "', '" + 
            dateNow() + "', 1, '"+dateNow+"', null)";
            querySQL(query, res);
        }

        
    },
    //cuando se actualize al registro anterior se pondra en estado false
    updateEstadoHistorialDepartamento: (req, res) => {

        if(req.body.estadoHistorialDepartamento == '1'){
            var queryAux = "UPDATE HistorialDepartamento SET " +
                        "estado = 0 " +
                        "WHERE idDepartamento = " + req.body.idDepartamento;
            requestSQL(queryAux);
        }

        var query = "UPDATE HistorialDepartamento SET " +
                    "estado = " + req.body.estadoHistorialDepartamento + ", " +
                    "edit = '" + dateNow + "' "+
                    "WHERE idHistorialDepartamento = " + req.params.id;

                    querySQL(query, res);
    },
    updateHistorialDepartamento: (req, res) => {

        var query = "UPDATE HistorialDepartamento SET " +
                    "limiteEstudiante = " + req.body.limiteEstudiante + ",  " +
                    "costoHora = " + req.body.costoHora + ", " +
                    "edit = '" + dateNow + "' "+
                    "WHERE idHistorialDepartamento = " + req.params.id;

                    querySQL(query, res);
    },
    deleteHistorialDepartamento: (req, res) => {
        var query = "UPDATE HistorialDepartamento SET " +
                    "delet = '" + dateNow + "' "+
                    "WHERE idHistorialDepartamento = " + req.params.id;

                    querySQL(query, res);
    }
};