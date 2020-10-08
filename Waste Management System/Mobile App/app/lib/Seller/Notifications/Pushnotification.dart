
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



}
