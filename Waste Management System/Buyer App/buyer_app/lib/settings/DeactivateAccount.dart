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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pushNamed('/settings'),
        ),
        title: Text(
          "Delete Account",
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
                                  image: AssetImage("assets/images/delete.jpg"),
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
                  padding: const EdgeInsets.only(left: 25.0, top: 40.0),
                  child: new RaisedButton(
                    child: const Text(
                      'Delete Account',
                      style: TextStyle(fontSize: 18),
                    ),
                    color: Colors.green,
                    textColor: Colors.white,
                    padding: const EdgeInsets.only(
                        left: 120.0, top: 10.0, bottom: 10.0, right: 120.0),
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
