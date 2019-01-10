const departamentoRouter = require('express').Router();

const { getDepartamentos, getDepartamento, addDepartamento, updateDepartamento, deleteDepartamento } = require('../controllers/departamento.controller');

departamentoRouter.route('/')
    .get(getDepartamentos)
    .post(addDepartamento);

departamentoRouter.route('/:id')
    .get(getDepartamento)
    .put(updateDepartamento)
    .delete(deleteDepartamento);

module.exports = departamentoRouter;