const {Router} = require('express');
const router = Router();

const Employee = require('../model/employeeModel');
const Buyer = require('../model/buyerModel');
const verifyToken = require('./verifyToken');

const jwt = require('jsonwebtoken');
const config = require('../config');

router.post('/addemployee', async(req, res) => {
    try{
        const {firstName,lastName,email,eusername,address,contactNumber,epassword,nicNo,driverlicenseNo} = req.body;

        const employee = new Employee({
            firstName,
            lastName,
            email,
            eusername,
            address,
            contactNumber,
            epassword,
            nicNo,
            driverlicenseNo
        });
        employee.epassword = await employee.encryptPassword(epassword);
        

        await employee.save();

        // const token = jwt.sign({ id: user.id}, config.secret, {
        //     expiresIn: "24h"
        // });
       // res.status(200).json({ auth: true, token})

    }catch(e){
        console.log(e);
        res.status(500).send('something went wrong ');

    }
});


//ADD A NEW BUYER
router.post('/addbuyer', async(req, res) => {
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


module.exports = router;