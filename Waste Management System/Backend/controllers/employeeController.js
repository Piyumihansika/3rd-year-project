const {Router} = require('express');
const router = Router();

//const Employee = require('../model/employeeModel');

router.get('/viewemployee', (req, res) => {
    db.collection('employees').find().toArray()
      .then(results => {
        console.log(results)
      })
      .catch(error => console.error(error))
    // ...
  })


module.exports = router;