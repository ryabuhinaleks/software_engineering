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
  if (!req.body.id) {
    res.status(400)
    res.json({
      error: 'Bad Data'
    })
  } else {
    Applications.create(req.body)
      .then(() => {
        res.send('Товар добавлен!')
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
      res.send('Товар удален!')
    })
    .catch(err => {
      res.send('error: ' + err)
    })
})

// Update Applications
router.put('/app/:id', (req, res, next) => {
	console.log(req.body);
  if (!req.body.id) {
    res.status(400)
    res.json({
      error: 'Bad Data'
    })
  } else {
    Applications.update(
      { model: req.body.model, description: req.body.description, year: req.body.year, sum: req.body.sum  },
      { where: { id: req.params.id } }
    )
      .then(() => {
        res.send('Товар добавлен')
      })
      .error(err => handleError(err))
  }
})

module.exports = router
