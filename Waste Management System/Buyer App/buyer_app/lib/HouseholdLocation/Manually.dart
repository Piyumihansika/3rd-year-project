// import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:http/http.dart' as http;
// import 'package:buyerapp/Models/registermodel.dart';
import 'dart:convert';

String apiUrl = "http://192.168.8.100:3000/buyer/addBuyer";

class Manually extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String contactNumber;
  final String password;
  final String email;

  const Manually(
      {Key key,
      this.firstName,
      this.lastName,
      this.contactNumber,
      this.password,
      this.email})
      : super(key: key);

  @override
  _ManuallyState createState() => _ManuallyState();
}

class _ManuallyState extends State<Manually> {
  TextEditingController address1 = TextEditingController();
  TextEditingController address2 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController district = TextEditingController();

  void register(BuildContext context) async {
    print(widget.firstName);

    final Map<String, dynamic> data = {
      "firstName": widget.firstName,
      "lastName": widget.lastName,
      "contactNumber": widget.contactNumber,
      "email": widget.email,
      "password": widget.password,
      "address1": address1.text,
      "address2": address2.text,
      "city": city.text,
      "district": district.text
    };
    print(widget.firstName);
    print(address1.text);
    print(
        "----------------------------------------------OK----------------------------------------------------");

    print(data.toString());
    var response = await http.post(apiUrl,
        body: data, encoding: Encoding.getByName("application/json"));
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.body);
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
        title: Text(widget.firstName),
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
                  // onChanged: (text){
                  //   address2= text;
                  // },
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
                  // onChanged: (text){
                  //   city= text;
                  // },
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
                  // onChanged: (text){
                  //   district= text;
                  // },
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
                      child: Text('Our terms & conditions'),
                      onPressed: () {
                        //terms and condition page
                        Navigator.of(context).pushNamed('/terms');
                      },
                    ),
                    FormBuilderCheckbox(
                      initialValue: false,
                      label: Text(
                        "I have read and agree to the terms and conditions",
                        style: TextStyle(color: Colors.black87),
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
                        child: const Text('BACK'),
                        color: Colors.yellow,
                        textColor: Colors.black,
                        onPressed: () {
                          Navigator.of(context).pushNamed('/login');
                        },
                      ),
                      RaisedButton(
                          child: const Text('SIGN UP'),
                          color: Colors.green,
                          textColor: Colors.white,
                          onPressed: () {
                            register(context);
                            Navigator.of(context).pushNamed('/login');
                          }

                          // if (_formKey.currentState.validate()) {

                          //   send request

                          //   Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context) =>CheckHousehold(address1: address1 ,address2: address2,city:city,district:district ),

                          //   ));
                          // }

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
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

// class ManuallyForm extends StatefulWidget {

//   final String firstName;
//   final String lastName;
//   final String contactNumber;
//   final String password;
//   final String email;

//   ManuallyForm({ this.firstName,this.lastName,this.contactNumber,this.password,this.email});

//   @override
//   _ManuallyFormState createState() => _ManuallyFormState(
//      firstName: this.firstName,
//     lastName: this.lastName,
//     contactNumber: this.contactNumber,
//     password: this.password,
//     email: this.email
//   );
// }
// Http request code
// class _ManuallyFormState extends State<Manually> {
// Map<String, dynamic> formData;

//  _ManuallyFormState(){
//    formData={

//    };
//  }

// String firstName;
// String lastName;
// String contactNumber;
// String password;
// String email;

// _ManuallyFormState(
//     {this.firstName,
//     this.lastName,
//     this.contactNumber,
//     this.password,
//     this.email});

// TextEditingController address1 = TextEditingController();
// TextEditingController address2 = TextEditingController();
// TextEditingController city = TextEditingController();
// TextEditingController district = TextEditingController();

// void register(BuildContext context) async {
//   print(this.firstName);

//   final Map<String, dynamic> data = {
//     "firstName": firstName,
//     "lastName": lastName,
//     "contactNumber": contactNumber,
//     "email": email,
//     "password": password,
//     "address1": address1.text,
//     "address2": address2.text,
//     "city": city.text,
//     "district": district.text
//   };
//   print(firstName);
//   print(address1.text);
//   print(
//       "----------------------------------------------OK----------------------------------------------------");

//   var response = await http.post(apiUrl,
//       body: data, encoding: Encoding.getByName("application/json"));
//   if (response.statusCode == 200) {
//     print(response.statusCode);
//     print(response.body);
//   } else {
//     print(response.statusCode);
//     print("error occured");
//   }
// }

// final _formKey = GlobalKey<FormState>();
// @override
// Widget build(BuildContext context) {
//   return Form(
//     key: _formKey,
//     child: SingleChildScrollView(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Container(
//             alignment: Alignment.center,
//             child: Text(''),
//           ),

//           Container(
//             alignment: Alignment.center,
//           ),

//           //location seen

//           Container(
//             padding: EdgeInsets.all(10),
//             child: TextFormField(
//               controller: address1,
//               scrollPadding: EdgeInsets.all(10),
//               decoration: const InputDecoration(
//                 icon: const Icon(Icons.add_location, color: Colors.black),
//                 hintText: 'Enter your address1',
//                 labelText: 'Address1',
//                 labelStyle: TextStyle(
//                     fontWeight: FontWeight.bold, color: Colors.black),
//               ),
//               //controller: locationController,
//               validator: (value) {
//                 if (value.isEmpty) {
//                   return 'Please enter your address1';
//                 }
//                 return null;
//               },
//             ),
//           ),

//           Container(
//             padding: EdgeInsets.all(10),
//             child: TextFormField(
//               controller: address2,
//               scrollPadding: EdgeInsets.all(10),
//               decoration: const InputDecoration(
//                 icon: const Icon(Icons.add_location, color: Colors.black),
//                 hintText: 'Enter your address2',
//                 labelText: 'Address2',
//                 labelStyle: TextStyle(
//                     fontWeight: FontWeight.bold, color: Colors.black),
//               ),
//               // onChanged: (text){
//               //   address2= text;
//               // },
//               //controller: locationController,
//               validator: (value) {
//                 if (value.isEmpty) {
//                   return 'Please enter your address2';
//                 }
//                 return null;
//               },
//             ),
//           ),

//           Container(
//             padding: EdgeInsets.all(10),
//             child: TextFormField(
//               controller: city,
//               scrollPadding: EdgeInsets.all(10),
//               decoration: const InputDecoration(
//                 icon: const Icon(Icons.location_city, color: Colors.black),
//                 hintText: 'Enter your city',
//                 labelText: 'City',
//                 labelStyle: TextStyle(
//                     fontWeight: FontWeight.bold, color: Colors.black),
//               ),
//               // onChanged: (text){
//               //   city= text;
//               // },
//               //controller: locationController,
//               validator: (value) {
//                 if (value.isEmpty) {
//                   return 'Please enter your city';
//                 }
//                 return null;
//               },
//             ),
//           ),

//           Container(
//             padding: EdgeInsets.all(10),
//             child: TextFormField(
//               controller: district,
//               scrollPadding: EdgeInsets.all(10),
//               decoration: const InputDecoration(
//                 icon: const Icon(Icons.my_location, color: Colors.black),
//                 hintText: 'Enter your district',
//                 labelText: 'District',
//                 labelStyle: TextStyle(
//                     fontWeight: FontWeight.bold, color: Colors.black),
//               ),
//               // onChanged: (text){
//               //   district= text;
//               // },
//               //controller: locationController,
//               validator: (value) {
//                 if (value.isEmpty) {
//                   return 'Please enter your district';
//                 }
//                 return null;
//               },
//             ),
//           ),

//           //  terms and conditions...
//           Container(
//             padding: EdgeInsets.all(10),
//             child: Column(
//               children: <Widget>[
//                 FlatButton(
//                   padding: const EdgeInsets.only(right: 120.0),
//                   textColor: Colors.green,
//                   child: Text('Our terms & conditions'),
//                   onPressed: () {
//                     //terms and condition page
//                     Navigator.of(context).pushNamed('/terms');
//                   },
//                 ),
//                 FormBuilderCheckbox(
//                   initialValue: false,
//                   label: Text(
//                     "I have read and agree to the terms and conditions",
//                     style: TextStyle(color: Colors.black87),
//                   ),
//                   validators: [
//                     FormBuilderValidators.requiredTrue(
//                       errorText:
//                           "You must accept terms and conditions to continue",
//                     ),
//                   ],
//                   attribute: null,
//                 ),
//               ],
//             ),
//           ),

//           new Container(
//               padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
//               child: Row(
//                 children: <Widget>[
//                   RaisedButton(
//                     child: const Text('BACK'),
//                     color: Colors.yellow,
//                     textColor: Colors.black,
//                     onPressed: () {
//                       Navigator.of(context).pushNamed('/login');
//                     },
//                   ),
//                   RaisedButton(
//                       child: const Text('SIGN UP'),
//                       color: Colors.green,
//                       textColor: Colors.white,
//                       onPressed: () {
//                         register(context);
//                       }

// if (_formKey.currentState.validate()) {

//   send request

//   Navigator.of(context).push(MaterialPageRoute(
//     builder: (context) =>CheckHousehold(address1: address1 ,address2: address2,city:city,district:district ),

//   ));
// }

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
//                         ),
//                   ],
//                   mainAxisAlignment: MainAxisAlignment.center,
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class CheckHousehold extends StatefulWidget {

//   final String address1;
//   final String address2;
//   final String city;
//   final String district;

//   CheckHousehold({this.address1, this.address2, this.city, this.district});

//   @override
//   _CheckHouseholdState createState() => _CheckHouseholdState(address1, address2, city, district);
// }

// class _CheckHouseholdState extends State<CheckHousehold> {

//   String address1;
//   String address2;
//   String city;
//   String district;

//   _CheckHouseholdState(this.address1, this.address2, this.city, this.district);
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
