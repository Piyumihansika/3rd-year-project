//import 'dart:html';
import 'package:app/CommonPages/Address/Addmanually.dart';
//import 'package:app/CommonPages/Address/Tracking.dart';
import 'package:app/CommonPages/Homepage.dart';
//import 'package:app/CommonPages/Address/checkpassdata.dart';
import 'package:app/CommonPages/Login.dart';
import 'package:app/CommonPages/Signup.dart';
import 'package:app/CommonPages/UploadFile.dart';
import 'package:app/Employees/Login.dart';
import 'package:app/Seller/Bidding/BiddingDetails.dart';
import 'package:app/Seller/Bidding/Chart.dart';
import 'package:app/Seller/Bidding/NoBidds.dart';
import 'package:app/Seller/Bidding/BiddingItems.dart';
import 'package:app/Seller/Dashboard.dart';
import 'package:app/Seller/History.dart';
import 'package:app/Seller/Notifications/Pushnotification.dart';
import 'package:app/Seller/Orders.dart';
import 'package:app/Seller/PriceChart.dart';
import 'package:app/Seller/Profile.dart';
import 'package:app/Seller/Profile/ChangePassword.dart';
import 'package:app/Seller/Profile/EditProfile.dart';
import 'package:app/Seller/Profile/deactivate.dart';
import 'package:app/Seller/Scheduled.dart';
import 'package:app/Seller/SettingPage.dart';
import 'package:app/Seller/SpecialPick.dart';
import 'package:app/Seller/SpecialSecond.dart';
import 'package:app/Seller/test.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'CommonPages/Address/ChooseRegLocaType.dart';
import 'CommonPages/Address/RegisterLocation.dart';
import 'CommonPages/ForgotPsw.dart';
import 'Seller/History.dart';
import 'Seller/Sell_Items/Sellitempage1.dart';
import 'Seller/Notifications/Notification.dart';

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
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.of(context).locale, // <--- Add the locale
      builder: DevicePreview.appBuilder,
      title: 'Waste Management App',
      home: Login(),

//To write routes names

      routes: <String, WidgetBuilder>{
        //'/second':(context)=>A(),
        '/login': (context) => Login(),
        '/register': (context) => SignUp(),
        '/forgot': (context) => Forgot(),

        '/homepage': (context) => HomePage(),
        '/dashboard': (context) => Dashboard(),
        '/price': (context) => PriceChart(),

        //seller

        '/dashboard1': (context) => Dashboard(),
        '/profile': (context) => Profile(),
        '/history': (context) => History(),
        '/order': (context) => Orders(),
        '/special': (context) => SpecialPick(),
        '/scheduled': (context) => Scheduled(),
        '/addGarbageList': (context) => AddList(),
        '/sell': (context) => SellItem(),
        '/test': (context) => Test(),
        '/setting': (context) => SettingPage(),
        '/editProfile': (context) => EditProfile(),
        '/deactivate': (context) => Deactivate(),
        '/changepassword': (context) => Passwordchange(),
        '/biddingDetails': (context) => BiddingDetails(),
        '/biddingItems': (context) => BiddingItems(),
        '/chart': (context) => Chart(),
        '/nobids': (context) => Nobids(),
        '/notification': (context) => Notifications(),
        '/push': (context) => Pushnotification(),
        // '/track':(context)=>Tracking(),

//register pages
        '/choosetype': (context) => ChooseLocaType(),
        '/addmanualy': (context) => Address(),
        '/reg3': (context) => Reglocation(),

        // '/check':(context)=>Check(),
//employee

        '/logemp': (context) => Loginemp(),
        '/upload': (context) => UploadImageDemo(),
      },
    );
  }
}
