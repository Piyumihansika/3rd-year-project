import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String apiUrl = "";

class TrackingCompany extends StatefulWidget {
  final String companyName;
  final String contactpersonName;
  final String contactpersonNumber;
  final String password;
  final String email;

  const TrackingCompany(
      {Key key,
      this.companyName,
      this.contactpersonName,
      this.contactpersonNumber,
      this.password,
      this.email})
      : super(key: key);

  @override
  _TrackingCompanyState createState() => _TrackingCompanyState();
}

class _TrackingCompanyState extends State<TrackingCompany> {
  TextEditingController address = TextEditingController();

  void register(BuildContext context) async {
    print(widget.companyName);

    final Map<String, dynamic> data = {
      "companyName": widget.companyName,
      "contactpersonName": widget.contactpersonName,
      "contactpersonNumber": widget.contactpersonNumber,
      "email": widget.email,
      "password": widget.password,
      "address": address.text,
    };
    print(widget.companyName);
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






