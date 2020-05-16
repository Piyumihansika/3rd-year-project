const { Schema, model} = require('mongoose');
const bcrypt = require('bcryptjs');

// const buyerSchema = new Schema({
//     firstName: String,
//     lastName: String,
//     email: String,
//     busername: String,
//     compnayaddress: String,
//     contactNumber: String,
//     bpassword: String
// });

// buyerSchema.methods.encryptPassword = async(bpassword) => {
//     const salt = await bcrypt.genSalt(10);
//     return bcrypt.hash(bpassword, salt);
// };

// buyerSchema.methods.validatePassword = function(bpassword){
//     return bcrypt.compare(bpassword, this.bpassword);
// const { Schema, model } = require('mongoose');
// const bcrypt = require('bcryptjs');

const buyerSchema = new Schema({
    companyName:String,
    address:String,
    email:String,
    landNumber:Number,
    mobileNumber:Number,
    registrationNumber:String,
    password:String,
});

buyerSchema.methods.encryptPassword = async(password) => {
    const salt = await bcrypt.genSalt(10);
    return bcrypt.hash(password, salt);
};

buyerSchema.methods.validatePassword = function(password){
    return bcrypt.compare(password, this.password);
};

module.exports = model('Buyer', buyerSchema);