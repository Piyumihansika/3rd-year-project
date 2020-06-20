import 'package:flutter/material.dart';

class Check extends StatefulWidget {

 final String address1;
 final String address2;
 final String city;
 
  Check({this.address1,this.address2,this.city});

  @override
  _CheckState createState() => _CheckState(address1,address2,city);
}

class _CheckState extends State<Check> {

  String address1;
 String address2;
  String city;

  _CheckState(this.address1,this.address2,this.city);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      body: Text(
        address1 + address2 + city,
      ),
      

    );
  }
}