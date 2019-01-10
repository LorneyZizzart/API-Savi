const userRouter = require('express').Router();

const { getUsers, getUser, addUser, updateUser, deleteUser } = require('../controllers/user.controller');
//no esta funcionando
//const { user } = require('../db/database.js');

userRouter.route('/')
    .get(getUsers)
    .post(addUser);

userRouter.route('/:id')
    .get(getUser)
    .put(updateUser)
    .delete(deleteUser);

module.exports = userRouter;