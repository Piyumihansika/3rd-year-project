import 'package:app/CommonPages/Address/checkpassdata.dart';
import 'package:app/Models/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Add extends StatefulWidget {
final String firstname;
final String lastname;
final String username;
final String phone;
final String password;

Add({this.firstname,this.lastname,this.username,this.phone,this.password});
  @override
  _AddState createState() => _AddState(firstname, lastname,username,phone, password );
}

class _AddState extends State<Add> {
  String firstname;
String lastname;
String username;
String phone;
String password;

_AddState(this.firstname,this.lastname,this.username,this.phone,this.password);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     

       appBar: AppBar(
        //  title: Text(
        //    phone + firstname,
        //    ),
      ),
     
     body:Address() ,
    );
  }
}

class Address extends StatefulWidget {
  final String firstname;
final String lastname;
final String username;
final String phone;
final String password;
Address({this.firstname,this.lastname,this.username,this.phone,this.password});

  @override
  _AddressState createState() => _AddressState(firstname, lastname,username,phone, password);
}

// Http request code

Future<UserModel> createUser(String firstname,String lastname,String username,String phone,String password,String address1,String address2,String city) async{

final String apiUrl = "Enter  your url here";

// this is for take response

final response = await http.post(apiUrl,body:{

"firstname":firstname,
"lastname":lastname,
"username":username,
"phone":phone,
"password":password,
"address1":address1,
"address2":address2,
"city":city
});
if(response.statusCode == 201){
  final String responseString = response.body;
  return userModelFromJson(responseString);
}else{
  return null;
}


}



// 

class _AddressState extends State<Address> {

String firstname;
String lastname;
String username;
String phone;
String password;

UserModel user1;

_AddressState(this.firstname,this.lastname,this.username,this.phone,this.password);
    final _formKey = GlobalKey<FormState>(); 

  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
 // TextEditingController city = TextEditingController();
  
  String address1;
  String address2;
  String city;

  @override
  Widget build(BuildContext context) {
    return Form(
      
key: _formKey,  
      
      child: SingleChildScrollView(child: Column(
mainAxisAlignment: MainAxisAlignment.center,
        
        children: <Widget>[ 

Container(
           padding: EdgeInsets.all(10),
            

            
           child:Text('Enter Your Address'),
      

         ),


 Container(
           padding: EdgeInsets.all(10),
           child:
   TextFormField(  
             scrollPadding: EdgeInsets.all(10),
            decoration: const InputDecoration(  
              //icon: const Icon(Icons.person,color: Colors.green,),  
              hintText: 'Address 1',  
              //labelText: 'First Name',  
              labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),
              
                
              
            ),  
            onChanged: (text){
              address1= text;
            },
           // controller: address1Controller,
            validator: (value) {  
              if (value.isEmpty) {  
                return 'Please enter some text';  
              }  
              return null;  
            },  
          ), 

       ),


         Container(
           padding: EdgeInsets.all(10),
           child:
   TextFormField(  
             scrollPadding: EdgeInsets.all(10),
            decoration: const InputDecoration(  
              //icon: const Icon(Icons.person,color: Colors.green,),  
              hintText: 'Address 2',  
              //labelText: 'First Name',  
              labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),
              
                
              
            ), 
            onChanged: (text){
              address2= text;
            }, 
            //controller: address2Controller,
            validator: (value) {  
              if (value.isEmpty) {  
                return 'Please enter some text';  
              }  
              return null;  
            },  
          ), 

       ),
          

          
         Container(
           padding: EdgeInsets.all(10),
           child:
   TextFormField(  
             scrollPadding: EdgeInsets.all(10),
            decoration: const InputDecoration(  
              //icon: const Icon(Icons.person,color: Colors.green,),  
              hintText: 'City',  
              //labelText: 'First Name',  
              labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),
              
                
              
            ),  
            onChanged: (text){
              city= text;
            },
            //controller: city,
            validator: (value) {  
              if (value.isEmpty) {  
                return 'Please enter some text';  
              }  
              return null;  
            },  
          ), 

       ),
  new Container(  
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),  
              child: new RaisedButton(  
                child: const Text('SAVE'), 
                color: Colors.green, 
                textColor: Colors.white, 
                
                onPressed: () async{  
                 
                  if (_formKey.currentState.validate()) {  
                    
                    //send request
                    final UserModel user =await createUser(firstname, lastname, username, phone, password, address1, address2, city);
                    setState(() {
                      user1 = 
                      user;
                    });

                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>Check(address1: address1 ,address2: address2,city:city),
                      
                      ));
                  }  
                },  
              )
              
              ),




         ],
      )),




    );
  }
}