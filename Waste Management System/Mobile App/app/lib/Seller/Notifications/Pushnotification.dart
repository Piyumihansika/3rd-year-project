import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
class Pushnotification extends StatefulWidget {
  @override
  _PushnotificationState createState() => _PushnotificationState();
}

class _PushnotificationState extends State<Pushnotification> {
  
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings androidInitializationSettings;
  IOSInitializationSettings iosInitializationSettings;
  InitializationSettings initializationSettings;


  @override
void initState(){
super.initState();
initializing();
}

void initializing() async{
 androidInitializationSettings = AndroidInitializationSettings('app_icon');
iosInitializationSettings=IOSInitializationSettings(onDidReceiveLocalNotification:onDidReceiveLocalNotification);
 initializationSettings =InitializationSettings(androidInitializationSettings,iosInitializationSettings);
 flutterLocalNotificationsPlugin.initialize(initializationSettings,onSelectNotification:onSelectNotification);
 }

 void _showNotifications() async{
await notification();
 }

Future<void> notification() async{
  AndroidNotificationDetails androidNotificationDetails=AndroidNotificationDetails('Channel_ID', 'Channel_title', 'Channel_body',
  priority: Priority.High,
  importance: Importance.Max,
  ticker: 'test'
  );

IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();
NotificationDetails notificationDetails = NotificationDetails(androidNotificationDetails,iosNotificationDetails);

await flutterLocalNotificationsPlugin.show(0,'helo','world',notificationDetails);
}

Future onSelectNotification(String payLoad)async {
    if (payLoad != null) {
      debugPrint('notification payload: ' + payLoad);
    }
    //await Navigator.push(
     // context,
      //MaterialPageRoute(builder: (context) => SecondScreen(payLoad)),
    //);
}



Future onDidReceiveLocalNotification(int id,String title,String body,String payload) async {
return CupertinoAlertDialog(
title:Text(title),
content:Text(body),
actions: <Widget>[

CupertinoDialogAction(
  
  isDefaultAction: true,
  onPressed: (){
    
    print(' ');
  },
  child: Text('Ok')),
  

],

);
}

 @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
   leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.black),
    onPressed: () => Navigator.of(context).pushNamed('/dashboard'),
  ), 
        title: Text("Test",
      style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
      ),

body: Container(

  child:Column(
mainAxisAlignment:MainAxisAlignment.center,
    children:<Widget>[
FlatButton(
  color: Colors.blue,
onPressed: _showNotifications,
  child: Text("show notifications"),
),
    ]
  )
),
      
    );
  }
}