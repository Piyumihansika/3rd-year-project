import 'package:flutter/material.dart';
//import 'package:flutter_sparkline/flutter_sparkline.dart';
//import 'package:clay_containers/clay_containers.dart';
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
// SizedBox(
//   height: 60.0,
// ),
// Text("Hello"),
// ClayContainer(
//   height: 300,
//   width: 300,
//   depth: 6,
//   spread: 12,
//   borderRadius: 16,

//   child: Column(
//     children:<Widget>[
// Text(
//   "Total number"
// ),
// Text("356"),
//     ]
//   ),
// ),



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

  // lineColor: Colors.green,
  // pointsMode: PointsMode.all,
  // pointSize: 10.0,
  // pointColor: Colors.black
),
    ]
  ),
   ),
                //color: Colors.green[100],    
                 // print(data.isEmpty ? 0 : data.reduce(max)); 
                       

// child:new Sparkline(
  
//   data: data,
//   lineColor: Colors.green,
//   pointsMode: PointsMode.all,
//   pointSize: 10.0,
//   pointColor: Colors.black


  
  
//   ) ,


                    ),


),
                

                    Container(
  height: 200.0,
   child:Card(
     
                color: Color(0xFFccffcc),    
                 // print(data.isEmpty ? 0 : data.reduce(max)); 
                   //padding: new EdgeInsets.all(32.0),
                  // child: new Column(
                  //   children: <Widget>[
                  //     new Text('Hello World'),
                  //     new Text('How are you?')
                  //   ],
                  // ),    
 child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
    // Row(
    //     children: [
    //       Expanded(
    //         flex: 7,
    //         child: Container(
    //           color: Colors.green,
    //         ),
    //       ),
    //       Expanded(
    //         flex: 3,
    //         child: Container(
    //           color: Colors.yellow,
    //         ),
    //       ),
    //     ],
    //   ),
            const ListTile(
              
              //leading: Icon(Icons.album),
              title: Text('Maximum Woter'),
              
              subtitle: Text('Kaluthara District'),
              
            ),
            Text("jjjjjjjjj"),
            Text("Ffffffff"),
            
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