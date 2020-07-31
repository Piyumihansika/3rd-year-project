import 'package:flutter/material.dart';

class Nobids extends StatelessWidget {
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


body:Container(

  child:Column(
  
 crossAxisAlignment: CrossAxisAlignment.center,
children: <Widget>[


SizedBox(height: 15.0,),
Text("Bidding Cancel ",
style: TextStyle(

                    fontSize:20,
                    fontWeight:FontWeight.bold,
                    color: Colors.black,
),
),

Text("12 July 2020 at 8.30 P.M",
style: TextStyle(

                    fontSize:20,
                    fontWeight:FontWeight.bold,
                    color: Colors.black,
),
),

SizedBox(height: 50.0,),
Text("No Bids For Your Item",
style: TextStyle(

                    fontSize:20,
                    fontWeight:FontWeight.bold,
                    color: Colors.black,
),
),
SizedBox(height: 50.0,),

Text("Max Price : 0",
style: TextStyle(

                    fontSize:20,
                    fontWeight:FontWeight.bold,
                    color: Colors.black,
),
)

]
 ),
) 

 


    );
  }
}