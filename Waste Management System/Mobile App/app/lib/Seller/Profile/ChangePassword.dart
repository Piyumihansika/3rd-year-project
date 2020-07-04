import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


final String apiUrl = "http://10.0.2.2:3000/ADD URL";

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
 
void updatePassword(BuildContext context) async {
    final Map<String, dynamic> data = {
      
      "password": newpassword.text,

     
    };
    print(oldpassword.text);
    print(newpassword.text);
    print(confirmpassword.text);
    print(
        "----------------------------------------------OK----------------------------------------------------");

    print(data.toString());
    var response = await http.post(apiUrl, body: data, encoding: Encoding.getByName("application/json"));
    if (response.statusCode == 200) {
      
      Navigator.of(context).pushNamed('/login');
      print(response.statusCode);
      print(response.body);
    } else {
      print(response.statusCode);
      print("error occured");
    }
  }





  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.black),
    onPressed: () => Navigator.of(context).pushNamed('/setting'),
  ), 
  title: Text("Change Password"),
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
                      
                      updatePassword(context);
                      
                      

                      
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