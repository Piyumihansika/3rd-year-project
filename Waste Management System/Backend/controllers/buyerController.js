const {Router} = require('express');
const router = Router();

const Buyer = require('../model/buyerModel');
const buyerRequest = require("../model/newbuyerModel")
const verifyToken = require('./verifyToken');

const jwt = require('jsonwebtoken');
const config = require('../config');


// ADD  A NEW BUYER
router.post('/buyerAdd', async(req, res) => {
    try{
    
        const {companyName,address,email,landNumber,mobileNumber,registrationNumber,password} = req.body;

        const buyer = new Buyer({
            companyName,
            address,
            email,
            landNumber,
            mobileNumber,
            registrationNumber,
            password
        });
        buyer.password = await buyer.encryptPassword(password);
        await buyer.save();

        const token = jwt.sign({ id: buyer.id}, config.secret, {
            expiresIn: "24h"
        });
        res.status(200).json({ auth: true, token})

    }catch(e){
        console.log(e);
        res.status(500).send('There was a problem signUp');

    }
});

// router.put("/updateBuyer/:id", (req, res) => {
//    Buyer.findByIdAndUpdate({_id: req.params.id}, req.body)
//    console.log(req.params.id)
//     .then(() =>{
//         Buyer.findOne({_id: req.params.id})
//         .then((doc) => {
//             res.send(doc)
//         });
//     });
// });

// router.delete("/delete/:id", (req, res) => {
//     UserModel.findByIdAndRemove({_id: req.params.id})
//     .then((doc) => {
//         res.send(doc)
//     });
// });



//ADD A NEW BUYER REQUEST
router.post('/buyerRequest', async(req, res) => {
    try{
    
        const {companyName,contactpersonName,address,email,contactNumber,comment} = req.body;

        const newbuyer = new buyerRequest({
            companyName,
            contactpersonName,
            address,
            email,
            contactNumber,
            comment
        });
        await newbuyer.save();

        const token = jwt.sign({ id: newbuyer.id}, config.secret, {
            expiresIn: "24h"
        });
        res.status(200).json({ auth: true, token})

    }catch(e){
        console.log(e);
        res.status(500).send('There was a problem signUp');

    }
});

module.exports = router;