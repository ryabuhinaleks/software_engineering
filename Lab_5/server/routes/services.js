var express = require('express')
var router = express.Router()
const Services = require('../models/Services')

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

router.post('/service', (req, res, next) => {
  if (!req.body.name) {
    res.status(400)
    res.json({
      error: 'Bad Data'
    })
  } else {
    Services.create(req.body)
      .then(() => {
        res.send('Services Added!')
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
      res.send('Services deleted!')
    })
    .catch(err => {
      res.send('error: ' + err)
    })
})

// Update Services
router.put('/service/:id', (req, res, next) => {
	console.log(req.body);
	
	
  if (!req.body.name) {
    res.status(400)
    res.json({
      error: 'Bad Data'
    })
  } else {
    Services.update(
      { name: req.body.name, data: req.body.data  },
      { where: { id: req.params.id } }
    )
      .then(() => {
        res.send('App Updated!')
      })
      .error(err => handleError(err))
  }
})

module.exports = router
