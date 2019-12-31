const departamentoRouter = require('express').Router();
const chekAuth = require('../middleware/chek-auth');

const {getDepartamentoById, getAllDepartamentos, getDepartamentos, getDepartamento, getDepartamentoName, getDepartamentosUser, addDepartamento, updateDepartamento, updateEstadoDepartamento, deleteDepartamento } = require('../controllers/departamento.controller');

departamentoRouter.route('/')
    .get(chekAuth, getDepartamentos)
    .post(chekAuth, addDepartamento);

departamentoRouter.route('/:id')
    .get(chekAuth, getDepartamento)
    .put(chekAuth, updateDepartamento)
    .delete(chekAuth, deleteDepartamento);
//PARA LISTAR LOS DEPTS DEL MODULO Departamento de la DB
departamentoRouter.route('/search/:nameDepto')
    .get(chekAuth, getDepartamentoName);
//PARA LISTAR LOS DEPTS DEL MODULO Departamento de la DB
departamentoRouter.route('/all/depts')
    .get(chekAuth, getAllDepartamentos);
//Para editar el estado del departamento
departamentoRouter.route('/editEstado/:id')
    .put(chekAuth, updateEstadoDepartamento);
//Para editar el estado del departamento
departamentoRouter.route('/depsUser/:idRol/:idUser')
    .get(chekAuth, getDepartamentosUser);

departamentoRouter.route('/getDepartamentoById/:idDepartamento')
    .get(chekAuth, getDepartamentoById);
module.exports = departamentoRouter;