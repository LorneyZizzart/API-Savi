const sql = require('mssql');
const config = require('./config.db');
const jwt = require("jsonwebtoken");
const { dateNow } = require('../class/date');

module.exports = {
    querySQL : (query, res) => {
        new sql.ConnectionPool(config).connect().then(pool => {
            return pool.request().query(query)
        }).then(result => {
            let rows = result.recordset
            res.setHeader('Access-Control-Allow-Origin', '*');
            res.status(200).json(rows);
            sql.close();
        }).catch(err => {
            res.status(500).send({ message: "Se a producido un error de petición en la API REST SABI"})
            sql.close();
        })
    },
    requestSQL : (query) => {
        sql.connect(config).then(() => {
            return sql.query(query)
        }).then(result => {
            sql.close();
        })
    },
    authToken : (query, res) => {
        try {
            new sql.ConnectionPool(config).connect().then(pool => {
                return pool.request().query(query)
            }).then(result => {
                let rows = result.recordset
                res.setHeader('Access-Control-Allow-Origin', '*');
                const token = jwt.sign(
                    {
                        id : rows[0].idUsuario,
                        date : dateNow,
                        api : "Bienvenido a la API REST de Sabi.",
                    },
                    config.database,
                    {expiresIn: "1h"});                    
    
                res.status(200).json({
                        message: "Auth successful",
                        token: token,
                        expira: "1h",
                        idPersona: res.req.body.idPersona,
                        idUsuario: rows[0].idUsuario,
                        idRol: res.req.body.idRol,
                        usuario: res.req.body.usuario,
                        password: res.req.body.password,
                        estado: rows[0].estado
                    })
                sql.close();
            }).catch(err => {
                res.status(500).send({ message: "Se a producido un error en la API REST SABI"})
                sql.close();
            })
        } catch (error) {
            return res.status(401).json({
                message: 'Se a producido un error al generar el token en la API REST SABI'
            });
        }
    }
};