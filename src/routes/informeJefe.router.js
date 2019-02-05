const informeJefeRouter = require('express').Router();

const { getMaxIdJefe, addInformeJefe } = require('../controllers/informeJefe.controller');

informeJefeRouter.route('/')
    .post(addInformeJefe);

informeJefeRouter.route('/id/:idUser/:idDept')
    .get(getMaxIdJefe);

module.exports = informeJefeRouter;