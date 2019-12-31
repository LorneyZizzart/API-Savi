const organizacionRouter = require('express').Router();
const chekAuth = require('../middleware/chek-auth');

const { getOrganizaciones, getOrganizacion, getAdministracion, getEncargodosDepartamento, addOrganizacion, deleteOrganizacion } = require('../controllers/organizacion.controller');

organizacionRouter.route('/')
    .get(chekAuth, getOrganizaciones)
    .post(chekAuth, addOrganizacion);

organizacionRouter.route('/:id')
    .get(chekAuth, getOrganizacion)
    .delete(chekAuth, deleteOrganizacion);

organizacionRouter.route('/encargadosDepartamento/:idDepartamento')
    .get(chekAuth, getEncargodosDepartamento)

organizacionRouter.route('/administracion/:idRol')
    .get(chekAuth, getAdministracion)

module.exports = organizacionRouter;