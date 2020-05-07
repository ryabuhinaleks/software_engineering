var express = require('express')
var router = express.Router()
const Services = require('../models/Services')
const Clients = require('../models/Clients')
const Applications = require('../models/Applications')

// Get All Services
router.get('/services', (req, res, next) => {
  Services.findAll()
    .then(tasks => {
      res.json(tasks)
    })
    .catch(err => {
      res.send('error: ' + err)
    })
})

router.get('/users', (req, res, next) => {
  Clients.findAll()
    .then(tasks => {
      res.json(tasks)
    })
    .catch(err => {
      res.send('error: ' + err)
    })
})

router.get('/user', (req, res, next) => {
  Clients.findAll()
    .then(tasks => {
      res.json(tasks)
    })
    .catch(err => {
      res.send('error: ' + err)
    })
})

router.get('/tovar', (req, res, next) => {
  Applications.findAll()
    .then(tasks => {
      res.json(tasks)
    })
    .catch(err => {
      res.send('error: ' + err)
    })
})

router.post('/service', (req, res, next) => {
	console.log(req.body);
  if (!req.body.date) {
    res.status(400)
    res.json({
      error: 'ERROR'
    })
  } else {
    Services.create(req.body)
      .then(() => {
        res.send('Услуга добавлена!')
      })
      .catch(err => {
        res.send('error: ' + err)
      })
  }
})

router.delete('/service/:id', (req, res, next) => {
  Services.destroy({
    where: {
      id: req.params.id
    }
  })
    .then(() => {
      res.send('Услуга удалена!')
    })
    .catch(err => {
      res.send('error: ' + err)
    })
})

// Update Services
router.put('/service/:id', (req, res, next) => {
	console.log(req.body);	
  if (!req.body.date) {
    res.status(400)
    res.json({
      error: 'Error'
    })
  } else {
    Services.update(
      { date: req.body.date, id_client: req.body.id_client, number:req.body.number, count:req.body.count   },
      { where: { id: req.params.id } }
    )
      .then(() => {
        res.send('App Updated!')
      })
      .error(err => handleError(err))
  }
})

module.exports = router
