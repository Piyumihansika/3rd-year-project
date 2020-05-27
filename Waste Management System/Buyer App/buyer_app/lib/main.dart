import 'package:flutter/material.dart';

import 'Buyers/Login.dart';
import 'Buyers/SignUp.dart';
import 'Buyers/ForgotPassword.dart';
import 'Buyers/BuyerHome.dart';


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
        //'/buyerhome':(context)=>BuyerHome(),






      },

    );
  }
}





