const peopleRouter = require('express').Router();

const { getPeoples, getPeople, getCodEstudiante, addPeople, updatePeople, deletePeople } = require('../controllers/people.controller');

peopleRouter.route('/')
    .get(getPeoples)
    .post(addPeople);

peopleRouter.route('/:id')
    .get(getPeople)
    .put(updatePeople)
    .delete(deletePeople);

peopleRouter.route('/search/codStudent/:codStudente')
    .get(getCodEstudiante);

module.exports = peopleRouter;