const convenioRouter = require('express').Router();
const chekAuth = require('../middleware/chek-auth');

const { getConvenios, getConvenio, getConvenioByUsuario, addConvenio, updateConvenio, updateEstadoConvenio, deleteConvenio } = require('../controllers/convenio.controller');

convenioRouter.route('/')
    .get(chekAuth, getConvenios)
    .post(chekAuth, addConvenio);

convenioRouter.route('/:id')
    .get(chekAuth, getConvenio)
    .put(chekAuth, updateConvenio)
    .delete(chekAuth, deleteConvenio);

convenioRouter.route('/editEstado/:id')
    .put(chekAuth, updateEstadoConvenio);

convenioRouter.route('/convenioByUsuario/:idUsuario')
    .get(chekAuth, getConvenioByUsuario);

module.exports = convenioRouter;