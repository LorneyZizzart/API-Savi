const acreedorRouter = require('express').Router();
const chekAuth = require('../middleware/chek-auth');

const {getAcreedorById, getAcreedorByIdConvenio,  getListAcreedor, getAcreedores, getAcreedorForCod, addAcreedor, 
    updateAcreedor, 
    updateAcreedorSaldo, updateDevolverSaldo, deleteAcreedor} = require('../controllers/acreedor.controller');

acreedorRouter.route('/')
    .get(chekAuth, getAcreedores)
    .post(chekAuth, addAcreedor);

acreedorRouter.route('/descuentos/')
    .put(chekAuth, updateAcreedor)

acreedorRouter.route('/:id')
    .get(chekAuth, getAcreedorById)
    .put(chekAuth, updateAcreedorSaldo)
    .delete(chekAuth, deleteAcreedor);

acreedorRouter.route('/lista/')
    .get(chekAuth, getListAcreedor);

acreedorRouter.route('/buscarEstudiante/:codEstudiante')
    .get(chekAuth, getAcreedorForCod);

acreedorRouter.route('/buscarConvenio/:idConvenio')
    .get(chekAuth, getAcreedorByIdConvenio);

acreedorRouter.route('/acreditacion/:id')
    .put(chekAuth, updateDevolverSaldo);

module.exports = acreedorRouter;