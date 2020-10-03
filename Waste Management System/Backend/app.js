const express = require('express');
const app = express();
app.use(cors());

app.use(express.json());
app.use(express.urlencoded({ extended: false }))
app.use(express.static('uploads'))

app.use('/auth',require('./controllers/authController'))
app.use('/admin',require('./controllers/adminController'))
app.use('/customer',require('./controllers/customerController'))
app.use('/buyer',require('./controllers/buyerController'))
app.use('/company',require('./controllers/companyController'))
app.use('/forgot',require('./controllers/forgotEmailBodyController'))
app.use('/item',require('./controllers/itemController'))
app.use('/category',require('./controllers/categoryController'))

module.exports = app;