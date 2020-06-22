import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:http/http.dart' as http;
import 'package:buyerapp/Models/registermodel.dart';

class Manually extends StatefulWidget {

  final String firstname;
  final String lastname;
  final String contactNumber;
  final String password;
  final String confirmpass;
  final String email;

  Manually({ this.firstname,this.lastname,this.contactNumber,this.password,this.confirmpass,this.email});

  @override
  _ManuallyState createState() => _ManuallyState(firstname,lastname,contactNumber,password,confirmpass,email);
}

class _ManuallyState extends State<Manually> {

  String firstname;
  String lastname;
  String contactNumber;
  String password;
  String confirmpass;
  String email;

  _ManuallyState(this.firstname,this.lastname,this.contactNumber,this.password,this.confirmpass,this.email);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mannual Location'),
        backgroundColor: Colors.green,),
      body: ManuallyForm(),
    );
  }
}

class ManuallyForm extends StatefulWidget {

  final String firstname;
  final String lastname;
  final String contactNumber;
  final String password;
  final String confirmpass;
  final String email;

  ManuallyForm({ this.firstname,this.lastname,this.contactNumber,this.password,this.confirmpass,this.email});

  @override
  _ManuallyFormState createState() => _ManuallyFormState(firstname,lastname,contactNumber,password,confirmpass,email);
}
// Http request code

Future<UserModel> createUser(String firstname,String lastname,String contactNumber,String password,String confirmpass,String email,String address1,String address2,String city,String district) async {
  final String apiUrl = "Enter  your url here";

  // this is for take response
  final response = await http.post(apiUrl, body: {

    "firstname": firstname,
    "lastname": lastname,
    "contactNumber": contactNumber,
    "password": password,
    "confirmpass": confirmpass,
    "email": email,
    "address1": address1,
    "address2": address2,
    "city": city,
    "district": district,

  });
  if (response.statusCode == 201) {
    final String responseString = response.body;
    return userModelFromJson(responseString);
  } else {
    return null;
  }
}
class _ManuallyFormState extends State<ManuallyForm> {

  String firstname;
  String lastname;
  String contactNumber;
  String password;
  String confirmpass;
  String email;

  UserModel user1;
  _ManuallyFormState(this.firstname,this.lastname,this.contactNumber,this.password,this.confirmpass,this.email);

  final _formKey = GlobalKey<FormState>();

  // TextEditingController locationController = TextEditingController();
  String address1;
  String address2;
  String city;
  String district;

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
                  hintText: 'Enter your address1',
                  labelText: 'Address1',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),

                ),
                onChanged: (text){
                  address1= text;
                },
                //controller: locationController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your address1';
                  }
                  return null;
                },
              ),
            ),

            Container(
              padding: EdgeInsets.all(10),
              child:
              TextFormField(
                scrollPadding: EdgeInsets.all(10),
                decoration: const InputDecoration(
                  icon: const Icon(Icons.add_location,color: Colors.black),
                  hintText: 'Enter your address2',
                  labelText: 'Address2',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),

                ),
                onChanged: (text){
                  address2= text;
                },
                //controller: locationController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your address2';
                  }
                  return null;
                },
              ),
            ),

            Container(
              padding: EdgeInsets.all(10),
              child:
              TextFormField(
                scrollPadding: EdgeInsets.all(10),
                decoration: const InputDecoration(
                  icon: const Icon(Icons.location_city,color: Colors.black),
                  hintText: 'Enter your city',
                  labelText: 'City',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),

                ),
                onChanged: (text){
                  city= text;
                },
                //controller: locationController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your city';
                  }
                  return null;
                },
              ),
            ),

            Container(
              padding: EdgeInsets.all(10),
              child:
              TextFormField(
                scrollPadding: EdgeInsets.all(10),
                decoration: const InputDecoration(
                  icon: const Icon(Icons.my_location,color: Colors.black),
                  hintText: 'Enter your district',
                  labelText: 'District',
                  labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),

                ),
                onChanged: (text){
                  district= text;
                },
                //controller: locationController,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your district';
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
                    ], attribute: null,
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
                          final UserModel user =await createUser(firstname, lastname, contactNumber, password, confirmpass, email, address1, address2, city, district);
                          setState(() {
                            user1 =
                                user;
                          });

                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>CheckHousehold(address1: address1 ,address2: address2,city:city,district:district ),

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

class CheckHousehold extends StatefulWidget {

  final String address1;
  final String address2;
  final String city;
  final String district;

  CheckHousehold({this.address1, this.address2, this.city, this.district});

  @override
  _CheckHouseholdState createState() => _CheckHouseholdState(address1, address2, city, district);
}

class _CheckHouseholdState extends State<CheckHousehold> {

  String address1;
  String address2;
  String city;
  String district;


  _CheckHouseholdState(this.address1, this.address2, this.city, this.district);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Text(
        address1 + address2 + city + district ,
      ),


    );
  }
}