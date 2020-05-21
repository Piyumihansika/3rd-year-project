import 'package:app/CommonPages/Login.dart';
import 'package:app/CommonPages/Signup.dart';
import 'package:app/Employees/Login.dart';
import 'package:app/GiveToUs/Dashboard.dart';
import 'package:app/GiveToUs/History.dart';
import 'package:app/GiveToUs/Orders.dart';
import 'package:app/GiveToUs/Profile.dart';
import 'package:app/GiveToUs/Scheduled.dart';
import 'package:app/GiveToUs/Sellitem.dart';
import 'package:app/GiveToUs/SpecialPick.dart';
import 'package:app/GiveToUs/SpecialSecond.dart';
import 'package:app/GiveToUs/test.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

import 'CommonPages/ForgotPsw.dart';




void main() {
  
runApp(
  DevicePreview(
    builder: (context) => MyApp(),
  ),
);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.of(context).locale, // <--- Add the locale
      builder: DevicePreview.appBuilder,
      title: 'Waste Management App',
      home:Login() ,

//To write routes names

      routes: <String,WidgetBuilder>{

      //'/second':(context)=>A(),
      '/login':(context)=>Login(),
      '/register':(context)=>SignUp(),
      '/forgot':(context)=>Forgot(),
     

      //customers give their garbage
 '/dashboard1':(context)=>Dashboard(),
  '/profile':(context)=>Profile(),
   '/history':(context)=>History(),
    '/order':(context)=>Orders(),
     '/special':(context)=>SpecialPick(),
      '/scheduled':(context)=>Scheduled(),
        '/addGarbageList':(context)=>AddList(),
        '/sell':(context)=>SellItem(),
        '/test':(context)=>Test(),

      
//employee 

  '/logemp':(context)=>Loginemp(),

      },

    );
  }
}




