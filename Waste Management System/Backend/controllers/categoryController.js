const { Router } = require('express');
const router = Router();
const express = require('express');
const app = express();
// const { route } = require('./authController');
var bodyParser = require('body-parser');
const multer = require('multer');
app.use(bodyParser.json({limit:'50mb'})); 
app.use(bodyParser.urlencoded({extended:true, limit:'50mb'}));

const storage = multer.diskStorage({
    destination: function(req, file, cb) {
        cb(null, './uploads/');
    },
    filename (req, file, cb){
        cb(null, new Date().toISOString().replace(/:/g, '-') + file.originalname);
    }
})

const upload = multer({ storage: storage,
    limits: {
        fileSize: '50mb'
    }
});

const Category = require('../model/categoryModel')


router.post("/addCategory",  upload.single('categoryImage'),(req, res, next) => {
   
   
    try {
        console.log(req.file);
        const category = new Category({
            categoryName: req.body.categoryName,
            unitPrice: req.body.unitPrice,
            categoryImage: req.file.path

        });
        
        category.save();
        console.log("image api hit")
        res.status(201).json({ 'category': category });
    }catch(err){
        res.status(500).json({ error : err });
    }

})

module.exports = router;