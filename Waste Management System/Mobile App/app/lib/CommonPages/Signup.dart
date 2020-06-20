import 'package:app/CommonPages/Address/ChooseRegLocaType.dart';
import 'package:flutter/material.dart';
// import 'package:passwordfield/passwordfield.dart';
 

 
// class Signup extends StatefulWidget {
//   @override
//   _State createState() => _State();
// }
 
// class _State extends State<Signup> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//    TextEditingController addressController = TextEditingController();
// TextEditingController phoneController = TextEditingController();
// TextEditingController firstController = TextEditingController();
// TextEditingController lastController = TextEditingController();

  
//   @override
//   Widget build(BuildContext context) {
//     var scaffold = Scaffold(
     


//         //appBar: AppBar(
//           // title: Text('Sample App'),
//        // ),
//         body: Padding(
//             padding: EdgeInsets.all(10),
//             child: ListView(
//               children: <Widget>[
//                 Container(
//                     alignment: Alignment.center,
//                     padding: EdgeInsets.all(10),
                 
//                      child:Image(
          
//           image: AssetImage('assets/images/logo.jpg'),
//           //image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/a/ab/Android_O_Preview_Logo.png'),
//   )
                    
//                     ),
//                 Container(
//                     alignment: Alignment.center,
//                     padding: EdgeInsets.all(10),
//                     child: Text(
//                       'Register',
//                       style: TextStyle(fontSize: 28,color:Colors.green),
//                     )),
                

//                 Container(
//                   padding: EdgeInsets.all(10),
//                   child: TextField(
//                     controller: firstController,
//                     decoration: InputDecoration(
//                        enabledBorder: const OutlineInputBorder(
                       
//         //borderRadius: BorderRadius.circular(2),
//          borderSide: BorderSide(width: 2, color: Colors.green)
                       
//                       ),
                      
//                       labelText: 'First Name',
//                       //icon: Icon(Icons.account_circle),
//                     ),
//                   ),


//                   // 

//                   // 
//                 ),
                

//                 Container(
//                   padding: EdgeInsets.all(10),
//                   child: TextField(
//                     controller: lastController,
//                     decoration: InputDecoration(
//                        enabledBorder: const OutlineInputBorder(
                       
//         //borderRadius: BorderRadius.circular(2),
//          borderSide: BorderSide(width: 2, color: Colors.green)
                       
//                       ),
                      
//                       labelText: 'Last Name',
//                       //icon: Icon(Icons.account_circle),
//                     ),
//                   ),
//                 ),
                



//                 Container(
//                   padding: EdgeInsets.all(10),
//                   child: TextField(
//                     controller: emailController,
//                     decoration: InputDecoration(
//                         enabledBorder: const OutlineInputBorder(
                       
//         //borderRadius: BorderRadius.circular(2),
//          borderSide: BorderSide(width: 2, color: Colors.green)
                       
//                       ),
                      
//                       labelText: 'Email',
//                       //icon: Icon(Icons.account_circle),
//                     ),
//                   ),
//                 ),
               

                 

                  
//                   Container(
//                   padding: EdgeInsets.all(10),
//                   child: TextField(
//                     controller: addressController,
//                     decoration: InputDecoration(
//                         enabledBorder: const OutlineInputBorder(
                       
//         //borderRadius: BorderRadius.circular(2),
//          borderSide: BorderSide(width: 2, color: Colors.green)
                       
//                       ),
                      
//                       labelText: 'Address',
//                       //icon: Icon(Icons.account_circle),
//                     ),
//                   ),
//                 ),
                
//                 Container(
//                   padding: EdgeInsets.all(10),
//                   child: TextField(
//                     controller: phoneController,
//                     decoration: InputDecoration(
//                       enabledBorder: const OutlineInputBorder(
                       
//         //borderRadius: BorderRadius.circular(2),
//          borderSide: BorderSide(width: 2, color: Colors.green)
                       
//                       ),
                      
//                       labelText: 'Phone Number',
//                       //icon: Icon(Icons.account_circle),
//                     ),
//                   ),
//                 ),
                
//                 Container(
//                   padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//                   child: PasswordField(
//                     controller: passwordController,
//               color: Colors.green,
//               hasFloatingPlaceholder: true,
//               // pattern: r'.*[@$#.*].*',
//               border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(2),
//                   borderSide: BorderSide(width: 2, color: Colors.green)),
//               // focusedBorder: OutlineInputBorder(
//               //     borderRadius: BorderRadius.circular(10),
//               //     borderSide: BorderSide(width: 2, color: Colors.green)),
//               // errorMessage: 'must contain special character either . * @ # \$',
//               ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top:40.0),
//                   height: 50,
//                     padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//                     child: RaisedButton(
//                       textColor: Colors.white,
//                       color: Colors.green,
//                       child: Text('SignUp'),
//                       onPressed: () {
//                         print(firstController.text);
//                         print(lastController.text);
//                         print(emailController.text);
//                         print(addressController.text);
//                         print(phoneController.text);
//                         print(passwordController.text);

//                          //Navigator.of(context).pushNamed('/dashboard1');


//                       },
//                     )),

                  
//               ],
// // 




//               // 
//             )
            
          
            
//             ),
        
            
//             // 
//             );
//     return scaffold;
 
 






//   }
// }
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
String username;
String phone;
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
            hintText: 'Enter an user name',  
            labelText: 'User Name',  
            labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),
            ),  
            onChanged: (text){
             username= text;
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
              phone= text;
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
                        username:username,
                        phone:phone,
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