// import 'package:app/Models/loginModel.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:http/http.dart' as http;

final String apiUrl = "http://192.168.8.100:3000/auth/customerLogin";

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

// Http request code

// Future<LoginModel> createUser(String email, String password) async {
//   final String apiUrl = "Enter  your url here";

// // this is for take response

//   final response = await http.post(apiUrl, body: {
//     "email": email,
//     "password": password,
//   });
//   if (response.statusCode == 201) {
//     final String responseString = response.body;
//     return loginModelFromJson(responseString);
//   } else {
//     return null;
//   }
// }

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
      "email": email.text,
      "password": password.text,
    };
    print(email);
    print(
        "----------------------------------------------Login----------------------------------------------------");

    // print(data.toString());
    var response = await http.post(apiUrl,
        body: data, encoding: Encoding.getByName("application/json"));
    if (response.statusCode == 200) {
      Navigator.of(context).pushNamed('/dashboard1');
      print(response.statusCode);
      print(response.body);
    } else {
      Navigator.of(context).pushNamed('/login');
      print(response.statusCode);
      print("error occured");
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
                'WELCOME',
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
              }
              return null;
            },
          ),

          TextFormField(
            controller: password,
            decoration: const InputDecoration(
              icon: const Icon(
                Icons.lock,
                color: Colors.green,
              ),
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
