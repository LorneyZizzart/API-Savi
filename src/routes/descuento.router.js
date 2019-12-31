const descuentoRouter = require('express').Router();
const chekAuth = require('../middleware/chek-auth');

const { getDescuentos, getDescuentosByConvenio , addDescuento, updateDescuento, deleteDescuento
        } = require('../controllers/descuento.controller');

descuentoRouter.route('/')
    .get(chekAuth, getDescuentos)
    .post(chekAuth, addDescuento);

descuentoRouter.route('/:id')
    .put(chekAuth, updateDescuento)
    .delete(chekAuth, deleteDescuento);

descuentoRouter.route('/convenio/:idConvenio')
    .get(chekAuth, getDescuentosByConvenio);

module.exports = descuentoRouter;