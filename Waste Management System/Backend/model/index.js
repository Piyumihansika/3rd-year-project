const mongoose = require("mongoose");

mongoose.set('useCreateIndex', true)
mongoose.connect("mongodb://localhost:27017/waste", { useNewUrlParser: true,  useUnifiedTopology: true  }, (error)=>{
    if(!error){
        console.log("Success connected");
    }else{
        console.log("error connecting to database");
    }
});

const User = require("./user.model");