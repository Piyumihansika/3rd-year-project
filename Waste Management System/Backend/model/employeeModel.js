const { Schema, model} = require('mongoose');
const bcrypt = require('bcryptjs');


const employeeSchema = new Schema({
    firstName: String,
    lastName: String,
    email: String,
    eusername: String,
    address: String,
    contactNumber: String,
    epassword: String,
    nicNo: String,
    driverlicenseNo: String
});

employeeSchema.methods.encryptPassword = async(epassword) => {
    const salt = await bcrypt.genSalt(10);
    return bcrypt.hash(epassword, salt);
};

employeeSchema.methods.validatePassword = function(epassword){
    return bcrypt.compare(epassword, this.epassword);
};

module.exports = model('Employee', employeeSchema);