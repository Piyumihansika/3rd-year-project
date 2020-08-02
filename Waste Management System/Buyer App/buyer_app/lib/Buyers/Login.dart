import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
// import 'package:buyerapp/Models/loginModel.dart';
//import 'package:passwordfield/passwordfield.dart';
import 'package:buyerapp/utils/ResponseData.dart';

final String apiUrl = "http://10.0.2.2:3000/auth/buyerLogin";

String newAuth = ResponseData.auth;

String userId,
    firstName,
    lastName,
    email,
    contactNumber,
    address1,
    address2,
    city,
    district;
var id, value;

class Login extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Login> {
  // void loadHome(BuildContext context) async {
  //   print("-------------------------------auth--------------------------");
  //   print(newAuth);
  //   print("--------------------------------------------------------------");
  //   if (newAuth == false) {
  //     Navigator.of(context).pushNamed('/login');
  //   } else {
  //     Navigator.of(context).pushNamed('/buyerhome');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Green wasteland'),
        backgroundColor: Colors.green,
      ),
      body: LoginForm(),
      //add drawer to the app
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Buyer App',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),

            //add logo
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
                              width: 2.0),
                          image: DecorationImage(
                            image: AssetImage('assets/images/logo.jpg'),
                          )),
                    )
                  ],
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.event_note),
              title: Text('About Us'),
              onTap: () {
                Navigator.of(context).pushNamed('/aboutus');
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text('Contact Us'),
              onTap: () {
                Navigator.of(context).pushNamed('/contactus');
              },
            ),
            ListTile(
              leading: Icon(Icons.event_note),
              title: Text('notificationtemp'),
              onTap: () {
                Navigator.of(context).pushNamed('/notifications');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

//unregister error alerts
unregistererrordialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Error",
            style: TextStyle(
                fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          content: Text(
            "Invalid Login",
            style: TextStyle(
                fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
          ),
        );
      });
}

//invalid username or password error
invaliderrordialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Error",
            style: TextStyle(
                fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          content: Text(
            "Invalid Email or Password!Login Failed",
            style: TextStyle(
                fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
          ),
        );
      });
}

//login successful messege
loginsuccessdialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Success",
            style: TextStyle(
                fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold),
          ),
          content: Text(
            "Congradulatios! You are Login successfully",
            style: TextStyle(
                fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold),
          ),
        );
      });
}

