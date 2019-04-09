const informeEstudianteRouter = require('express').Router();

const { getInformeEstudianteAll, getInformeEstudiante, 
    getInformeEstudianteArchivados, getAcreedorHistorial,
    addInformeEstudiante, 
    updateAprobarFinanzas, updateInformeArchivar, 
    deleteInformeEstudiante } = require('../controllers/informeEstudiante.controller');

informeEstudianteRouter.route('/')
    .get(getInformeEstudianteAll)
    .post(addInformeEstudiante);

informeEstudianteRouter.route('/aprobarFinanzas/:id')
    .put(updateAprobarFinanzas);

informeEstudianteRouter.route('/archivar/:id')
    .get(getInformeEstudianteArchivados)
    .put(updateInformeArchivar);

informeEstudianteRouter.route('/:idDepto')
    .get(getInformeEstudiante);

informeEstudianteRouter.route('/acreedorHistorial/:idConvenio')
    .get(getAcreedorHistorial);

informeEstudianteRouter.route('/:fecha/:idRH')
    .delete(deleteInformeEstudiante);

module.exports = informeEstudianteRouter;