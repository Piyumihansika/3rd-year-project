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
       

    }catch(e){
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

    Customer.findById
 
     Customer.findByIdAndRemove({_id: req.params.id}, req.body)
     res.status(200).send("deleted")
    
 });
 

 //VIEW CUSTOMER DETAILS
 router.get("/viewCustomer/:id", async(req,res) => {
     const customer = Customer.findById({_id: req.params.id}, req.body)
    //  const customer = await Customer.findOne({ _id: req.body.id })
     res.status(200).send(customer)
 })


module.exports = router;