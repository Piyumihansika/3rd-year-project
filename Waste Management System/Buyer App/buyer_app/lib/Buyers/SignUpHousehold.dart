import 'package:flutter/material.dart';
//import 'package:passwordfield/passwordfield.dart';
import 'package:email_validator/email_validator.dart';
//import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:buyerapp/HouseholdLocation/GetLocation.dart';
//import 'package:intl/intl.dart';


class SignUpHousehold extends StatefulWidget {
  @override
  _SignUpHouseholdState createState() => _SignUpHouseholdState();
}

class _SignUpHouseholdState extends State<SignUpHousehold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SignUp Page'),
        backgroundColor: Colors.green,),
      body: SignHouseholdForm(),

    );
  }
}

class SignHouseholdForm extends StatefulWidget {
  @override
  _SignHouseholdFormState createState() => _SignHouseholdFormState();
}

class _SignHouseholdFormState extends State<SignHouseholdForm> {

  // Initially password is obscure
  bool _obscureText = true;

  final _formKey = GlobalKey<FormState>();

  //controller names

//  final TextEditingController _confirmPass = TextEditingController();
//
//  TextEditingController usernameController = TextEditingController();
//  TextEditingController addressController = TextEditingController();
//  TextEditingController phoneController = TextEditingController();
//  TextEditingController emailController = TextEditingController();
//  TextEditingController passwordController = TextEditingController();

  String firstname;
  String lastname;
  String contactNumber;
  String password;
  String confirmpass;
  String email;


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,

      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

            // my design using positioned
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
                      SizedBox(height: 15.0),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          'SIGN UP',
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
                          'Sign Up for your GreenWasteland Account',
                          style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ]
            ),
            //
            Container(
              alignment: Alignment.center,
            ),

            Container(
              padding: EdgeInsets.all(10),
              child:
              TextFormField(
                scrollPadding: EdgeInsets.all(10),
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person,color: Colors.black),
                  hintText: 'Enter first name',
                  labelText: 'First Name',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                ),

                onChanged: (text){
                  firstname= text;
                },
                //controller: usernameController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your firstname';
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
                  hintText: 'Enter your lastname',
                  labelText: 'Last Name',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),

                ),
                onChanged: (text){
                  lastname= text;
                },
                // controller: addressController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your lastname';
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
                onChanged: (text){
                  contactNumber= text;
                },
                //controller: phoneController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a your phone number';
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
                onChanged: (text){
                  email= text;
                },
                //controller: emailController,


                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter an Email ';
                  }
                  else {
                    bool temp = (EmailValidator.validate(value));
                    if(temp){
                      return null;
                    }
                    return 'Please enter a valid Email ';
                  }

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
                onChanged: (text){
                  password= text;
                },
                //controller: passwordController,
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
                onChanged: (text){
                  confirmpass= text;
                },
                //controller: _confirmPass,
                validator: (val){
                  if(val.isEmpty)
                    return 'Please enter confirm password';
                  if(val != password)
                    return 'Password is not match';
                  return null;
                },
                obscureText: _obscureText,
              ),
            ),


            new Container(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                      child: const Text('Next'),
                      color: Colors.green,
                      textColor: Colors.white,

                      onPressed: () {

                        if (_formKey.currentState.validate()) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>GetLocation(
                                firstname:firstname ,
                                lastname:lastname,
                                contactNumber:contactNumber,
                                email:email,
                                password:password,
                                confirmpass:confirmpass

                            ),

                          ));


//                          print(usernameController.text);
//                          print(addressController.text);
//                          print(phoneController.text);
//                          print(emailController.text);
//                          print(passwordController.text);
//                          print( _confirmPass.text);
//
//                          Navigator.of(context).pushNamed('/getlocation');

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

