const {Router} = require('express');
const router = Router();

const Buyer = require('../model/buyerModel');
const buyerRequest = require("../model/newbuyerModel")
const verifyToken = require('./verifyToken');

const jwt = require('jsonwebtoken');
const config = require('../config');

//UPDATE BUYER DETAILS
router.put("/updateBuyer/:id", async (req, res) => {
    
    const buyer = await Buyer.findByIdAndUpdate({_id: req.params.id}, req.body)
    console.log("update buyer api hit")
   if(buyer){
    const newBuyer =  await Buyer.findOne({_id: req.params.id})
    res.status(200).json(newBuyer)
    console.log("success")
   }else{
       res.status(500).send("server error");
   }
    
 });
// router.put("/updateBuyer/:id", async(req, res) => {
  
//    const buyer = await Buyer.findByIdAndUpdate({_id: req.params.id}, req.body)
//    if(buyer){
//     const newBuyer = await Buyer.findOne({_id: req.params.id})
//     res.status(200).json(newBuyer)
//    }
// });


//DELETE A BUYER

router.delete("/deleteBuyer/:id", async (req, res) => {

    
    const deleteOne = await Buyer.findByIdAndRemove({_id: req.params.id},req.body)
    console.log("api hit")
    if(deleteOne){
        // const user = await Buyer.findById({_id: req.params.id})
        res.status(200).json({ "status" : "delete" });
        // console.log(user)
        console.log("---------------------delete user------------------------------------")
    }else{
        const user = await Buyer.findById({_id: req.params.id})
        res.status(403).json({ "user" : user })
        console.log(user)
        console.log("------------------------------not delete---------------------------")
    }
   
    
 });

//CONFIRM PASSWORD FOR DELETE A BUYER
router.post("/getPassword", async(req,res) => {
   
    try {
    const buyer = await Buyer.findOne({ _id: req.body.id })
   const validPassword = await buyer.validatePassword(req.body.password, buyer.password);
   if(!validPassword){
        
        res.status(401).json({ "status" : "not match" });
        console.log("------------------------------invalid---------------------------")
    
    }else{

        res.status(200).json({ "status" : "matched" })
        console.log("------------------------------matched----------------------------")
        
    }
        
    } catch (error) {
        console.log(error)
        
    }
    
  
})

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
        buyer.password = await buyer.encryptPassword(password);
        console.log("api hit");
        const user = await Buyer.findOne({ email: req.body.email })
        if(!user){
            await buyer.save();
            console.log("buyer api hit")
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


module.exports = router;