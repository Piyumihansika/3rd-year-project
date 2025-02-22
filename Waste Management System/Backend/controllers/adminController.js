const {Router} = require('express');
const router = Router();
const Customer = require('../model/customerModel');
const Admin = require('../model/adminModel');
const Buyer = require('../model/buyerModel');
const verifyToken = require('./verifyToken');

const jwt = require('jsonwebtoken');
const config = require('../config');

//add a new admin
router.post('/addnewadmin', async(req, res) => {
    try{
        const {adminName,adminemail,admincontactNumber,adminpassword} = req.body;

        const admin = new Admin({
            adminName,
            adminemail,
            admincontactNumber,
            adminpassword,
            
        });
        admin.adminpassword = await admin.encryptPassword(adminpassword);
        

        await admin.save();

        // const token = jwt.sign({ id: user.id}, config.secret, {
        //     expiresIn: "24h"
        // });
       // res.status(200).json({ auth: true, token})


       console.log();
        res.status(200).send('That was a suceess');


    }catch(e){
        console.log(e);
        res.status(500).send('oh noooooooo😱😱😱😱!!!! something went wrong ');

    }
});

//remove/delete customers(sellers)
router.delete("/deleteCustomer/:id", async (req, res) => {

    Customer.findById
 
     Customer.findByIdAndRemove({_id: req.params.id}, req.body)
     res.status(200).send("deleted")
    
 });

// View All Admins
router.get('/viewAllAdmin', async(req,res) => {
    const allAdmin = await Admin.find();
    res.json(allAdmin)
  })




//REMOVE/DELETE BUYER
 router.delete("/deleteBuyer/:id", async (req, res) => {
    Buyer.findById
    Buyer.findByIdAndRemove({_id: req.params.id}, req.body)
    res.status(200).send("deleted")
   });



 //VIEW CUSTOMER DETAILS
 router.get("/viewCustomer/:id", async(req,res) => {
    const customer = Customer.findById({_id: req.params.id}, req.body)
   //  const customer = await Customer.findOne({ _id: req.body.id })
    res.status(200).send(customer)
});


//VIEW BUYER DETAILS
router.get("/viewbUYER", async(req,res) => {
    const buyer =buyer.findById({_id: req.params.id}, req.body)
    res.status(200).send(buyer)
});


//update admin details
router.put("/updateAdmin/:id", async(req, res) => {
    const admin = await Admin.findByIdAndUpdate({_id: req.params.id}, req.body)
    if(admin){
    const newAdmin = await Admin.findOne({_id: req.params.id})
    res.status(200).json(newAdmin)
    }
   });
    
 



   //DELETE ADMIN   
router.delete("/deleteAdmin/:id", async (req, res) => {
    Admin.findById
    Admin.findByIdAndRemove({_id: req.params.id}, req.body)
    res.status(200).send("deleted")
   });

   
module.exports = router;