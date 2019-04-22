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
        var hh = fechaRegistro.getHours();
        var min = fechaRegistro.getMinutes();
        var ss = fechaRegistro.getSeconds();

        if (dd < 10) { dd = '0' + dd; }
        if (mm < 10) { mm = '0' + mm; }
        if (hh < 10) { hh = '0' + hh;   }
        if (min < 10) { min = '0' + min;   }
        if (ss < 10) { ss = '0' + ss;   }

        return fechaRegistro = yyyy+'/'+mm+'/'+dd+' '+hh+':'+min+':'+ss+'.000';
}


module.exports = {
    //VER LOS USUARIOS PARA FINANZAS
    getUsers: (req, res) => {
        var query = "SELECT pe.idPersona, pe.idCarrera, us.idUsuario, us.idRol, pe.codEstudiante, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, pe.semestre, pe.direccion, pe.nacionalidad, pe.fechaNacimiento, pe.ci, pe.celular, " +
                    "pe.estado as estadoPersona, us.estado as estadoUsuario, us.usuario, us.password " +
                    "FROM Persona pe, Usuario us " +
                    "WHERE pe.idPersona = us.idPersona " +
                    "AND us.idRol != 1 " +
                    "AND us.idRol != 6 " +
                    "AND us.delet IS NULL " +
                    "ORDER BY pe.primerApellido ASC ";
        cmdSQL(query, res);
    },//obtener datos del usuario para el navbar
    getUser: (req, res) => {
        var query = "SELECT pe.idPersona, us.idUsuario, us.idRol, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, " +
                    "rl.nombre as rol, us.estado as estadoUsuario " +
                    "FROM Usuario us, Rol rl, Persona pe " +
                    "WHERE pe.idPersona = us.idPersona " +
                    "AND us.idRol = rl.idRol " +
                    "AND idUsuario = " + req.params.id;
        cmdSQL(query, res);
    },//para el login 
    getVerificarUser: (req, res) => {
        var query = "SELECT * FROM Usuario WHERE usuario = '" + req.body.usuario + "' AND password = '" + req.body.password + "' AND delet IS NULL";
        cmdSQL(query, res);
    },//para verificar si el nombre de usuario existe
    searchUser: (req, res) => {
        var query = "SELECT * FROM Usuario WHERE usuario = '" + req.params.usuario + "' AND delet IS NULL";
        cmdSQL(query, res);
    },
    addUser: (req, res) => {

        var query = "INSERT INTO Usuario VALUES(" +
            req.body.idPersona + "," +
            req.body.idRol + ", '" +
            req.body.usuario + "', '" +
            req.body.password + "', 1, '" +
            dateNow() + "', null, null)";

        cmdSQL(query, res);
    },
    updateUser: (req, res) => {   
        var query = "UPDATE Usuario SET " +
            "idRol = " + req.body.idRol + ", " +
            "usuario = '" + req.body.usuario + "', " +
            "password = '" + req.body.password + "', " +
            "estado = " + req.body.estado + ", " +
            "edit = '" + dateNow() + "' "+
            "WHERE idUsuario = " + req.params.id + "AND idPersona = " + req.params.idPersona;

        cmdSQL(query, res);
    },
    updateEstadoUser: (req, res) => {
        var query = "UPDATE Usuario SET " +
            "estado = " + req.body.estado + ", " +
            "edit = '" + dateNow() + "' "+
            "WHERE idUsuario = " + req.params.id;

        cmdSQL(query, res);
    },
    deleteUser: (req, res) => {

        var query = "UPDATE Usuario SET " +
                    "delet = '" + dateNow() + "' "+
                    "WHERE idUsuario = " + req.params.id;

        cmdSQL(query, res);
    }
};