import 'package:app/CommonPages/Address/ChooseRegLocaType.dart';
import 'package:flutter/material.dart';

 

               

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignForm(),
    );
  }
}

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {

  final _formKey = GlobalKey<FormState>();  
  
  //controller names

  // TextEditingController firstnameController = TextEditingController();
  // TextEditingController lastnameController = TextEditingController();
  // TextEditingController usernameController = TextEditingController();
  // TextEditingController addressController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();
  // TextEditingController nearLocationController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();


String firstname;
String lastname;
String email;
String contactNumber;
String password;
  @override
  Widget build(BuildContext context) {
    return Form(  
      key: _formKey,  
      
      child: SingleChildScrollView(child: Column(
mainAxisAlignment: MainAxisAlignment.center,
        
        children: <Widget>[  

          Container(
                  alignment: Alignment.center,
                  //padding: EdgeInsets.all(10),
                
                  child: Image(
                     alignment: Alignment(0.5, 0.5),
                    image: AssetImage('assets/images/logo.jpg'),
                    //image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/a/ab/Android_O_Preview_Logo.png'),
                  )
                  ,
                  
                  
                  ),
                  Container(
                  alignment: Alignment.center,
              
                  child: Text(
                    'REGISTER',
                    style: TextStyle(fontSize:17, color: Colors.green),
)),
         
         Container(
           padding: EdgeInsets.all(10),
           child:
TextFormField(  
             scrollPadding: EdgeInsets.all(10),
            decoration: const InputDecoration(  
              icon: const Icon(Icons.person,color: Colors.green,),  
              hintText: 'Enter your first name',  
              labelText: 'First Name',  
              labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),
              
                
              
            ),  
            onChanged: (text){
              firstname= text;
            },
           // controller: firstnameController,
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
              icon: const Icon(Icons.phone,color: Colors.green),  
              hintText: 'Enter your last name',  
              labelText: 'Last Name', 
              labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.green), 
            ),  
            onChanged: (text){
              lastname= text;
            },
            //controller: lastnameController,
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
            icon: const Icon(Icons.calendar_today,color: Colors.green),  
            hintText: 'Enter an email',  
            labelText: 'Emai',  
            labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),
            ),  
            onChanged: (text){
             email= text;
            },
           // controller: usernameController,
            validator: (value) {  
              if (value.isEmpty) {  
                return 'Please enter some text';  
              }  
              return null;  
            },  
           ),  

            ),
          
//           Container(
//             padding: EdgeInsets.all(10),
//             child: 
// TextFormField(  
//    scrollPadding: EdgeInsets.all(10),
//             decoration: const InputDecoration(  
//               icon: const Icon(Icons.person,color: Colors.green),  
//               hintText: 'Enter your address',  
//               labelText: 'Address',  
//               labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),
              
//             ),  
//             controller: addressController,
//             validator: (value) {  
//               if (value.isEmpty) {  
//                 return 'Please enter some text';  
//               }  
//               return null;  
//             },  
//           ), 
//           ),
           
           Container(
             padding: EdgeInsets.all(10),
             child: 
TextFormField(  
   scrollPadding: EdgeInsets.all(10),
            decoration: const InputDecoration(  
              icon: const Icon(Icons.person,color: Colors.green),  
              hintText: 'Enter your phone number',  
              labelText: 'Phone Number', 
              labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.green), 
              
            ), 
            onChanged: (text){
              contactNumber= text;
            }, 
            //controller: phoneController,
            validator: (value) {  
              if (value.isEmpty) {  
                return 'Please enter a valid phone number';  
              }  
              return null;  
            },  
          ), 

           ),

          
//           Container(
//             padding: EdgeInsets.all(10),
// child: 
// TextFormField(  
//             decoration: const InputDecoration(  
//               icon: const Icon(Icons.person,color: Colors.green),  
//               hintText: 'Enter a near by center',  
//               labelText: 'Service Center',  
//               labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),
              
//             ),  
//             controller: nearLocationController,
//             validator: (value) {  
//               if (value.isEmpty) {  
//                 return 'Please select a service center';  
//               }  
//               return null;  
//             },  
//           ), 
//           ),
          
//password field

          Container(
            padding: EdgeInsets.all(10),
child: 
TextFormField(  
  scrollPadding: EdgeInsets.all(10),
            decoration: const InputDecoration(  
              icon: const Icon(Icons.person,color: Colors.green),  
              hintText: 'Enter a password',  
              labelText: 'Password',  
              labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),
              
            ), 
            onChanged: (text){
              password= text;
            }, 
            //controller: passwordController,
            validator: (value) {  
              if (value.isEmpty) {  
                return 'Please enter a strong password';  
              }  
              return null;  
            },  
          ),
          ),
          
          new Container(  
              padding: const EdgeInsets.only(left: 150.0, top: 40.0),  
              child: new RaisedButton(  
                child: const Text('Next'), 
                color: Colors.green, 
                textColor: Colors.white, 
                
                onPressed: () {  
                 
                  if (_formKey.currentState.validate()) {  
                    //  print(firstnameController.text);
                    //  print(lastnameController.text);
                    //  print(usernameController.text);
                    // //  print(addressController.text);
                    //  print(phoneController.text);
                    // //  print(nearLocationController.text);
                    // print(passwordController.text);

                    // Navigator.of(context).pushNamed('/choosetype');
Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>ChooseLocaType(
                        firstname:firstname ,
                        lastname:lastname,
                        email:email,
                       contactNumber:contactNumber,
                        password:password
                        
                        ),
                      
                      ));

                    // 
                  }  
                },  
              )
              
              ),  
        ],  
      ), 
    ), 
    ); 
  }
}