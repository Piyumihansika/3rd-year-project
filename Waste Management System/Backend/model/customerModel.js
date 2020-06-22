const { Schema, model } = require('mongoose');
const bcrypt = require('bcryptjs');

const customerSchema = new Schema({
    firstName: String,
    lastName: String,
    email: String,
    contactNumber: String,
    password: String,
    address1: String,
    address2: String,
    city: String,
    district: String
});

customerSchema.methods.encryptPassword = async(password) => {
    const salt = await bcrypt.genSalt(10);
    return bcrypt.hash(password, salt);
};

customerSchema.methods.validatePassword = function(password){
    return bcrypt.compare(password, this.password);
};

module.exports = model('Customer', customerSchema);