import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:http/http.dart' as http;
import 'package:buyerapp/Models/registermodel.dart';

class Manually extends StatefulWidget {

  final String username;
  final String address;
  final String phone;
  final String password;
  final String confirmpass;
  final String email;

  Manually({ this.username,this.address,this.phone,this.password,this.confirmpass,this.email});

  @override
  _ManuallyState createState() => _ManuallyState(username,address,phone,password,confirmpass,email);
}

class _ManuallyState extends State<Manually> {

  String username;
  String address;
  String phone;
  String password;
  String confirmpass;
  String email;

  _ManuallyState(this.username,this.address,this.phone,this.password,this.confirmpass,this.email);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mannual Location'),
        backgroundColor: Colors.green,),
      body: SignForm(),
    );
  }
}

class SignForm extends StatefulWidget {

  final String username;
  final String address;
  final String phone;
  final String password;
  final String confirmpass;
  final String email;

  SignForm({ this.username,this.address,this.phone,this.password,this.confirmpass,this.email});

  @override
  _SignFormState createState() => _SignFormState(username,address,phone,password,confirmpass,email);
}
// Http request code

Future<UserModel> createUser(String username,String address,String phone,String password,String confirmpass,String email,String location) async {
  final String apiUrl = "Enter  your url here";

  // this is for take response
  final response = await http.post(apiUrl, body: {

    "username": username,
    "address": address,
    "phone": phone,
    "password": password,
    "confirmpass": confirmpass,
    "email": email,
    "location": location,

  });
  if (response.statusCode == 201) {
    final String responseString = response.body;
    return userModelFromJson(responseString);
  } else {
    return null;
  }
}
class _SignFormState extends State<SignForm> {

  String username;
  String address;
  String phone;
  String password;
  String confirmpass;
  String email;

  UserModel user1;
  _SignFormState(this.username,this.address,this.phone,this.password,this.confirmpass,this.email);

  final _formKey = GlobalKey<FormState>();

  // TextEditingController locationController = TextEditingController();
  String location;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,

      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

            Container(
              alignment: Alignment.center,
              child: Text(''),
            ),

            Container(
              alignment: Alignment.center,
            ),

            //location seen

            Container(
              padding: EdgeInsets.all(10),
              child:
              TextFormField(
                scrollPadding: EdgeInsets.all(10),
                decoration: const InputDecoration(
                  icon: const Icon(Icons.add_location,color: Colors.black),
                  hintText: 'Enter your location',
                  labelText: 'Location',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),

                ),
                onChanged: (text){
                  location= text;
                },
                //controller: locationController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your location';
                  }
                  return null;
                },
              ),
            ),

            //  terms and conditions...
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  FlatButton(
                    padding: const EdgeInsets.only(right: 120.0),


                    textColor: Colors.green,
                    child: Text('Our terms & conditions'
                    ),

                    onPressed: () {
                      //terms and condition page
                      Navigator.of(context).pushNamed('/terms');
                    },
                  ),
                  FormBuilderCheckbox(
                    initialValue: false,
                    label: Text(
                      "I have read and agree to the terms and conditions",
                      style: TextStyle(color: Colors.black87),),
                    validators: [
                      FormBuilderValidators.requiredTrue(
                        errorText:
                        "You must accept terms and conditions to continue",
                      ),
                    ],
                  ),

                ],
              ),
            ),

            new Container(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Row(
                  children: <Widget>[
                    RaisedButton(
                      child: const Text('BACK'),
                      color: Colors.yellow,
                      textColor: Colors.black,

                      onPressed: (){
                        Navigator.of(context).pushNamed('/login');
                      },
                    ),

                    RaisedButton(
                      child: const Text('SIGN UP'),
                      color: Colors.green,
                      textColor: Colors.white,

                      onPressed: () async{

                        if (_formKey.currentState.validate()) {

                          //send request
                          final UserModel user =await createUser(username, address, phone, password, confirmpass, email, location);
                          setState(() {
                            user1 =
                                user;
                          });

                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>Check(location: location ),

                          ));
                        }
                      },

//                      onPressed: () {
//
//                        if (_formKey.currentState.validate()) {
//
//                          print(locationController.text);
//
//
//                          Navigator.of(context).pushNamed('/buyerhome');
//
////                        Scaffold
////                            .of(context)
////                            .showSnackBar(SnackBar(content: Text('Sending Data'),backgroundColor: Colors.green,));
//
//                        }
//                      },
                    ),

                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )

            ),
          ],
        ),
      ),
    );
  }
}

class Check extends StatefulWidget {

  final String location;

  Check({this.location});

  @override
  _CheckState createState() => _CheckState(location);
}

class _CheckState extends State<Check> {

  String location;


  _CheckState(this.location);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Text(
        location ,
      ),


    );
  }
}