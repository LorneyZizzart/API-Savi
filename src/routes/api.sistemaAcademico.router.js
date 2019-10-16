const areaRouter = require('express').Router();

const { getEstudiantes, getEstudiante, getNotas
        } = require('../controllers/api.sistemaAcademico.controller');

areaRouter.route('/estudiantes/:cant')
    .get(getEstudiantes);

areaRouter.route('/estudiante/:codEstudiante')
    .get(getEstudiante);

areaRouter.route('/notas/:idEstudiante')
    .get(getNotas);

module.exports = areaRouter;