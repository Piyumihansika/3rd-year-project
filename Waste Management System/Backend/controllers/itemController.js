var expess = require("express");
var bodyParser = require("body-parser");
var fs = require("fs");
var app = expess();
var route = require("path");
const { Router } = require('express');
const router = Router();
const Item = require('../model/itemModel');
const { Mongoose } = require("mongoose");
var cors = require('cors')
const { runInContext } = require("vm");

app.use(bodyParser.urlencoded({ extended: true, limit: "1gb" }));

router.post("/addItem", function (req, res) {

console.log("item api")
 
var name = req.body.name;
var img = req.body.image;
var realFile = Buffer.from(img, "base64")
var path = './uploads/'+ new Date().toISOString().replace(/:/g, '-') + name


  // console.log(upload.storage);

  fs.writeFile(path , realFile,
    function (err) {
    if (err) {
      console.log(err);
    } 
    else {
      const item = new Item({

        category: req.body.category,
        description: req.body.description,
        price: req.body.price,
        duration: req.body.duration,
        startDate:req.body.startDate,
        finishDate:req.body.finishDate,
        itemImage: path,
        customerId:req.body.customerId,

      });
      item.save();
      res.status(200).json({ "item": item });
      console.log("image upload" + item);
    }


  });

});

//pass all items details



// VIEW ITEMS
router.get('/viewItem/:item', async (req,res) => {

  const item = await Item.find({category: req.params.item})
  // item.itemImage = fs.readFileSync('./uploads/'+item.itemImage , {encoding: 'base64'})
  // const newList = 
  res.json({"item" : item})
  // console.log(item);
})

//view image
router.get('/viewImage/:id', async(req,res)=> {
  const item = await Item.find({_id: req.params.id});
  const data = fs.readFileSync('./uploads/'+item[0].itemImage , {encoding: 'base64'})
  res.json(data);
 
})

router.get('/viewAllItems', async(req,res) => {
  const item = await Item.find();
  res.json(item)
})

module.exports = router;