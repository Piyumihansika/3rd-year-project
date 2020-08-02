const {Router} = require('express');
const router = Router();

const Customer = require('../model/customerModel');
const verifyToken = require('./verifyToken');

const jwt = require('jsonwebtoken');
const config = require('../config');


//ADD A CUSTOMER
router.post('/addCustomer', async(req, res) => {
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
        console.log("customer api hit")
        const user = await Customer.findOne({ email: req.body.email })

        if(!user){
            await customer.save();
            console.log("customer api hit")
            const token = jwt.sign({ id: customer.id}, config.secret, {
                expiresIn: "24h"
            });
            res.status(200).json({ auth: true, token})
        }else{
            res.status(403).send("email already exist")
        }
       

    }
    catch(e){
        console.log(e);
        res.status(500).send('There was a problem signUp');

    }
});

//UPDATE CUSTOMER DETAILS
router.put("/updateCustomer/:id", async (req, res) => {
    
    const customer = await Customer.findByIdAndUpdate({_id: req.params.id}, req.body)
    console.log("update api hit")
   if(customer){
    const newCustomer =  await Customer.findOne({_id: req.params.id})
    res.status(200).json(newCustomer)
    console.log("success")
   }else{
       res.status(500).send("server error");
   }
    
 });
 
 
 //DELETE A CUSTOMER
 router.delete("/deleteCustomer/:id", async (req, res) => {

    
    const deleteOne = await Customer.findByIdAndRemove({_id: req.params.id},req.body)
    console.log(deleteOne)
    if(deleteOne){
        // const user = await Customer.findById({_id: req.params.id})
        res.status(200).json({ "status" : "delete" });
        // console.log(user)
        console.log("---------------------delete user------------------------------------")
    }else{
        const user = await Customer.findById({_id: req.params.id})
        res.status(403).json({ "user" : user })
        console.log(user)
        console.log("------------------------------not delete---------------------------")
    }
   
    
 });
 

 //VIEW CUSTOMER DETAILS
 router.get("/viewCustomer/:id", async(req,res) => {
     const customer = await Customer.findById({_id: req.params.id}, req.body)
    //  const customer = await Customer.findOne({ _id: req.body.id }
     res.status(200).send(customer)
     console.log(customer.password)
 })


 //CONFIRM PASSWORD FOR DELETE A CUSTOMER
 router.post("/getPassword", async(req,res) => {
   
    try {
    const customer = await Customer.findOne({ _id: req.body.id })
   const validPassword = await customer.validatePassword(req.body.password, customer.password);
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

module.exports = router;