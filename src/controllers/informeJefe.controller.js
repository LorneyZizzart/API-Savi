const {querySQL} = require("../db/cmdSQL");
const {dateNow} = require('../class/date');

module.exports = {
    //Obtencion del ultimo registrado por el jefe del departamento
    getMaxIdJefe: (req, res) =>{

        var query = "SELECT MAX(ij.idInformeJefe) AS idInformeJefe " +
                    "FROM InformeJefe ij, Usuario us, Departamento de " +
                    "WHERE de.idDepartamento = ij.idDepartamento " + 
                    "AND us.idUsuario = ij.idUsuario " +
                    "AND ij.idUsuario = " + req.params.idUser + " " +
                    "AND de.idDepartamento = " + req.params.idDept;

                    querySQL(query, res);
    },
    //para generar un informe del jefe
    addInformeJefe: (req, res) => {
        var observacion = null;
        var detalle = null;
        if(req.body.observacion != null){
            observacion = "'" + req.body.observacion+"'";
        }
        if(req.body.detalle != null){
            detalle = "'" + req.body.detalle+"'";
        }
        var query = "INSERT INTO InformeJefe VALUES( " +
            req.body.idDepartamento + ", '" +
            dateNow + "', " + 
            detalle + ", " +
            observacion + ", null, null)";

            querySQL(query, res);
    },
    updateInformeJefe: (req, res) => {
        var query = "UPDATE RegistroHora SET " +
            "fechaHoraSalida = '" + dateNow + "' " +
            "WHERE idRegistroHora = " + req.params.id;

            querySQL(query, res);
    },
    deleteInformeJefe: (req, res) => {

        var query = "UPDATE RegistroHora SET " +
                    "delet = '" + dateNow + "' " +
                    "WHERE idRegistroHora = " + req.params.id;

                    querySQL(query, res);
    }
};