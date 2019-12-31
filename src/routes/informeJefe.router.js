const informeJefeRouter = require('express').Router();
const chekAuth = require('../middleware/chek-auth');

const { getMaxIdJefe, addInformeJefe } = require('../controllers/informeJefe.controller');

informeJefeRouter.route('/')
    .post(chekAuth, addInformeJefe);

informeJefeRouter.route('/id/:idUser/:idDept')
    .get(chekAuth, getMaxIdJefe);

module.exports = informeJefeRouter;