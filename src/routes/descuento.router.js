const descuentoRouter = require('express').Router();

const { getDescuentos, getDescuentosByConvenio , addDescuento, updateDescuento, deleteDescuento
        } = require('../controllers/descuento.controller');

descuentoRouter.route('/')
    .get(getDescuentos)
    .post(addDescuento);

descuentoRouter.route('/:id')
    .put(updateDescuento)
    .delete(deleteDescuento);

descuentoRouter.route('/convenio/:idConvenio')
    .get(getDescuentosByConvenio);

module.exports = descuentoRouter;