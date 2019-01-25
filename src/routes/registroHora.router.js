const registroHoraRouter = require('express').Router();

const { getRegistroHorasNow, getRegistroHorasYesterday, addRegistroHora, updateRegistroHoraSalida, deleteRegistroHora } = require('../controllers/registroHora.controller');

registroHoraRouter.route('/')
    .post(addRegistroHora);

registroHoraRouter.route('/:id')
    .delete(deleteRegistroHora)
    .put(updateRegistroHoraSalida);

registroHoraRouter.route('/dateNow/:idDepto')
    .get(getRegistroHorasNow);

registroHoraRouter.route('/dateYesterday/:idDepto')
    .get(getRegistroHorasYesterday);

module.exports = registroHoraRouter;