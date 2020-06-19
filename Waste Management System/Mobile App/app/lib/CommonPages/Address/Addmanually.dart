import 'package:flutter/material.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     

       appBar: AppBar(
      ),
     
     body:Address() ,
    );
  }
}

class Address extends StatefulWidget {
  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
    final _formKey = GlobalKey<FormState>(); 

  TextEditingController address1Controller = TextEditingController();
  TextEditingController address2Controller = TextEditingController();
  TextEditingController city = TextEditingController();
  
  
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
            controller: address1Controller,
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
            controller: address2Controller,
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
            controller: city,
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
                
                onPressed: () {  
                 
                  if (_formKey.currentState.validate()) {  
                     print(address1Controller.text);
                     print(address2Controller.text);
                     print(city.text);
                     

                     Navigator.of(context).pushNamed('/addmanualy');
                  }  
                },  
              )
              
              ),




         ],
      )),




    );
  }
}