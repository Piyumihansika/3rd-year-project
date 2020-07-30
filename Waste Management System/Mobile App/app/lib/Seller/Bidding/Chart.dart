import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';

class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {

  var data=[0.0,1.0,1.5,2.0,3.5,0.1];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.black),
    onPressed: () => Navigator.of(context).pushNamed('/biddingDetails'),
  ), 
  title: Text("Bidding Details"),
        backgroundColor: Colors.green,
      ),

body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

                   Card(
                 color: Colors.green,     
                      

child:new Sparkline(
  
  data: data,
  lineColor: Colors.black,
  pointsMode: PointsMode.all,
  pointSize: 10.0,
  pointColor: Colors.white,


  
  
  ) ,

                    ),

                    Container(

                    ),



            ],
          ),
),

      
    );
  }
}