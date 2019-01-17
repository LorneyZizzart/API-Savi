const areaRouter = require('express').Router();

const { getAreas, getArea, getAreasDepartamento, addArea, updateArea, deleteArea } = require('../controllers/area.controller');

areaRouter.route('/')
    .get(getAreas)
    .post(addArea);

areaRouter.route('/:idArea')
    .get(getArea)
    .put(updateArea)
    .delete(deleteArea);

areaRouter.route('/dept/:idDepartamento')
    .get(getAreasDepartamento);


module.exports = areaRouter;