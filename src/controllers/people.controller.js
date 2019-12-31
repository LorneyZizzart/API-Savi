const {querySQL} = require("../db/cmdSQL");
const {dateNow} = require('../class/date');

module.exports = {
    getPeoples: (req, res) => {
        var query = "SELECT * FROM Persona WHERE delet IS NULL ORDER BY primerApellido ASC";
        querySQL(query, res);
    },
    getPeople: (req, res) => {
        var query = "SELECT idCarrera, codEstudiante, primerNombre, segundoNombre, primerApellido, segundoApellido, ci, semestre, nacionalidad, direccion, celular, fechaNacimiento, estado as estadoPersona, register as fechaRegistroPersona, edit as editPersona " +
                    "FROM Persona " +
                    "WHERE idPersona =" + req.params.id;
                    querySQL(query, res);
    },
    //Verificar si codEstudiante existe
    getCodEstudiante: (req, res) => {
        var query = 'SELECT codEstudiante FROM Persona WHERE codEstudiante = '+ req.params.codStudente + ' AND delet IS NULL';
        querySQL(query, res);
    },
    addPeople: (req, res) => {
        var idCarrera, codEstudiante, segundoNombre, segundoApellido, semestre, fechaNac;
        
        if(req.body.idCarrera == null){idCarrera = null;}
        else{ idCarrera = parseInt(req.body.idCarrera);}

        if(req.body.codEstudiante == null){codEstudiante = null;}
        else{ codEstudiante = parseInt(req.body.codEstudiante);}

        if(req.body.segundoNombre == null || req.body.segundoNombre == undefined){segundoNombre = null;}
        else{ segundoNombre = "'" + req.body.segundoNombre + "'";}

        if(req.body.segundoApellido == null || req.body.segundoApellido == undefined){segundoApellido = null;}
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
            dateNow + "', null, null)";

            querySQL(query, res);
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
                    "edit = '" + dateNow + "' " +
                    "WHERE idPersona = " + req.params.id;

                    querySQL(query, res);
    },
    deletePeople: (req, res) => {

        var query = "UPDATE Persona SET " +
        "delet = '" + dateNow + "' " +
        "WHERE idPersona = " + req.params.id;

        querySQL(query, res);
    }
};