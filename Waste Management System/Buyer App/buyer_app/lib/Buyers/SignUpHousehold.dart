import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:buyerapp/HouseholdLocation/GetLocation.dart';

class SignUpHousehold extends StatefulWidget {
  @override
  _SignUpHouseholdState createState() => _SignUpHouseholdState();
}

class _SignUpHouseholdState extends State<SignUpHousehold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pushNamed('/usertype'),
        ),
        title: Text(
          "SignUp Page",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: SignHouseholdForm(),
    );
  }
}

class SignHouseholdForm extends StatefulWidget {
  @override
  _SignHouseholdFormState createState() => _SignHouseholdFormState();
}

class _SignHouseholdFormState extends State<SignHouseholdForm> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController contactNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  // Initially password is obscure
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // my design using positioned
            Stack(children: <Widget>[
              Container(
                  height: 200.0, width: double.infinity, color: Colors.white),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20.0),
                  Container(
                    alignment: Alignment(-0.1, 1),
                    child: Column(
                      children: <Widget>[
                        new GestureDetector(
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage("assets/images/signup.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        // Padding(padding: EdgeInsets.only(left:10.5)),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      'Sign Up for your GreenWasteland Account',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ),
                ],
              ),
            ]),
            //
            Container(
              alignment: Alignment.center,
            ),

            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: firstName,
                scrollPadding: EdgeInsets.all(10),
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person, color: Colors.black),
                  hintText: 'Enter first name',
                  labelText: 'First Name',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
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
              child: TextFormField(
                controller: lastName,
                scrollPadding: EdgeInsets.all(10),
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person, color: Colors.black),
                  hintText: 'Enter your lastname',
                  labelText: 'Last Name',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
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
              child: TextFormField(
                controller: contactNumber,
                scrollPadding: EdgeInsets.all(10),
                decoration: const InputDecoration(
                  icon: const Icon(Icons.phone, color: Colors.black),
                  hintText: 'Enter your phone number',
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                // validator: (value) {
                //   if (value.isEmpty) {
                //     return 'Please enter a your phone number';
                //   }
                //   return null;
                // },

                validator: (value) {
                  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                  RegExp regExp = new RegExp(pattern);
                  if (value.length == 0) {
                    return 'Please enter mobile number';
                  } else if (!regExp.hasMatch(value)) {
                    return 'Please enter valid mobile number';
                  }
                  return null;
                },
              ),
            ),

            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: email,
                scrollPadding: EdgeInsets.all(10),
                decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.email,
                    color: Colors.black,
                  ),
                  hintText: 'Enter Your Email',
                  labelText: 'Email',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter an Email ';
                  } else {
                    bool temp = (EmailValidator.validate(value));
                    if (temp) {
                      return null;
                    }
                    return 'Please enter a valid Email ';
                  }
                },
                // validator: (value) {
                //   Pattern pattern =
                //       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                //   RegExp regex = new RegExp(pattern);
                //   return (!regex.hasMatch(value)) ? "check your email" : null;
                // }
              ),
            ),

            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: password,
                scrollPadding: EdgeInsets.all(10),
                decoration: const InputDecoration(
                  icon: const Icon(Icons.lock, color: Colors.black),
                  hintText: 'Enter a password',
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                // validator: (value) {
                //   if (value.isEmpty) {
                //     return 'Please enter a strong password';
                //   }
                //   return null;
                // },
                validator: (value) {
                  Pattern pattern =
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                  RegExp regex = new RegExp(pattern);
                  print(value);
                  if (value.isEmpty) {
                    return 'Please enter password';
                  } else {
                    if (!regex.hasMatch(value))
                      return 'Enter Strong password (include lower,upper,number, & symbol)';
                    else
                      return null;
                  }
                },
                obscureText: _obscureText,
              ),
            ),

            // Container(
            //   padding: EdgeInsets.all(10),
            //   child:
            //   TextFormField(
            //     scrollPadding: EdgeInsets.all(10),
            //     decoration: const InputDecoration(
            //       icon: const Icon(Icons.lock,color: Colors.black),
            //       hintText: 'Confirm your password',
            //       labelText: 'Confirm Password',
            //       labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),

            //     ),
            //     onChanged: (text){
            //       confirmpass= text;
            //     },
            //     //controller: _confirmPass,
            //     validator: (value){
            //       if(value.isEmpty)
            //         return 'Please enter confirm password';
            //       else{
            //         if(value != password)
            //           return 'Password is not match';
            //         else
            //           return null;
            //       }
            //     },
            //     obscureText: _obscureText,
            //   ),
            // ),

            new Container(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                      child: const Text(
                        'Next',
                        style: TextStyle(fontSize: 18),
                      ),
                      color: Colors.green,
                      textColor: Colors.white,
                      padding: const EdgeInsets.only(
                          left: 130.0, top: 10.0, bottom: 10.0, right: 130.0),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => GetLocation(
                                firstName: firstName.text,
                                lastName: lastName.text,
                                contactNumber: contactNumber.text,
                                email: email.text,
                                password: password.text),
                          ));
                        }
                      },
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )),
          ],
        ),
      ),
    );
  }
}
