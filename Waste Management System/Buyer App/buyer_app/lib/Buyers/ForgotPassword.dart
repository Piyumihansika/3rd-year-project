import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart' show EmailValidator;
//import 'package:passwordfield/passwordfield.dart';

class Forgot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ForgotPassword Page'),
        backgroundColor: Colors.green,),
      body:ForgotForm(),

    );
  }
}
class ForgotForm extends StatefulWidget {
  @override
  _ForgotFormState createState() => _ForgotFormState();
}

class _ForgotFormState extends State<ForgotForm> {

  //
  createAlertDialog(BuildContext context){
    return showDialog(context: context,builder: (context){
      return AlertDialog(
        title: Text('Check Your Email '),

        actions: <Widget>[
          MaterialButton(
            child: Text('OK'),
            onPressed: (){
              Navigator.of(context).pushNamed('/login');
            },
          )
        ],
      );
    });
  }

//email validater
  bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  //
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[

            // add design
            Stack(
                children: <Widget>[
                  Container(
                    height: 200.0,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                  Positioned(
                bottom: 40.0,
                right: 80.0,
                child: Container(
                  height: 350.0,
                  width: 350.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(320),
                      color: Colors.yellowAccent),
                ),
              ),
              Positioned(
                bottom: 50.0,
                right: 130.0,
                child: Container(
                  height: 290.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(320),
                      color: Colors.green[100]),
                ),
              ),
             
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 14.0),
                      Row(
                        children: <Widget>[
                          SizedBox(width: 14.0),
                          Container(
                            alignment: Alignment.topLeft,
                            height: 45.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width: 2.0
                                ),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/logo.jpg'),
                                )
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          'FORGOT PASSWORD',
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                      ),

                      SizedBox(height: 45.0),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Forgot Your Password ?',
                          style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ]
            ),

            //
            SizedBox(height: 45.0),
            Container(
              alignment: Alignment.center,
            ),

            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(Icons.person,color: Colors.black,),
                //hintText: 'Type Your Email',
                labelText: 'Type Your Email',
                labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),

                //: true,

              ),
              controller: usernameController,


              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter an Email ';
                }  else{
                  assert(EmailValidator.validate(value));
                  return 'Please enter a valid Email ';
                }
                //return null;
              },




            ),


            Container(

                padding: const EdgeInsets.only(top: 40.0),
                child: Row(
                  children: <Widget>[
                    new RaisedButton(
                      child: const Text('Back',style: TextStyle(fontSize: 18),),
                      color: Colors.yellow,
                      textColor: Colors.black,

                      onPressed: (){
                        Navigator.of(context).pushNamed('/login');
                      },
                    ),

                    new RaisedButton(
                      child: const Text('Submit',style: TextStyle(fontSize: 18),),
                      color: Colors.green,
                      textColor: Colors.white,

                      onPressed: () {

                        if (_formKey.currentState.validate()) {
                          print(usernameController.text);
                          createAlertDialog(context);
                        }
                      },
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )

            )
          ],
        ),
      ),

    );
  }
}