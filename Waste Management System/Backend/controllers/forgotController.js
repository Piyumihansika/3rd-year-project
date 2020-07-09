var nodemailer = require('nodemailer');

var transporter = nodemailer.createTransport({

    service :'gmail',
    auth:{
        user:'greenwasland@gmail.com',
        pass:'Green@123'
    }
});
var mailOption ={

    from:'greenwasland@gmail.com',
    to:'piyumihansi02@gmail.com',
    subject:'Reset Your password',
    text:'Hi'


}
transporter.sendMail(mailOption,function(error,info){

    if(error){
        console.log('error');
    }
    else{
        console.log('Email sent : ' + info.response);
    }


});
