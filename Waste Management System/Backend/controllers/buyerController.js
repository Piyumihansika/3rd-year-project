const {Router} = require('express');
const router = Router();

const Buyer = require('../model/buyerModel');
const buyerRequest = require("../model/newbuyerModel")
const verifyToken = require('./verifyToken');

const jwt = require('jsonwebtoken');
const config = require('../config');

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
router.post('/addBuyer', async(req, res) => {
    console.log("api hit 1");
    try{
    
        const {firstName,lastName,contactNumber,email,password,address1,address2,city,district} = req.body;

        const buyer = new Buyer({
            firstName,
            lastName,
            contactNumber,
            email,
            password,
            address1,
            address2,
            city,
            district
        });
        await buyer.save();
        console.log("api hit");

        const token = jwt.sign({ id: buyer.id}, config.secret, {
            expiresIn: "24h"
        });
        res.status(200).json({ auth: true, token})

    }catch(e){
        console.log(e);
        res.status(500).send('There was a problem signUp');

    }
});


module.exports = router;