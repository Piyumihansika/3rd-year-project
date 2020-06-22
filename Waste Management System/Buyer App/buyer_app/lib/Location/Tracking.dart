import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class Tracking extends StatefulWidget {
  @override
  _TrackingState createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location Track"),
        backgroundColor: Colors.green,
      ),
      body: SignForm(),
    );
  }
}

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  final _formKey = GlobalKey<FormState>();

  Position _currentPosition;
  String _currentAddress;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (_currentPosition != null) Text(_currentAddress),

          Container(
            alignment: Alignment.center,
            child: Text('Your Location Here'),
          ),

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
                    onPressed: () {
                      Navigator.of(context).pushNamed('/login');
                    },
                  ),
                  RaisedButton(
                    child: const Text('SIGN UP'),
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Navigator.of(context).pushNamed('/buyerhome');
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
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
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
//class SignForm extends StatefulWidget {
//  @override
//  _SignFormState createState() => _SignFormState();
//}
//
//class _SignFormState extends State<SignForm> {
//
//  final _formKey = GlobalKey<FormState>();
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
