var sql = require('mssql');
const config = require('../db/config.dbSistemaAcademico');

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

module.exports = {
    getEstudiantes: (req, res) => {
        //se utliza para consumir en el sabi
        var query = "SELECT idEstudiante, codEstudiante, nombres, apellidos, ci, nacionalidad, direccion, fechaNacimiento, celular, carrera, semestre " +
                    "FROM Estudiante " + 
                    "WHERE idEstudiante <= " + req.params.cant;
        cmdSQL(query, res);
    },
    getEstudiante: (req, res) => {
        //se utliza para consumir en el sabi
        var query = "SELECT idEstudiante, codEstudiante, nombres, apellidos, ci, nacionalidad, direccion, fechaNacimiento, celular, carrera, semestre " +
                    "FROM Estudiante " + 
                    "WHERE codEstudiante = " + req.params.codEstudiante;
        cmdSQL(query, res);
    },
    //GESTIONAR NOTAS
    getNotas: (req, res) => {
        //se utliza para consumir en el sabi
        var query = "SELECT nt.idNotas, nt.idEstudiante, nt.idMateria, nt.primerParcial, nt.segundoParcial, nt.tercerParcial, nt.notaFinal, ma.idMateria, ma.nombre as materia " +
                    "FROM Notas nt, Materia ma " +
                    "WHERE nt.idMateria = ma.idMateria " +
                    "AND nt.idEstudiante = " + req.params.idEstudiante;
        cmdSQL(query, res);
    }
};