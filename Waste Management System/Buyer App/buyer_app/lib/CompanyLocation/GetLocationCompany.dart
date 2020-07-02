import 'package:flutter/material.dart';
import 'package:buyerapp/CompanyLocation/ManuallyCompany.dart';
import 'package:buyerapp/CompanyLocation/TrackingCompany.dart';

class GetLocationCompany extends StatefulWidget {

  final String companyName;
  final String contactpersonName;
  final String contactpersonNumber;
  final String password;
  final String confirmpass;
  final String email;

  const GetLocationCompany({ Key key, this.companyName,this.contactpersonName,this.contactpersonNumber,this.password,this.confirmpass,this.email}) : super(key: key);

  @override
  _GetLocationCompanyState createState() => new _GetLocationCompanyState();
}

 class _GetLocationCompanyState extends State<GetLocationCompany> {

  List<String> _options = ['Type Location Manually', 'Get Tracked location']; // Option 2
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
        appBar: AppBar(title: Text('Get Location'),
          backgroundColor: Colors.green,),
        body: Center(
          child: Column(
            children: <Widget>[

              // my design using positioned
              Stack(
                  children: <Widget>[
                    Container(
                      height: 200.0,
                      width: double.infinity,
                      color: Colors.green,
                    ),
                    Positioned(
                      bottom: 55.0,
                      right: 100.0,
                      child: Container(
                        height: 350.0,
                        width: 350.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(320),
                            color: Colors.yellowAccent
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 100.0,
                      right: 130.0,
                      child: Container(
                        height: 290.0,
                        width: 300.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(320),
                            color: Colors.blueAccent
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 100.0,
                      right: 150.0,
                      child: Container(
                        height: 330.0,
                        width: 300.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(320),
                            color: Colors.yellow
                        ),
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
                                      width: 2.0
                                  ),
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/logo.jpg'),
                                  )
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 15.0),
                        Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Text(
                            'SIGN UP',
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
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ]
              ),
              //
              Container(
                alignment: Alignment.center,
              ),
              DropdownButton(
                hint: Text('Select your option'), // Not necessary for Option 1
                value: _selectedOption,
                onChanged: (newValue) {
                  setState(() {
                    _selectedOption = newValue;
                  });
                  if( _selectedOption == 'Type Location Manually'){

                     
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>ManuallyCompany(
                      companyName: widget.companyName,
                      contactpersonName: widget.contactpersonName,
                      contactpersonNumber: widget.contactpersonNumber,
                      password: widget.password,
                      email: widget.email,
                    )));
                  
                  }else{
                   
                     Navigator.push(context,MaterialPageRoute(builder: (context)=>TrackingCompany(
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
                    child: new Text(option),
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
