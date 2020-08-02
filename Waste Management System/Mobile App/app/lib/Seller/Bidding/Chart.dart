import 'package:flutter/material.dart';
import 'package:flutter_sparkline/flutter_sparkline.dart';


class Chart extends StatefulWidget {
  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {

  var data=[55.0,90.0,40.0,55.0,70.0,10.0,100.0];


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
          child:Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("5 Days Remaining",
              style: TextStyle(

                    fontSize:20,
                    fontWeight:FontWeight.bold,
                    color: Colors.red,
),),
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

SizedBox(height: 20.0,),
Container(
  
  height: 250.0,
   child:Card(
     child:Padding(
       padding: const EdgeInsets.only(left:16.0,right:16.0,top:16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
    children:<Widget>[
Text(
  "Max Price",style: TextStyle(

  fontSize:20,
  fontWeight:FontWeight.bold,
  color: Colors.black,
),
),
Text("356",style: TextStyle(

  fontSize:30.0,
  fontWeight:FontWeight.bold,
  color: Colors.black,
),),

new Sparkline(
  
  data: data,
  fillMode: FillMode.below,
  fillGradient: new LinearGradient(

    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      
      Color(0xFF77b300),
      Color(0xFFa6ff4d),
      Color(0xFFb3ffb3),
      Color(0xFFe6e600),
      Color(0xFFffe066),
     
      
      
      ] 
  ),

  
),
    ]
  ),
   ),
                


                    ),


),
                
SizedBox(height: 12.0,),
                    Container(
  height: 220.0,
   child:Card(
     
                color: Color(0xFFccffcc),    
                 // print(data.isEmpty ? 0 : data.reduce(max)); 
                  
                  
 child: Column(
       
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
  SizedBox(height: 12.0,),
            Text("Highest Bid",
                 style: TextStyle(
                  fontSize:20,
                  fontWeight:FontWeight.bold,
                  color: Colors.green[300],
                
                  )
                  
              ),

  SizedBox(height: 15),

            Text("John Perera",
            style: TextStyle(

            fontSize:18,
            fontWeight:FontWeight.bold,
            color: Colors.black,
            
            
            )
            ),
             Text("0771750655",
            style: TextStyle(

            fontSize:18,
            fontWeight:FontWeight.bold,
            color: Colors.black,
            
            
            )
            ),
             Text("Kaluthara",
            style: TextStyle(

            fontSize:18,
            fontWeight:FontWeight.bold,
            color: Colors.black,
            
            
            )
            ),
            
          new ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                child: const Text('Confirm'),
                color: Colors.green,
                
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),),
                onPressed: () {},
              ),
              FlatButton(
                color: Colors.red,
                child: const Text('Cancel'),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0)),
                textColor: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
        
                
            //
          ],
           
           
            
 )
//


//

          ),
),


            ],
          ),
          ),
),

      
    );
  }
}