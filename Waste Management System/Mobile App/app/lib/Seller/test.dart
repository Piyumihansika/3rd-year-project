import 'package:flutter/material.dart';


  
 



//     myFocusNode = FocusNode();
//     myFocusNode1 = FocusNode();
//   }

//   @override
//   void dispose() {
  
//     myFocusNode.dispose();
// myFocusNode1.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('Text Field Focus'),
//       // ),
//       body: Padding(
//         padding: const EdgeInsets.all(6.0),
//         child: Column(
//           children: [
           
//            Row(
//        children: <Widget>[
//           Text(
//               'First name',
              
//               //autofocus: true,
//             ),
//                   Container(
//                 child: new IconButton(
//                                  icon: new Icon(Icons.edit),
//                                 onPressed:() => myFocusNode.requestFocus(),
//                                ),
                  
            
//               ),
//        ],
//            ),
            

// // 


            
            
//                Container(
//                   child:TextField(
              
//               focusNode: myFocusNode,
              
//             ),
//                ),
              
//             // 


//  Row(
//        children: <Widget>[
//           Text(
//               'Last name',
              
//               //autofocus: true,
//             ),
//                   Container(
//                 child: new IconButton(
//                                  icon: new Icon(Icons.edit),
//                                 onPressed:() => myFocusNode1.requestFocus(),
//                                ),
                  
            
//               ),
//        ],
//            ),

//             // 
//             // 

          


//             TextField(
             
//               focusNode: myFocusNode1,
              
//             ),
            
            
//           ],

          
            
          
//         ),

        
//       ),

//       // 




      // 
      // floatingActionButton: FloatingActionButton(
      //   // When the button is pressed,
      //   // give focus to the text field using myFocusNode.
      //   onPressed: () => myFocusNode.requestFocus(),
      //   tooltip: 'Focus Second Text Field',
      //   child: Icon(Icons.edit),
      // ), 
      
      // This trailing comma makes auto-formatting nicer for build methods.
   // );
  //}
//}

  
  //profile page 



// class Test extends StatelessWidget {  
//   @override  






//   @override  
//   Widget build(BuildContext context) { 

//     // final Size screenSize = MediaQuery.of(context).size;
//     return Form(  
//       key: _formKey,  
      
//       child: Column(  
//         crossAxisAlignment: CrossAxisAlignment.start,  
        
//         children: <Widget>[  

//           Container(
//                   alignment: Alignment.center,
//                   padding: EdgeInsets.all(10),
                
//                   child: Image(
//                     image: AssetImage('assets/images/logo.jpg'),
//                     //image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/a/ab/Android_O_Preview_Logo.png'),
//                   )),
//           TextFormField(  
//             decoration: const InputDecoration(  
//               icon: const Icon(Icons.person,color: Colors.green,),  
//               hintText: 'Enter your first name',  
//               labelText: 'First Name',  
//               labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),
              
                
              
//             ),  
//             controller: firstnameController,
//             validator: (value) {  
//               if (value.isEmpty) {  
//                 return 'Please enter some text';  
//               }  
//               return null;  
//             },  
//           ),  
//           TextFormField(  
//             decoration: const InputDecoration(  
//               icon: const Icon(Icons.phone,color: Colors.green),  
//               hintText: 'Enter your last name',  
//               labelText: 'Last Name', 
//               labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.green), 
//             ),  
//             controller: lastnameController,
//             validator: (value) {  
//               if (value.isEmpty) {  
//                 return 'Please enter some text';  
//               }  
//               return null;  
//             },  
//           ),  
//           TextFormField(  
//             decoration: const InputDecoration(  
//             icon: const Icon(Icons.calendar_today,color: Colors.green),  
//             hintText: 'Enter an user name',  
//             labelText: 'User Name',  
//             labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),
//             ),  
//             controller: usernameController,
//             validator: (value) {  
//               if (value.isEmpty) {  
//                 return 'Please enter some text';  
//               }  
//               return null;  
//             },  
//            ),  

//            TextFormField(  
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

//           TextFormField(  
//             decoration: const InputDecoration(  
//               icon: const Icon(Icons.person,color: Colors.green),  
//               hintText: 'Enter your phone number',  
//               labelText: 'Phone Number', 
//               labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.green), 
              
//             ),  
//             controller: phoneController,
//             validator: (value) {  
//               if (value.isEmpty) {  
//                 return 'Please enter a valid phone number';  
//               }  
//               return null;  
//             },  
//           ), 

//           TextFormField(  
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
//           TextFormField(  
//             decoration: const InputDecoration(  
//               icon: const Icon(Icons.person,color: Colors.green),  
//               hintText: 'Enter a password',  
//               labelText: 'Password',  
//               labelStyle: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),
              
//             ),  
//             controller: passwordController,
//             validator: (value) {  
//               if (value.isEmpty) {  
//                 return 'Please enter a strong password';  
//               }  
//               return null;  
//             },  
//           ),
//           new Container(  
//               padding: const EdgeInsets.only(left: 150.0, top: 40.0),  
//               child: new RaisedButton(  
//                 child: const Text('Submit'), 
//                 color: Colors.green, 
//                 textColor: Colors.white, 
                
//                 onPressed: () {  
                 
//                   if (_formKey.currentState.validate()) {  
//                      print(firstnameController.text);
//                      print(lastnameController.text);
//                      print(usernameController.text);
//                      print(addressController.text);
//                      print(phoneController.text);
//                      print(nearLocationController.text);
//                      print(passwordController.text);
//                   }  
//                 },  
//               )
              
//               ),  
//         ],  
//       ),  
//     );  
      
//   }  
// }  

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Dropdown(),
    );
  }
}
class Dropdown extends StatefulWidget {
  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      

    
    );
  }
}