


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

// 
class Item{
  int id;
  String name;
 
  Item(this.id, this.name);
 
  static List<Item> getItems() {
    return <Item>[
      Item(1, 'Select A Category'),
      Item(2, 'Polythin'),
      Item(3, 'Metal'),
      Item(4, 'Organic'),
      Item(5, 'Plastic'),
      Item(6, 'Silver'),
    ];
  }
}


// 







class _SellFormState extends State<SellForm> {
String itemname;
String time;

  // 
  List<Item> _items = Item.getItems();
List<DropdownMenuItem<Item>> _dropdownMenuItems;
Item _selectedItem;
@override
void initState() {
  _dropdownMenuItems = buildDropdownMenuItems(_items);
  _selectedItem = _dropdownMenuItems[0].value;
  super.initState();
}
 
List<DropdownMenuItem<Item>> buildDropdownMenuItems(List itemcategory) {
  List<DropdownMenuItem<Item>> items = List();
  for (Item item in itemcategory) {
    items.add(
      DropdownMenuItem(
        value: item,
        child: Text(item.name),
      ),
    );
  }
  return items;
}

onChangeDropdownItem(Item selectedItem) {
  setState(() {
    _selectedItem = selectedItem;

  });
}
 
  // ****   //



  // 












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
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,  
//  child: Column(  
//         crossAxisAlignment: CrossAxisAlignment.start, 
 
      child: SingleChildScrollView(child: Column(
mainAxisAlignment: MainAxisAlignment.center, 
        
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


Container(
  
  child: Column(
    
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              //Text("Item Category"),
              SizedBox(
                height: 20.0,
              ),
            DropdownButton(
              
                value: _selectedItem,
                items: _dropdownMenuItems,
                onChanged: onChangeDropdownItem,
              

              ),
              SizedBox(
                height: 20.0,
              ),
    
  //Text('Selected: ${_selectedItem.name}'),

            ],
          ),
  
),


            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: price,
                scrollPadding: EdgeInsets.all(10),
                decoration: const InputDecoration(
                  
                  hintText: 'Enter a base price',
                  labelText: 'Base Price',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                ),

                
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter some price';
                  }
                  return null;
                },
              ),
            ),

Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: price,
                scrollPadding: EdgeInsets.all(10),
                decoration: const InputDecoration(
                  
                  hintText: '1-7 days',
                  labelText: 'Duration',
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green),
                ),

                
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter duration';
                  }
                  return null;
                },
              ),
            ),

Container(
  child: Padding(
    padding: const EdgeInsets.all(15.0),
    child: TextField(
      minLines: 10,
      maxLines: 15,
      autocorrect: false,
      controller: description,
      decoration: InputDecoration(
        hintText: 'Write your discription here',
        filled: true,
        fillColor: Colors.green[100],
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    ),
  ),
),


Container(

alignment: Alignment(-0.1,1),
//padding: const EdgeInsets.only(left: 100.0, top: 40.0),  
              child: new RaisedButton(  
                child: const Text('ADD TO BID'), 
                color: Colors.green, 
                textColor: Colors.white, 
                
                onPressed: () {  
                 

                  print(description.text);
                  print(_selectedItem.name);
                    Navigator.of(context).pushNamed('/dashboard1');
                  // if (_formKey.currentState.validate()) {  
                 
                  //   print(descriptionController.text);
                  //   Navigator.of(context).pushNamed('/dashboard1');
                
                   
                  // }  
                },  
              )

),










        ],
 ),

      )
    );
  }
}