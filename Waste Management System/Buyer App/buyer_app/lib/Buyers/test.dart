// import 'dart:convert';

// import 'package:dropdownfield/dropdownfield.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;
// import 'package:tt/Screens/Tourist/Tourist/Login.dart';
// import 'package:tt/Widgets/LabelTextField.dart';

// //will be updated

// String apiUrl = "http://10.0.2.2:8000/api";

// class RegistrationPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => _RegistrationState();
// }

// class _RegistrationState extends State<RegistrationPage> {

//   Map<String, dynamic> formData;
//   List<String> types = [
//     'guide',
//     'tourist'
//   ];

//   _RegistrationState(){
//     formData={

//     };
//   }
//   // Controllers
//   TextEditingController username = TextEditingController();
//   TextEditingController password = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController cnfirmPassowrd = TextEditingController();
//   TextEditingController type = TextEditingController();

//   void register(BuildContext context) async {
//     final Map<String, dynamic> data = {
//       "email": email.text,
//       "password": password.text,
//       "name": username.text,
//       "password_confirmation": cnfirmPassowrd.text,
//       "userType": type.text,
//       "rating": "3",
//       'status': "pending",
//     };

//     if (type.text == "tourist" || type.text == "guide") {
//       var response = await http.post(apiUrl + '/register',
//           body: data, encoding: Encoding.getByName("application/json"));
//       if (response.statusCode == 200) {
//         if (type.text == "tourist") {
//           print(response.statusCode);
//           Navigator.pushReplacement(
//               context, MaterialPageRoute(builder: (context) => Login()));
//         } else if (type.text == "guide") {
//           print(response.statusCode);
//           Navigator.pushReplacement(
//               context, MaterialPageRoute(builder: (context) => Login()));
//         }
        
//       Fluttertoast.showToast(msg: "Successfully registered");
//       } else {
//         print("Cant rout");
//         print(response.statusCode);
//       Fluttertoast.showToast(msg: "Enter valid data");
//       }
//     } else {
//       Fluttertoast.showToast(msg: "Enter valid user type");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomPadding: false,
//       appBar: AppBar(
//         title: Text(
//           "Sign Up",
//           style: TextStyle(color: Colors.black),
//         ),
//         backgroundColor: Theme.of(context).canvasColor,
//         iconTheme: Theme.of(context).iconTheme,
//         elevation: 0,
//       ),
//       body: Container(
//         decoration: BoxDecoration(color: Colors.orangeAccent.withOpacity(0.2)),
//         child: Form(
//           child: ListView(
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
//                 child: Column(
//                   children: <Widget>[
//                     SizedBox(
//                       height: 16,
//                     ),
//                     LabelTextField(
//                         hintText: 'Username',
//                         labelText: 'Enter your username',
//                         validator: null),
//                     SizedBox(
//                       height: 16,
//                     ),
//                     LabelTextField(
//                         hintText: 'name',
//                         textEditingController: username,
//                         labelText: 'Enter your name',
//                         validator: null),
//                     SizedBox(
//                       height: 16,
//                     ),
//                     LabelTextField(
//                         textEditingController: email,
//                         hintText: 'you@example.com',
//                         labelText: 'E-mail Address',
//                         keyboardType: TextInputType.emailAddress,
//                         validator: null),
//                     SizedBox(
//                       height: 16,
//                     ),
//                     LabelTextField(
//                         textEditingController: password,
//                         hintText: 'Password',
//                         labelText: 'Enter your password',
//                         isObscure: true,
//                         validator: null),
//                     SizedBox(height: 16),
//                     LabelTextField(
//                         textEditingController: cnfirmPassowrd,
//                         hintText: 'Confirm password',
//                         labelText: 'Re enter the password',
//                         isObscure: true,
//                         validator: null),
//                     SizedBox(height: 16),
//                     DropDownField(
//                         value: formData['Type'],
//                         required: true,
//                         hintText: 'Choose a type',
//                         labelText: 'Type *',
//                         items: types,
//                         strict: true,
//                         controller: type,
//                         setter: (dynamic newValue) {
//                           formData['Type'] = newValue;
//                         }),
//                     _registerButton(context),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _registerButton(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 16.0),
//             child: RaisedButton(
//                 color: Colors.teal,
//                 padding: EdgeInsets.symmetric(vertical: 16.0),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8)),
//                 child: Text(
//                   'Sign Up',
//                   style: Theme.of(context)
//                       .textTheme
//                       .headline
//                       .copyWith(color: Colors.white),
//                 ),
//                 onPressed: () {
//                   if (username.text.isEmpty == true ||
//                       password.text.isEmpty == true ||
//                       email.text.isEmpty == true ||
//                       cnfirmPassowrd.text.isEmpty == true ||
//                       type.text.isEmpty == true) {
//                     Fluttertoast.showToast(msg: "Please fill all the fields");
//                   } else {
//                     register(context);
//                   }
//                 }),
//           ),
//         ),
//       ],
//     );
//   }
// }