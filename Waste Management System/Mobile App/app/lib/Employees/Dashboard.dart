import 'package:flutter/material.dart';

class EmpDash extends StatefulWidget {
  @override
  _EmpDashState createState() => _EmpDashState();
}

class _EmpDashState extends State<EmpDash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar:AppBar(
        title:Text('hello employee')
      )
    );
  }
}