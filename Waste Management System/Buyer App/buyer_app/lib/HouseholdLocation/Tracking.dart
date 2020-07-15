import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String apiUrl = "ADD URL HERE";

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
  final _formKey = GlobalKey<FormState>();
  // ignore: unused_field
  Position _position;
  StreamSubscription<Position> _streamSubscription;
  Address _address;

  @override
  void initState() {
    super.initState();
    var locationOptions =
        LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
    _streamSubscription = Geolocator()
        .getPositionStream(locationOptions)
        .listen((Position position) {
      setState(() {
        print(position);
        _position = position;
        final coordinates =
            new Coordinates(position.latitude, position.longitude);
        convertCoordinatesToAddress(coordinates)
            .then((value) => _address = value);
      });
    });
  }

  void register(BuildContext context) async {
    print(widget.firstName);

    final Map<String, dynamic> data = {
      "firstName": widget.firstName,
      "lastName": widget.lastName,
      "contactNumber": widget.contactNumber,
      "email": widget.email,
      "password": widget.password,
      "_address": _address.addressLine,
    };
    print(widget.firstName);
    print(_address.addressLine);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location Tracking'),
        backgroundColor: Colors.green,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //     "latitude: ${_position?.latitude ?? '-'}, longitude: ${_position?.longitude ?? '-'}"),
            SizedBox(
              height: 40,
            ),
            Text("Your Location Here",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 20,
            ),
            
            Text("${_address?.addressLine ?? '-'}",style: TextStyle(fontSize: 18,color: Colors.green),),

            SizedBox(
              height: 20,
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
                      style: TextStyle(fontSize: 18),
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
                      style: TextStyle(color: Colors.black, fontSize: 18),
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
                        'Back',
                        style: TextStyle(fontSize: 18),
                      ),
                      color: Colors.yellow,
                      textColor: Colors.black,
                      onPressed: () {
                        Navigator.of(context).pushNamed('/login');
                      },
                    ),
                    RaisedButton(
                      child: const Text(
                        'Sign up',
                        style: TextStyle(fontSize: 18),
                      ),
                      color: Colors.green,
                      textColor: Colors.white,
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          register(context);
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

  @override
  void dispose() {
    super.dispose();
    _streamSubscription.cancel();
  }

  Future<Address> convertCoordinatesToAddress(Coordinates coordinates) async {
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    return addresses.first;
  }
}

