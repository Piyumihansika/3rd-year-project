import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final String apiUrl = "http://192.168.8.100:3000/customer/addCustomer";

class Address extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String contactNumber;
  final String password;

  const Address(
      {Key key,
      this.firstName,
      this.lastName,
      this.email,
      this.contactNumber,
      this.password})
      : super(key: key);

  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController address1 = TextEditingController();
  TextEditingController address2 = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController district = TextEditingController();

  void register(BuildContext context) async {
    final Map<String, dynamic> data = {
      "firstName": widget.firstName,
      "lastName": widget.lastName,
      "contactNumber": widget.contactNumber,
      "email": widget.email,
      "password": widget.password,
      "address1": address1.text,
      "address2": address2.text,
      "city": city.text,
      "district": district.text
    };
    print(widget.firstName);
    print(address1.text);
    print(
        "----------------------------------------------OK----------------------------------------------------");

    print(data.toString());
    var response = await http.post(apiUrl, body: data, encoding: Encoding.getByName("application/json"));
    if (response.statusCode == 200) {
      
      //This line added by piyumi
      Navigator.of(context).pushNamed('/login');
      print(response.statusCode);
      print(response.body);
    } else {
      print(response.statusCode);
      print("error occured");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            //  title: Text(
            //    phone + firstname,
            //    ),
            ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                child: Text('Enter Your Address'),
              ),

              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: address1,
                  scrollPadding: EdgeInsets.all(10),
                  decoration: const InputDecoration(
                    //icon: const Icon(Icons.person,color: Colors.green,),
                    hintText: 'Address 1',
                    labelText: 'Address 1',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  // onChanged: (text) {
                  //   address1 = text;
                  // },
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
                child: TextFormField(
                  controller: address2,
                  scrollPadding: EdgeInsets.all(10),
                  decoration: const InputDecoration(
                    //icon: const Icon(Icons.person,color: Colors.green,),
                    hintText: 'Address 2',
                    labelText: 'Address 2',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  ),               
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
                child: TextFormField(
                  controller: city,
                  scrollPadding: EdgeInsets.all(10),
                  decoration: const InputDecoration(
                    //icon: const Icon(Icons.person,color: Colors.green,),
                    hintText: 'City',    
                    labelText: 'City',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),

              //for district
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: district,
                  scrollPadding: EdgeInsets.all(10),
                  decoration: const InputDecoration(
                    //icon: const Icon(Icons.person,color: Colors.green,),
                    hintText: 'District',
                    labelText: 'District',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  // onChanged: (text) {
                  //   district = text;
                  // },
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
                    child: const Text('SUBMIT'),
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        register(context);

                      }
                    },
                  )),
            ],
          )),
        ));
  }
}
