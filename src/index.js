const morgan = require('morgan');
const express = require('express');
const cors = require('cors')

const app = express();

const userRouter = require('./routes/user.router');
const peopleRouter = require('./routes/people.router');
const convenioRouter = require('./routes/convenio.router');
const becaRouter = require('./routes/beca.router');
const departamentoRouter = require('./routes/departamento.router');
const areaRouter = require('./routes/area.router');
const tipoPersonaRouter = require('./routes/tipoPersona.router');
const historialDepartamento = require('./routes/historialDepartamento.router')

//setting
//app.set('views', path.join(__dirname, 'views'));
app.set('port', process.env.PORT || 3000);
app.set('json spaces', 4)
app.set('view engine', 'ejs');

//middlewares
app.use(cors());
app.use(morgan('dev'))
app.use(express.json())
app.use(express.urlencoded({ extended: false }));
app.use(function(req, res, next) {
    res.setHeader("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Credentials", "true");
    res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept", 'application/json', 'text/json');
    res.header('Access-Control-Allow-Methods', 'POST, GET, PUT, DELETE, OPTIONS');
    next();
})

//routes
app.use('/user', userRouter)
app.use('/people', peopleRouter)
app.use('/convenio', convenioRouter)
app.use('/beca', becaRouter)
app.use('/departamento', departamentoRouter)
app.use('/area', areaRouter)
app.use('/tipoPersona', tipoPersonaRouter)
app.use('/historialDepartamento', historialDepartamento)

//static files
//start server
app.listen(app.get('port'), () => {
    console.log("server on port: ", app.get('port'));

})