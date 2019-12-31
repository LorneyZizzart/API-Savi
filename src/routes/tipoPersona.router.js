const tipoPersonaRouter = require('express').Router();
const chekAuth = require('../middleware/chek-auth');

const { getTipoPersona, getEstudianteDepartamento, getEstudianteInfo, 
        getEstudianteInfoFinanzas, getEstudianteInfoF,
        getMaxIdPersona, getConvenioHistorial, addTipoPersona 
        } = require('../controllers/tipoPersona.controller');

tipoPersonaRouter.route('/')
    .get(chekAuth, getMaxIdPersona) /*Para enviar el max idPersona ()OJO*/
    .post(chekAuth, addTipoPersona);

tipoPersonaRouter.route('/:idRol')
    .get(chekAuth, getTipoPersona);

tipoPersonaRouter.route('/historialConvenio/:idConvenio')
    .get(chekAuth, getConvenioHistorial);

tipoPersonaRouter.route('/estDep/:idDep')
    .get(chekAuth, getEstudianteDepartamento);

tipoPersonaRouter.route('/infoEstudiante/:idDep/:idPersona')
    .get(chekAuth, getEstudianteInfo);

tipoPersonaRouter.route('/finanzas/infoEstudiante/')
    .get(chekAuth, getEstudianteInfoFinanzas);

tipoPersonaRouter.route('/finanzas/infoEstudiante/:id')
    .get(chekAuth, getEstudianteInfoF);

module.exports = tipoPersonaRouter;