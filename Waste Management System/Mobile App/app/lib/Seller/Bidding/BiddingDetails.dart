
import 'package:flutter/material.dart';



String name ='Polythin bag';
String date ='14.5.2020';



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
        title: Text("Items",
      style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.green[100],  

//
 body: SingleChildScrollView(
 padding: const EdgeInsets.all(16.0),

 child: Column(
 crossAxisAlignment: CrossAxisAlignment.start,
children: <Widget>[

// 


for (int i = 0; i < 2; i++) 
Card(
      
child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
         ListTile(
          leading: Icon(Icons.shopping_cart, size: 50),
          title: Text("Polythin"),
          subtitle: Text('date'),
          trailing: Icon(Icons.keyboard_arrow_right),
         onTap: (){

           if(5 == null){
        Navigator.of(context).pushNamed('/chart');

           }
           else{
             Navigator.of(context).pushNamed('/nobids');
           }
             
         },



        ),
      ],
    ),
),
    

Container(
              alignment: Alignment(-0.1, 1),
              child: new RaisedButton(
                child: const Text('LOGIN'),
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () async {
                 //print(_score);
                 //print(n);
                },
              )),




 ],

 ),

 )


    );
  }
}

