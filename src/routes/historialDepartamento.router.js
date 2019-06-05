const historialDepartamentoRouter = require('express').Router();

const { getHistorialDepartamentos, getHistorialDepartamento, addHistorialDepartamento, updateEstadoHistorialDepartamento } = require('../controllers/historialDepartamento.controller');
//no esta funcionando
//const { user } = require('../db/database.js');

historialDepartamentoRouter.route('/')
    .post(addHistorialDepartamento);


historialDepartamentoRouter.route('/:id')
    .get(getHistorialDepartamento);

historialDepartamentoRouter.route('/allHistorial/:id')
    .get(getHistorialDepartamentos);

historialDepartamentoRouter.route('/editEstado/:id')
    .put(updateEstadoHistorialDepartamento);

module.exports = historialDepartamentoRouter;