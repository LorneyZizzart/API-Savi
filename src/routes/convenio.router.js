const convenioRouter = require('express').Router();

const { getConvenios, getConvenio, addConvenio, updateConvenio, deleteConvenio } = require('../controllers/convenio.controller');

convenioRouter.route('/')
    .get(getConvenios)
    .post(addConvenio);

convenioRouter.route('/:id')
    .get(getConvenio)
    .put(updateConvenio)
    .delete(deleteConvenio);

module.exports = convenioRouter;