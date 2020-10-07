import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:buyerapp/utils/ResponseData.dart';

final String apiUrl = "${ResponseData.apiUrl}/company/addCompany";

class ManuallyCompany extends StatefulWidget {
  final String companyName;
  final String contactpersonName;
  final String contactpersonNumber;
  final String password;
  final String email;

  const ManuallyCompany(
      {Key key,
      this.companyName,
      this.contactpersonName,
      this.contactpersonNumber,
      this.password,
      this.email})
      : super(key: key);

  @override
  _ManuallyCompanyState createState() => _ManuallyCompanyState();
}

class _ManuallyCompanyState extends State<ManuallyCompany> {
  TextEditingController address1 = TextEditingController();
  TextEditingController address2 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController district = TextEditingController();

  //success dialog box
  registersuccessdialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Congradulations!",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
            content: Text(
              "You are registered successfully. Please Login!",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
          );
        });
  }

  void register(BuildContext context) async {
    print(widget.companyName);

    final Map<String, dynamic> data = {
      "companyName": widget.companyName,
      "contactpersonName": widget.contactpersonName,
      "contactpersonNumber": widget.contactpersonNumber,
      "email": widget.email,
      "password": widget.password,
      "address1": address1.text,
      "address2": address2.text,
      "city": city.text,
      "district": district.text
    };
    print(widget.companyName);
    print(address1.text);
    print(
        "----------------------------------------------OK----------------------------------------------------");

    print(data.toString());
    var response = await http.post(apiUrl,
        body: data, encoding: Encoding.getByName("application/json"));
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.body);
      Navigator.of(context).pushNamed('/login');
      registersuccessdialog(context);
    } else {
      print(response.statusCode);
      print("error occured");
    }
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mannual Location'),
        backgroundColor: Colors.green,
      ),
      body: Form(
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
                child: TextFormField(
                  controller: address1,
                  scrollPadding: EdgeInsets.all(10),
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.add_location, color: Colors.black),
                    hintText: 'Enter your address1',
                    labelText: 'Address1',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
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
                child: TextFormField(
                  controller: address2,
                  scrollPadding: EdgeInsets.all(10),
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.add_location, color: Colors.black),
                    hintText: 'Enter your address2',
                    labelText: 'Address2',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
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
                child: TextFormField(
                  controller: city,
                  scrollPadding: EdgeInsets.all(10),
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.location_city, color: Colors.black),
                    hintText: 'Enter your city',
                    labelText: 'City',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
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
                child: TextFormField(
                  controller: district,
                  scrollPadding: EdgeInsets.all(10),
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.my_location, color: Colors.black),
                    hintText: 'Enter your district',
                    labelText: 'District',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  ),
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
                      padding: const EdgeInsets.only(right: 10.0),
                      textColor: Colors.red,
                      child: Text(
                        'Our terms & conditions',
                        style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
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
                        style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),
                      ),
                      validators: [
                        FormBuilderValidators.requiredTrue(
                          errorText:
                              "You must accept terms and conditions to continue",
                        ),
                      ],
                      attribute: null,
                    ),
                  ],
                ),
              ),

              new Container(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: Row(
                    children: <Widget>[
                      
                      RaisedButton(
                          child: const Text(
                            'Sign up',
                            style: TextStyle(fontSize: 18),
                          ),
                          color: Colors.green,
                          textColor: Colors.white,
                           padding: const EdgeInsets.only(
                      left: 130.0, top: 10.0, bottom: 10.0, right: 130.0),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              register(context);
                            }
                          }),
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

// class CheckCompany extends StatefulWidget {

//   final String address1;
//   final String address2;
//   final String city;
//   final String district;

//   CheckCompany({this.address1, this.address2, this.city, this.district});

//   @override
//   _CheckCompanyState createState() => _CheckCompanyState(address1, address2, city, district);
// }

// class _CheckCompanyState extends State<CheckCompany> {

//   String address1;
//   String address2;
//   String city;
//   String district;

//   _CheckCompanyState(this.address1, this.address2, this.city, this.district);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(

//       ),
//       body: Text(
//         address1 + address2 + city + district ,
//       ),

//     );
//   }
// }
