import 'package:flutter/material.dart';

import 'Buyers/Login.dart';
import 'Buyers/ForgotPassword.dart';
import 'Buyers/BuyerHome.dart';
import 'Buyers/ContactUs.dart';
import 'Buyers/AboutUs.dart';
import 'settings/Profile.dart';
import 'Buyers/History.dart';
import 'Categories/Category.dart';
import 'Buyers/UserType.dart';

import 'Buyers/SignUpHousehold.dart';
import 'HouseholdLocation/GetLocation.dart';
import 'HouseholdLocation/Manually.dart';
import 'HouseholdLocation/Tracking.dart';

import 'Buyers/SignUpCompany.dart';
import 'CompanyLocation/GetLocationCompany.dart';
import 'CompanyLocation/ManuallyCompany.dart';
import 'CompanyLocation/TrackingCompany.dart';

import 'settings/Settings.dart';

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
        '/forgot':(context)=>Forgot(),
        '/buyerhome':(context)=>BuyerHome(),
        '/contactus':(context)=>ContactUs(),
        '/aboutus':(context)=>AboutUs(),
        '/profile':(context)=>Profile(),
        '/history':(context)=>History(),
        '/category':(context)=>Category(),
        '/usertype':(context)=>UserType(),

        //househld user
        '/getlocation':(context)=>GetLocation(),
        '/manually':(context)=>Manually(),
        '/tracking':(context)=>Tracking(),
        '/signuphousehold':(context)=>SignUpHousehold(),


        //company users
        '/manuallycompany':(context)=>ManuallyCompany(),
        '/trackingcompany':(context)=>TrackingCompany(),
        '/getlocationcompany':(context)=>GetLocationCompany(),
        '/signupcompany':(context)=>SignUpCompany(),
        // '/terms':(context)=>Terms(),

        //settings
        '/settings':(context)=>Settings(),






      },

    );
  }
}







