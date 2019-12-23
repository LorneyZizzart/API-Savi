const acreedorRouter = require('express').Router();

const {getAcreedorById, getAcreedorByIdConvenio,  getListAcreedor, getAcreedores, getAcreedorForCod, addAcreedor, 
    updateAcreedor, 
    updateAcreedorSaldo, updateDevolverSaldo, deleteAcreedor} = require('../controllers/acreedor.controller');

acreedorRouter.route('/')
    .get(getAcreedores)
    .post(addAcreedor);

acreedorRouter.route('/descuentos/')
    .put(updateAcreedor)

acreedorRouter.route('/:id')
    .get(getAcreedorById)
    .put(updateAcreedorSaldo)
    .delete(deleteAcreedor);

acreedorRouter.route('/lista/')
    .get(getListAcreedor);

acreedorRouter.route('/buscarEstudiante/:codEstudiante')
    .get(getAcreedorForCod);

acreedorRouter.route('/buscarConvenio/:idConvenio')
    .get(getAcreedorByIdConvenio);

acreedorRouter.route('/acreditacion/:id')
    .put(updateDevolverSaldo);

module.exports = acreedorRouter;