class _LoginFormState extends State<LoginForm> {
  // Initially password is obscure
  bool _obscureText = true;
  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void login(BuildContext context) async {
    final Map<String, dynamic> data = {
      "email": email.text.toLowerCase(),
      "password": password.text,
    };
    var response = await http.post(apiUrl,
        body: data, encoding: Encoding.getByName("application/json"));
    if (response.statusCode == 200) {
      value = json.decode(response.body);
      id = (value["id"].toString());

      if (id == null) {
        Navigator.of(context).pushNamed('/login');
        unregistererrordialog(context);
      } else {
        print(
            "----------------------------------------------Login----------------------------------------------------");
        if ((value["userName"].toString() == "Company")) {
          ResponseData.userId = id;
          ResponseData.firstName = (value["user"]["companyName"].toString());
          ResponseData.lastName = "Company";
          ResponseData.contactpersonName =
              (value["user"]["contactpersonName".toString()]);
          ResponseData.email = (value["user"]["email"].toString());
          ResponseData.contactNumber =
              (value["user"]["contactpersonNumber"].toString());
          ResponseData.address1 = (value["user"]["address1"].toString());
          ResponseData.address2 = (value["user"]["address2"].toString());
          ResponseData.city = (value["user"]["city"].toString());
          ResponseData.district = (value["user"]["district"].toString());
          ResponseData.username = (value["userName"].toString());
          Navigator.of(context).pushNamed('/buyerhome');
          loginsuccessdialog(context);
        } else {
          ResponseData.userId = id;
          ResponseData.firstName = (value["user"]["firstName"].toString());
          ResponseData.lastName = (value["user"]["lastName"].toString());
          ResponseData.email = (value["user"]["email"].toString());
          ResponseData.contactNumber =
              (value["user"]["contactNumber"].toString());
          ResponseData.address1 = (value["user"]["address1"].toString());
          ResponseData.address2 = (value["user"]["address2"].toString());
          ResponseData.city = (value["user"]["city"].toString());
          ResponseData.district = (value["user"]["district"].toString());
          ResponseData.username = "Household";
          Navigator.of(context).pushNamed('/buyerhome');
          loginsuccessdialog(context);
        }
      }
    } else {
      Navigator.of(context).pushNamed('/login');
      invaliderrordialog(context);
      print(response.statusCode);
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
            //
            Stack(children: <Widget>[
              Container(
                height: 150.0,
                width: double.infinity,
                //color: Colors.white,
              ),
              Positioned(
                bottom: 10.0,
                right: 100.0,
                child: Container(
                  height: 350.0,
                  width: 350.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(320),
                      color: Colors.yellowAccent),
                ),
              ),
              Positioned(
                bottom: 20.0,
                right: 150.0,
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
                                width: 2.0),
                            image: DecorationImage(
                              image: AssetImage('assets/images/logo.jpg'),
                            )),
                      )
                    ],
                  ),
                  //add 'hi welcome' text
                  SizedBox(height: 15.0),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      'Hi Welcome',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                  ),
                ],
              ),
            ]),
            //
            // Container(
            //     alignment: Alignment.center,
            //     child: Text(
            //       '',
            //       style: TextStyle(fontSize: 17, color: Colors.green),
            //     )),
            Container(
              alignment: Alignment(-0.1, 1),
              child: Column(
                children: <Widget>[
                  new GestureDetector(
                    child: Container(
                      width: 140,
                      height: 140,
                      child: Icon(
                        Icons.account_circle,
                        color: Colors.green,
                        size: 100.0,
                      ),
                      // decoration: BoxDecoration(
                      //   // color: Colors.white,
                      //   image: DecorationImage(
                      //     image: AssetImage("assets/images/logo.jpg"),
                      //     fit: BoxFit.cover,
                      //   ),
                      // ),
                    ),
                  ),
                  // Padding(padding: EdgeInsets.only(left:10.5)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: TextFormField(
                controller: email,
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
                // onChanged: (text) {
                //   email = text;
                // },
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
                  //return null;
                },
              ),
            ),

            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: new TextFormField(
                    controller: password,
                    decoration: const InputDecoration(
                      icon: const Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      hintText: 'Enter password',
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    // onChanged: (text) {
                    //   password = text;
                    // },

                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter Password';
                      }
                      return null;
                    },
                    obscureText: _obscureText,
                  ),
                ),
                new FlatButton(
                    onPressed: _toggle,
                    padding: const EdgeInsets.only(
                        right: 10.0, top: 0.0, bottom: 0.0, left: 270.0),
                    child: new Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility))
              ],
            ),

            Container(
                alignment: Alignment(-0.1, 1),
                child: new RaisedButton(
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  color: Colors.green,
                  padding: const EdgeInsets.only(
                      left: 130.0, top: 10.0, bottom: 10.0, right: 130.0),
                  textColor: Colors.white,
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      login(context);
                    }
                  },
                )),
            FlatButton(
              padding:
                  const EdgeInsets.only(left: 130.0, top: 5.0, right: 130.0),
              textColor: Colors.green,
              child: Text(
                'Forgot Password ?',
                style: TextStyle(fontSize: 18),
              ),
              onPressed: () {
                //forgot password screen

                Navigator.of(context).pushNamed('/forgot');
              },
            ),

            Container(
                child: Row(
              children: <Widget>[
                Text(
                  'Don\'t have an account ?',
                  style: TextStyle(fontSize: 17, color: Colors.black),
                ),
                FlatButton(
                  textColor: Colors.green,
                  child: Text(
                    'Create Acount',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed('/usertype');
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ))
//
          ],
        ),
      ),
    );

//

//

    //
  }

//

}
