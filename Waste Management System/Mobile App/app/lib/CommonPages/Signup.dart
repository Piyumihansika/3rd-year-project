import 'package:flutter/material.dart';
import 'package:passwordfield/passwordfield.dart';
 

 
class Signup extends StatefulWidget {
  @override
  _State createState() => _State();
}
 
class _State extends State<Signup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   TextEditingController addressController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController firstController = TextEditingController();
TextEditingController lastController = TextEditingController();

  
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
                 
                     child:Image(
          
          image: AssetImage('assets/images/logo.jpg'),
          //image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/a/ab/Android_O_Preview_Logo.png'),
  )
                    
                    ),
                Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 28,color:Colors.green),
                    )),
                

                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: firstController,
                    decoration: InputDecoration(
                       enabledBorder: const OutlineInputBorder(
                       
        //borderRadius: BorderRadius.circular(2),
         borderSide: BorderSide(width: 2, color: Colors.green)
                       
                      ),
                      
                      labelText: 'First Name',
                      //icon: Icon(Icons.account_circle),
                    ),
                  ),


                  // 

                  // 
                ),
                

                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: lastController,
                    decoration: InputDecoration(
                       enabledBorder: const OutlineInputBorder(
                       
        //borderRadius: BorderRadius.circular(2),
         borderSide: BorderSide(width: 2, color: Colors.green)
                       
                      ),
                      
                      labelText: 'Last Name',
                      //icon: Icon(Icons.account_circle),
                    ),
                  ),
                ),
                



                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                       
        //borderRadius: BorderRadius.circular(2),
         borderSide: BorderSide(width: 2, color: Colors.green)
                       
                      ),
                      
                      labelText: 'Email',
                      //icon: Icon(Icons.account_circle),
                    ),
                  ),
                ),
               

                 

                  
                  Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: addressController,
                    decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                       
        //borderRadius: BorderRadius.circular(2),
         borderSide: BorderSide(width: 2, color: Colors.green)
                       
                      ),
                      
                      labelText: 'Address',
                      //icon: Icon(Icons.account_circle),
                    ),
                  ),
                ),
                
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                       
        //borderRadius: BorderRadius.circular(2),
         borderSide: BorderSide(width: 2, color: Colors.green)
                       
                      ),
                      
                      labelText: 'Phone Number',
                      //icon: Icon(Icons.account_circle),
                    ),
                  ),
                ),
                
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: PasswordField(
                    controller: passwordController,
              color: Colors.green,
              hasFloatingPlaceholder: true,
              // pattern: r'.*[@$#.*].*',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(2),
                  borderSide: BorderSide(width: 2, color: Colors.green)),
              // focusedBorder: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(10),
              //     borderSide: BorderSide(width: 2, color: Colors.green)),
              // errorMessage: 'must contain special character either . * @ # \$',
              ),
                ),
                Container(
                  margin: EdgeInsets.only(top:40.0),
                  height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.green,
                      child: Text('SignUp'),
                      onPressed: () {
                        print(firstController.text);
                        print(lastController.text);
                        print(emailController.text);
                        print(addressController.text);
                        print(phoneController.text);
                        print(passwordController.text);

                         //Navigator.of(context).pushNamed('/dashboard1');


                      },
                    )),

                  
              ],
// 




              // 
            )
            
          
            
            ),
        
            
            // 
            );
    return scaffold;
 
 






  }
}