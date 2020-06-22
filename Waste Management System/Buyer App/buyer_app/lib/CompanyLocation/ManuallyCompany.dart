import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:http/http.dart' as http;
import 'package:buyerapp/Models/registermodel.dart';

class ManuallyCompany extends StatefulWidget {

  final String companyName;
  final String contactpersonName;
  final String contactpersonNumber;
  final String password;
  final String confirmpass;
  final String email;

  ManuallyCompany({ this.companyName,this.contactpersonName,this.contactpersonNumber,this.password,this.confirmpass,this.email});

  @override
  _ManuallyCompanyState createState() => _ManuallyCompanyState(companyName,contactpersonName,contactpersonNumber,password,confirmpass,email);
}

class _ManuallyCompanyState extends State<ManuallyCompany> {

  String companyName;
  String contactpersonName;
  String contactpersonNumber;
  String password;
  String confirmpass;
  String email;

  _ManuallyCompanyState(this.companyName,this.contactpersonName,this.contactpersonNumber,this.password,this.confirmpass,this.email);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mannual Location'),
        backgroundColor: Colors.green,),
      body: ManuallyCompanyForm(),
    );
  }
}

class ManuallyCompanyForm extends StatefulWidget {

  final String companyName;
  final String contactpersonName;
  final String contactpersonNumber;
  final String password;
  final String confirmpass;
  final String email;

  ManuallyCompanyForm({ this.companyName,this.contactpersonName,this.contactpersonNumber,this.password,this.confirmpass,this.email});

  @override
  _ManuallyCompanyFormState createState() => _ManuallyCompanyFormState(companyName,contactpersonName,contactpersonNumber,password,confirmpass,email);
}
// Http request code

  Future<CompanyModel> createUser(String companyName,String contactpersonName,String contactpersonNumber,String password,String confirmpass,String email,String address1,String address2,String city,String district) async {
  final String apiUrl = "Enter  your url here";

  // this is for take response
  final response = await http.post(apiUrl, body: {

    "companyName": companyName,
    "contactpersonName": contactpersonName,
    "contactpersonNumber": contactpersonNumber,
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
    return companyModelFromJson(responseString);
  } else {
    return null;
  }
}
  class _ManuallyCompanyFormState extends State<ManuallyCompanyForm> {

    String companyName;
    String contactpersonName;
    String contactpersonNumber;
    String password;
    String confirmpass;
    String email;

    CompanyModel user1;
    _ManuallyCompanyFormState(this.companyName,this.contactpersonName,this.contactpersonNumber,this.password,this.confirmpass,this.email);

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
                          final CompanyModel user =await createUser(companyName, contactpersonName, contactpersonNumber, password, confirmpass, email, address1, address2, city, district);
                          setState(() {
                            user1 =
                                user;
                          });

                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>CheckCompany(address1: address1 ,address2: address2,city:city,district:district ),

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

class CheckCompany extends StatefulWidget {

  final String address1;
  final String address2;
  final String city;
  final String district;

  CheckCompany({this.address1, this.address2, this.city, this.district});

  @override
  _CheckCompanyState createState() => _CheckCompanyState(address1, address2, city, district);
}

class _CheckCompanyState extends State<CheckCompany> {

  String address1;
  String address2;
  String city;
  String district;


  _CheckCompanyState(this.address1, this.address2, this.city, this.district);
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