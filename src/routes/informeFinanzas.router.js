const informeFinanzasRouter = require('express').Router();
const chekAuth = require('../middleware/chek-auth');

const { getInformeFinanzas, getInformesFinanzas, getInformeFinanzasArchivadas, addInformeFinanzas, updateInformeFinanzas,
    updateInformeFinanzasArchivar, deleteInformeFinanzas } = require('../controllers/informeFinanzas.controller');

informeFinanzasRouter.route('/')
    .get(chekAuth, getInformesFinanzas)
    .post(chekAuth, addInformeFinanzas);

informeFinanzasRouter.route('/:id')
    .get(chekAuth, getInformeFinanzas)
    .put(chekAuth, updateInformeFinanzas)
    .delete(chekAuth, deleteInformeFinanzas);

informeFinanzasRouter.route('/informes/archivados')
    .get(chekAuth, getInformeFinanzasArchivadas);

informeFinanzasRouter.route('/informes/archivados/:id')
    .put(chekAuth, updateInformeFinanzasArchivar);

module.exports = informeFinanzasRouter;