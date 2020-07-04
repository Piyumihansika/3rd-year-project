// import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app/utils/ResponseData.dart';
import 'package:http/http.dart' as http;

final String editUrl =
    "https://192.168.8.100:3000/customer/updateCustomer/${ResponseData.userId}";

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final appTitle = 'Edit Profile';
    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.green,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: MyCustomForm(),
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
  //          Profile pic code

  File imageFile;
  openGallery(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = picture;
    });

    Navigator.of(context).pop();
  }

  openCamera(BuildContext context) async {
    var pic = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      imageFile = pic;
    });
    //this is for closing the alert box
//Navigator.of(context).pop();
  }

  Future<void> showChoicedialogbox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Select Your Choice"),
              content: SingleChildScrollView(
                  child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text("Gallery"),
                    onTap: () {
                      openGallery(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(10.5)),
                  GestureDetector(
                    child: Text("Camera"),
                    onTap: () {
                      openCamera(context);
                    },
                  )
                ],
              )));
        });
  }

  Widget decide() {
    if (imageFile == null) {
      return CircleAvatar(
        radius: 80,
        backgroundImage: NetworkImage(
            "https://cdn0.iconfinder.com/data/icons/avatar-78/128/12-512.png"),
      );
    } else {
      return Image.file(imageFile, width: 150, height: 150);
    }
  }

  // TextEditingController newfirstName = TextEditingController();
  // TextEditingController newlastName = TextEditingController();
  // TextEditingController newcontactNumber = TextEditingController();
  String newfirstName;
  String newlastName;
  String newcontactNumber;

  void editProfile() {
    // final Map<String, dynamic> data = {
    //   "firstName": newfirstName,
    //   "lastName": newlastName,
    //   "contactNumber": newcontactNumber,
    // };

    http.put(editUrl, body: {
      "firstName": newfirstName,
      "lastName": newlastName,
      "contactNumber": newcontactNumber
    }, headers: {
      "Accept": "application/json"
    }).then((response) {
      if (response.statusCode == 200) {
        print(
            "-------------------------------------------update successfully----------------------------");
        print(newlastName);
      } else {
        print(response.statusCode);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  decide(),
                  Container(),
                  RaisedButton(
                    child: Text("Select Image"),
                    onPressed: () {
                      showChoicedialogbox(context);
                    },
                  ),
                ],
              ),
            ),

//

            TextFormField(
              // controller: TextEditingController(text: ResponseData.firstName),
              initialValue: ResponseData.firstName,

              decoration: const InputDecoration(
                icon: const Icon(
                  Icons.account_circle,
                  color: Colors.green,
                ),
                hintText: 'Enter your new name',
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
              onChanged: (text) {
                newfirstName = text;
              },
            ),

            TextFormField(
              initialValue: ResponseData.lastName,
              // controller: lastName,
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
              onChanged: (text) {
                newlastName = text;
              },
            ),

            TextFormField(
              initialValue: ResponseData.contactNumber,
              // controller: contactNumber,
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
              onChanged: (text) {
                newcontactNumber = text;
              },
            ),

            new Container(
                padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                child: new RaisedButton(
                  child: const Text('Save'),
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: () {
                    editProfile();
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
