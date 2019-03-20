const informeFinanzasRouter = require('express').Router();

const { getInformeFinanzas, getInformeFinanzasArchivadas, addInformeFinanzas, updateInformeFinanzas,
    updateInformeFinanzasArchivar, deleteInformeFinanzas } = require('../controllers/informeFinanzas.controller');

informeFinanzasRouter.route('/')
    .get(getInformeFinanzas)
    .post(addInformeFinanzas);

informeFinanzasRouter.route('/:id')
    .put(updateInformeFinanzas)
    .delete(deleteInformeFinanzas);

informeFinanzasRouter.route('/informes/archivados')
    .get(getInformeFinanzasArchivadas);

informeFinanzasRouter.route('/informes/archivados/:id')
    .put(updateInformeFinanzasArchivar);

module.exports = informeFinanzasRouter;