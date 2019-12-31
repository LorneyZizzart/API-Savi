const informeEstudianteRouter = require('express').Router();
const chekAuth = require('../middleware/chek-auth');

const { getInformeEstudianteAll, getInformeEstudiante, 
    getInformeEstudianteArchivados, getAcreedorHistorial, getInformeEstudianteDelete,
    addInformeEstudiante, 
    updateAprobarFinanzas, updateInformeArchivar, bajaInformeEstudiante,
    deleteInformeEstudiante } = require('../controllers/informeEstudiante.controller');

informeEstudianteRouter.route('/')
    .get(chekAuth, getInformeEstudianteAll)
    .post(chekAuth, addInformeEstudiante);

informeEstudianteRouter.route('/aprobarFinanzas/:id')
    .put(chekAuth, updateAprobarFinanzas);

informeEstudianteRouter.route('/archivar/:id')
    .get(chekAuth, getInformeEstudianteArchivados)
    .put(chekAuth, updateInformeArchivar);

informeEstudianteRouter.route('/:idDepto')
    .get(chekAuth, getInformeEstudiante)
    .delete(chekAuth, bajaInformeEstudiante);

informeEstudianteRouter.route('/informesEliminados/:id')
    .get(chekAuth, getInformeEstudianteDelete);

informeEstudianteRouter.route('/acreedorHistorial/:idConvenio')
    .get(chekAuth, getAcreedorHistorial);

informeEstudianteRouter.route('/:fecha/:idRH')
    .delete(chekAuth, deleteInformeEstudiante);

module.exports = informeEstudianteRouter;