const userRouter = require('express').Router();

const { getUsers, getUser, getVerificarUser, searchUser, addUser, updateUser, deleteUser } = require('../controllers/user.controller');

userRouter.route('/')
    .post(addUser);

userRouter.route('/search/users/:idRol')
    .get(getUsers);

userRouter.route('/:id')
    .get(getUser)
    .put(updateUser)
    .delete(deleteUser);

userRouter.route('/:id/:idPersona')
    .put(updateUser)

userRouter.route('/search/name/:usuario')
    .get(searchUser)

userRouter.route('/verificarUser/')
    .post(getVerificarUser);

module.exports = userRouter;