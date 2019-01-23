const registroHoraRouter = require('express').Router();

const { getRegistroHorasNow, getRegistroHorasYesterday, addRegistroHora, deleteRegistroHora } = require('../controllers/registroHora.controller');

registroHoraRouter.route('/')
    .post(addRegistroHora);

registroHoraRouter.route('/:id')
    .delete(deleteRegistroHora);

registroHoraRouter.route('/dateNow/:nameDept')
    .get(getRegistroHorasNow);

registroHoraRouter.route('/dateYesterday/:nameDept')
    .get(getRegistroHorasYesterday);

module.exports = registroHoraRouter;