import 'package:flutter/material.dart';

class ChooseLocaType extends StatefulWidget {
  @override
  _ChooseLocaTypeState createState() => _ChooseLocaTypeState();
}

class _ChooseLocaTypeState extends State<ChooseLocaType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('Enter Your Address'),
      ),
     body: new Center(
        child:

            // Below is the code which will help you to achive Buttons Bar as show above

            new Row(
          children: [
            new RaisedButton(
                child: Text('Add Address'),
                onPressed:(){

                     Navigator.of(context).pushNamed('/addmanualy');

                } ,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(30.0),
                        right: Radius.circular(0.0)))),
            new RaisedButton(
                child: Text('Set Using Map'),
                onPressed: (){


                } ,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(0.0),
                        right: Radius.circular(30.0)))),
          ],
          mainAxisSize: MainAxisSize.min,
        ),



        
      ),




      // 
    );
  }
}

// class SetlocationType extends StatefulWidget {
//   @override
//   _SetlocationTypeState createState() => _SetlocationTypeState();
// }

// class _SetlocationTypeState extends State<SetlocationType> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
      



//     );
//   }
// }