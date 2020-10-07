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
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pushNamed('/settings'),
          ),
          title: Text(
            "Change Password",
            style: TextStyle(color: Colors.white),
          ),
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
                    height: 180.0,
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
                                    image: AssetImage(
                                        "assets/images/changepassword.jpg"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            // Padding(padding: EdgeInsets.only(left:10.5)),
                          ],
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
                    padding: const EdgeInsets.all(40.0),
                    child: new RaisedButton(
                      child: const Text(
                        'Update',
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      padding: const EdgeInsets.only(
                          left: 130.0, top: 10.0, bottom: 10.0, right: 130.0),
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
