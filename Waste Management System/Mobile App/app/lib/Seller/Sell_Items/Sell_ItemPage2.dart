import 'package:flutter/material.dart';

class SellItemPage2 extends StatefulWidget {
  @override
  _SellItemPage2State createState() => _SellItemPage2State();
}

class _SellItemPage2State extends State<SellItemPage2> {
    final _formKey = GlobalKey<FormState>();

    TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();

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
        body: Form(
           key: _formKey,  
          

           child: SingleChildScrollView(child: Column(
mainAxisAlignment: MainAxisAlignment.center, 
        
        children: <Widget>[

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
  child: Padding(
    padding: const EdgeInsets.all(15.0),
    child: TextField(
      minLines: 8,
      maxLines: 12,
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
                 

                  // print(description.text);
                  // print(_selectedItem.name);
                 // print(selectDuration);
                    //Navigator.of(context).pushNamed('/dashboard1');
                  if (_formKey.currentState.validate()) {  
                 
               // print(selectDuration);
                
                   
                  }  
                },  
              )

),



        ],
           ),),

          
          
          
          ), 
    );
  }
}
