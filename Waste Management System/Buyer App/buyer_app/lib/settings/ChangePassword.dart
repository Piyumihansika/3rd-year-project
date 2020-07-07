import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

final String apiUrl = "http://10.0.2.2:3000/ADD URL";
//final String apiUrl = "http://192.168.8.188:3000/ADD URL";

class PasswordChange extends StatefulWidget {
  @override
  _PasswordChangeState createState() => _PasswordChangeState();
}

class _PasswordChangeState extends State<PasswordChange> {
  final _formKey = GlobalKey<FormState>();

  //controller names
  TextEditingController oldpassword = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  void updatePassword(BuildContext context) async {
    final Map<String, dynamic> data = {
      "password": newpassword.text,
    };
    print(oldpassword.text);
    print(newpassword.text);
    print(confirmpassword.text);
    print(
        "----------------------------------------------OK----------------------------------------------------");

    print(data.toString());
    var response = await http.post(apiUrl,
        body: data, encoding: Encoding.getByName("application/json"));
    if (response.statusCode == 200) {
      Navigator.of(context).pushNamed('/login');
      print(response.statusCode);
      print(response.body);
    } else {
      print(response.statusCode);
      print("error occured");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Change Password'),
          backgroundColor: Colors.green,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(children: <Widget>[
                  Container(
                    height: 200.0,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                  Positioned(
                    bottom: 1.0,
                    right: 90.0,
                    child: Container(
                      height: 350.0,
                      width: 350.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(320),
                          color: Colors.yellowAccent),
                    ),
                  ),
                  Positioned(
                    bottom: 10.0,
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
                                    width: 2.0),
                                image: DecorationImage(
                                  image: AssetImage('assets/images/logo.jpg'),
                                )),
                          )
                        ],
                      ),
                      SizedBox(height: 15.0),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          'CHANGE PASSWORD',
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ]),
                Padding(padding: EdgeInsets.all(20.5)),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextFormField(
                    controller: oldpassword,
                    decoration: const InputDecoration(
                      labelText: 'Old Password',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your old password';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextFormField(
                    controller: newpassword,
                    decoration: const InputDecoration(
                      labelText: 'New Password',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter your new  password';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: TextFormField(
                    controller: confirmpassword,
                    decoration: const InputDecoration(
                      labelText: 'Confirm Password',
                      labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: Colors.black,
                      ),
                    ),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please re-enter your password';
                      }
                      if (value != newpassword.text) {
                        return 'Your Password is not same to new one';
                      }

                      return null;
                    },
                  ),
                ),
                new Container(
                    // padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                    padding: const EdgeInsets.all(60.0),
                    child: new RaisedButton(
                      child: const Text(
                        'Update',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      color: Colors.green,
                      textColor: Colors.white,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          print(oldpassword.text);
                          print(newpassword.text);
                          print(confirmpassword.text);

                          updatePassword(context);
                          Navigator.of(context).pushNamed('/settings');
                          resetpasswordsuccessdialog(context);
                        }
                      },
                    )),
              ],
            ),
          ),
        ));
  }

  resetpasswordsuccessdialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Success",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
            content: Text(
              "Password change successfully",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
