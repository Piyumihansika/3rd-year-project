import 'package:flutter/material.dart';

class Passwordchange extends StatefulWidget {
  @override
  _PasswordchangeState createState() => _PasswordchangeState();
}

class _PasswordchangeState extends State<Passwordchange> {
  
final _formKey = GlobalKey<FormState>();

  //controller names
  TextEditingController oldpassword = TextEditingController();
  TextEditingController newpassword = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
 

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.green,
      ),

      body:Form(
key: _formKey,  
child: SingleChildScrollView(
child: Column(
  crossAxisAlignment: CrossAxisAlignment.start, 
  children: <Widget>[
Padding(padding: EdgeInsets.all(20.5)),

 TextFormField(  
            controller:oldpassword ,
           
            decoration: const InputDecoration(  
              
              labelText: 'Old Password', 
              labelStyle:TextStyle(fontWeight: FontWeight.bold,fontSize:22.0,color: Colors.black,),
            ),  
            
            validator: (value) {  
              if (value.isEmpty) {  
                return 'Please enter your old password';  
              }  
              return null;  
            },  
          ), 

 TextFormField(  
            controller:newpassword ,
           
            decoration: const InputDecoration(  
              
              labelText: 'New Password', 
              labelStyle:TextStyle(fontWeight: FontWeight.bold,fontSize:22.0,color: Colors.black,),
            ),  
            
            validator: (value) {  
              if (value.isEmpty) {  
                return 'Please enter your new  password';  
              }  
              return null;  
            },  
          ), 

 TextFormField(  
            controller:confirmpassword ,
           
            decoration: const InputDecoration(  
              
              labelText: 'Confirm Password', 
              labelStyle:TextStyle(fontWeight: FontWeight.bold,fontSize:22.0,color: Colors.black,),
            ),  
            
            validator: (value) {  
              if (value.isEmpty) {  
                return 'Please re-enter your password';  
              }  
              if(value != newpassword.text){

                return 'Your Password is not same to new one';
              }
                                   
              return null;  
            },  
          ), 

 new Container(
                // padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                padding: const EdgeInsets.all(60.0),
                child: new RaisedButton(
                  child: const Text('UPDATE',style: TextStyle(
                    fontSize:25.0,
                  ),),
                  color: Colors.green,
                textColor: Colors.white,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {


                      
                      print(oldpassword.text);
                      print(newpassword.text);
                      print(confirmpassword.text);
                      

                      
                      

                      
                    }
                  },
                )),


  ],

),

),
        







      )


    );
  }
}