import 'package:app/CommonPages/Address/Addmanually.dart';
import 'package:flutter/material.dart';

class ChooseLocaType extends StatefulWidget {

final String firstName;
final String lastName;
final String email;
final String contactNumber;
final String password;

const ChooseLocaType({Key key, this.firstName, this.lastName, this.email, this.contactNumber, this.password}) : super(key: key);

  @override
  _ChooseLocaTypeState createState() => _ChooseLocaTypeState();
}

class _ChooseLocaTypeState extends State<ChooseLocaType> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('How Do You Enter Address'),
        backgroundColor: Colors.green,
      ),
     body: new Center(
        child:

           

            new Row(
          children: [
            new RaisedButton(
                child: Text('Add Manually'),
                onPressed:(){

                     //Navigator.of(context).pushNamed('/addmanualy');
                      Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>Address(
                        firstName:widget.firstName ,
                        lastName:widget.lastName,
                        email:widget.email,
                        contactNumber:widget.contactNumber,
                        password:widget.password
                        
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


