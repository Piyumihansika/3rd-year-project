const {Router} = require('express');
const router = Router();

const User = require('../model/userModel');
const Customer = require('../model/customerModel');
const Buyer = require('../model/buyerModel')
const verifyToken = require('./verifyToken');

const jwt = require('jsonwebtoken');
const config = require('../config');

//buyer login,customer login,admin login

//BUYER LOGIN
router.post('/customerLogin', async(req, res) => {
    try{
        const customer = await Customer.findOne({ email: req.body.email })
       
        if(!customer){
            return res.status(404).send("The email doesn't exist")
        }
        const validPassword = await customer.validatePassword(req.body.password, customer.password);
        if(!validPassword){
            return res.status(401).send({ auth: false, token: null});
        }
        const token = jwt.sign({ id: customer._id }, config.secret, {
            expiresIn: '24h'
           
        });
        if(token){
            id=customer._id;
            user= customer;
            res.status(200).json({ auth: true, id: customer._id, token, user: customer});
            console.log("api hit");
        }
       
    }catch(e){
        console.log(e);
        res.status(500).send("There was a problem signin");

    }
});

//EMAIL LOGIN
router.post('/emailLogin', async(req, res) => {
    try{
        const buyer = await Buyer.findOne({ email: req.body.email })
       
        if(!buyer){
            return res.status(404).send("The email doesn't exist")
        }
        const validPassword = await buyer.validatePassword(req.body.password, buyer.password);
        if(!validPassword){
            return res.status(401).send({ auth: false, token: null});
        }
        const token = jwt.sign({ id: buyer._id }, config.secret, {
            expiresIn: '24h'
        });
        if(token){
            res.status(200).json({ auth: true, id: buyer._id, user: buyer, token});
        }
       
    }catch(e){
        console.log(e);
        res.status(500).send("There was a problem signin");

    }
});


//USERNAME LOGIN
router.post('/usernameLogin', async(req, res) => {
    try{
        const customer = await Customer.findOne({ username: req.body.username })

        if(!customer){
            return res.status(404).send("The username doesn't exist")
        }
        const validPassword = await customer.validatePassword(req.body.password, customer.password);
        if(!validPassword){
            return res.status(401).send({ auth: false, token: null});
        }

        if(customer){
            const token = jwt.sign({ id: customer._id }, config.secret, {
                expiresIn: '24h'
            });
            res.status(200).json({ auth: true, token , id: customer._id});
        }
        
    }catch(e){ 
        console.log(e);
        res.status(500).send("There was a problem signin");

    }
});

router.get('/logout/:id', async(req,res) => {
    res.status(200).send({ auth: false, token: null, id: null })
    console.log("logout hit")
});

module.exports = router;