const peopleRouter = require('express').Router();

const { getPeoples, getPeople, addPeople, updatePeople, deletePeople } = require('../controllers/people.controller');

peopleRouter.route('/')
    .get(getPeoples)
    .post(addPeople);

peopleRouter.route('/:id')
    .get(getPeople)
    .put(updatePeople)
    .delete(deletePeople);

module.exports = peopleRouter;