var expess = require("express");
var bodyParser = require("body-parser");
var fs = require("fs");
var app = expess();
const { Router } = require('express');
const router = Router();
const Item = require('../model/itemModel');
const { Mongoose } = require("mongoose");

app.use(bodyParser.urlencoded({ extended: true, limit: "1gb" }));

router.post("/addItem", function (req, res) {


 
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
        customerId:req.body.id,

      });
      item.save();
      res.status(201).json({ "item": item });
      console.log("image upload" + item);
    }


  });

});


// VIEW ITEMS
router.get('/viewItem/:item', async (req,res) => {
  const item = await Item.find({category: req.params.item});
  res.json({"item" : item})
  // console.log(item);
})

module.exports = router;