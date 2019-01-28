const areaRouter = require('express').Router();

const { getAreas, getArea, getAreasDepartamento, addArea, updateArea, 
        updateEstadoArea, deleteArea, getAsignacionArea, addAsigancionArea 
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

areaRouter.route('/asignacionArea/crud/:idDept')
    .get(getAsignacionArea);


module.exports = areaRouter;