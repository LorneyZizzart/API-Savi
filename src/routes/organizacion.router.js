const organizacionRouter = require('express').Router();

const { addOrganizacion } = require('../controllers/organizacion.controller');

organizacionRouter.route('/')
    .post(addOrganizacion);

module.exports = organizacionRouter;