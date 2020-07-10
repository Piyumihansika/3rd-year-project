const { Router } = require('express');
const { route } = require('./authController');
const router = Router();
const multer = require('multer');

const storage = multer.diskStorage({
    destination: function(req, file, cb) {
        cb(null, './uploads/');
    },
    filename (req, file, cb){
        cb(null, new Date().toISOString().replace(/:/g, '-') + file.originalname);
    }
})

const upload = multer({ storage: storage });

const Category = require('../model/categoryModel')

router.post("/addCategory", upload.single('categoryImage'),(req, res, next) => {
    // console.log(req.file);
    try {
        const category = new Category({
            categoryName: req.body.categoryName,
            unitPrice: req.body.unitPrice,
            categoryImage: req.file.path

        });
        category.save();
        res.status(201).json({ 'category': category });
    }catch(err){
        res.status(500).json({ error : err });
    }

})





module.exports = router;