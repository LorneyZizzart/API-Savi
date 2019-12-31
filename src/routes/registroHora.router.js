const registroHoraRouter = require('express').Router();
const chekAuth = require('../middleware/chek-auth');

const { getRegistroHorasNow, getRegistroHorasYesterday, addRegistroHora, 
        updateRegistroHoraSalida, deleteRegistroHora, updateRegistroHoraAprovado,
        updateRegistroHoraAprobarFinanzas, 
        getRegistroHorasWeek, getRegistroHorasMonth, updateRegistroHoraArchivar
    } = require('../controllers/registroHora.controller');

registroHoraRouter.route('/')
    .post(chekAuth, addRegistroHora);

registroHoraRouter.route('/:id')
    .delete(chekAuth, deleteRegistroHora)
    .put(chekAuth, updateRegistroHoraSalida);

registroHoraRouter.route('/delete/:id')
    .put(chekAuth, deleteRegistroHora)

registroHoraRouter.route('/archivar/:id')
    .put(chekAuth, updateRegistroHoraArchivar);

registroHoraRouter.route('/aprovado/:id')
    .put(chekAuth, updateRegistroHoraAprovado);

registroHoraRouter.route('/aprobarFinanzas/:id')
    .put(chekAuth, updateRegistroHoraAprobarFinanzas);

registroHoraRouter.route('/dateNow/:idDepto')
    .get(chekAuth, getRegistroHorasNow);

registroHoraRouter.route('/dateYest/informe/:idDepto')
    .get(chekAuth, getRegistroHorasYesterday);

registroHoraRouter.route('/dateWeek/informe/:idDepto')
    .get(chekAuth, getRegistroHorasWeek);

registroHoraRouter.route('/dateMonth/informe/:idDepto')
    .get(chekAuth, getRegistroHorasMonth);

module.exports = registroHoraRouter;