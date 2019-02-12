const registroHoraRouter = require('express').Router();

const { getRegistroHorasNow, getRegistroHorasYesterday, addRegistroHora, 
        updateRegistroHoraSalida, deleteRegistroHora, updateRegistroHoraAprovado,
        updateRegistroHoraAprobarFinanzas, 
        getRegistroHorasWeek, getRegistroHorasMonth, updateRegistroHoraArchivar
    } = require('../controllers/registroHora.controller');

registroHoraRouter.route('/')
    .post(addRegistroHora);

registroHoraRouter.route('/:id')
    .delete(deleteRegistroHora)
    .put(updateRegistroHoraSalida);

registroHoraRouter.route('/delete/:id')
    .put(deleteRegistroHora)

registroHoraRouter.route('/archivar/:id')
    .put(updateRegistroHoraArchivar);

registroHoraRouter.route('/aprovado/:id')
    .put(updateRegistroHoraAprovado);

registroHoraRouter.route('/aprobarFinanzas/:id')
    .put(updateRegistroHoraAprobarFinanzas);

registroHoraRouter.route('/dateNow/:idDepto')
    .get(getRegistroHorasNow);

registroHoraRouter.route('/dateYest/informe/:idDepto')
    .get(getRegistroHorasYesterday);

registroHoraRouter.route('/dateWeek/informe/:idDepto')
    .get(getRegistroHorasWeek);

registroHoraRouter.route('/dateMonth/informe/:idDepto')
    .get(getRegistroHorasMonth);

module.exports = registroHoraRouter;