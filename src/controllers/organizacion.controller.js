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

//un auxiliar cmd 
async function requestSQL(query){
    sql.connect(config).then(() => {
        sql.query(query);
        return true;
    }).then(result => {
    })
}

function dateNow(){
    var fechaRegistro = new Date();
        var dd = fechaRegistro.getDate();
        var mm = fechaRegistro.getMonth() + 1;
        var yyyy = fechaRegistro.getFullYear();

        if (dd < 10) {
            dd = '0' + dd;
          }
          
          if (mm < 10) {
            mm = '0' + mm;
          }

          return fechaRegistro = yyyy+'/'+mm+'/'+dd;
}


module.exports = {
    getOrganizacion: (req, res) => {
        //PARA VER LA INFO DEL DEPARTAMENTO [modulo de departamento]
        var query = "SELECT idOrganizacion, idDepartamento, idPersona, fechaRegistro as fechaRegistroOrganizacion, estado as estadoOrganizacion, edit as editOrganizacion " +
                    "FROM Organizacion " +
                    "WHERE estado = 1 AND idDepartamento = " + req.params.id;
        //var query = "SELECT de.idDepartamento, de.nombre FROM Departamento de , Organizacion org " +
          //              "WHERE NOT EXISTS (SELECT * FROM Departamento de , Organizacion org WHERE de.idDepartamento = org.idDepartamento)";
         cmdSQL(query, res);
    },
    getOrganizaciones: (req, res) => {
        var query = "SELECT pe.idPersona, us.idUsuario, us.idRol, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, pe.direccion, pe.nacionalidad, pe.fechaNacimiento, pe.ci, pe.celular, " + 
                    "pe.estado as estadoPersona, us.estado as estadoUsuario, us.usuario, us.password " +
		            "FROM Persona pe, Usuario us WHERE pe.idPersona = us.idPersona AND us.idRol = 4"
        cmdSQL(query, res);
    },
    getAdministracion: (req, res) => {

        var query = "SELECT pe.idPersona, us.idUsuario, us.idRol, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, pe.direccion, pe.nacionalidad, pe.fechaNacimiento, pe.ci, pe.celular, " + 
                    "pe.estado as estadoPersona, us.estado as estadoUsuario, us.usuario, us.password " +
                    "FROM Persona pe, Usuario us WHERE pe.idPersona = us.idPersona AND us.estado = 1 AND us.delet IS NULL AND us.idRol = " + req.params.idRol;
                 
        cmdSQL(query, res);
    },
    getEncargodosDepartamento: (req, res) => {
        //para el modulo de departamento me lista el historial de encargados del departamento
        var query = "SELECT pe.idPersona, pe.primerNombre, pe.segundoNombre, pe.primerApellido, pe.segundoApellido, pe.direccion, pe.nacionalidad, pe.fechaNacimiento, pe.ci, pe.celular, pe.estado as estadoPersona, " +
                    "org.idOrganizacion, org.fechaRegistro as fechaRegistroOrganizacion, org.estado as estadoOrganizacion, org.edit as editOrganizacion " +
                    "FROM Persona pe, Organizacion org " +
                    "WHERE pe.idPersona = org.idPersona " +
                    "AND org.delet IS NULL " +
                    "AND org.idDepartamento = " + req.params.idDepartamento;
        cmdSQL(query, res);
    },
    addOrganizacion: (req, res) => {

        var queryAux = "UPDATE Organizacion SET " +
                        "estado = 0 " +
                        "WHERE idDepartamento = " + req.body.idDepartamento;

        if(requestSQL(queryAux)){
            var query = "INSERT INTO Organizacion VALUES (" +
            req.body.idDepartamento + ", " +
            req.body.idPersona + ", '" +
            dateNow() + "', 1, '" +
            dateNow() + "', null)";

            cmdSQL(query, res);
        }        
    },
    updateOrganizacion: (req, res) => {},
    deleteOrganizacion: (req, res) => {

        var query = "UPDATE Organizacion SET " +
            "delet = '" + dateNow() + "' "+
            "WHERE idOrganizacion = " + req.params.id;

        cmdSQL(query, res);
    }
};