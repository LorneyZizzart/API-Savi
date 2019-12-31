const areaRouter = require('express').Router();
const chekAuth = require('../middleware/chek-auth');

const { getAreas, getArea, getAreasDepartamento, addArea, updateArea, 
        updateEstadoArea, deleteArea, getAsignacionArea, getAreByConvenio, addAsigancionArea,
        updateAsignacionArea, updateCambiarArea, deleteAsignacionArea
        } = require('../controllers/area.controller');

areaRouter.route('/')
    .get(chekAuth, getAreas)
    .post(chekAuth, addArea);

areaRouter.route('/:id')
    .get(chekAuth, getArea)
    .put(chekAuth, updateArea)
    .delete(chekAuth, deleteArea);

areaRouter.route('/dept/:idDepartamento')
    .get(chekAuth, getAreasDepartamento);

areaRouter.route('/estado/:idArea')
    .put(chekAuth, updateEstadoArea);

areaRouter.route('/asignacionArea/crud')
    .post(chekAuth, addAsigancionArea);

areaRouter.route('/asignacionArea/byConvenio/:idConvenio')
    .get(chekAuth, getAreByConvenio);

areaRouter.route('/asignacionArea/crud/:idArea')
    .get(chekAuth, getAsignacionArea)
    .put(chekAuth, updateAsignacionArea) /*aqui se envia el id de asigancion de area*/
    .delete(chekAuth, deleteAsignacionArea); /*aqui se envia el id de asigancion para dar de baja*/

areaRouter.route('/cambiarArea/:idAsignacion')
    .put(chekAuth, updateCambiarArea);

module.exports = areaRouter;