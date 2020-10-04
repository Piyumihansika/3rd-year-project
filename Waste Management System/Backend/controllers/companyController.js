const {Router} = require('express');
const router = Router();

const Company = require('../model/companyModel');
const verifyToken = require('./verifyToken');

const jwt = require('jsonwebtoken');
const config = require('../config');

//ADD A COMPANY
router.post('/addCompany', async(req, res) => {
    try{
    
        const {companyName,contactpersonName,contactpersonNumber,email,password,address1,address2,city,district} = req.body;

        const company = new Company({
            companyName,
            contactpersonName,
            contactpersonNumber,
            email,
            password,
            address1,
            address2,
            city,
            district
        });
        company.password = await company.encryptPassword(password);

        const user = await Company.findOne({ email: req.body.email })

        if(!user){
            await company.save();
            console.log('company api hit')
            const token = jwt.sign({ id: company.id}, config.secret, {
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

//UPDATE COMPANY PROFILE
router.put("/updateCompany/:id", async (req, res) => {
    
    const company = await Company.findByIdAndUpdate({_id: req.params.id}, req.body)
    console.log("update company api hit")
   if(company){
    const newCompany =  await Company.findOne({_id: req.params.id})
    res.status(200).json(newCompany)
    console.log("success")
   }else{
       res.status(500).send("server error");
   }
    
 });


 //VERIFY COMPANY PASSWORD
 router.post("/getPassword", async(req,res) => {
   
    try {
    const company = await Company.findOne({ _id: req.body.id })
   const validPassword = await company.validatePassword(req.body.password, company.password);
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

// View All Companies
router.get('/viewAllCompanies', async(req,res) => {
    const allCompanies = await Company.find();
    res.json(allCompanies)
    console.log(allCompanies)
  })


 //DELETE COMPANY PROFILE
 router.delete("/deleteCompany/:id", async (req, res) => {

    
    const deleteOne = await Company.findByIdAndRemove({_id: req.params.id},req.body)
    console.log("company delete api hit")
    if(deleteOne){
        // const user = await Company.findById({_id: req.params.id})
        res.status(200).json({ "status" : "delete" });
        // console.log(user)
        console.log("---------------------delete user------------------------------------")
    }else{
        const user = await Company.findById({_id: req.params.id})
        res.status(403).json({ "user" : user })
        console.log(user)
        console.log("------------------------------not delete---------------------------")
    }
   
    
 });


module.exports = router;