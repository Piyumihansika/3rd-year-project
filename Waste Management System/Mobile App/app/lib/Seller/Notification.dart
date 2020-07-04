import 'package:flutter/material.dart';
class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(
   leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.black),
    onPressed: () => Navigator.of(context).pushNamed('/dashboard'),
  ), 
        title: Text("NOTIFICATION",
      style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.green[100],     
    
    );
  }
}