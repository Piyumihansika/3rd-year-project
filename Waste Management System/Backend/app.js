const express = require('express');
const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: false }))

app.use('/auth',require('./controllers/authController'))
app.use('/customer',require('./controllers/customerController'))
app.use('/buyer',require('./controllers/buyerController'))

module.exports = app;