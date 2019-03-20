const acreedorRouter = require('express').Router();

const {getListAcreedr, getAcreedor, addAcreedor, updateAcreedorSaldo, updateDevolverSaldo, deleteAcreedor} = require('../controllers/acreedor.controller');

acreedorRouter.route('/')
    .get(getAcreedor)
    .post(addAcreedor);

acreedorRouter.route('/:id')
    .put(updateAcreedorSaldo)
    .delete(deleteAcreedor);

acreedorRouter.route('/lista/')
    .get(getListAcreedr);

acreedorRouter.route('/acreditacion/:id')
    .put(updateDevolverSaldo);

module.exports = acreedorRouter;