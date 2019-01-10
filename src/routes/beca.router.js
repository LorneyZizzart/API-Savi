const becaRouter = require('express').Router();

const { getBecas, getBeca, addBeca, updateBeca, deleteBeca } = require('../controllers/beca.controller');

becaRouter.route('/')
    .get(getBecas)
    .post(addBeca);

becaRouter.route('/:id')
    .get(getBeca)
    .put(updateBeca)
    .delete(deleteBeca);

module.exports = becaRouter;