var express = require('express')
var router = express.Router()
const Clients = require('../models/Clients')


router.get('/client', (req, res, next) => {
  Clients.findAll()
    .then(client => {
      res.json(client)
    })
    .catch(err => {
      res.send('error: ' + err)
    })
})

module.exports = router
