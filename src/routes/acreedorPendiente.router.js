const acreedorPendienteRouter = require('express').Router();
const chekAuth = require('../middleware/chek-auth');

const { getAcreedoresPendientes, addAcreedorPendiente, 
    updateAcreedorPendiente, deleteAcreedorPendiente } = require('../controllers/acreedorPendiente.controller');

acreedorPendienteRouter.route('/')
    .get(chekAuth, getAcreedoresPendientes)
    .post(chekAuth, addAcreedorPendiente);

acreedorPendienteRouter.route('/:id')
    .put(chekAuth, updateAcreedorPendiente)
    .delete(chekAuth, deleteAcreedorPendiente);

module.exports = acreedorPendienteRouter;