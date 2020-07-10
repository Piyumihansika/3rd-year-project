import 'dart:convert';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



final String apiUrl = "http://10.0.2.2:3000/forgot/sendEmail";


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


  
  final _formKey = GlobalKey<FormState>();  

//Done by piyumi

   TextEditingController email = TextEditingController();

void emailpass(BuildContext context) async {

  final Map<String, dynamic> data = {
      "email": email.text,
    
    };
    print(email);

     var response = await http.post(apiUrl,
        body: data, encoding: Encoding.getByName("application/json"));
    if (response.statusCode == 200) {

      createAlertDialog(context);

      print(response.statusCode);
      print(response.body);
    } else {
      Navigator.of(context).pushNamed('/forgot');
      print(response.statusCode);
      print("error occured");
    }
}
    
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
                 'Forgot Password ?',
                 
                 style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.green),
               ),
               
                 ),

                 Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
               child: new Text(
                 'We just need your registered email address to send you password reset  ',
                 
                 style:TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color: Colors.green),
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
            controller: email,

        
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
                child: const Text('Reset Password'), 
                color: Colors.green, 
                textColor: Colors.white, 
                
                onPressed: () {  
                 
                  if (_formKey.currentState.validate()) {  
                     

                  emailpass(context);
                  }  
                },  
              )
            
          )
        ],
),
      
    );
  }
}