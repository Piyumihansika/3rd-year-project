import 'package:flutter/material.dart';

import 'Buyers/Login.dart';
import 'Buyers/SignUp.dart';
import 'Buyers/ForgotPassword.dart';
import 'Buyers/BuyerHome.dart';
import 'Buyers/ContactUs.dart';
import 'Buyers/AboutUs.dart';
import 'Buyers/Profile.dart';
import 'Buyers/History.dart';
import 'Buyers/Category.dart';
//import 'Buyers/Terms.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // locale: DevicePreview.of(context).locale, // <--- Add the locale
      //builder: DevicePreview.appBuilder,
      title: 'Waste Management App',
      home:Login() ,

//routings here

      routes: <String,WidgetBuilder>{


        '/login':(context)=>Login(),
        '/signup':(context)=>SignUp(),
        '/forgot':(context)=>Forgot(),
        '/buyerhome':(context)=>BuyerHome(),
        '/contactus':(context)=>ContactUs(),
        '/aboutus':(context)=>AboutUs(),
        '/profile':(context)=>Profile(),
        '/history':(context)=>History(),
        '/category':(context)=>Category(),
       // '/terms':(context)=>Terms(),






      },

    );
  }
}





