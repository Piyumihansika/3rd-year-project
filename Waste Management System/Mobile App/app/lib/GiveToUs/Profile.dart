import 'package:flutter/material.dart';
//import 'package:flutter/cupertino.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(

        child:Image(
          
          
          image: AssetImage('assets/images/logo.jpg'),
          //image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/a/ab/Android_O_Preview_Logo.png'),
  )
      ),
    );
  }
}