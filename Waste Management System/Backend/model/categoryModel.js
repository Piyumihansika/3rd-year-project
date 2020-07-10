const { Schema, model} = require('mongoose');
const bcrypt = require('bcryptjs');

const categorySchema = new Schema({
  categoryName: String,
  unitPrice: Number,
  categoryImage: String
  
});

module.exports = model('Category', categorySchema);