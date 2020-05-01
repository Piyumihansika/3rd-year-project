import 'package:app/CommonPages/Login.dart';
import 'package:app/CommonPages/Signup.dart';
import 'package:app/GiveToUs/Dashboard.dart';
import 'package:app/GiveToUs/History.dart';
import 'package:app/GiveToUs/Orders.dart';
import 'package:app/GiveToUs/Profile.dart';
import 'package:app/GiveToUs/Scheduled.dart';
import 'package:app/GiveToUs/SpecialPick.dart';
import 'package:flutter/material.dart';





void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Count Increasing App',
      home:Login() ,

//To write routes names

      routes: <String,WidgetBuilder>{

      //'/second':(context)=>A(),
      '/login':(context)=>Login(),
      '/register':(context)=>Signup(),
     

      //customers give their garbage
 '/dashboard1':(context)=>Dashboard(),
  '/profile':(context)=>Profile(),
   '/history':(context)=>History(),
    '/order':(context)=>Orders(),
     '/special':(context)=>SpecialPick(),
      '/scheduled':(context)=>Scheduled(),
      


      },

    );
  }
}




