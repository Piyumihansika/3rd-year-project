const { Schema, model} = require('mongoose');

const finalBidSchema = new Schema({
 customerId : String,
 itemId : String,
 biddingTime : String,
 buyerId : String,
 bidValue : Number 
  
});

module.exports = model('FinalBid', finalBidSchema);