import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final String apiUrl = "http://10.0.2.2:3000/forgot/sendEmail";

class Forgot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ForgotPassword Page'),
        backgroundColor: Colors.green,
      ),
      body: ForgotForm(),
    );
  }
}

class ForgotForm extends StatefulWidget {
  @override
  _ForgotFormState createState() => _ForgotFormState();
}

class _ForgotFormState extends State<ForgotForm> {
  //
  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Check Your Email '),
            actions: <Widget>[
              MaterialButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/login');
                },
              )
            ],
          );
        });
  }

// //email validater
//   bool validateEmail(String value) {
//     Pattern pattern =
//         r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//     RegExp regex = new RegExp(pattern);
//     return (!regex.hasMatch(value)) ? false : true;
//   }

  //
  final _formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();

  void emailpass(BuildContext context) async {
    final Map<String, dynamic> data = {
      "email": email.text,
    };
    print(email);

    var response = await http.post(apiUrl,
        body: data, encoding: Encoding.getByName("application/json"));
    if (response.statusCode == 200) {
      createAlertDialog(context);

      print(response.statusCode);
      print(response.body);
    } else {
      Navigator.of(context).pushNamed('/forgot');
      print(response.statusCode);
      print("error occured");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // add design
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
                                image: AssetImage("assets/images/forgot.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        // Padding(padding: EdgeInsets.only(left:10.5)),
                      ],
                    ),
                  ),
                  // Row(
                  //   children: <Widget>[
                  //     SizedBox(width: 14.0),
                  //     Container(
                  //       alignment: Alignment.topLeft,
                  //       height: 45.0,
                  //       width: 50.0,
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(30),
                  //           border: Border.all(
                  //               color: Colors.white,
                  //               style: BorderStyle.solid,
                  //               width: 2.0
                  //           ),
                  //           image: DecorationImage(
                  //             image: AssetImage('assets/images/logo.jpg'),
                  //           )
                  //       ),
                  //     )
                  //   ],
                  // ),
                  // SizedBox(height: 15.0),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 15.0),
                  //   child: Text(
                  //     'FORGOT PASSWORD',
                  //     style: TextStyle(
                  //         fontSize: 25.0,
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.black87),
                  //   ),
                  // ),

                  SizedBox(height: 35.0),
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
            ]),

            //
            SizedBox(height: 45.0),
            Container(
              alignment: Alignment.center,
            ),

            TextFormField(
              decoration: const InputDecoration(
                icon: const Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                //hintText: 'Type Your Email',
                labelText: 'Type Your Registered Email',
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),

                //: true,
              ),
              controller: email,
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter an Email ';
                } else {
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
                    // new RaisedButton(
                    //   child: const Text(
                    //     'Back',
                    //     style: TextStyle(fontSize: 18),
                    //   ),
                    //   color: Colors.yellow,
                    //   textColor: Colors.black,
                    //   onPressed: () {
                    //     Navigator.of(context).pushNamed('/login');
                    //   },
                    // ),
                    new RaisedButton(
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 18),
                      ),
                      color: Colors.green,
                      padding: const EdgeInsets.only(
                      left: 130.0, top: 10.0, bottom: 10.0, right: 130.0),
                      textColor: Colors.white,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          emailpass(context);
                        }
                      },
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ))
          ],
        ),
      ),
    );
  }
}
