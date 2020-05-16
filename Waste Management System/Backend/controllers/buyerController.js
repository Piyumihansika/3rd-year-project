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

        const Email = await Buyer.findOne({ email: req.body.email })

        if(!Email){
            await buyer.save();

            const token = jwt.sign({ id: buyer.id}, config.secret, {
                expiresIn: "24h"
            });
            res.status(200).json({ auth: true, token})
            
        }else{

            res.status(403).send("email already exist")
          
        }
   
    }catch(e){
        console.log(e);
        res.status(500).send('There was a problem signUp');

    }
});

//UPDATE BUYER DETAILS
router.put("/updateBuyer/:id", async(req, res) => {
  
   const buyer = await Buyer.findByIdAndUpdate({_id: req.params.id}, req.body)
   if(buyer){
    const newBuyer = await Buyer.findOne({_id: req.params.id})
    res.status(200).json(newBuyer)
   }
});


//DELETE A BUYER
router.delete("/deleteBuyer/:id", async (req, res) => {

    Buyer.findByIdAndRemove({_id: req.params.id}, req.body)
    res.status(200).send("deleted")
   
});

//VIEW BUYER DETAILS
router.post("/viewBuyer", async(req,res) => {
    const buyer = await Buyer.findOne({ _id: req.body.id })
    res.status(200).send(buyer)
})

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