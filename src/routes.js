const {Router} = require('express')

const routes = new Router();

routes.get('/health',(req, res)=> {
    res.send({message: 'Conect with sucess!'})
})

routes.get('/',(req, res)=> {
    res.send({message: process.env.MESSAGE})
})

module.exports = routes