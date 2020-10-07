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
              
             
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20.0),
                  Container(
                    alignment: Alignment(-0.1, 1),
                    child: Column(
                      children: <Widget>[
                        new GestureDetector(
                          child: Container(
                            width: 200,
                            height: 200,
                            decoration: BoxDecoration(
                              // color: Colors.white,
                              image: DecorationImage(
                                image: AssetImage("assets/images/loca.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        // Padding(padding: EdgeInsets.only(left:10.5)),
                      ],
                    ),
                  ),
                  
                
                  
                  SizedBox(height: 45.0),
                  Padding(
                    padding: EdgeInsets.only(left: 85.0),
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
