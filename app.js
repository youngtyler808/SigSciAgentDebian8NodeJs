// 1. Import sigsci module
var Sigsci = require('sigsci-module-nodejs')

const express = require('express')


// 2. Create a SigSci object
var sigsci = new Sigsci({
    path: '/var/run/sigsci.sock'
    // other parameters here
})

// App

const app = express()
app.use(sigsci.express()) 

app.get('/', function (req, res) {
  res.send('Hello World!')
})

app.listen(80, function () {
  console.log('Example app listening on port 80!')
})
