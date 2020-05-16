const {Router} = require('express');
const router = Router();

const Customer = require('../model/customerModel');
const verifyToken = require('./verifyToken');

const jwt = require('jsonwebtoken');
const config = require('../config');

router.post('/customerAdd', async(req, res) => {
    try{
    
        const {firstName,lastName,email,username,address,contactNumber,serviceCenter,password} = req.body;

        const customer = new Customer({
            firstName,
            lastName,
            email,
            username,
            address,
            contactNumber,
            serviceCenter,
            password
        });
        customer.password = await customer.encryptPassword(password);
        await customer.save();

        const token = jwt.sign({ id: customer.id}, config.secret, {
            expiresIn: "24h"
        });
        res.status(200).json({ auth: true, token})

    }catch(e){
        console.log(e);
        res.status(500).send('There was a problem signUp');

    }
});

module.exports = router;