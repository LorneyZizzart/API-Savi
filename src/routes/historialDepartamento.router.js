const historialDepartamentoRouter = require('express').Router();

const { getHistorialDepartamentos, getHistorialDepartamento, addHistorialDepartamento } = require('../controllers/historialDepartamento.controller');
//no esta funcionando
//const { user } = require('../db/database.js');

historialDepartamentoRouter.route('/')
    .get(getHistorialDepartamentos)
    .post(addHistorialDepartamento);


historialDepartamentoRouter.route('/:id')
    .get(getHistorialDepartamento);


module.exports = historialDepartamentoRouter;