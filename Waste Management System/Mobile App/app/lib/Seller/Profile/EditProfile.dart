import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

String firstname = 'piyumi';
String lastname = 'hansi';
String contactNumber = 'hdghdhj';

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
        backgroundColor: Colors.lightGreen[200],
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

  //
  Future<File> imageFile;

// File imageF;
// openGallery(BuildContext context)async{
//   var picture=await ImagePicker.pickImage(source: ImageSource.gallery);
//   this.setState(() {
//     imageF=picture;
//   });
//   Navigator.of(context).pop();
// }

  pickImageFromGallery(ImageSource source) {
    setState(() async {
      imageFile = ImagePicker.pickImage(source: source);
    });
//Navigator.of(context).pop();
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return Image.file(
            snapshot.data,
            width: 100,
            height: 150,
            fit: BoxFit.cover,
          );
        } else if (snapshot.error != null) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(
                "https://cdn0.iconfinder.com/data/icons/avatar-78/128/12-512.png"),
          );
          // return const Text(
          //   'No Image selected',
          //   textAlign: TextAlign.center,
          // );
        }
      },
    );
  }

  // Widget decide(){
  //   if(imageF==null){
  //     return Text("No image selected");
  //   }else{
  //    return  Image.file(imageF,width:400,height:400);
  //   }
  // }


  
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // ********//

            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
// Text("No image "),
//Image.file(imageF,width:400,height:400),
                  //decide(),
                  Container(),
                  showImage(),
                  RaisedButton(
                    child: Text("Select Image"),
                    onPressed: () {
                      pickImageFromGallery(ImageSource.gallery);
// openGallery(context);
                    },
                  ),
                  //  decide(),
                ],
              ),
            ),

//

            TextFormField(
              initialValue: firstname,
              decoration: const InputDecoration(
                icon: const Icon(
                  Icons.account_circle,
                  color: Colors.green,
                ),
                // hintText: 'Enter your full name',

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
              initialValue: lastname,
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
              initialValue: "0771750655",
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

// ********//

// Container(

//   child: Column(
//     mainAxisAlignment:MainAxisAlignment.center,
//     children:<Widget>[

//       showImage(),
//     RaisedButton(
//       child:Text("Select Image from gallery") ,
//       onPressed: (){

// pickImageFromGallery(ImageSource.gallery);
//       },
//       )
//     ],

//   ),
// ),

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
