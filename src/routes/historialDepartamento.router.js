const historialDepartamentoRouter = require('express').Router();

const { getHistorialDepartamentos, getHistorialDepartamento, addHistorialDepartamento, updateEstadoHistorialDepartamento, updateHistorialDepartamento, deleteHistorialDepartamento } = require('../controllers/historialDepartamento.controller');
//no esta funcionando
//const { user } = require('../db/database.js');

historialDepartamentoRouter.route('/')
    .post(addHistorialDepartamento);


historialDepartamentoRouter.route('/:id')
    .get(getHistorialDepartamento)
    .put(updateHistorialDepartamento)
    .delete(deleteHistorialDepartamento);

historialDepartamentoRouter.route('/allHistorial/:id')
    .get(getHistorialDepartamentos);

historialDepartamentoRouter.route('/editEstado/:id')
    .put(updateEstadoHistorialDepartamento);

module.exports = historialDepartamentoRouter;