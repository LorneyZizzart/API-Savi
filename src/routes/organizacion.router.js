const organizacionRouter = require('express').Router();

const { getOrganizaciones, getOrganizacion, addOrganizacion, getAdministracion } = require('../controllers/organizacion.controller');

organizacionRouter.route('/')
    .get(getOrganizaciones)
    .post(addOrganizacion);

organizacionRouter.route('/:id')
    .get(getOrganizacion)

module.exports = organizacionRouter;