import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:buyerapp/Models/registermodel.dart';
// import 'package:flutter/services.dart';
import 'dart:convert';

String apiUrl = "";

class Tracking extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String contactNumber;
  final String password;
  final String email;

  const Tracking(
      {Key key,
      this.firstName,
      this.lastName,
      this.contactNumber,
      this.password,
      this.email})
      : super(key: key);

  @override
  _TrackingState createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  TextEditingController address = TextEditingController();

  void register(BuildContext context) async {
    print(widget.firstName);

    final Map<String, dynamic> data = {
      "firstName": widget.firstName,
      "lastName": widget.lastName,
      "contactNumber": widget.contactNumber,
      "email": widget.email,
      "password": widget.password,
      "address": address.text,
    };
    print(widget.firstName);
    print(address.text);
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

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  final _formKey = GlobalKey<FormState>();

  Position currentPosition;
  String currentAddress;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (currentPosition != null) Text(currentAddress),

//          Container(
//            alignment: Alignment.center,
//            child: Text('Your Location Here'),
//          ),

          RaisedButton(
            child: Text(
              "Get location",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            onPressed: () {
              _getCurrentLocation();
            },
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
                      //Navigator.of(context).pushNamed('/buyerhome');
                    },
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              )),
        ],
      ),
    );
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          currentPosition.latitude, currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
        address = currentAddress as TextEditingController;
      });
    } catch (e) {
      print(e);
    }
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
// import 'package:buyerapp/Models/registermodel.dart';
// //import 'package:flutter/services.dart';

// class Tracking extends StatefulWidget {

//   final String firstname;
//   final String lastname;
//   final String contactNumber;
//   final String password;
//   final String confirmpass;
//   final String email;

//   Tracking({ this.firstname,this.lastname,this.contactNumber,this.password,this.confirmpass,this.email});

//   @override
//   _TrackingState createState() => _TrackingState(firstname,lastname,contactNumber,password,confirmpass,email);
// }

// class _TrackingState extends State<Tracking> {

//   String firstname;
//   String lastname;
//   String contactNumber;
//   String password;
//   String confirmpass;
//   String email;

//   _TrackingState(this.firstname,this.lastname,this.contactNumber,this.password,this.confirmpass,this.email);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Location Track"),
//         backgroundColor: Colors.green,
//       ),
//       body: TrackForm(),
//     );
//   }
// }

// class TrackForm extends StatefulWidget {

//   final String firstname;
//   final String lastname;
//   final String contactNumber;
//   final String password;
//   final String confirmpass;
//   final String email;

//   TrackForm({ this.firstname,this.lastname,this.contactNumber,this.password,this.confirmpass,this.email});

//   @override
//   _TrackFormState createState() => _TrackFormState(firstname,lastname,contactNumber,password,confirmpass,email);
// }

// // Http request code

// Future<UserModelTrack> createUser(String firstname,String lastname,String contactNumber,String password,String confirmpass,String email,String currentAddress) async {
//   final String apiUrl = "Enter  your url here";

//   // this is for take response
//   final response = await http.post(apiUrl, body: {

//     "firstname": firstname,
//     "lastname": lastname,
//     "contactNumber": contactNumber,
//     "password": password,
//     "confirmpass": confirmpass,
//     "email": email,
//     "currentAddress": currentAddress,

//   });

//   if (response.statusCode == 201) {
//     final String responseString = response.body;
//     return userModelTrackFromJson(responseString);
//   } else {
//     return null;
//   }
// }

// class _TrackFormState extends State<TrackForm> {

//   String firstname;
//   String lastname;
//   String contactNumber;
//   String password;
//   String confirmpass;
//   String email;

//   UserModelTrack user1;
//   _TrackFormState(this.firstname,this.lastname,this.contactNumber,this.password,this.confirmpass,this.email);

//   final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
//   final _formKey = GlobalKey<FormState>();

//   Position currentPosition;
//   String currentAddress;
//   String temp;

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           if (currentPosition != null) Text(currentAddress),

// //          Container(
// //            alignment: Alignment.center,
// //            child: Text('Your Location Here'),
// //          ),

//           Container(
//             child: RaisedButton(
//               child: Text(
//                 "Get location",
//                 style: TextStyle(
//                   fontSize: 20.0,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.green,
//                 ),
//               ),
//               onPressed: () {
//                 _getCurrentLocation();
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
//                       "You must accept terms and conditions to continue",
//                     ),
//                   ], attribute: null,
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
//                     child: const Text('SIGN UP'),
//                     color: Colors.green,
//                     textColor: Colors.white,
//                     onPressed: () async {
//                       if (_formKey.currentState.validate()) {
// //                        Navigator.of(context).pushNamed('/buyerhome');

//                         //send request
//                         final UserModelTrack user =await createUser(firstname, lastname, contactNumber, password, confirmpass, email, currentAddress);
//                         setState(() {
//                           user1 =
//                               user;
//                         });

//                         Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) =>CheckHousehold(currentAddress: currentAddress),

//                         ));
//                       }
//                       //                         Scaffold
// //                            .of(context)
// //                            .showSnackBar(SnackBar(content: Text('Sending Data'),backgroundColor: Colors.green,));
//                     },
//                   ),
//                 ],
//                 mainAxisAlignment: MainAxisAlignment.center,
//               )),
//         ],
//       ),
//     );
//   }

//   _getCurrentLocation() {
//     geolocator
//         .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
//         .then((Position position) {
//       setState(() {
//         currentPosition = position;
//       });

//       //     onChanged: (text){
// //        currentPosition= text;
// //      };

//       _getAddressFromLatLng();
//     }).catchError((e) {
//       print(e);
//     });
//   }

//   _getAddressFromLatLng() async {
//     try {
//       List<Placemark> p = await geolocator.placemarkFromCoordinates(
//           currentPosition.latitude, currentPosition.longitude);

//       Placemark place = p[0];

//       setState(() {
//         currentAddress =
//         "${place.locality}, ${place.postalCode}, ${place.country}";
//       });
//     } catch (e) {
//       print(e);
//     }

//   }
// }

// //chechHousehold

// class CheckHousehold extends StatefulWidget {

//   final String currentAddress;

//   CheckHousehold({this.currentAddress});

//   @override
//   _CheckHouseholdState createState() => _CheckHouseholdState(currentAddress);
// }

// class _CheckHouseholdState extends State<CheckHousehold> {

//   String currentAddress;

//   _CheckHouseholdState(this.currentAddress);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(

//       ),
//       body: Text(
//         currentAddress,
//       ),

//     );
//   }
// }
