const carreraRouter = require('express').Router();

const {getCarreras, getCarrera, addCarrera, 
       updateCarrera, updateEstadoCarrera, deleteCarrera} = require('../controllers/carrera.controller');

carreraRouter.route('/')
    .get(getCarreras)
    .post(addCarrera);

carreraRouter.route('/:idCarrera')
    .get(getCarrera)
    .put(updateCarrera)
    .delete(deleteCarrera);

carreraRouter.route('/estado/:idCarrera')
    .get(updateEstadoCarrera);

module.exports = carreraRouter;