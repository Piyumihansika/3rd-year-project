import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:dropdownfield/dropdownfield.dart';

String selectedSalutation;
String selectDuration = "";
String selectCategory = "";

final durationSelected = TextEditingController();
final categorySelected = TextEditingController();

List<String> duration = [
  '1 Day',
  '2 Days',
  '3 Days',
  '4 Days',
  '5 Days',
  '6 Days',
  '7 Days',
];

List<String> category = [
  'Polythin',
  'Metal',
  'Organic',
  'Plastic',
  'Silver',
];

class SellItem extends StatefulWidget {
  @override
  _SellItemState createState() => _SellItemState();
}

class _SellItemState extends State<SellItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pushNamed('/dashboard'),
        ),
        title: Text('Add Items To Bid'),
        backgroundColor: Colors.green,
      ),
      body: SellForm(),
    );
  }
}

class SellForm extends StatefulWidget {
  @override
  _SellFormState createState() => _SellFormState();
}

class _SellFormState extends State<SellForm> {
  final _formKey = GlobalKey<FormState>();
//
  File image;
  openGallery(BuildContext context) async {
    var pictures = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = pictures;
    });

    Navigator.of(context).pop();
  }

  Future<void> showChoicedialogbox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: SingleChildScrollView(
                  child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text("Gallery"),
                onTap: () {
                  openGallery(context);
                },
              ),
            ],
          )));
        });
  }

  Widget decide() {
    if (image == null) {
      return CircleAvatar(
        radius: 80,
        backgroundImage: NetworkImage(
            "https://secureservercdn.net/45.40.144.60/f14.f12.myftpupload.com/wp-content/uploads/2017/07/hazardoushouseholdwaste.png"),
      );
    } else {
      return Image.file(image, width: 150, height: 150);
    }
  }

  //

  TextEditingController catagory = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
//  child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,

        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(30.0),
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

//category select
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text("Category"),

                    SizedBox(
                      height: 20.0,
                    ),
// DropDownField(
// controller: categorySelected,
// hintText: "Select item category",

// enabled: true,
// itemsVisibleInDropdown:2,
// items: category,

// onValueChanged: (value){

// setState(() {
//  selectCategory=value;
// });

// },

// ),

// SizedBox(height:20.0),
// Text(selectDuration)
//
                  ],
                ),
              ),

              Padding(padding: const EdgeInsets.all(10.0)),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text("Duration"),
                    SizedBox(
                      height: 20.0,
                    ),
// DropDownField(

// controller: durationSelected,
// hintText: "Select any duration",
// enabled: true,
// itemsVisibleInDropdown:2,
// items: duration,

// onValueChanged: (value){

// setState(() {
//   selectDuration=value;
// });
// },

// ),
                  ],
                ),
              ),

//
              SizedBox(
                height: 20.0,
              ),
              DropdownButtonFormField<String>(
                value: selectedSalutation,
                hint: Text(
                  'Salutation',
                ),
                onChanged: (salutation) =>
                    setState(() => selectedSalutation = salutation),
                validator: (value) => value == null ? 'field required' : null,
                items: ['MR.', 'MS.']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),

//

              Padding(padding: const EdgeInsets.all(7.0)),
              Container(
                  padding: const EdgeInsets.all(20.0),
                  alignment: Alignment(-0.1, 1),
//padding: const EdgeInsets.only(left: 100.0, top: 40.0),
                  child: new RaisedButton(
                    child: const Text('Next'),
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () {
                      if (selectCategory != null && selectDuration != null) {
                        print(selectCategory);
                        print(selectDuration);

                        Navigator.of(context).pushNamed('/upload');
                      }
                      // else{
                      //   return 'Please enter all the fields';
                      // }
                    },
                  )),
            ],
          ),
        ));
  }
}

//
