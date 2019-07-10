const organizacionRouter = require('express').Router();

const { getOrganizaciones, getOrganizacion, getAdministracion, getEncargodosDepartamento, addOrganizacion, deleteOrganizacion } = require('../controllers/organizacion.controller');

organizacionRouter.route('/')
    .get(getOrganizaciones)
    .post(addOrganizacion);

organizacionRouter.route('/:id')
    .get(getOrganizacion)
    .delete(deleteOrganizacion);

organizacionRouter.route('/encargadosDepartamento/:idDepartamento')
    .get(getEncargodosDepartamento)

organizacionRouter.route('/administracion/:idRol')
    .get(getAdministracion)

module.exports = organizacionRouter;