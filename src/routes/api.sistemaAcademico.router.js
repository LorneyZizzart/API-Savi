const areaRouter = require('express').Router();

const { getEstudiantes, getEstudiante, getNotas, getHorario
        } = require('../controllers/api.sistemaAcademico.controller');

areaRouter.route('/estudiantes/:cant')
    .get(getEstudiantes);

areaRouter.route('/estudiante/:codEstudiante')
    .get(getEstudiante);

areaRouter.route('/notas/:idEstudiante')
    .get(getNotas);

areaRouter.route('/horario/:idEstudiante')
    .get(getHorario);

module.exports = areaRouter;