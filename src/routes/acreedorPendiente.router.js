const acreedorPendienteRouter = require('express').Router();

const { getAcreedorPendientes, addAcreedorPendiente, 
    updateAcreedorPendiente, deleteAcreedorPendiente } = require('../controllers/acreedorPendiente.controller');

acreedorPendienteRouter.route('/')
    .get(getAcreedorPendientes)
    .post(addAcreedorPendiente);

acreedorPendienteRouter.route('/:id')
    .put(updateAcreedorPendiente)
    .delete(deleteAcreedorPendiente);

module.exports = acreedorPendienteRouter;