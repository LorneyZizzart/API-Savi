const areaRouter = require('express').Router();

const { getAreas, getArea, getAreasDepartamento, addArea, updateArea, 
        updateEstadoArea, deleteArea, getAsignacionArea, getAreByConvenio, addAsigancionArea,
        updateAsignacionArea, updateCambiarArea, deleteAsignacionArea
        } = require('../controllers/area.controller');

areaRouter.route('/')
    .get(getAreas)
    .post(addArea);

areaRouter.route('/:id')
    .get(getArea)
    .put(updateArea)
    .delete(deleteArea);

areaRouter.route('/dept/:idDepartamento')
    .get(getAreasDepartamento);

areaRouter.route('/estado/:idArea')
    .put(updateEstadoArea);

areaRouter.route('/asignacionArea/crud')
    .post(addAsigancionArea);

areaRouter.route('/asignacionArea/byConvenio/:idConvenio')
    .get(getAreByConvenio);

areaRouter.route('/asignacionArea/crud/:idArea')
    .get(getAsignacionArea)
    .put(updateAsignacionArea) /*aqui se envia el id de asigancion de area*/
    .delete(deleteAsignacionArea); /*aqui se envia el id de asigancion para dar de baja*/

areaRouter.route('/cambiarArea/:idAsignacion')
    .put(updateCambiarArea);

module.exports = areaRouter;