import 'package:flutter/material.dart';

class BiddingDetails extends StatefulWidget {
  @override
  _BiddingDetailsState createState() => _BiddingDetailsState();
}

class _BiddingDetailsState extends State<BiddingDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
   leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.black),
    onPressed: () => Navigator.of(context).pushNamed('/dashboard'),
  ), 
        title: Text("BIDDING",
      style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.green[100],  
    );
  }
}