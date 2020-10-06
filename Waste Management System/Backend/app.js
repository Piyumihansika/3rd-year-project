const express = require('express');
const app = express();
var cors = require('cors')

app.use(express.json());
app.use(express.urlencoded({ extended: false }))
app.use(express.static('uploads'))

var corsOptions = {
    origin: 'http://localhost:8080',
    optionsSuccessStatus: 200 // For legacy browser support
}

app.use(cors(corsOptions));

app.use('/auth',require('./controllers/authController'))
app.use('/admin',require('./controllers/adminController'))
app.use('/customer',require('./controllers/customerController'))
app.use('/buyer',require('./controllers/buyerController'))
app.use('/company',require('./controllers/companyController'))
app.use('/forgot',require('./controllers/forgotEmailBodyController'))
app.use('/item',require('./controllers/itemController'))
app.use('/category',require('./controllers/categoryController'))
app.use('/auction',require('./controllers/auctionController'))
app.use('/finalBids',require('./controllers/finalBidsController'))

module.exports = app;