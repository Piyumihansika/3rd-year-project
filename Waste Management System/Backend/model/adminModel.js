const { Schema, model} = require('mongoose');
const bcrypt = require('bcryptjs');


const adminSchema = new Schema({
    
    adminName: String,
    adminemail: String,
    admincontactNumber: String,
    adminpassword: String
   
});

adminSchema.methods.encryptPassword = async(adminpassword) => {
    const salt = await bcrypt.genSalt(10);
    return bcrypt.hash(adminpassword, salt);
};

adminSchema.methods.validatePassword = function(adminpassword){
    return bcrypt.compare(adminpassword, this.adminpassword);
};

module.exports = model('Admin', adminSchema);