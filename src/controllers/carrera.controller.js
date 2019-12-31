const {querySQL} = require("../db/cmdSQL");
const {dateNow} = require('../class/date');

module.exports = {
    //para registrar estudiante
    getCarreras: (req, res) => {
        var query = "SELECT idCarrera, nombre as nombreCarrera, estado as estadoCarrera FROM Carrera WHERE delet IS NULL AND estado = 1 ORDER BY nombre ASC";
        querySQL(query, res);
    },
    //
    getCarrera: (req, res) =>{
        var query = "SELECT idCarrera, nombre as nombreCarrera, estado as estadoCarrera, register as registerCarrera " +
                    "FROM Carrera " +
                    "WHERE idCarrera = " + req.params.idCarrera;
                    querySQL(query, res);
    },
    addCarrera: (req, res) => {

        var query = "INSERT INTO Carrera VALUES( '" +
            req.body.nombreCarrera + "', '" +
            dateNow + "', null, null, 1)";

            querySQL(query, res);
    },
    updateCarrera: (req, res) => {

        var query = "UPDATE Carrera SET " +
                    "nombre = '" + req.body.nombreCarrera + "', " +
                    "edit = '" + dateNow + "' " +
                    "WHERE idCarrera = " + req.params.idCarrera; 

                    querySQL(query, res);
    },
    updateEstadoCarrera: (req, res) => {

        var query = "UPDATE Carrera SET " +
                    "estado = '" + req.body.estadoCarrera + "', " +
                    "edit = '" + dateNow + "' " +
                    "WHERE idCarrera = " + req.params.idCarrera; 

                    querySQL(query, res);
    },
    deleteCarrera: (req, res) => {
        var query = "UPDATE Carrera SET " +
                    "delet = '" + dateNow + "' " +
                    "WHERE idCarrera = " + req.params.idCarrera;      

                    querySQL(query, res);
    }
};