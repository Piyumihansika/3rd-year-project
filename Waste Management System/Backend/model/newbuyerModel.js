const { Schema, model } = require('mongoose');


const buyerRequestSchema = new Schema({
    companyName:String,
    contactpersonName:String,
    address:String,
    email:String,
    contactNumber:Number,
    comment:String
});

module.exports = model('buyerRequest', buyerRequestSchema);