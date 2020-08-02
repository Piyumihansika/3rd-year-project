import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {

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
              new RaisedButton(
                onPressed: _showNotificationCancelBid,
                child: new Text('Show Notification With Sound'),
              ),
            ]
          )
      )
    );
  }

  Future onSelectNotification(String currentBid) async {
    showDialog(
      context: context,
      builder: (_) {
        return new AlertDialog(
          title: Text("Current Bid"),
          content: Text("Current Bid : $currentBid"),
        );
      },
    );
  }

  // Future onWinNotification(String currentBid) async {
  //   showDialog(
  //     context: context,
  //     builder: (_) {
  //       return new AlertDialog(
  //         title: Text("Congradulations!"),
  //         content: Text("Your Bid : $currentBid" ),
  //       );
  //     },
  //   );
  // }


// Future _showNotificationWinner() async {
//   var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
//       'your channel id', 'your channel name', 'your channel description',
//       sound: 'swiftly',
//       importance: Importance.Max,
//       priority: Priority.High);
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

// Method 2
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