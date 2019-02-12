const tipoPersonaRouter = require('express').Router();

const { getTipoPersona, getEstudianteDepartamento, getEstudianteInfo, getEstudianteInfoFinanzas,
        getMaxIdPersona, addTipoPersona 
        } = require('../controllers/tipoPersona.controller');

tipoPersonaRouter.route('/')
    .get(getMaxIdPersona) /*Para enviar el max idPersona ()OJO*/
    .post(addTipoPersona);

tipoPersonaRouter.route('/:idRol')
    .get(getTipoPersona);

tipoPersonaRouter.route('/estDep/:idDep')
    .get(getEstudianteDepartamento);

tipoPersonaRouter.route('/infoEstudiante/:idDep')
    .get(getEstudianteInfo);

tipoPersonaRouter.route('/finanzas/infoEstudiante/')
    .get(getEstudianteInfoFinanzas);


module.exports = tipoPersonaRouter;