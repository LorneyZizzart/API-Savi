const acreedorRouter = require('express').Router();

const { getListAcreedor, getAcreedor, getAcreedorForCod, addAcreedor, 
    updateAcreedor, 
    updateAcreedorSaldo, updateDevolverSaldo, deleteAcreedor} = require('../controllers/acreedor.controller');

acreedorRouter.route('/')
    .get(getAcreedor)
    .post(addAcreedor);

acreedorRouter.route('/descuentos/')
    .put(updateAcreedor)

acreedorRouter.route('/:id')
    .put(updateAcreedorSaldo)
    .delete(deleteAcreedor);

acreedorRouter.route('/lista/')
    .get(getListAcreedor);

acreedorRouter.route('/buscarEstudiante/:codEstudiante')
    .get(getAcreedorForCod);

acreedorRouter.route('/acreditacion/:id')
    .put(updateDevolverSaldo);

module.exports = acreedorRouter;