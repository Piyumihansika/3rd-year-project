const mongoose = require("mongoose");

//create location
const GeoSchema = new mongoose.Schema({
    type : {
        type : String,
        default : "Point"
    },
    coordinates : {
        type : [Number],
        index: "2dsphere"
    }
})

var UserSchema = new mongoose.Schema({
    firstName : {
        type : String,
        required : "Required"
    },
    userId : {
        type : String
    },
    userName : {
        type : String
    },
    geometry : GeoSchema

});

mongoose.model("User", UserSchema)