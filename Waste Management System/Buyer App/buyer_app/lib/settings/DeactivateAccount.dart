import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

final String apiUrl = "http://10.0.2.2:3000/ADD URL";
//final String apiUrl = "http://192.168.8.188:3000/ADD URL";

class DeactivateAccount extends StatefulWidget {
  @override
  _DeactivateAccountState createState() => _DeactivateAccountState();
}

class _DeactivateAccountState extends State<DeactivateAccount> {
  final _formKey = GlobalKey<FormState>();

  //controller names

  TextEditingController password = TextEditingController();

  void delete(BuildContext context) async {
    final Map<String, dynamic> data = {
      "password": password.text,
    };

    print(password.text);
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
        title: Text('Delete Account'),
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
                        color: Colors.blueAccent),
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
                        'DELETE ACCOUNT',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ]),
              Padding(padding: EdgeInsets.all(20.5)),
              Text(
                  "When you press delete account button your account is no longer available",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  )),
              Padding(padding: EdgeInsets.all(15.0)),
              TextFormField(
                controller: password,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              new Container(
                  padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                  child: new RaisedButton(
                    child: const Text('Delete Account'),
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        print(password.text);

                        delete(context);
                        Navigator.of(context).pushNamed('/login');
                      }
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
