import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
//import 'package:intl/intl.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignForm(),
    );
  }
}

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {

  // Initially password is obscure
  bool _obscureText = true;

  final _formKey = GlobalKey<FormState>();

  //controller names

  final TextEditingController _confirmPass = TextEditingController();

//  TextEditingController firstnameController = TextEditingController();
//  TextEditingController lastnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,

      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

//          Container(
//            alignment: Alignment.center,
//            //padding: EdgeInsets.all(10),
//
//            child: Image(
//              alignment: Alignment(0.5, 0.5),
//              image: AssetImage('assets/images/logo.jpg'),
//
//            )
//            ,
//
//
//          ),
            //
            Stack(
                children: <Widget>[
                  Container(
                    height: 200.0,
                    width: double.infinity,
                    color: Colors.green,
                  ),
                  Positioned(
                    bottom: 55.0,
                    right: 100.0,
                    child: Container(
                      height: 350.0,
                      width: 350.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(320),
                          color: Colors.yellowAccent
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 100.0,
                    right: 130.0,
                    child: Container(
                      height: 290.0,
                      width: 300.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(320),
                          color: Colors.blueAccent
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 100.0,
                    right: 150.0,
                    child: Container(
                      height: 330.0,
                      width: 300.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(320),
                          color: Colors.yellow
                      ),
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
                    ],
                  ),
                ]
            ),
            //
            Container(
                alignment: Alignment.center,

                child: Text(
                  'Sign Up for your GreenWasteland Account',
                  style: TextStyle(fontSize:17, color: Colors.green,fontWeight: FontWeight.bold),
                )),







            Container(
              padding: EdgeInsets.all(10),
              child:
              TextFormField(
                scrollPadding: EdgeInsets.all(10),
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person,color: Colors.black),
                  hintText: 'Enter an user name',
                  labelText: 'User Name',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                ),
                controller: usernameController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),

            ),

            Container(
              padding: EdgeInsets.all(10),
              child:
              TextFormField(
                scrollPadding: EdgeInsets.all(10),
                decoration: const InputDecoration(
                  icon: const Icon(Icons.contacts,color: Colors.black),
                  hintText: 'Enter your address',
                  labelText: 'Address',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),

                ),
                controller: addressController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),

            Container(
              padding: EdgeInsets.all(10),
              child:
              TextFormField(
                scrollPadding: EdgeInsets.all(10),
                decoration: const InputDecoration(
                  icon: const Icon(Icons.phone,color: Colors.black),
                  hintText: 'Enter your phone number',
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),

                ),
                controller: phoneController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
              ),

            ),


            Container(
              padding: EdgeInsets.all(10),
              child:
              TextFormField(
                scrollPadding: EdgeInsets.all(10),
                decoration: const InputDecoration(
                  icon: const Icon(Icons.email,color: Colors.black,),
                  hintText: 'Enter Your Email',
                  labelText: 'Email',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),

                  //: true,

                ),
                controller: emailController,


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
            ),


            Container(
              padding: EdgeInsets.all(10),
              child:
              TextFormField(
                scrollPadding: EdgeInsets.all(10),
                decoration: const InputDecoration(
                  icon: const Icon(Icons.lock,color: Colors.black),
                  hintText: 'Enter a password',
                  labelText: 'Password',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),

                ),
                controller: passwordController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a strong password';
                  }
                  return null;
                },
                obscureText: _obscureText,
              ),
            ),

            Container(
              padding: EdgeInsets.all(10),
              child:
              TextFormField(
                scrollPadding: EdgeInsets.all(10),
                decoration: const InputDecoration(
                  icon: const Icon(Icons.lock,color: Colors.black),
                  hintText: 'Confirm your password',
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),

                ),
                controller: _confirmPass,
                validator: (val){
                  if(val.isEmpty)
                    return 'Please enter confirm password';
                  if(val != passwordController.text)
                    return 'Password is not match';
                  return null;
                },
                obscureText: _obscureText,
              ),
            ),

            //  terms and conditions...
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  FlatButton(
                    padding: const EdgeInsets.only(right: 120.0),


                    textColor: Colors.green,
                    child: Text('Our terms & conditions'
                    ),

                    onPressed: () {
                      //terms and condition page
                      Navigator.of(context).pushNamed('/terms');
                    },
                  ),
                  FormBuilderCheckbox(
                    initialValue: false,
                    label: Text(
                      "I have read and agree to the terms and conditions",
                      style: TextStyle(color: Colors.black87),),
                    validators: [
                      FormBuilderValidators.requiredTrue(
                        errorText:
                        "You must accept terms and conditions to continue",
                      ),
                    ],
                  ),

                ],
              ),
            ),


            new Container(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                      child: const Text('BACK'),
                      color: Colors.yellow,
                      textColor: Colors.black,

                      onPressed: (){
                        Navigator.of(context).pushNamed('/login');
                      },
                    ),

                    RaisedButton(
                      child: const Text('SIGN UP'),
                      color: Colors.green,
                      textColor: Colors.white,

                      onPressed: () {

                        if (_formKey.currentState.validate()) {
//                    print(firstnameController.text);
//                    print(lastnameController.text);
                          print(usernameController.text);
                          print(addressController.text);
                          print(phoneController.text);
                          print(emailController.text);
                          print(passwordController.text);
                          print( _confirmPass.text);

                          Navigator.of(context).pushNamed('/login');

//                        Scaffold
//                            .of(context)
//                            .showSnackBar(SnackBar(content: Text('Sending Data'),backgroundColor: Colors.green,));

                        }
                      },
                    ),

                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )

            ),
          ],
        ),
      ),
    );
  }
}