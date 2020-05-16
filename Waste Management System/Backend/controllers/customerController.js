const {Router} = require('express');
const router = Router();

const Customer = require('../model/customerModel');
const verifyToken = require('./verifyToken');

const jwt = require('jsonwebtoken');
const config = require('../config');


//ADD A CUSTOMER
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

//UPDATE CUSTOMER DETAILS
router.put("/updateCustomer/:id", async(req, res, next) => {
  
    const customer = await Customer.findByIdAndUpdate({_id: req.params.id}, req.body)
   if(customer){
    const newCustomer = await Customer.findOne({_id: req.params.id})
    res.status(200).json(newCustomer)
   }
    
 });
 
 
 //DELETE A CUSTOMER
 router.delete("/deleteCustomer/:id", async (req, res) => {
 
     Customer.findByIdAndRemove({_id: req.params.id}, req.body)
     res.status(200).send("deleted")
    
 });
 

 //VIEW CUSTOMER DETAILS
 router.post("/viewCustomer", async(req,res) => {
     const customer = await Customer.findOne({ _id: req.body.id })
     res.status(200).send(customer)
 })


module.exports = router;