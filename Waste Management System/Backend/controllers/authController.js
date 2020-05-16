const {Router} = require('express');
const router = Router();

const User = require('../model/userModel');
const Customer = require('../model/customerModel');
const verifyToken = require('./verifyToken');

const jwt = require('jsonwebtoken');
const config = require('../config');

router.post('/customerSignup', async(req, res) => {
    try{
        
        const {firstName,lastName,email,username,address,contactNumber,password} = req.body;

        const user = new User({
            firstName,
            lastName,
            email,
            username,
            address,
            contactNumber,
            password
        });
        user.password = await user.encryptPassword(password);
        await user.save();

        const token = jwt.sign({ id: user.id}, config.secret, {
            expiresIn: "24h"
        });
        res.status(200).json({ auth: true, token})

    }catch(e){
        console.log(e);
        res.status(500).send('There was a problem signin');

    }
});

router.post('/Signin', async(req, res) => {
    try{
        const user = await User.findOne({ username: req.body.username })
        if(!user){
            return res.status(404).send("The username doesn't exist")
        }
        const validPassword = await user.validatePassword(req.body.password, user.password);
        if(!validPassword){
            return res.status(401).send({ auth: false, token: null});
        }
        const token = jwt.sign({ id: user._id }, config.secret, {
            expiresIn: '24h'
        });
        res.status(200).json({ auth: true, token });
    }catch(e){
        console.log(e);
        res.status(500).send("There was a problem signin");

    }
});

router.get('/logout', function(req, res) {
    res.status(200).send({ auth: false, token: null })
});

module.exports = router;