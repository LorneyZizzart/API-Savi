const becaRouter = require('express').Router();
const chekAuth = require('../middleware/chek-auth');

const { getBecas, getBeca, addBeca, updateBeca, deleteBeca } = require('../controllers/beca.controller');

becaRouter.route('/')
    .get(chekAuth, getBecas)
    .post(chekAuth, addBeca);

becaRouter.route('/:id')
    .get(chekAuth, getBeca)
    .put(chekAuth, updateBeca)
    .delete(chekAuth, deleteBeca);

module.exports = becaRouter;