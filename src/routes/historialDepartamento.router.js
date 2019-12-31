const historialDepartamentoRouter = require('express').Router();
const chekAuth = require('../middleware/chek-auth');

const { getHistorialDepartamentos, getHistorialDepartamento, addHistorialDepartamento, updateEstadoHistorialDepartamento, updateHistorialDepartamento, deleteHistorialDepartamento } = require('../controllers/historialDepartamento.controller');
//no esta funcionando
//const { user } = require('../db/database.js');

historialDepartamentoRouter.route('/')
    .post(chekAuth, addHistorialDepartamento);


historialDepartamentoRouter.route('/:id')
    .get(chekAuth, getHistorialDepartamento)
    .put(chekAuth, updateHistorialDepartamento)
    .delete(chekAuth, deleteHistorialDepartamento);

historialDepartamentoRouter.route('/allHistorial/:id')
    .get(chekAuth, getHistorialDepartamentos);

historialDepartamentoRouter.route('/editEstado/:id')
    .put(chekAuth, updateEstadoHistorialDepartamento);

module.exports = historialDepartamentoRouter;