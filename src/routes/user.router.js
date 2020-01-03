const userRouter = require('express').Router();
const chekAuth = require('../middleware/chek-auth');

const { getUsers, getUser, getVerificarUser, searchUser, addUser, updateUser, deleteUser } = require('../controllers/user.controller');

userRouter.route('/')
    .post(chekAuth, addUser);

userRouter.route('/search/users/:idRol')
    .get(chekAuth, getUsers);

userRouter.route('/:id')
    .get(chekAuth, getUser)
    .put(chekAuth, updateUser)
    .delete(chekAuth, deleteUser);

userRouter.route('/:id/:idPersona')
    .put(chekAuth, updateUser)

userRouter.route('/search/name/:usuario')
    .get(chekAuth, searchUser)

userRouter.route('/login/')
    .post(getVerificarUser);

module.exports = userRouter;