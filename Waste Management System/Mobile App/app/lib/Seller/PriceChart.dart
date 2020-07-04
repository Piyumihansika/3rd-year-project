import 'package:flutter/material.dart';
class PriceChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
   leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.black),
    onPressed: () => Navigator.of(context).pushNamed('/dashboard'),
  ), 
        title: Text("Price Chart",
      style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.green,
      ),


    );
  }
}