const carreraRouter = require('express').Router();
const chekAuth = require('../middleware/chek-auth');

const {getCarreras, getCarrera, addCarrera, 
       updateCarrera, updateEstadoCarrera, deleteCarrera} = require('../controllers/carrera.controller');

carreraRouter.route('/')
    .get(chekAuth, getCarreras)
    .post(chekAuth, addCarrera);

carreraRouter.route('/:idCarrera')
    .get(chekAuth, getCarrera)
    .put(chekAuth, updateCarrera)
    .delete(chekAuth, deleteCarrera);

carreraRouter.route('/estado/:idCarrera')
    .get(chekAuth, updateEstadoCarrera);

module.exports = carreraRouter;