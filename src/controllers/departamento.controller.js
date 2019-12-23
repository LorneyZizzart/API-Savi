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
    getDepartamentoById: (req, res) =>{
        var query = "SELECT idDepartamento, nombre as nombreDepartamento, fechaRegistro, estado as estadoDepartamento FROM Departamento WHERE estado = 1 AND delet IS NULL "+
                    "AND idDepartamento = " +  req.params.idDepartamento;
        cmdSQL(query, res);
    },
    //se utiliza para realizar el convenio
    getAllDepartamentos: (req, res) =>{
        var query = "SELECT idDepartamento, nombre as nombreDepartamento, fechaRegistro, estado as estadoDepartamento FROM Departamento WHERE estado = 1 AND delet IS NULL ORDER BY nombre ASC";
        cmdSQL(query, res);
    },
    getDepartamentos: (req, res) => {
        //Lista de los departamentos [Modulo Departamento]
        var query = "SELECT idDepartamento, nombre as nombreDepartamento, fechaRegistro as fechaRegistroDepartamento, estado as estadoDepartamento, edit as fechaEditDepartamento FROM Departamento WHERE delet IS NULL ORDER BY nombre ASC";
        cmdSQL(query, res);
    },
    getDepartamentoName: (req, res) => {
        var query = "SELECT * FROM Departamento WHERE nombre = '" + req.params.nameDepto +"' AND delet IS NULL";
        cmdSQL(query, res);
    },
    //Obtener todos los departamentos del jefe de departamento
    getDepartamentosUser: (req, res) => {
        var query = "SELECT de.idDepartamento, de.nombre as nombreDepartamento, de.estado as estadoDepartamento, de.edit as editDepartamento " +
                    "FROM Departamento de, Usuario us, Rol ro, Persona pe, Organizacion org " +
                    "WHERE us.idRol = ro.idRol " +
                    "AND us.idPersona = pe.idPersona " +
                    "AND pe.idPersona = org.idPersona " +
                    "AND org.idDepartamento = de.idDepartamento " +
                    "AND de.delet IS NULL " +
                    "AND org.delet IS NULL " +
                    "AND org.estado = 1 " +
                    "AND ro.idRol = " + req.params.idRol + " " +
                    "AND us.idUsuario = " + req.params.idUser + " AND de.estado = 1";
        cmdSQL(query, res);
    },
    //Obtener todos los datos de un departamento -> se lo utiliza en informe de hoy
    getDepartamento: (req, res) => {
        var query = "SELECT de.idDepartamento, de.nombre as nombreDepartamento, de.fechaRegistro as fechaRegistroDepartamento, de.estado as estadoDepartamento, " +
                    "pe.idPersona, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, pe.direccion, pe.nacionalidad, pe.fechaNacimiento, pe.ci, pe.celular, pe.estado as estadoPersona, " +
                    "hd.limiteEstudiante, hd.costoHora, hd.fechaRegistro as fechaRegistroHistorialDepartamento, hd.edit as editHistorialDepartamento, " +
                    "org.idOrganizacion, org.fechaRegistro as fechaRegistroOrganizacion, org.estado as estadoOrganizacion " +
                    "FROM Departamento de, Persona pe, Organizacion org, HistorialDepartamento hd " +
                    "WHERE hd.idDepartamento = de.idDepartamento " +
                    "AND de.idDepartamento = org.idDepartamento " +
                    "AND org.idPersona = pe.idPersona " +
                    "AND hd.estado = 1 " +
                    'AND de.idDepartamento = ' + req.params.id;

        cmdSQL(query, res);
    },
    addDepartamento: (req, res) => {
        var query = "INSERT INTO Departamento VALUES ( '" +
            req.body.nombreDepartamento + "', '" +
            dateNow() + "', 1, '"+dateNow()+"', null)";
        cmdSQL(query, res);
    },
    updateDepartamento: (req, res) => {

        console.log("departamento: ", req.body);

        var query = "UPDATE Departamento SET " +
            "nombre = '" + req.body.nombreDepartamento + "', " +
            "estado = " + req.body.estadoDepartamento + ", " +
            "edit = '" + dateNow() + "' "+
            " WHERE idDepartamento = " + req.params.id;

        cmdSQL(query, res);
    },
    updateEstadoDepartamento: (req, res) => {
        var query = "UPDATE Departamento SET " +
                    "estado = " + req.body.estadoDepartamento + ", " +
                    "edit = '" + dateNow() + "' "+
                    "WHERE idDepartamento = " + req.params.id;
        cmdSQL(query, res);
    },
    deleteDepartamento: (req, res) => {

        var query = "UPDATE Departamento SET " +
            "delet = '" + dateNow() + "' "+
            "WHERE idDepartamento = " + req.params.id;

        cmdSQL(query, res);
    }
};