import 'package:flutter/material.dart';

class ChangeLocation extends StatefulWidget {
  ChangeLocation({Key key}) : super(key: key);

  @override
  _ChangeLocationState createState() => _ChangeLocationState();
}

class _ChangeLocationState extends State<ChangeLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Green wasteland'),
        backgroundColor: Colors.green,
      ),
    );
  }
}