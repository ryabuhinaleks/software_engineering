var express = require('express')
var path = require('path')
var bodyParser = require('body-parser')

var clients = require('./routes/clients')
var applications = require('./routes/applications')
var services = require('./routes/services')

var cors = require('cors')

var port = 8000

var app = express()
app.use(cors())

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))

app.use('/', clients)
app.use('/', applications)
app.use('/', services)

app.listen(port, function() {
  console.log('Server started on port ' + port)
})
