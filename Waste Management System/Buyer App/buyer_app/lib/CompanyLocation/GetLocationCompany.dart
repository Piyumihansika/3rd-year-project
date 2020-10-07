import 'package:flutter/material.dart';
import 'package:buyerapp/CompanyLocation/ManuallyCompany.dart';
import 'package:buyerapp/CompanyLocation/TrackingCompany.dart';

class GetLocationCompany extends StatefulWidget {
  final String companyName;
  final String contactpersonName;
  final String contactpersonNumber;
  final String password;
  final String email;

  const GetLocationCompany(
      {Key key,
      this.companyName,
      this.contactpersonName,
      this.contactpersonNumber,
      this.password,
      this.email})
      : super(key: key);

  @override
  _GetLocationCompanyState createState() => new _GetLocationCompanyState();
}

class _GetLocationCompanyState extends State<GetLocationCompany> {
  List<String> _options = [
    'Type Location Manually',
    'Get Tracked location'
  ]; // Option 2
  String _selectedOption; // Option 2

  @override
  void initState() {
    super.initState();
    print(widget.companyName);
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
              hint: Text(
                'Select your option',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ), // Not necessary for Option 1
              value: _selectedOption,
              onChanged: (newValue) {
                setState(() {
                  _selectedOption = newValue;
                });
                if (_selectedOption == 'Type Location Manually') {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ManuallyCompany(
                                companyName: widget.companyName,
                                contactpersonName: widget.contactpersonName,
                                contactpersonNumber: widget.contactpersonNumber,
                                password: widget.password,
                                email: widget.email,
                              )));
                } else {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TrackingCompany(
                                companyName: widget.companyName,
                                contactpersonName: widget.contactpersonName,
                                contactpersonNumber: widget.contactpersonNumber,
                                password: widget.password,
                                email: widget.email,
                              )));
                }
              },
              items: _options.map((option) {
                return DropdownMenuItem(
                  child: new Text(
                    option,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
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
