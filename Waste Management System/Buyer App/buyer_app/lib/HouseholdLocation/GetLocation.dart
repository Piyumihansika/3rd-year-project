import 'package:buyerapp/HouseholdLocation/Tracking.dart';
import 'package:flutter/material.dart';
import 'package:buyerapp/HouseholdLocation/Manually.dart';
// import 'Tracking.dart';

class GetLocation extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String contactNumber;
  final String password;
  final String email;

  const GetLocation(
      {Key key,
      this.firstName,
      this.lastName,
      this.contactNumber,
      this.password,
      this.email})
      : super(key: key);

  @override
  _GetLocationState createState() => _GetLocationState();
}

class _GetLocationState extends State<GetLocation> {
  // String firstName;
  // String lastName;
  // String contactNumber;
  // String password;
  // String email;

  // _GetLocationState(this.firstName,this.lastName,this.contactNumber,this.password,this.email);

  List<String> _options = [
    'Type Location Manually',
    'Get Tracked location'
  ]; // Option 2
  String _selectedOption; // Option 2

  @override
  void initState() {
    super.initState();
    print(widget.firstName);
  }

  @override
  Widget build(BuildContext context) {
    //return MaterialApp(
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Location'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            // my design using positioned
            Stack(children: <Widget>[
              Container(
                height: 200.0,
                width: double.infinity,
                color: Colors.white,
              ),
              Positioned(
                bottom: 40.0,
                right: 80.0,
                child: Container(
                  height: 350.0,
                  width: 350.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(320),
                      color: Colors.yellowAccent),
                ),
              ),
              Positioned(
                bottom: 50.0,
                right: 140.0,
                child: Container(
                  height: 290.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(320),
                      color: Colors.green[100]),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 14.0),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 14.0),
                      Container(
                        alignment: Alignment.topLeft,
                        height: 45.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: Colors.white,
                                style: BorderStyle.solid,
                                width: 2.0),
                            image: DecorationImage(
                              image: AssetImage('assets/images/logo.jpg'),
                            )),
                      )
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      widget.firstName,
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                  ),
                  SizedBox(height: 45.0),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      'What is your location ?',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ),
                ],
              ),
            ]),
            //
            Container(
              alignment: Alignment.center,
            ),
            DropdownButton(
              hint: Text('Select your option',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),), // Not necessary for Option 1
              value: _selectedOption,
              onChanged: (newValue) {
                setState(() {
                  _selectedOption = newValue;
                });
                if (_selectedOption == 'Type Location Manually') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Manually(
                                firstName: widget.firstName,
                                lastName: widget.lastName,
                                contactNumber: widget.contactNumber,
                                password: widget.password,
                                email: widget.email,
                              )));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Tracking(
                                firstName: widget.firstName,
                                lastName: widget.lastName,
                                contactNumber: widget.contactNumber,
                                password: widget.password,
                                email: widget.email,
                              )));
                }
              },
              items: _options.map((option) {
                return DropdownMenuItem(
                  child: new Text(option,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                  value: option,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
