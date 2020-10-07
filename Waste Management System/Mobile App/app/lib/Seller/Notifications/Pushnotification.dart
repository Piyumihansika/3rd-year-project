// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// class Pushnotification extends StatefulWidget {
//   @override
//   _PushnotificationState createState() => _PushnotificationState();
// }

// class _PushnotificationState extends State<Pushnotification> {
  
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
//   AndroidInitializationSettings androidInitializationSettings;
//   IOSInitializationSettings iosInitializationSettings;
//   InitializationSettings initializationSettings;


//   @override
// void initState(){
// super.initState();
// initializing();
// }

// void initializing() async{
//  androidInitializationSettings = AndroidInitializationSettings('app_icon');
// iosInitializationSettings=IOSInitializationSettings(onDidReceiveLocalNotification:onDidReceiveLocalNotification);
//  initializationSettings =InitializationSettings(androidInitializationSettings,iosInitializationSettings);
//  flutterLocalNotificationsPlugin.initialize(initializationSettings,onSelectNotification:onSelectNotification);
//  }

//  void _showNotifications() async{
// await notification();
//  }

// Future<void> notification() async{
//   AndroidNotificationDetails androidNotificationDetails=AndroidNotificationDetails('Channel_ID', 'Channel_title', 'Channel_body',
//   priority: Priority.High,
//   importance: Importance.Max,
//   ticker: 'test'
//   );

// IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();
// NotificationDetails notificationDetails = NotificationDetails(androidNotificationDetails,iosNotificationDetails);

// await flutterLocalNotificationsPlugin.show(0,'helo','world',notificationDetails);
// }

// Future onSelectNotification(String payLoad)async {
//     if (payLoad != null) {
//       debugPrint('notification payload: ' + payLoad);
//     }
//     //await Navigator.push(
//      // context,
//       //MaterialPageRoute(builder: (context) => SecondScreen(payLoad)),
//     //);
// }



// Future onDidReceiveLocalNotification(int id,String title,String body,String payload) async {
// return CupertinoAlertDialog(
// title:Text(title),
// content:Text(body),
// actions: <Widget>[

// CupertinoDialogAction(
  
//   isDefaultAction: true,
//   onPressed: (){
    
//     print(' ');
//   },
//   child: Text('Ok')),
  

// ],

// );
// }

//  @override
//   Widget build(BuildContext context) {
//     return Scaffold(
// appBar: AppBar(
//    leading: IconButton(
//     icon: Icon(Icons.arrow_back, color: Colors.black),
//     onPressed: () => Navigator.of(context).pushNamed('/dashboard'),
//   ), 
//         title: Text("Test",
//       style: TextStyle(color: Colors.white),),
//         backgroundColor: Colors.green,
//       ),

// body: Container(

//   child:Column(
// mainAxisAlignment:MainAxisAlignment.center,
//     children:<Widget>[
// FlatButton(
//   color: Colors.blue,
// onPressed: _showNotifications,
//   child: Text("show notifications"),
// ),
//     ]
//   )
// ),
      
//     );
//   }
// }


// new code

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Pushnotification extends StatefulWidget {
  @override
  PushnotificationState createState() => PushnotificationState();
}

