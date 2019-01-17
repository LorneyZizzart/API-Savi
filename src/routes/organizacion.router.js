const organizacionRouter = require('express').Router();

const { getOrganizacion, addOrganizacion, getAdministracion } = require('../controllers/organizacion.controller');

organizacionRouter.route('/')
    .get(getOrganizacion)
    .post(addOrganizacion);

organizacionRouter.route('/administracion')
    .get(getAdministracion)

module.exports = organizacionRouter;