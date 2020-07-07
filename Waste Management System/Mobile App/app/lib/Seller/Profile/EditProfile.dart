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


class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  // dialog box

  createAlertDialog(BuildContext context) {
    print("----------------------------------------------------");
    print("${ResponseData.userId}" + "uid");
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Save Successful !'),
            actions: <Widget>[
              MaterialButton(
                child: Text('OK'),
                onPressed: () {
                  // Navigator.of(context).pushNamed('/');
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
    backgroundImage: AssetImage('assets/images/icon.jpg'),
        // backgroundImage: NetworkImage(
        //     "https://cdn0.iconfinder.com/data/icons/avatar-78/128/12-512.png"),
      );
    } else {
      return Image.file(imageFile, width: 150, height: 150);
    }
  }

  String newfirstName;
  String newlastName;
  String newcontactNumber;

  // void editProfile(BuildContext context) async {
  //   // final Map<String, dynamic> data = {
  //   //   "firstName": newfirstName,
  //   //   "lastName": newlastName,
  //   //   "contactNumber": newcontactNumber,
  //   // };

  //   var response = await http.put(editUrl, body: {
  //     "firstName": "jkdg",
  //     "lastName": "fdbkjf",
  //     "contactNumber": "fbdlh"
  //   }, headers: {
  //     "Accept": "application/json"
  //   });
  //   if (response.statusCode == 200) {
  //     print(
  //         "-------------------------------------------update successfully----------------------------");
  //     print(newlastName);
  //   } else {
  //     print(response.statusCode);
  //   }
  // }
//

  editData() async {
    await http.put(editUrl, headers: {
      "Accept": "application/json",
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjliNTg2MWVlNTg0ZGJkZGI5MDc1NDc3YTQ1ZDQ3ZDM5NGNiMzU2ZGIxZjBhMjUwZDUyZjk0YmViNGQwOTM3NTI0ZTM0MGNhMzBiYWM5NDAwIn0.eyJhdWQiOiIxIiwianRpIjoiOWI1ODYxZWU1ODRkYmRkYjkwNzU0NzdhNDVkNDdkMzk0Y2IzNTZkYjFmMGEyNTBkNTJmOTRiZWI0ZDA5Mzc1MjRlMzQwY2EzMGJhYzk0MDAiLCJpYXQiOjE1NTg1NTMyMTMsIm5iZiI6MTU1ODU1MzIxMywiZXhwIjoxNTkwMTc1NjEzLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.sFIfXVx72efT54J40TVkqh3rwMGW-anTulNMDnVvGh_eO_qz0oKRl56JYCBwPQchc7fTbG5ZkVwaf_oU85rzjq3hrgXaOIzOoaNYsAKTOpPVbPi26bqpMLCWFe26hZO3BmS_kCSSD_-WlYVOlEw5oXQt1_MHV1eBt0tbXFLkgNwvkFr9IOvySINVsDOVoCArvp2Cx-XYthIP-0JuC7yQny5byMKerRGDO8pIjKLnPTTi9YWo36KU1SlzqoK-IJrQFvi5ir-rKk93IFCXwNoRN9QwXATb_4uJJyhpv2WLtXQwpnlPFqQFad8L0I8y9pfyzXnDtl3Aq1G3OlZMHbKcXp4uV8uByuT7UzI_FW6a0ion3Id1P3wy65n-X2OW2rDH6cpoCaz5_yzkpUfeo5WQ0RpG7q_VbWon2rf2NpbV8Jyzg80Woz3eNaQPA8-hdR5qUeeGXXulwfcT_sQln2uBmC3Ke2gbI1cKrBa4gVFpip9055lhgXfKzBvNkhV2dUljawBGacb0p4C1irkz6ygTzMu_31r2KHuzXiKQvbaEmorHGOLdvrwr-L2cqUmM3_jeAMmrV2_Pe4nRJHsvOLOYpB6ELNdeX8_DhD7DWUa6pdeU2PpRsXvwaGLbAkah9z7hCa54HGCzSLJPhN813nTXHuK_biSxIlH5n3ruvHiP6Rw'
    }, body: {
      "firstName": "djkfbk",
      "lastName": "kdjbfh",
      "contactNumber": "fdfbkdj"
    }).then((value) {
      value.statusCode == 200 ? print("success") : print(value.statusCode);
    });
  }

  @override
  Widget build(BuildContext context) {
    
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


            TextFormField(
              // controller: TextEditingController(text: ResponseData.firstName),
              // initialValue: ResponseData.firstName,

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
              // initialValue: ResponseData.lastName,
              // controller: lastName,
              decoration: const InputDecoration(
                icon: const Icon(
                  Icons.person,
                  color: Colors.green,
                ),
                

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
              // initialValue: ResponseData.contactNumber,
              // controller: contactNumber,
              decoration: const InputDecoration(
                icon: const Icon(
                  Icons.phone,
                  color: Colors.green,
                ),
               
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
                    print(
                        "----------------------------------------------------");
                    print("${ResponseData.userId}" + "uid");
                    if (_formKey.currentState.validate()) {
                      //
                      editData();
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
