const { Schema, model} = require('mongoose');

const finalbidSchema = new Schema({
    customerId: String,
    itemId: String,
    timeStamp: String,
    buyerId: String,
    maxBid: Number
  
});

module.exports = model('Final_Bid', finalbidSchema);