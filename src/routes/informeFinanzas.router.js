const informeFinanzasRouter = require('express').Router();

const { getInformeFinanzas, getInformesFinanzas, getInformeFinanzasArchivadas, addInformeFinanzas, updateInformeFinanzas,
    updateInformeFinanzasArchivar, deleteInformeFinanzas } = require('../controllers/informeFinanzas.controller');

informeFinanzasRouter.route('/')
    .get(getInformesFinanzas)
    .post(addInformeFinanzas);

informeFinanzasRouter.route('/:id')
    .get(getInformeFinanzas)
    .put(updateInformeFinanzas)
    .delete(deleteInformeFinanzas);

informeFinanzasRouter.route('/informes/archivados')
    .get(getInformeFinanzasArchivadas);

informeFinanzasRouter.route('/informes/archivados/:id')
    .put(updateInformeFinanzasArchivar);

module.exports = informeFinanzasRouter;