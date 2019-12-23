const convenioRouter = require('express').Router();

const { getConvenios, getConvenio, getConvenioByUsuario, addConvenio, updateConvenio, updateEstadoConvenio, deleteConvenio } = require('../controllers/convenio.controller');

convenioRouter.route('/')
    .get(getConvenios)
    .post(addConvenio);

convenioRouter.route('/:id')
    .get(getConvenio)
    .put(updateConvenio)
    .delete(deleteConvenio);

convenioRouter.route('/editEstado/:id')
    .put(updateEstadoConvenio);

convenioRouter.route('/convenioByUsuario/:idUsuario')
    .get(getConvenioByUsuario);

module.exports = convenioRouter;