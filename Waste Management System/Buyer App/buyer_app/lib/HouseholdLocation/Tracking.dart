import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:buyerapp/Models/registermodel.dart';
import 'package:flutter/services.dart';

class Tracking extends StatefulWidget {

  final String firstname;
  final String lastname;
  final String contactNumber;
  final String password;
  final String confirmpass;
  final String email;

  Tracking({ this.firstname,this.lastname,this.contactNumber,this.password,this.confirmpass,this.email});

  @override
  _TrackingState createState() => _TrackingState(firstname,lastname,contactNumber,password,confirmpass,email);
}

class _TrackingState extends State<Tracking> {

  String firstname;
  String lastname;
  String contactNumber;
  String password;
  String confirmpass;
  String email;

  _TrackingState(this.firstname,this.lastname,this.contactNumber,this.password,this.confirmpass,this.email);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location Track"),
        backgroundColor: Colors.green,
      ),
      body: TrackForm(),
    );
  }
}

class TrackForm extends StatefulWidget {

  final String firstname;
  final String lastname;
  final String contactNumber;
  final String password;
  final String confirmpass;
  final String email;

  TrackForm({ this.firstname,this.lastname,this.contactNumber,this.password,this.confirmpass,this.email});

  @override
  _TrackFormState createState() => _TrackFormState(firstname,lastname,contactNumber,password,confirmpass,email);
}

// Http request code

Future<UserModelTrack> createUser(String firstname,String lastname,String contactNumber,String password,String confirmpass,String email,String currentAddress) async {
  final String apiUrl = "Enter  your url here";

  // this is for take response
  final response = await http.post(apiUrl, body: {

    "firstname": firstname,
    "lastname": lastname,
    "contactNumber": contactNumber,
    "password": password,
    "confirmpass": confirmpass,
    "email": email,
    "currentAddress": currentAddress,


  });

  if (response.statusCode == 201) {
    final String responseString = response.body;
    return userModelTrackFromJson(responseString);
  } else {
    return null;
  }
}

class _TrackFormState extends State<TrackForm> {

  String firstname;
  String lastname;
  String contactNumber;
  String password;
  String confirmpass;
  String email;

  UserModelTrack user1;
  _TrackFormState(this.firstname,this.lastname,this.contactNumber,this.password,this.confirmpass,this.email);

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  final _formKey = GlobalKey<FormState>();

  Position currentPosition;
  String currentAddress;
  String temp;

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

          Container(
            child: RaisedButton(
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
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
//                        Navigator.of(context).pushNamed('/buyerhome');

                        //send request
                        final UserModelTrack user =await createUser(firstname, lastname, contactNumber, password, confirmpass, email, currentAddress);
                        setState(() {
                          user1 =
                              user;
                        });

                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>CheckHousehold(currentAddress: currentAddress),

                        ));
                      }
                      //                         Scaffold
//                            .of(context)
//                            .showSnackBar(SnackBar(content: Text('Sending Data'),backgroundColor: Colors.green,));
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

      //     onChanged: (text){
//        currentPosition= text;
//      };

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
      });
    } catch (e) {
      print(e);
    }

  }
}

//chechHousehold

class CheckHousehold extends StatefulWidget {


  final String currentAddress;



  CheckHousehold({this.currentAddress});

  @override
  _CheckHouseholdState createState() => _CheckHouseholdState(currentAddress);
}

class _CheckHouseholdState extends State<CheckHousehold> {


  String currentAddress;



  _CheckHouseholdState(this.currentAddress);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Text(
        currentAddress,
      ),


    );
  }
}

//import 'package:flutter/material.dart';
//import 'package:flutter_form_builder/flutter_form_builder.dart';
//
//class Tracking extends StatefulWidget {
//  @override
//  _TrackingState createState() => _TrackingState();
//}
//
//class _TrackingState extends State<Tracking> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text('Tracked Location'),
//        backgroundColor: Colors.green,),
//      body: SignForm(),
//    );
//  }
//}
//
//class TrackForm extends StatefulWidget {
//  @override
//  _TrackFormState createState() => _STrackFormState();
//}
//
//class _TrackFormState extends State<TrackForm> {
//
//  final _formKey = GlobalKey<TrackForm>();
//
//  TextEditingController locationController = TextEditingController();
//
//  @override
//  Widget build(BuildContext context) {
//    return Form(
//      key: _formKey,
//
//      child: SingleChildScrollView(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//
//          children: <Widget>[
//
//            Container(
//              alignment: Alignment.center,
//              child: Text(''),
//            ),
//
//            Container(
//              alignment: Alignment.center,
//            ),
//
//            //location track
//
//
//
//            //  terms and conditions...
//            Container(
//              padding: EdgeInsets.all(10),
//              child: Column(
//                children: <Widget>[
//                  FlatButton(
//                    padding: const EdgeInsets.only(right: 120.0),
//
//
//                    textColor: Colors.green,
//                    child: Text('Our terms & conditions'
//                    ),
//
//                    onPressed: () {
//                      //terms and condition page
//                      Navigator.of(context).pushNamed('/terms');
//                    },
//                  ),
//                  FormBuilderCheckbox(
//                    initialValue: false,
//                    label: Text(
//                      "I have read and agree to the terms and conditions",
//                      style: TextStyle(color: Colors.black87),),
//                    validators: [
//                      FormBuilderValidators.requiredTrue(
//                        errorText:
//                        "You must accept terms and conditions to continue",
//                      ),
//                    ],
//                  ),
//
//                ],
//              ),
//            ),
//
//            new Container(
//                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
//                child: Row(
//                  children: <Widget>[
//                    RaisedButton(
//                      child: const Text('BACK'),
//                      color: Colors.yellow,
//                      textColor: Colors.black,
//
//                      onPressed: (){
//                        Navigator.of(context).pushNamed('/login');
//                      },
//                    ),
//
//                    RaisedButton(
//                      child: const Text('SIGN UP'),
//                      color: Colors.green,
//                      textColor: Colors.white,
//
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
//                    ),
//
//                  ],
//                  mainAxisAlignment: MainAxisAlignment.center,
//                )
//
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
