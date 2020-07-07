import 'package:flutter/material.dart';
import 'package:app/utils/ResponseData.dart';



class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Edit Profile';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
          backgroundColor: Colors.green[800],
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class, which holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  // dialog box

  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Save Successful !'),
            actions: <Widget>[
              MaterialButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/dashboard1');
                },
              )
            ],
          );
        });
  }
  //

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              initialValue: ResponseData.firstName,
              decoration: const InputDecoration(
                icon: const Icon(
                  Icons.account_circle,
                  color: Colors.green,
                ),
                

                labelText: 'First Name',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your first name';
                }
                return null;
              },
            ),

            TextFormField(
              initialValue: ResponseData.lastName,
              decoration: const InputDecoration(
                icon: const Icon(
                  Icons.person,
                  color: Colors.green,
                ),
                // hintText: 'Enter your full name',

                labelText: 'Last Name',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your last name';
                }
                return null;
              },
            ),

            TextFormField(
              initialValue: ResponseData.contactNumber,
              decoration: const InputDecoration(
                icon: const Icon(
                  Icons.phone,
                  color: Colors.green,
                ),
                // hintText: 'Enter a phone number',
                labelText: 'Phone',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter valid phone number';
                }
                return null;
              },
            ),

            TextFormField(
              initialValue: ResponseData.address1,
              decoration: const InputDecoration(
                icon: const Icon(
                  Icons.account_balance,
                  color: Colors.green,
                ),
                // hintText: 'Enter your full name',

                labelText: 'Address',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your address';
                }
                return null;
              },
            ),

//address 2
            TextFormField(
              initialValue: ResponseData.address2,
              decoration: const InputDecoration(
               
                labelText: 'Address',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your address';
                }
                return null;
              },
            ),

//city
            TextFormField(
              initialValue: ResponseData.city,
              decoration: const InputDecoration(
                //icon: const Icon(Icons.account_balance,color: Colors.green,),
                // hintText: 'Enter your full name',

                labelText: 'City',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your address';
                }
                return null;
              },
            ),
            TextFormField(
              initialValue: ResponseData.district,
              decoration: const InputDecoration(
                //icon: const Icon(Icons.account_balance,color: Colors.green,),
                // hintText: 'Enter your full name',

                labelText: 'District',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter your address';
                }
                return null;
              },
            ),

            TextFormField(
              initialValue: ResponseData.password,
              decoration: const InputDecoration(
                icon: const Icon(Icons.security, color: Colors.green),
                // hintText: 'Enter your full name',

                labelText: 'Password',
                labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black),
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a valid password';
                }
                return null;
              },
            ),

            
            new Container(
                padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                child: new RaisedButton(
                  child: const Text('Save'),
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      //

                      createAlertDialog(context);
                    }
                  },
                )),
          ],
        ),
      ),
    );
  }
}
