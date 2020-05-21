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
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,  
 child: Column(  
        crossAxisAlignment: CrossAxisAlignment.start,  
        
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
                
              ),
              SizedBox(
                height: 20.0,
              ),

              Text('Selected: ${_selectedItem.name}'),
            ],
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
                 
                  if (_formKey.currentState.validate()) {  
                    //print(value.text);
                    
                    Navigator.of(context).pushNamed('/dashboard1');
                    
                   
                  }  
                },  
              )

),










        ],
 ),


    );
  }
}