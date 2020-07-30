import 'dart:convert';
// import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:app/utils/ResponseData.dart';

final String apiUrl =
    "http://10.0.2.2:3000/customer/deleteCustomer/${ResponseData.userId}";
final String passwordUrl = "http://10.0.2.2:3000/customer/getPassword";

class Deactivate extends StatefulWidget {
  @override
  _DeactivateState createState() => _DeactivateState();
}

class _DeactivateState extends State<Deactivate> {
  final _formKey = GlobalKey<FormState>();

  //controller names

  TextEditingController password = TextEditingController();

  void delete(BuildContext context) async {
    var response =
        await http.delete(apiUrl, headers: {"Accept": "application/json"});
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
      Navigator.of(context).pushNamed('/setting');
      print('hit');
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pushNamed('/setting'),
        ),
        backgroundColor: Colors.green,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(20.5)),
              Text(
                  "When you press delete account button your account is no longer available",
                  style: TextStyle(
                    fontSize: 19.0,
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
                    fontSize: 22.0,
                    color: Colors.black,
                  ),
                ),
                validator: (value) {
                  Pattern pattern =
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                  RegExp regex = new RegExp(pattern);

                  if (value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return 'Must be more than 6 charactors';
                  } else if (!regex.hasMatch(value)) {
                    return 'At least a upper, lower, symbol & number';
                  }
                  return null;
                },
              ),
              new Container(
                  padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                  child: new RaisedButton(
                    child: const Text('DELETE ACCOUNT'),
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        getPassword(context);
                        // delete(context);
                        // if (ResponseData.userStatus == "matched") {
                        //   print(ResponseData.userStatus);
                        //   delete(context);
                        // }
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
