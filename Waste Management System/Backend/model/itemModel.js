const { Schema, model} = require('mongoose');

const itemSchema = new Schema({
  category: String,
  duration: String,
  description: String,
  price: Number,
  startDate:String,
  finishDate:String,
  itemImage: String,
  customerId: String,
  state: String,
  bidCount: Number,
  
});

module.exports = model('Item', itemSchema);