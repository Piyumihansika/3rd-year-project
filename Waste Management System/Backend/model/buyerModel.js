const { Schema, model} = require('mongoose');
const bcrypt = require('bcryptjs');

const buyerSchema = new Schema({
    firstName: String,
    lastName : String,
    contactNumber : String,
    email : String,
    password : String,
    address1 : String,
    address2 : String,
    city : String,
    district : String
});

buyerSchema.methods.encryptPassword = async(password) => {
    const salt = await bcrypt.genSalt(10);
    return bcrypt.hash(password, salt);
    
};

buyerSchema.methods.validatePassword = function(password){
    return bcrypt.compare(password, this.password);
};

module.exports = model('Buyer', buyerSchema);