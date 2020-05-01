import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:passwordfield/passwordfield.dart';
 

 
class Login extends StatefulWidget {
  @override
  _State createState() => _State();
}
 
class _State extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
     
        //appBar: AppBar(
          // title: Text('Sample App'),
       // ),
        body: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    // child: Text(
                    //   'Logo',
                    //   style: TextStyle(
                    //       color: Colors.blue,
                    //       fontWeight: FontWeight.w500,
                    //       fontSize: 30),
                    // )
                     child:Image(
          
          image: AssetImage('assets/images/logo.jpg'),
          //image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/a/ab/Android_O_Preview_Logo.png'),
  )
                    
                    ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 28,color:Colors.green),
                    )),
               
              
                Container(
                  padding: EdgeInsets.all(10),


          
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                    
                    enabledBorder: const OutlineInputBorder(
                       
        //borderRadius: BorderRadius.circular(2),
         borderSide: BorderSide(width: 2, color: Colors.green)
                       
                      ),
                      
                      labelText: 'User Name',
                      
                    ),
                  ),
                
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: PasswordField(
                    controller: passwordController,
              color: Colors.green,
              hasFloatingPlaceholder: true,
              //pattern: r'.*[@$#.*].*',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide: BorderSide(width: 2, color: Colors.green)),
              
              ),
                ),
                FlatButton(
                  onPressed: (){
                    //forgot password screen
                  },
                  textColor: Colors.green,
                  child: Text('Forgot Password'),
                ),
                Container(
                  height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.green,
                      child: Text('Login'),
                      onPressed: () {
                        print(nameController.text);
                        print(passwordController.text);

                         Navigator.of(context).pushNamed('/dashboard1');


                      },
                    )),
                Container(
                  child: Row(
                    children: <Widget>[
                      Text('Does not have accountb ?'),
                      FlatButton(
                        textColor: Colors.green,
                        child: Text(
                          'Sign in',
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed('/register');
                        },
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                ))
              ],
// 




              // 
            )
            
          
            
            ),
            
            // 
floatingActionButton: SpeedDial(

animatedIcon: AnimatedIcons.menu_close,
backgroundColor:Colors.green
 ,
// curve: Curves.easeIn,
children: [

  SpeedDialChild(
    child: Icon(Icons.phone_in_talk),
    label: "First",
    // onTap: ()=>print("firstone"),
     onTap: (){
Navigator.of(context).pushNamed('/second');

     },
  ),
  SpeedDialChild(

     child: Icon(Icons.home),
    // label: "second",
    
    backgroundColor: Colors.yellow,
  )
],

),
            
// floatingActionButton: Row(
//   children: [
//     RaisedButton(child: Text('Button1'), onPressed: (){}),
//     RaisedButton(child: Text('Button1'), onPressed: (){}),
//   ]
// ),
          
            
            // 
            );
    return scaffold;
 
 






  }
}