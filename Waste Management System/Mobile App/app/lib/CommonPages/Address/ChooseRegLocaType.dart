import 'package:app/CommonPages/Address/Addmanually.dart';
import 'package:flutter/material.dart';

class ChooseLocaType extends StatefulWidget {

final String firstname;
final String lastname;
final String email;
final String contactNumber;
final String password;

ChooseLocaType({ this.firstname,this.lastname,this.email,this.contactNumber,this.password});

  @override
  _ChooseLocaTypeState createState() => _ChooseLocaTypeState(firstname, lastname,email,contactNumber, password );
}

class _ChooseLocaTypeState extends State<ChooseLocaType> {

String firstname;
String lastname;
String email;
String contactNumber;
String password;

_ChooseLocaTypeState(this.firstname,this.lastname,this.email,this.contactNumber,this.password);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('How Do You Enter Your Address'),
      ),
     body: new Center(
        child:

            // Below is the code which will help you to achive Buttons Bar as show above

            new Row(
          children: [
            new RaisedButton(
                child: Text('Add Manually'),
                onPressed:(){

                     //Navigator.of(context).pushNamed('/addmanualy');
                      Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>Add(
                        firstname:firstname ,
                        lastname:lastname,
                        email:email,
                        contactNumber:contactNumber,
                        password:password
                        
                      ),
                      
                      ));


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


