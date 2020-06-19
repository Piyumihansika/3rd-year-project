
import 'package:flutter/material.dart';

class SellItem extends StatefulWidget {
  @override
  _SellItemState createState() => _SellItemState();
}

class _SellItemState extends State<SellItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
          title: Text('Add Items To Sell'),
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
 
  // 

  final _formKey = GlobalKey<FormState>();
// 
  
  
  
    // 

  TextEditingController firstnameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
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
  child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Item Category"),
              SizedBox(
                height: 20.0,
              ),
            DropdownButton(
                value: _selectedItem,
                items: _dropdownMenuItems,
                onChanged: onChangeDropdownItem,
                
                
                //itemname= _selectedItem.name;
              ),
              SizedBox(
                height: 20.0,
              ),
    
   
  // itemname;

              Text('Selected: ${_selectedItem.name}'),
            ],
          ),
  
),


Container(
  child: Padding(
    padding: const EdgeInsets.all(15.0),
    child: TextField(
      minLines: 10,
      maxLines: 15,
      autocorrect: false,
      controller: descriptionController,
      decoration: InputDecoration(
        hintText: 'Write your status here',
        filled: true,
        fillColor: Color(0xFFDBEDFF),
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
                 

                  print(descriptionController.text);
                  print(itemname);
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