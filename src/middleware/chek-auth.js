const jwt = require('jsonwebtoken');
const config = require('../db/config.db');

module.exports = (req, res, next) => {
        try {        
        const token = req.headers.authorization.split(" ");
        if(token[0] === 'Sabi'){
            const decoded = jwt.verify(token[1], config.database);
            req.userData = decoded;
            next();
        }else{
            return res.status(401).json({
                message: 'Autentificación fallida'
            });
        }        
    } catch (error) {
        return res.status(401).json({
            message: 'Autentificación fallida'
        });
    }
};