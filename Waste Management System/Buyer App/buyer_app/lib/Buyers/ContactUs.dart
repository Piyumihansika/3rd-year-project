import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
//import 'package:passwordfield/passwordfield.dart';

class ContactUs extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Green wasteland'),
        backgroundColor: Colors.green,
      ),
      body: Contact(),
    );
  }
}

class Contact extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<Contact> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController messegeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
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
                      'CONTACT US',
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
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: nameController,
                scrollPadding: EdgeInsets.all(10),
                decoration: const InputDecoration(
                  icon: const Icon(Icons.person, color: Colors.black),
                  hintText: 'Enter Your Name',
                  labelText: 'Name',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: emailController,
                scrollPadding: EdgeInsets.all(10),
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
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter email ';
                  } else {
                    bool temp = (EmailValidator.validate(value));
                    if (temp) {
                      return null;
                    }
                    return 'Please enter a valid Email ';
                  }
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: messegeController,
                scrollPadding: EdgeInsets.all(10),
                maxLines: 5,
                decoration: const InputDecoration(
                  icon: const Icon(
                    Icons.message,
                    color: Colors.black,
                  ),
                  hintText: 'Enter Your Messege',
                  labelText: 'Messege',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your messege';
                  }
                  return null;
                },
              ),
            ),
            new Container(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                      child: const Text('Submit'),
                      color: Colors.green,
                      textColor: Colors.white,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          Navigator.of(context).pushNamed('/');
                        }
                      },
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )),
          ],
        ),
      ),
    );
  }
}