class PushnotificationState extends State<Pushnotification> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  initState() {
    super.initState();
    // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    // If you have skipped STEP 3 then change app_icon to @mipmap/ic_launcher
    var initializationSettingsAndroid =
        new AndroidInitializationSettings('notifi');
    var initializationSettingsIOS = new IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notifications'),
          backgroundColor: Colors.green,
        ),
        backgroundColor: Colors.white,
        body: new Center(
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
              new Container(
                alignment: Alignment.topLeft,
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                        color: Colors.white,
                        style: BorderStyle.solid,
                        width: 2.0),
                    image: DecorationImage(
                      image: AssetImage('assets/images/noti.png'),
                    )),
              ),
              SizedBox(height: 50.0),
              new Text(
                "Click here to show notifications",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30.0),
              new RaisedButton(
                onPressed: _showNotificationCancelBid,
                padding: const EdgeInsets.only(
                    left: 130.0, top: 10.0, bottom: 10.0, right: 130.0),
                child: new Text(
                  'Click',
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                color: Colors.green,
              ),
            ])));
  }

  Future onSelectNotification(String currentBid) async {
    showDialog(
      context: context,
      builder: (_) {
        return new AlertDialog(
          title: Text(
            "Current Bid",
            style: TextStyle(
                fontSize: 23.0, fontWeight: FontWeight.bold, color: Colors.red),
          ),
          content: Text(
            "Current Bid : $currentBid",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        );
      },
    );
  }

  // Future onWinNotification(String currentBid) async {
  //   showDialog(
  //     context: context,
  //     builder: (_) {
  //       return new AlertDialog(
  //         title: Text(
  //           "Congradulations!, you are the winner",
  //           style: TextStyle(
  //               fontSize: 25.0,
  //               fontWeight: FontWeight.bold,
  //               color: Colors.green),
  //         ),
  //         content: Text(
  //           "Your Bid : $currentBid",
  //           style: TextStyle(
  //               fontSize: 25.0,
  //               fontWeight: FontWeight.bold,
  //               color: Colors.green),
  //         ),
  //       );
  //     },
  //   );
  // }

// Method 1
  Future _showNotificationCancelBid() async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'New Alert',
      'Your bid is canceled!',
      platformChannelSpecifics,
      payload: '200',
    );
  }
//method 2
  // Future _showNotificationWinner() async {
  //   var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
  //       'your channel id', 'your channel name', 'your channel description',
  //       sound: 'swiftly', importance: Importance.Max, priority: Priority.High);
  //   var iOSPlatformChannelSpecifics =
  //       new IOSNotificationDetails(sound: "swiftly");
  //   var platformChannelSpecifics = new NotificationDetails(
  //       androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //     0,
  //     'Winner',
  //     'You win the bid',
  //     platformChannelSpecifics,
  //     payload: '5000',
  //   );
  // }

// // Method 3
  // Future _showNotificationWithoutSound() async {
  //   var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
  //       'your channel id', 'your channel name', 'your channel description',
  //       playSound: false, importance: Importance.Max, priority: Priority.High);
  //   var iOSPlatformChannelSpecifics =
  //       new IOSNotificationDetails(presentSound: false);
  //   var platformChannelSpecifics = new NotificationDetails(
  //       androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //     0,
  //     'New Post',
  //     'How to Show Notification in Flutter',
  //     platformChannelSpecifics,
  //     payload: 'No_Sound',
  //   );
  // }
}

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class Notifications extends StatefulWidget {
//   @override
//   _NotificationsState createState() => _NotificationsState();
// }

// class _NotificationsState extends State<Notifications> {
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

//   @override
//   void initState() {
//     super.initState();
//     flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
//     var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
//     var iOS = new IOSInitializationSettings();
//     var initSetttings = new InitializationSettings(android, iOS);
//     flutterLocalNotificationsPlugin.initialize(initSetttings,
//         onSelectNotification: onSelectNotification);
//   }

//   Future onSelectNotification(String payload) async {
//     debugPrint("payload : $payload");
//     showDialog(
//       context: context,
//       builder: (_) => new AlertDialog(
//         title: new Text('Notification'),
//         content: new Text('$payload'),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(
//         title: new Text('Flutter Local Notification'),
//       ),
//       body: new Center(
//         child: new RaisedButton(
//           onPressed: showNotification,
//           child: new Text(
//             'Demo',
//             // ignore: deprecated_member_use
//             style: Theme.of(context).textTheme.headline,
//           ),
//         ),
//       ),
//     );
//   }

//   showNotification() async {
//     var android = new AndroidNotificationDetails(
//         'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
//         priority: Priority.High,importance: Importance.Max
//     );
//     var iOS = new IOSNotificationDetails();
//     var platform = new NotificationDetails(android, iOS);
//     await flutterLocalNotificationsPlugin.show(
//         0, 'New Video is out', 'Flutter Local Notification', platform,
//         payload: 'Nitish Kumar Singh is part time Youtuber');
//   }
// }
