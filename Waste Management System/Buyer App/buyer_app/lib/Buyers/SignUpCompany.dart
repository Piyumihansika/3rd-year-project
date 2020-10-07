import 'package:flutter/material.dart';
//import 'package:passwordfield/passwordfield.dart';
import 'package:email_validator/email_validator.dart';
//import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:buyerapp/CompanyLocation/GetLocationCompany.dart';
//import 'package:intl/intl.dart';

class SignUpCompany extends StatefulWidget {
  @override
  _SignUpCompanyState createState() => _SignUpCompanyState();
}

class _SignUpCompanyState extends State<SignUpCompany> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp Page'),
        backgroundColor: Colors.green,
      ),
      body: SignCompanyForm(),
    );
  }
}

class SignCompanyForm extends StatefulWidget {
  @override
  _SignCompanyFormState createState() => _SignCompanyFormState();
}

class _SignCompanyFormState extends State<SignCompanyForm> {
  TextEditingController companyName = TextEditingController();
  TextEditingController contactpersonName = TextEditingController();
  TextEditingController contactpersonNumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController email = TextEditingController();

  // Initially password is obscure
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();

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
                height: 200.0,
                width: double.infinity,
                color: Colors.white,
              ),
              
             
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
                controller: companyName,
                scrollPadding: EdgeInsets.all(10),
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person, color: Colors.black),
                  hintText: 'Enter company name',
                  labelText: 'Company Name',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your company name';
                  }
                  return null;
                },
              ),
            ),

            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: contactpersonName,
                scrollPadding: EdgeInsets.all(10),
                decoration: const InputDecoration(
                  icon: const Icon(Icons.contacts, color: Colors.black),
                  hintText: 'Enter your Contact Person Name',
                  labelText: 'Contact Person Name',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your Contact Person Name';
                  }
                  return null;
                },
              ),
            ),

            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: contactpersonNumber,
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

                  //: true,
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
            //   child: TextFormField(
            //     scrollPadding: EdgeInsets.all(10),
            //     decoration: const InputDecoration(
            //       icon: const Icon(Icons.lock, color: Colors.black),
            //       hintText: 'Confirm your password',
            //       labelText: 'Confirm Password',
            //       labelStyle: TextStyle(
            //           fontWeight: FontWeight.bold, color: Colors.black),
            //     ),
            //     validator: (val) {
            //       if (val.isEmpty) return 'Please enter confirm password';
            //       // ignore: unrelated_type_equality_checks
            //       if (val != password) return 'Password is not match';
            //       return null;
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
                            builder: (context) => GetLocationCompany(
                                companyName: companyName.text,
                                contactpersonName: contactpersonName.text,
                                contactpersonNumber: contactpersonNumber.text,
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
