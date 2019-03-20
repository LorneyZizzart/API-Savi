const descuentoRouter = require('express').Router();

const { getDescuentos, addDescuento, updateDescuento, deleteDescuento
        } = require('../controllers/descuento.controller');

descuentoRouter.route('/')
    .get(getDescuentos)
    .post(addDescuento);

descuentoRouter.route('/:id')
    .put(updateDescuento)
    .delete(deleteDescuento);

module.exports = descuentoRouter;