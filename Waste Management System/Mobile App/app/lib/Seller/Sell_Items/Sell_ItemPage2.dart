import 'package:flutter/material.dart';

class SellItemPage2 extends StatefulWidget {
  @override
  _SellItemPage2State createState() => _SellItemPage2State();
}

class _SellItemPage2State extends State<SellItemPage2> {
    final _formKey = GlobalKey<FormState>();

  // TextEditingController description = TextEditingController();
  // TextEditingController price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
         leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.black),
    onPressed: () => Navigator.of(context).pushNamed('/dashboard'),
  ), 
          title: Text('Add Item Images'),
          backgroundColor: Colors.green,  
        ),  
        body: Form(
           key: _formKey,  
          

           child: SingleChildScrollView(child: Column(
mainAxisAlignment: MainAxisAlignment.center, 
        
        children: <Widget>[




Container(

alignment: Alignment(-0.1,1),
//padding: const EdgeInsets.only(left: 100.0, top: 40.0),  
              child: new RaisedButton(  
                child: const Text('ADD TO BID'), 
                color: Colors.green, 
                textColor: Colors.white, 
                
                onPressed: () {  
                 

                 
                    //Navigator.of(context).pushNamed('/dashboard1');
                  if (_formKey.currentState.validate()) {  
                 
        
                   
                  }  
                },  
              )

),



        ],
           ),),

          
          
          
          ), 
    );
  }
}
