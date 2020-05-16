const {Router} = require('express');
const router = Router();

const Employee = require('../model/employeeModel');
const Buyer = require('../model/buyerModel');
//const verifyToken = require('./verifyToken');

//const jwt = require('jsonwebtoken');
//const config = require('../config');

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
        res.status(500).send('something went wrong 🤔');

    }
});

router.post('/addbuyer', async(req, res) => {
    try{
        const {firstName,lastName,email,busername,companyaddress,contactNumber,bpassword} = req.body;

        const buyer = new Buyer({
            firstName,
            lastName,
            email,
            busername,
            companyaddress,
            contactNumber,
            bpassword
        });

        buyer.epassword = await buyer.encryptPassword(epassword);
        await buyer.save();

        // const token = jwt.sign({ id: user.id}, config.secret, {
        //     expiresIn: "24h"
        // });
       // res.status(200).json({ auth: true, token})

    }catch(e){
        console.log(e);
        res.status(500).send('something went wrong 🤔');

    }
});


module.exports = router;