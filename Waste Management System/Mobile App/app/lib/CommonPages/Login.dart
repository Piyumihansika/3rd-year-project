import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

//import 'package:passwordfield/passwordfield.dart';

class Login extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Login> {

   

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    body:LoginForm(),
//       body: Padding(
//           padding: EdgeInsets.all(10),
//           child: ListView(
//             children: <Widget>[
              
//               Container(
//                   alignment: Alignment.center,
//                   padding: EdgeInsets.all(10),
//                   // child: Text(
//                   //   'Logo',
//                   //   style: TextStyle(
//                   //       color: Colors.blue,
//                   //       fontWeight: FontWeight.w500,
//                   //       fontSize: 30),
//                   // )
//                   child: Image(
//                     image: AssetImage('assets/images/logo.jpg'),
//                     //image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/a/ab/Android_O_Preview_Logo.png'),
//                   )
//                   ),
//               Container(
//                   alignment: Alignment.center,
//                   padding: EdgeInsets.all(10),
//                   child: Text(
//                     'Login',
//                     style: TextStyle(fontSize: 28, color: Colors.green),
//                   )),
//               Container(
//                 padding: EdgeInsets.all(10),
//                 child: TextField(
//                   controller: nameController,
//                   decoration: InputDecoration(
//                     enabledBorder: const OutlineInputBorder(

//                         //borderRadius: BorderRadius.circular(2),
//                         borderSide: BorderSide(width: 2, color: Colors.green)),
//                     labelText: 'User Name',
//                   ),
//                 ),
//               ),


//               // Container(
//               //   padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
//               //   child: PasswordField(
//               //     controller: passwordController,
//               //     color: Colors.green,
//               //     hasFloatingPlaceholder: true,
//               //     //pattern: r'.*[@$#.*].*',
//               //     border: OutlineInputBorder(
//               //         borderRadius: BorderRadius.circular(2),
//               //         borderSide: BorderSide(width: 2, color: Colors.green)),
//               //   ),
//               // ),
//               FlatButton(
//                 onPressed: () {
//                   //forgot password screen

//                    Navigator.of(context).pushNamed('/forgot');
//                 },
//                 textColor: Colors.green,
//                 child: Text('Forgot Password'),
//               ),
//               Container(
//                   height: 50,
//                   padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//                   child: RaisedButton(
//                     textColor: Colors.white,
//                     color: Colors.green,
//                     child: Text('Login'),
//                     onPressed: () {
//                       print(nameController.text);
//                       print(passwordController.text);

//                       Navigator.of(context).pushNamed('/dashboard1');
//                     },
//                   )
//                   ),
//               Container(
//                   child: Row(
//                 children: <Widget>[
//                   Text('Does not have accountb ?'),
//                   FlatButton(
//                     textColor: Colors.green,
//                     child: Text(
//                       'Sign in',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                     onPressed: () {
//                       Navigator.of(context).pushNamed('/register');
//                     },
//                   )
//                 ],
//                 mainAxisAlignment: MainAxisAlignment.center,
//               ))
//             ],
// //

//             //
//           )
//           ),

      //
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.green,

        children: [
          SpeedDialChild(
            child: Icon(Icons.phone_in_talk),
            label: "First",
            
            onTap: () {
              Navigator.of(context).pushNamed('/second');
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.home),
           

            backgroundColor: Colors.yellow,
          ),
          SpeedDialChild(
            child: Icon(Icons.phone_in_talk),
            label: "Career",
            
            onTap: () {
              Navigator.of(context).pushNamed('/logemp');
            },
          ),
        ],
      ),

      //
    );
    
  }
}
class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

   final _formKey = GlobalKey<FormState>();  
  TextEditingController nameController = TextEditingController();
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
                 alignment: Alignment(0.5, 0.5),
              //    width: 80,
              // height: 80,
             image: AssetImage('assets/images/logo.jpg'),
//                     //image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/a/ab/Android_O_Preview_Logo.png'),
  ),
                 ),
                  Container(
                  alignment: Alignment.center,
                  //padding: EdgeInsets.all(10),
                 //padding: const EdgeInsets.only(left: 30.0, top: 5.0),
//                  Align(
//   heightFactor: .30,
//   widthFactor: .30,
//   child: child,
// ),
                  child: Text(
                    'WELCOME',
                    style: TextStyle(fontSize:17, color: Colors.green),
)),
          TextFormField(  
            decoration: const InputDecoration(  
              icon: const Icon(Icons.person,color: Colors.green,),  
              hintText: 'Enter your user name',  
              labelText: 'User Name',  
              labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),
             
              //: true,
              
            ),  
            controller: nameController,
            validator: (value) {  
              if (value.isEmpty) {  
                return 'Please enter user name';  
              }  
              return null;  
            },  
          ),  

              TextFormField(  
            decoration: const InputDecoration(  
              icon: const Icon(Icons.lock,color: Colors.green,),  
              hintText: 'Enter password',  
              labelText: 'Password',  
              labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),
             
              //: true,
              
            ),  
            controller: passwordController,
            validator: (value) {  
              if (value.isEmpty) {  
                return 'Please enter Password';  
              }  
              return null;  
            },  
          ),  



          Container(
            
alignment: Alignment(-0.1,1),
//padding: const EdgeInsets.only(left: 100.0, top: 40.0),  
              child: new RaisedButton(  
                child: const Text('LOG IN'), 
                color: Colors.green, 
                textColor: Colors.white, 
                
                onPressed: () {  
                 
                  if (_formKey.currentState.validate()) {  
                     print(nameController.text);
                    Navigator.of(context).pushNamed('/dashboard1');
                   
                  }  
                },  
              )
            
          ),
 FlatButton(
   padding: const EdgeInsets.only(left: 100.0, top:5.0),  
   
   //alignment: Alignment(-0.1,1),
                onPressed: () {
                  //forgot password screen

                   Navigator.of(context).pushNamed('/forgot');
                },
                textColor: Colors.green,
                child: Text('Forgot Password'),
              ),


 Container(
                  child: Row(
                children: <Widget>[
                  Text('Does not have account ?'),
                  FlatButton(
                    textColor: Colors.green,
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/register');
                    },
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ))
// 





// 
        ],
        
),
      
  
    );

// 





// 


      // 


  }
  


  // 

}
