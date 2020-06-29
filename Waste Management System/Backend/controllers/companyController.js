const {Router} = require('express');
const router = Router();

const Buyer = require('../model/company');
const verifyToken = require('./verifyToken');

const jwt = require('jsonwebtoken');
const config = require('../config');

//add household buyer
router.post('/addCompany', async(req, res) => {
    try{
    
        const {firstName,lastName,email,contactNumber,password,address1,address2,city,district} = req.body;

        const customer = new Customer({
            firstName,
            lastName,
            email,
            contactNumber,
            password,
            address1,
            address2,
            city,
            district
        });
        customer.password = await customer.encryptPassword(password);

        const user = await Customer.findOne({ username: req.body.username })

        if(!user){
            await customer.save();

            const token = jwt.sign({ id: customer.id}, config.secret, {
                expiresIn: "24h"
            });
            res.status(200).json({ auth: true, token})
        }else{
            res.status(403).send("username already exist")
        }
       

    }catch(e){
        console.log(e);
        res.status(500).send('There was a problem signUp');

    }
});