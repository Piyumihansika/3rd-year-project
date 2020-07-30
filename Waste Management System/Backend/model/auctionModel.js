const { Schema, model} = require('mongoose');

const auctionSchema = new Schema({
  customerId: String,
  itemId: String,
  biddingTime: String,
  buyerId: String,
  bidValue: Number
  
});

module.exports = model('Auction', auctionSchema);