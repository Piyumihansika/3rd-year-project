var expess = require("express");
var bodyParser = require("body-parser");
var fs = require("fs");
var app = expess();
const {Router} = require('express');
const router = Router();


app.use(bodyParser.urlencoded({ extended: true, limit: "1gb" }));
router.post("/image", function(req, res){
  var name = req.body.name;
  var img = req.body.image;
  var realFile = Buffer.from(img,"base64");
  fs.writeFile(name, realFile, function(err) {
      if(err)
         console.log(err);
   });
   res.send("OK");
 });

// app.listen(3000);
module.exports = router;