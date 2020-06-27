import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
   elevation: 4.0,
        title: Text('Edit Profile',style: TextStyle(color:Colors.black,fontWeight:FontWeight.bold,),),
        backgroundColor: Colors.lightGreen[200],
        brightness: Brightness.light,
        iconTheme: IconThemeData(color:Colors.black),
      ),
      
    );
  }
}