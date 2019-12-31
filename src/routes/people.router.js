const peopleRouter = require('express').Router();
const chekAuth = require('../middleware/chek-auth');

const { getPeoples, getPeople, getCodEstudiante, addPeople, updatePeople, deletePeople } = require('../controllers/people.controller');

peopleRouter.route('/')
    .get(chekAuth, getPeoples)
    .post(chekAuth, addPeople);

peopleRouter.route('/:id')
    .get(chekAuth, getPeople)
    .put(chekAuth, updatePeople)
    .delete(chekAuth, deletePeople);

peopleRouter.route('/search/codStudent/:codStudente')
    .get(chekAuth, getCodEstudiante);

module.exports = peopleRouter;