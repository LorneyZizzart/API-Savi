const acreedorPendienteRouter = require('express').Router();

const { getAcreedoresPendientes, addAcreedorPendiente, 
    updateAcreedorPendiente, deleteAcreedorPendiente } = require('../controllers/acreedorPendiente.controller');

acreedorPendienteRouter.route('/')
    .get(getAcreedoresPendientes)
    .post(addAcreedorPendiente);

acreedorPendienteRouter.route('/:id')
    .put(updateAcreedorPendiente)
    .delete(deleteAcreedorPendiente);

module.exports = acreedorPendienteRouter;