const acreedorRouter = require('express').Router();

const {addInformeFinanzas} = require('../controllers/acreedor.controller');

acreedorRouter.route('/')
    .post(addInformeFinanzas);

acreedorRouter.route('/:id')



module.exports = acreedorRouter;