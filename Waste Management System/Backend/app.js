const express = require('express');
const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: false }))

app.use('/user',require('./controllers/authController'))
app.use('/employee',require('./controllers/adminController'))
app.use('/buyer',require('./controllers/adminController'))
app.use('/employee',require('./controllers/employeeController'))

module.exports = app;