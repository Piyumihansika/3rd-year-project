const { Schema, model} = require('mongoose');

const itemSchema = new Schema({
  category: String,
  duration: String,
  description: String,
  price: Number,
  itemImage: String,
  customerId: String,
  state: String
  
});

module.exports = model('Item', itemSchema);