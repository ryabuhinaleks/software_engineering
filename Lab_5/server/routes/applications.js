var express = require('express')
var router = express.Router()
const Applications = require('../models/Applications')

// Get All Applications
router.get('/apps', (req, res, next) => {
  Applications.findAll()
    .then(tasks => {
      res.json(tasks)
    })
    .catch(err => {
      res.send('error: ' + err)
    })
})

router.post('/app', (req, res, next) => {
  if (!req.body.name) {
    res.status(400)
    res.json({
      error: 'Bad Data'
    })
  } else {
    Applications.create(req.body)
      .then(() => {
        res.send('Applications Added!')
      })
      .catch(err => {
        res.send('error: ' + err)
      })
  }
})

router.delete('/app/:id', (req, res, next) => {
  Applications.destroy({
    where: {
      id: req.params.id
    }
  })
    .then(() => {
      res.send('Applications deleted!')
    })
    .catch(err => {
      res.send('error: ' + err)
    })
})

// Update Applications
router.put('/app/:id', (req, res, next) => {
	console.log(req.body);
	
	
  if (!req.body.name) {
    res.status(400)
    res.json({
      error: 'Bad Data'
    })
  } else {
    Applications.update(
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
