import 'package:flutter/material.dart';
class AddList extends StatefulWidget {
  @override
  _AddListState createState() => _AddListState();
}

class _AddListState extends State<AddList> {

    bool _isChecked = true;

  List<String> _texts = [
    "InduceSmile.com," "Flutter.io",
    "google.com",
    "youtube.com",
    "yahoo.com",
    "gmail.com"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CheckBox in ListView Example"),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: _texts.map((text) => CheckboxListTile(
          title: Text(text),
                        value: _isChecked,
                        onChanged: (val) {
                          setState(() {
                            _isChecked = val;
                            
                          });
                        },
        )).toList(),



    ),
    );
    
  }
}