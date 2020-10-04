// import 'package:buyerapp/Categories/Aluminum_test.dart';
import 'package:buyerapp/Categories/OtherMetals.dart';
import 'package:buyerapp/Categories/PaperCardboard.dart';
import 'package:buyerapp/Categories/Plastic.dart';
import 'package:buyerapp/Categories/RuneLandsConcrete.dart';
import 'package:buyerapp/Categories/Scrap.dart';
import 'package:buyerapp/Categories/Specials.dart';
import 'package:buyerapp/Categories/Stainless.dart';
import 'package:buyerapp/Categories/Wood.dart';
import 'package:buyerapp/bidding/auctionDetails.dart';
import 'package:flutter/material.dart';

import 'Buyers/Login.dart';
import 'Buyers/ForgotPassword.dart';
import 'Buyers/BuyerHome.dart';
import 'Buyers/ContactUs.dart';
import 'Buyers/AboutUs.dart';
import 'Categories/Brash.dart';
import 'Categories/Glass.dart';
import 'Categories/Trash.dart';
import 'bidding/Report.dart';
import 'settings/Profile.dart';
import 'settings/companyProfile.dart';
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
import 'settings/Notification.dart';
import 'settings/ChangePassword.dart';
import 'settings/DeactivateAccount.dart';
import 'settings/ChangeLocation.dart';
import 'settings/Search.dart';

import 'Categories/Copper.dart';
// import 'Categories/Aluminum_test.dart';
import 'Categories/Aluminium.dart';
import 'Categories/Polythene.dart';

import 'bidding/Bid.dart';

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
      home: Login(),

//routings here

      routes: <String, WidgetBuilder>{
        '/login': (context) => Login(),
        '/forgot': (context) => Forgot(),
        '/buyerhome': (context) => BuyerHome(),
        '/contactus': (context) => ContactUs(),
        '/aboutus': (context) => AboutUs(),
        '/profile': (context) => Profile(),
        '/companyProfile': (context) => CompanyProfile(),
        '/history': (context) => History(),
        '/category': (context) => Category(),
        '/usertype': (context) => UserType(),

        //househld user
        '/getlocation': (context) => GetLocation(),
        '/manually': (context) => Manually(),
        '/tracking': (context) => Tracking(),
        '/signuphousehold': (context) => SignUpHousehold(),

        //company users
        '/manuallycompany': (context) => ManuallyCompany(),
        '/trackingcompany': (context) => TrackingCompany(),
        '/getlocationcompany': (context) => GetLocationCompany(),
        '/signupcompany': (context) => SignUpCompany(),
        // '/terms':(context)=>Terms(),

        //settings
        '/settings': (context) => SettingPage(),
        '/notifications': (context) => Notifications(),
        '/changepassword': (context) => PasswordChange(),
        '/deactivateaccount': (context) => DeactivateAccount(),
        '/changelocation': (context) => ChangeLocation(),

        //categories

        '/aluminium': (context) => Aluminium(),
        '/brash': (context) => Brash(),
        '/copper': (context) => Copper(),
        '/glass': (context) => Glass(),
        '/bid': (context) => Bid(),
        '/search': (context) => Search(),
        '/polythene': (context) => Polythene(),
        '/plastic': (context) => Plastic(),
        '/scrap': (context) => Scrap(),
        '/trash': (context) => Trash(),
        '/landconcrete': (context) => RuneLandConcrete(),
        '/othermetals': (context) => OtherMetals(),
        '/papercardboard': (context) => PaperCardboard(),
        '/specials': (context) => Specials(),
        '/stainless': (context) => Stainless(),
        '/wood': (context) => Wood(),
        '/auctiondetail': (context) => AuctionDetail(),
        '/report': (context) => Report(),
      },
    );
  }
}
