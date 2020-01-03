const sql = require('mssql');
const config = require('./config.db');
const jwt = require("jsonwebtoken");
const { dateNow } = require('../class/date');
const { admin, gth, finanzas, jefeDepartamento, estudiante } = require('../db/menu');

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
            res.status(500).send({ message: "Se ha producido un error de petición en la API REST SABI"})
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
                let menu = {};
                                                
                res.setHeader('Access-Control-Allow-Origin', '*');
                const token = jwt.sign(
                    {
                        id : rows[0].idUsuario,
                        date : dateNow,
                        api : "Bienvenido a la API REST de Sabi.",
                    },
                    config.database,
                    {expiresIn: "1h"});   
                switch(rows[0].idRol){
                    case 1 :
                        menu = gth();
                    break;
                    case 2 : 
                        menu = finanzas();
                    break;
                    case 3 :
                        menu = finanzas();
                    break;
                    case 4 :
                        menu = jefeDepartamento();
                    break;
                    case 5 :
                        menu = estudiante();
                    break;
                    case 6 :
                        menu = admin();
                    break;
                    default:
                        menu = {
                                "menu": [{
                                        "state": "404",
                                        "name": "Error",
                                        "type": "link",
                                        "icon": "domain"
                                    }
                                    ]
                                }
                    break;
                }

                res.status(200).json({
                        message: "Auth successful",
                        token: token,
                        expira: "1h",
                        idPersona: res.req.body.idPersona,
                        idUsuario: rows[0].idUsuario,
                        idRol: res.req.body.idRol,
                        usuario: res.req.body.usuario,
                        password: res.req.body.password,
                        estado: rows[0].estado,
                        menu
                    })
                sql.close();
            }).catch(err => {
                res.status(401).json({ message: "Error de autentificación"})
                sql.close();
            })
        } catch (error) {
            return res.status(500).json({
                message: 'Se ha producido un error al generar el token en la API REST SABI'
            });
        }
    }
};