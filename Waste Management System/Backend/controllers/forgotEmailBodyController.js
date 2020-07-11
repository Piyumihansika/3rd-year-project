const { Router } = require('express');
const router = Router();
var nodemailer = require('nodemailer');

router.post('/sendEmail', async (req, res) => {

    try {

        var email = req.body.email;

        var transporter = nodemailer.createTransport({

            service: 'gmail',
            auth: {
                user: 'greenwasland@gmail.com',
                pass: 'Green@123'
            }
        });
        var mailOption = {

            from: 'greenwasland@gmail.com',
            to: email,
            subject: 'Reset Your password',
            // text:'Hi'
            html: '<!DOCTYPE html>' +
                '<html><head>' +
                '</head><body><div>' +
                '<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQ3lORjBnvs68b4kTtxL9GqsTjUG-4yVrDrqA&usqp=CAU" alt="" width="160">' +
                '<h4>Password Reset</h4>' +
                '<p>Seems like you forgot password for GreenWasland.If this is true,click below to reset your password. </p>' +
                '<button type="button" onclick=" " style="background-color:green;color:white;width:150px;height:40px">Reset Password</button>' +


                '<p>If you did not forgot your password you can safely ignore this email.</p>' +
                '</div></body></html>'



        }
        transporter.sendMail(mailOption, function (error, info) {

            if (error) {
                console.log('error');
            }
            else {
                console.log('Email sent : ' + info.response);
            }

        });

    } catch (e) {

    }
})


module.exports = router;