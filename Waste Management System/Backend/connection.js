const mongoose = require('mongoose');

mongoose.connect("mongodb+srv://sachini:1234@greenwasteland-fr9bl.mongodb.net/greenWasteland?retryWrites=true&w=majority", {
    useNewUrlParser: true,  
    useUnifiedTopology: true,
    useCreateIndex: true
}).then(db => console.log('Connection establish successfully'));