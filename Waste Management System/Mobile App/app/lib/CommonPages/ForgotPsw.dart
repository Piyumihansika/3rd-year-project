import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
//import 'package:email_validator/email_validator.dart';
//import 'package:passwordfield/passwordfield.dart';

class Forgot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.green,
      body:ForgotForm(), 
    );
  }
}
class ForgotForm extends StatefulWidget {
  @override
  _ForgotFormState createState() => _ForgotFormState();
}

class _ForgotFormState extends State<ForgotForm> {

  // 
createAlertDialog(BuildContext context){
  return showDialog(context: context,builder: (context){
    return AlertDialog(
      title: Text('Check Your Email '),
      
      actions: <Widget>[
        MaterialButton(
          child: Text('OK'),
          onPressed: (){
Navigator.of(context).pushNamed('/login');
          },
        )
      ],
    );
  });
}

//email validater
bool validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(value)) ? false : true;
}

  // 
  final _formKey = GlobalKey<FormState>();  
   TextEditingController firstnameController = TextEditingController();
     TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
 key: _formKey, 
child: Column(  
        crossAxisAlignment: CrossAxisAlignment.start,  
        
        children: <Widget>[  


          Container(

                  alignment: Alignment.center,
                  
                  padding: EdgeInsets.all(10),
         
               child: Image(
                 alignment: Alignment(0.00000005, 0.00000005),
              //    width: 80,
              // height: 80,
             image: AssetImage('assets/images/lock.png'),

  ),
                 ),
          Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
               child: new Text(
                 'Forgot Your Password ?',
                 
                 style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.green),
               ),
                 ),
          TextFormField(  
            decoration: const InputDecoration(  
              icon: const Icon(Icons.person,color: Colors.green,),  
              //hintText: 'Type Your Email',  
              labelText: 'Type Your Email',  
              labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),
             
              //: true,
              
            ),  
            controller: firstnameController,

        
            validator: (value) {  
              if (value.isEmpty) {  
                return 'Please enter an Email ';  
              }  else{
                 assert(EmailValidator.validate(value));
                 return 'Please enter a valid Email '; 
              }
              //return null;  
            },  


             
             
          ),  


          Container(

padding: const EdgeInsets.only(left: 150.0, top: 40.0),  
              child: new RaisedButton(  
                child: const Text('Submit'), 
                color: Colors.green, 
                textColor: Colors.white, 
                
                onPressed: () {  
                 
                  if (_formKey.currentState.validate()) {  
                     print(firstnameController.text);
                    createAlertDialog(context);
                  }  
                },  
              )
            
          )
        ],
),
      
    );
  }
}