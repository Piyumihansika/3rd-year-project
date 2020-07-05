import 'package:flutter/material.dart';

class Deactivate extends StatefulWidget {
  @override
  _DeactivateState createState() => _DeactivateState();
}

class _DeactivateState extends State<Deactivate> {

  final _formKey = GlobalKey<FormState>();

  //controller names
  TextEditingController password = TextEditingController();
 







 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),

      body: Form(

key: _formKey,  
       child: SingleChildScrollView(child: Column(  
        crossAxisAlignment: CrossAxisAlignment.start,  
        children: <Widget>[  
          Padding(padding: EdgeInsets.all(20.5)),

Text("When you press deactivate button your account is no longer available",style:TextStyle(

  fontSize:19.0,
  color: Colors.red,
  fontWeight: FontWeight.bold,


)),
 Padding(padding: EdgeInsets.all(15.0)),
          TextFormField(  
            controller:password ,
           
            decoration: const InputDecoration(  
              
              labelText: 'Password', 
              labelStyle:TextStyle(fontWeight: FontWeight.bold,fontSize:22.0,color: Colors.black,),
            ),  
            
            validator: (value) {  
              if (value.isEmpty) {  
                return 'Please enter your password';  
              }  
              return null;  
            },  
          ), 

          new Container(
                padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                child: new RaisedButton(
                  child: const Text('DELETE ACCOUNT'),
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      
                      print(password.text);

                      
                      

                      
                    }
                  },
                )),


        ],




      ),),

      ),
    );

  }
}