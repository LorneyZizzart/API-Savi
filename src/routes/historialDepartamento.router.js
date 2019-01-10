const historialDepartamentoRouter = require('express').Router();

const { getHistorialDepartamentos, addHistorialDepartamento } = require('../controllers/historialDepartamento.controller');
//no esta funcionando
//const { user } = require('../db/database.js');

historialDepartamentoRouter.route('/')
    .get(getHistorialDepartamentos)
    .post(addHistorialDepartamento);


module.exports = historialDepartamentoRouter;