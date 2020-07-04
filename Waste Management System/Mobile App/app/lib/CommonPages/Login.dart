// import 'package:app/Models/loginModel.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:http/http.dart' as http;
import 'package:app/utils/ResponseData.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_validator/email_validator.dart';

final String apiUrl = "http://192.168.8.100:3000/auth/customerLogin";
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginForm(),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.green,
        children: [
          SpeedDialChild(
            child: Icon(Icons.phone_in_talk),
            label: "First",
            onTap: () {
              Navigator.of(context).pushNamed('/second');
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.home),
            backgroundColor: Colors.yellow,
          ),
          SpeedDialChild(
            child: Icon(Icons.phone_in_talk),
            label: "Career",
            onTap: () {
              Navigator.of(context).pushNamed('/logemp');
            },
          ),
        ],
      ),

      //
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void login(BuildContext context) async {
    final Map<String, dynamic> data = {
      "email": email.text.toLowerCase(),
      "password": password.text,
    };
    print(email);

    // print(data.toString());
    var response = await http.post(apiUrl,
        body: data, encoding: Encoding.getByName("application/json"));
    if (response.statusCode == 200) {
      value = json.decode(response.body);
      // print(value);
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
        Navigator.of(context).pushNamed('/dashboard1');
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Image(
              alignment: Alignment(0.5, 0.5),
              //    width: 80,
              // height: 80,
              image: AssetImage('assets/images/logo.jpg'),
            ),
          ),
          Container(
              alignment: Alignment.center,
              child: Text(
                "WELCOME",
                style: TextStyle(fontSize: 17, color: Colors.green),
              )),
          TextFormField(
            controller: email,
            decoration: const InputDecoration(
              icon: const Icon(
                Icons.person,
                color: Colors.green,
              ),
              hintText: 'Enter your Email',
              labelText: 'Email',
              labelStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter an email';
              } else {
                bool temp = (EmailValidator.validate(value));
                if (temp) {
                  return null;
                }
                return 'Please enter a valid Email ';
              }
            },
          ),

          TextFormField(
            controller: password,
            decoration: const InputDecoration(
              icon: const Icon(
                Icons.lock,
                color: Colors.green,
              ),
              //

              //

              hintText: 'Enter password',
              labelText: 'Password',
              labelStyle:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter Password';
              }
              return null;
            },
            obscureText: true,
          ),

          Container(
              alignment: Alignment(-0.1, 1),
              child: new RaisedButton(
                child: const Text('LOGIN'),
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    login(context);
                  }
                },
              )),
          FlatButton(
            padding: const EdgeInsets.only(left: 100.0, top: 5.0),
            onPressed: () {
              //forgot password screen

              Navigator.of(context).pushNamed('/forgot');
            },
            textColor: Colors.green,
            child: Text('Forgot Password'),
          ),

          Container(
              child: Row(
            children: <Widget>[
              Text('Does not have account ?'),
              FlatButton(
                textColor: Colors.green,
                child: Text(
                  'SIGN UP',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                 

                  Navigator.of(context).pushNamed('/register');
                },
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ))
//

//
        ],
      ),
    );

//

//

    //
  }

  //

}
