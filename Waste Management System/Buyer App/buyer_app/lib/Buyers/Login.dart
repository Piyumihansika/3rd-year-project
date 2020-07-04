import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:http/http.dart' as http;
// import 'package:buyerapp/Models/loginModel.dart';
//import 'package:passwordfield/passwordfield.dart';
import 'package:buyerapp/utils/ResponseData.dart';

final String apiUrl = "http://192.168.8.100:3000/auth/buyerLogin";

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
  void loadHome(BuildContext context) async {
    print("-------------------------------auth--------------------------");
    print(newAuth);
    print("--------------------------------------------------------------");
    if (newAuth == false) {
      Navigator.of(context).pushNamed('/login');
    } else {
      Navigator.of(context).pushNamed('/buyerhome');
    }
  }

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
              leading: Icon(Icons.contacts),
              title: Text('Home'),
              onTap: () {
                loadHome(context);
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
    print("---------------------------------------------------------");
    print(password.text);
    var response = await http.post(apiUrl,
        body: data, encoding: Encoding.getByName("application/json"));
    if (response.statusCode == 200) {
      value = json.decode(response.body);
      print(value);
      id = (value["id"].toString());
      var resfirstName = (value["user"]["firstName"].toString());
      var reslastName = (value["user"]["lastName"].toString());
      var resemail = (value["user"]["email"].toString());
      // var rescontactNumber = (value["user"]["contactNumber"].toString());
      // var resaddress1 = (value["user"]["address1"].toString());
      // var resaddress2 = (value["user"]["address2"].toString());
      // var rescity = (va)
      print(resemail);
      if (id == null) {
        // Fluttertoast.showToast(msg: "Invalid login");
        Navigator.of(context).pushNamed('/login');
      } else {
        print(
            "----------------------------------------------Login----------------------------------------------------");
        ResponseData.userId = id;
        ResponseData.firstName = resfirstName;
        ResponseData.lastName = reslastName;
        ResponseData.email = resemail;
        ResponseData.contactNumber =
            (value["user"]["contactNumber"].toString());
        ResponseData.address1 = (value["user"]["address1"].toString());
        ResponseData.address2 = (value["user"]["address2"].toString());
        ResponseData.city = (value["user"]["city"].toString());
        ResponseData.district = (value["user"]["district"].toString());
        Navigator.of(context).pushNamed('/buyerhome');
        // Navigator.of(context).pushNamed('/dashboard1');
      }
    } else {
      // Fluttertoast.showToast(msg: "Check credentials login failed");
      Navigator.of(context).pushNamed('/login');
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
                      color: Colors.yellowAccent),
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
                      color: Colors.blueAccent),
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
                      color: Colors.yellow),
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
                  // add search bar
                  SizedBox(height: 25.0),
                  Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(25),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.green,
                                  size: 30.0,
                                ),
                                contentPadding: EdgeInsets.only(
                                    left: 20, top: 15, bottom: 10),
                                hintText: 'Search',
                                hintStyle: TextStyle(color: Colors.grey)),
                          ))),
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
                  // add search bar
                  // SizedBox(height: 25.0),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 15.0,right: 15.0),
                  //   child: Material(
                  //     elevation: 5.0,
                  //     borderRadius: BorderRadius.circular(25),
                  //     child: TextFormField(
                  //       decoration: InputDecoration(
                  //           border: InputBorder.none,
                  //           prefixIcon: Icon(
                  //             Icons.search,
                  //             color: Colors.green,
                  //             size: 30.0,
                  //           ),
                  //           contentPadding:
                  //           EdgeInsets.only(left: 20,top: 15,bottom: 10),
                  //           hintText: 'Search',hintStyle: TextStyle(
                  //           color: Colors.grey
                  //       )
                  //       ),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ]),
            //
            Container(
                alignment: Alignment.center,
                child: Text(
                  '',
                  style: TextStyle(fontSize: 17, color: Colors.green),
                )),
            TextFormField(
              controller: email,
              decoration: const InputDecoration(
                icon: const Icon(
                  Icons.email,
                  color: Colors.black,
                ),
                hintText: 'Enter Your Email',
                labelText: 'Email',
                labelStyle:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
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

            Column(
              children: <Widget>[
                new TextFormField(
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
                  child: const Text('LOGIN'),
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      //send request
                      login(context);

                      // print(email.text);

//                    Scaffold
//                        .of(context)
//                        .showSnackBar(SnackBar(content: Text('Processing Data'),backgroundColor: Colors.green,));

                    }
                  },
                )),
            FlatButton(
              padding:
                  const EdgeInsets.only(left: 100.0, top: 5.0, right: 100.0),
              textColor: Colors.green,
              child: Text(
                'Forgot Password ?',
                style: TextStyle(fontSize: 16),
              ),
              onPressed: () {
                //forgot password screen

                Navigator.of(context).pushNamed('/forgot');
              },
            ),

            Container(
                child: Row(
              children: <Widget>[
                Text('Don\'t have an account ?'),
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
