const express = require("express");
const mongoose = require("mongoose");

const router = express.Router();
const UserModel = mongoose.model("User");

router.post("/add", (req, res)=> {

    // console.log(req.body);
    // res.send({type : "POST"})
    var user = new UserModel();
    user.firstName = req.body.firstName;
    user.userId = req.body.userId;
    user.userName = req.body.userName;
    user.geometry = req.body.geometry;
    user.save((err, doc)=> {
        if(!err){
            // console.log(req.body);
            res.send(doc)
        }else{
           
            res.send(err)
        }
    });
})

router.get("/list", (req, res)=> {

    UserModel.find((err, docs) =>{
        if(!err){
            // console.log(docs);
            res.send(docs)
        }
        else{
            res.send("error")
        }
    })    
})

router.get("/nearuser", (req, res) => {
    UserModel.aggregate([{
        $geoNear: {
            near: {
                type : "Point", 
                coordinates:[parseFloat(req.query.lng), parseFloat(req.query.lat)]
        },
            distanceField: "dist.calculated",
            maxDistance: 100000, 
            // query: { category: "Parks" },
            // includeLocs: "dist.location",
            spherical: true
        }

    }
]).then((doc) => {
        res.send(doc);
    })
})

router.put("/update/:id", (req, res) => {
    UserModel.findByIdAndUpdate({_id: req.params.id}, req.body)
    .then(() =>{
        UserModel.findOne({_id: req.params.id})
        .then((doc) => {
            res.send(doc)
        });
    });
});

router.delete("/delete/:id", (req, res) => {
    UserModel.findByIdAndRemove({_id: req.params.id})
    .then((doc) => {
        res.send(doc)
    });
});

module.exports = router; 