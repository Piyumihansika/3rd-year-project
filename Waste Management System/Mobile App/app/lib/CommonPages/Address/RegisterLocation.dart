import 'package:flutter/material.dart';

class Reglocation extends StatefulWidget {
  @override
  _ReglocationState createState() => _ReglocationState();
}

class _ReglocationState extends State<Reglocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter Your Address'),
      ),
      body: Setlocation(),
    );
  }
}

class Setlocation extends StatefulWidget {
  @override
  _SetlocationState createState() => _SetlocationState();
}

class _SetlocationState extends State<Setlocation> {
  
  //final _formKey = GlobalKey<FormState>();  

   String radioItem = '';
  @override
  Widget build(BuildContext context) {
    return Column(
       
       children: <Widget>[
 
          RadioListTile(
              groupValue: radioItem,
              title: Text('Add Manually'),
              value: 'Item 1',
              onChanged: (val) {
                setState(() {
                  radioItem = val;
                });
              },
            ),
 
           RadioListTile(
              groupValue: radioItem,
              title: Text('Set Using Map'),
              value: 'Item 2',
              onChanged: (val) {
                setState(() {
                  radioItem = val;
                });
              },
            ),
 
           Text('$radioItem', style: TextStyle(fontSize: 23),)
          
        ],
      

          // new Container(  
          //     padding: const EdgeInsets.only(left: 150.0, top: 40.0),  
          //     child: new RaisedButton(  
          //       child: const Text('Next'), 
          //       color: Colors.green, 
          //       textColor: Colors.white, 
                
          //       onPressed: () {  
                 
          //         if (_formKey.currentState.validate()) {  
          //           //  print(firstnameController.text);
          //           //  print(lastnameController.text);
          //           //  print(usernameController.text);
          //           // //  print(addressController.text);
          //           //  print(phoneController.text);
          //           // //  print(nearLocationController.text);
          //           // print(passwordController.text);

          //            Navigator.of(context).pushNamed('/reg2');
          //         }  
          //       },  
          //     )
              
          //     ),  
     


    );
  }
}