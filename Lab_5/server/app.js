var express = require('express')
var path = require('path')
var bodyParser = require('body-parser')

var tasks = require('./routes/clients')
var cors = require('cors')

var port = 8000

var app = express()
app.use(cors())

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))

app.use('/api', tasks)

app.listen(port, function() {
  console.log('Server started on port ' + port)
})
