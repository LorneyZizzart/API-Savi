const areaRouter = require('express').Router();

const { getAreas, getArea, addArea, updateArea, deleteArea } = require('../controllers/area.controller');

areaRouter.route('/')
    .get(getAreas)
    .post(addArea);

areaRouter.route('/:id')
    .get(getArea)
    .put(updateArea)
    .delete(deleteArea);

module.exports = areaRouter;