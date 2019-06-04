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
        res.status(500).send({ state: false, message: 'Invalid command'})
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
    getPeoples: (req, res) => {
        var query = "SELECT * FROM Persona WHERE delet IS NULL ORDER BY primerApellido ASC";
        cmdSQL(query, res);
    },
    getPeople: (req, res) => {
        var query = "SELECT idCarrera, codEstudiante, primerNombre, segundoNombre, primerApellido, segundoApellido, ci, semestre, nacionalidad, direccion, celular, fechaNacimiento, estado as estadoPersona, register as fechaRegistroPersona, edit as editPersona " +
                    "FROM Persona " +
                    "WHERE idPersona =" + req.params.id;
        cmdSQL(query, res);
    },
    //Verificar si codEstudiante existe
    getCodEstudiante: (req, res) => {
        var query = 'SELECT codEstudiante FROM Persona WHERE codEstudiante = '+ req.params.codStudente + ' AND delet IS NULL';
        cmdSQL(query, res);
    },
    addPeople: (req, res) => {
        var idCarrera, codEstudiante, segundoNombre, segundoApellido, semestre, fechaNac;
        
        if(req.body.idCarrera == null){idCarrera = null;}
        else{ idCarrera = parseInt(req.body.codEstudiante);}

        if(req.body.codEstudiante == null){codEstudiante = null;}
        else{ codEstudiante = parseInt(req.body.codEstudiante);}

        if(req.body.segundoNombre == null){segundoNombre = null;}
        else{ segundoNombre = "'" + req.body.segundoNombre + "'";}

        if(req.body.segundoApellido == null){segundoApellido = null;}
        else{ segundoApellido = "'" + req.body.segundoApellido + "'";}

        if(req.body.semestre == null){semestre = null;}
        else{ semestre = "'" + req.body.semestre + "'";}

        var query = "INSERT INTO Persona VALUES(" +
            idCarrera + ", " +
            codEstudiante + ", '" +
            req.body.primerNombre + "', " +
            segundoNombre + ", '" +
            req.body.primerApellido + "', " +
            segundoApellido + ", '" +
            req.body.ci + "', " +
            semestre + ", '" +
            req.body.nacionalidad + "', '" +
            req.body.direccion + "', " +
            req.body.celular + ", '" + 
            req.body.fechaNacimiento + "', 1, '" + 
            dateNow() + "', null, null)";

        cmdSQL(query, res);
    },
    updatePeople: (req, res) => {

        var idCarrera, codEstudiante, segundoNombre, segundoApellido, carrera, semestre;
        
        if(req.body.idCarrera == null){idCarrera = null;}
        else{ idCarrera = parseInt(req.body.idCarrera);}

        if(req.body.codEstudiante == null){codEstudiante = null;}
        else{ codEstudiante = "'" + req.body.codEstudiante + "'";}

        if(req.body.segundoNombre == null){segundoNombre = null;}
        else{ segundoNombre = "'" + req.body.segundoNombre + "'";}

        if(req.body.segundoApellido == null){segundoApellido = null;}
        else{ segundoApellido = "'" + req.body.segundoApellido + "'";}

        if(req.body.carrera == null){carrera = null;}
        else{ carrera = "'" + req.body.carrera + "'";}

        if(req.body.semestre == null){semestre = null;}
        else{ semestre = "'" + req.body.semestre + "'";}

        var query = "UPDATE Persona SET " +
                    "idCarrera = " + idCarrera + ", " +
                    "codEstudiante = " + codEstudiante + ", " +
                    "primerNombre = '" + req.body.primerNombre + "', " +
                    "segundoNombre = " + segundoNombre + ", " +
                    "primerApellido = '" + req.body.primerApellido + "', " +
                    "segundoApellido = " + segundoApellido + ", " +
                    "direccion = '" + req.body.direccion + "', " +
                    "nacionalidad = '" + req.body.nacionalidad + "', " +
                    "fechaNacimiento = '" + req.body.fechaNacimiento + "', " +
                    "ci = '" + req.body.ci + "', " +
                    "semestre = " + semestre + ", " +
                    "celular = " + req.body.celular + ", " +
                    "edit = '" + dateNow() + "' " +
                    "WHERE idPersona = " + req.params.id;

        cmdSQL(query, res);
    },
    deletePeople: (req, res) => {

        var query = "UPDATE Persona SET " +
        "delet = '" + dateNow() + "' " +
        "WHERE idPersona = " + req.params.id;

        cmdSQL(query, res);
    }
};