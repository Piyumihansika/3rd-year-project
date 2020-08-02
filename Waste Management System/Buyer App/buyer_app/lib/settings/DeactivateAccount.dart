import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:buyerapp/utils/ResponseData.dart';

final String housedelUrl =
    "${ResponseData.apiUrl}/buyer/deleteBuyer/${ResponseData.userId}";
final String companydelUrl =
    "${ResponseData.apiUrl}/company/deleteCompany/${ResponseData.userId}";
final String passwordUrl = "${ResponseData.apiUrl}/buyer/getPassword";
final String companypwdUrl = "${ResponseData.apiUrl}/company/getPassword";

class DeactivateAccount extends StatefulWidget {
  @override
  _DeactivateAccountState createState() => _DeactivateAccountState();
}

class _DeactivateAccountState extends State<DeactivateAccount> {
  final _formKey = GlobalKey<FormState>();

  //controller names

  TextEditingController password = TextEditingController();

  void delete(BuildContext context) async {
    if (ResponseData.username == "Company") {
      var response = await http
          .delete(companydelUrl, headers: {"Accept": "application/json"});
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("------------------------------deleted-------------------------");
        var result = json.decode(response.body);
        Navigator.of(context).pushNamed('/login');
        print(result);
      } else {
        print(response.statusCode);
        print("error occured");
      }
    } else {
      var response = await http
          .delete(housedelUrl, headers: {"Accept": "application/json"});
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("------------------------------deleted-------------------------");
        var result = json.decode(response.body);
        Navigator.of(context).pushNamed('/login');
        print(result);
      } else {
        print(response.statusCode);
        print("error occured");
      }
    }
  }

  void getPassword(BuildContext context) async {
    final Map<String, dynamic> data = {
      "id": ResponseData.userId,
      "password": password.text,
    };

    var response = await http.post(passwordUrl,
        body: data, encoding: Encoding.getByName("application/json"));
    print(data);

    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      ResponseData.userStatus = result['status'];
      print(ResponseData.userStatus);
      delete(context);
    } else {
      Navigator.of(context).pushNamed('/settings');
      print('hit');
      print(response.statusCode);
    }
  }

  void getcompanyPassword(BuildContext context) async {
    final Map<String, dynamic> data = {
      "id": ResponseData.userId,
      "password": password.text,
    };

    var response = await http.post(companypwdUrl,
        body: data, encoding: Encoding.getByName("application/json"));
    print(data);

    if (response.statusCode == 200) {
      var result = json.decode(response.body);
      ResponseData.userStatus = result['status'];
      print(ResponseData.userStatus);
      delete(context);
    } else {
      Navigator.of(context).pushNamed('/settings');
      print('hit');
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Delete Account',
          style: TextStyle(fontSize: 18),
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
                        'DELETE ACCOUNT',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ]),
              Padding(padding: EdgeInsets.all(30.5)),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                    "When you press delete account button your account is no longer available",
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(padding: EdgeInsets.all(15.0)),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: TextFormField(
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
              ),
              new Container(
                  padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                  child: new RaisedButton(
                    child: const Text('Delete Account'),
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        if (ResponseData.username == "Company") {
                          getcompanyPassword(context);
                        } else {
                          getPassword(context);
                        }
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
