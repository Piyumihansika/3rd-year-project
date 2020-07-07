const { Schema, model} = require('mongoose');
const bcrypt = require('bcryptjs');

const companySchema = new Schema({
    companyName: String,
    contactpersonName : String,
    contactpersonNumber : String,
    email : String,
    password : String,
    address1 : String,
    address2 : String,
    city : String,
    district : String
});

companySchema.methods.encryptPassword = async(password) => {
    const salt = await bcrypt.genSalt(10);
    return bcrypt.hash(password, salt);
};

companySchema.methods.validatePassword = function(password){
    return bcrypt.compare(password, this.password);
};

module.exports = model('Company', companySchema);