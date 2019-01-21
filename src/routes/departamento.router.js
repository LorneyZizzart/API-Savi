const departamentoRouter = require('express').Router();

const { getAllDepartamentos, getDepartamentos, getDepartamento, addDepartamento, updateDepartamento, updateEstadoDepartamento, deleteDepartamento } = require('../controllers/departamento.controller');

departamentoRouter.route('/')
    .get(getDepartamentos)
    .post(addDepartamento);

departamentoRouter.route('/:id')
    .get(getDepartamento)
    .put(updateDepartamento)
    .delete(deleteDepartamento);
//PARA LISTAR LOS DEPTS DEL MODULO Departamento de la DB
departamentoRouter.route('/all/depts')
    .get(getAllDepartamentos);
//Para editar el estado del departamento
departamentoRouter.route('/editEstado/:id')
    .put(updateEstadoDepartamento);


module.exports = departamentoRouter;