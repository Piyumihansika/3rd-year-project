import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Profile extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<Profile>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(title: Text('Profile Page'),
          backgroundColor: Colors.green,),
        body: new Container(
          color: Colors.white,
          child: new ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  new Container(
                    height: 250.0,
                    color: Colors.white,
                    child: new Column(
                      children: <Widget>[

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




                                  SizedBox(height: 25.0),
                                  Padding(
                                    padding: EdgeInsets.only(top: 20.0),
                                    child: new Stack(fit: StackFit.loose, children: <Widget>[
                                      new Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          new Container(
                                              width: 140.0,
                                              height: 140.0,
                                              decoration: new BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: new DecorationImage(
                                                  image: new ExactAssetImage(
                                                      'assets/images/profile.png'),
                                                  fit: BoxFit.cover,
                                                ),
                                              )),
                                        ],
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(top: 90.0, right: 100.0),
                                          child: new Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: <Widget>[
                                              new CircleAvatar(
                                                backgroundColor: Colors.red,
                                                radius: 25.0,
                                                child: new Icon(
                                                  Icons.camera_alt,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          )),
                                    ]),
                                  )
                                ],
                              ),
                            ]
                        ),
                      ],
                    ),
                  ),

                  new Container(
                    color: Color(0xffFFFFFF),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 25.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Parsonal Information',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      _status ? _getEditIcon() : new Container(),
                                    ],
                                  )
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'User Name',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: const InputDecoration(
                                        hintText: "Enter User Name",
                                      ),
                                      enabled: !_status,
                                      autofocus: !_status,

                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Email',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: const InputDecoration(
                                          hintText: "Enter Email"),
                                      enabled: !_status,
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Address',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: const InputDecoration(
                                          hintText: "Enter Your Address"),
                                      enabled: !_status,
                                    ),
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 25.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      new Text(
                                        'Mobile',
                                        style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.only(
                                  left: 25.0, right: 25.0, top: 2.0),
                              child: new Row(
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  new Flexible(
                                    child: new TextField(
                                      decoration: const InputDecoration(
                                          hintText: "Enter Mobile Number"),
                                      enabled: !_status,
                                    ),
                                  ),
                                ],
                              )),
//                          Padding(
//                              padding: EdgeInsets.only(
//                                  left: 25.0, right: 25.0, top: 25.0),
//                              child: new Row(
//                                mainAxisSize: MainAxisSize.max,
//                                mainAxisAlignment: MainAxisAlignment.start,
//                                children: <Widget>[
//                                  Expanded(
//                                    child: Container(
//                                      child: new Text(
//                                        'Pin Code',
//                                        style: TextStyle(
//                                            fontSize: 16.0,
//                                            fontWeight: FontWeight.bold),
//                                      ),
//                                    ),
//                                    flex: 2,
//                                  ),
//                                  Expanded(
//                                    child: Container(
//                                      child: new Text(
//                                        'State',
//                                        style: TextStyle(
//                                            fontSize: 16.0,
//                                            fontWeight: FontWeight.bold),
//                                      ),
//                                    ),
//                                    flex: 2,
//                                  ),
//                                ],
//                              )),
//                          Padding(
//                              padding: EdgeInsets.only(
//                                  left: 25.0, right: 25.0, top: 2.0),
//                              child: new Row(
//                                mainAxisSize: MainAxisSize.max,
//                                mainAxisAlignment: MainAxisAlignment.start,
//                                children: <Widget>[
//                                  Flexible(
//                                    child: Padding(
//                                      padding: EdgeInsets.only(right: 10.0),
//                                      child: new TextField(
//                                        decoration: const InputDecoration(
//                                            hintText: "Enter Pin Code"),
//                                        enabled: !_status,
//                                      ),
//                                    ),
//                                    flex: 2,
//                                  ),
//                                  Flexible(
//                                    child: new TextField(
//                                      decoration: const InputDecoration(
//                                          hintText: "Enter State"),
//                                      enabled: !_status,
//                                    ),
//                                    flex: 2,
//                                  ),
//                                ],
//                              )),
                          !_status ? _getActionButtons() : new Container(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: new Text("Save"),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: () {
                      setState(() {
                        _status = true;
                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                    child: new Text("Cancel"),
                    textColor: Colors.white,
                    color: Colors.red,
                    onPressed: () {
                      setState(() {
                        _status = true;
                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    },
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                  )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}

//import 'package:flutter/material.dart';
//import 'package:email_validator/email_validator.dart';
//
//
//
//class Profile extends StatefulWidget {
//  @override
//  _State createState() => _State();
//}
//
//class _State extends State<Profile> {
//
//  @override
//  Widget build(BuildContext context) {
//    return  Scaffold(
//      appBar: AppBar(title: Text('Green wasteland'),
//        backgroundColor: Colors.green,),
//      body:ProfilePage(),
//
//      //add drawer to the app
//      drawer: Drawer(
//
//        child: ListView(
//          // Important: Remove any padding from the ListView.
//          padding: EdgeInsets.zero,
//          children: <Widget>[
//            DrawerHeader(
//              child: Text('Buyer App',style: TextStyle(fontSize: 20,color: Colors.white),),
//              decoration: BoxDecoration(
//                color: Colors.green,
//              ),
//            ),
//
//            //add logo
//            Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                SizedBox(height: 14.0),
//                Row(
//                  children: <Widget>[
//                    SizedBox(width: 14.0),
//                    Container(
//                      alignment: Alignment.topLeft,
//                      height: 45.0,
//                      width: 50.0,
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.circular(30),
//                          border: Border.all(
//                              color: Colors.white,
//                              style: BorderStyle.solid,
//                              width: 2.0
//                          ),
//                          image: DecorationImage(
//                            image: AssetImage('assets/images/logo.jpg'),
//                          )
//                      ),
//                    )
//                  ],
//                ),
//              ],
//            ),
//
//            ListTile(
//              leading: Icon(Icons.home),
//              title: Text('Home'),
//              onTap: () {
//                Navigator.of(context).pushNamed('/buyerhome');
//              },
//            ),
//            ListTile(
//              leading: Icon(Icons.person),
//              title: Text('Profile'),
//              onTap: () {
//                Navigator.of(context).pushNamed('/');
//              },
//            ), //ListTitle
//            ListTile(
//              leading: Icon(Icons.category),
//              title: Text('Categories'),
//              onTap: () {
//                Navigator.of(context).pushNamed('/');
//              },
//            ), //ListTitle
//            ListTile(
//              leading: Icon(Icons.notifications),
//              title: Text('Notifications'),
//              onTap: () {
//                Navigator.of(context).pushNamed('/');
//              },
//            ), //ListTitle
//            ListTile(
//              leading: Icon(Icons.history),
//              title: Text('Histry'),
//              onTap: () {
//                Navigator.of(context).pushNamed('/');
//              },
//            ),//ListTitle
//            ListTile(
//              leading: Icon(Icons.account_circle),
//              title: Text('Logout'),
//              onTap: () {
//                Navigator.of(context).pushNamed('/login');
//              },
//            ),
//          ],
//        ),
//      ),
//
//
//    );
//
//  }
//}
//class ProfilePage extends StatefulWidget {
//  @override
//  _ProfileState createState() => _ProfileState();
//}
//
//class _ProfileState extends State<ProfilePage> {
//
//  @override
//  Widget build(BuildContext context) {
//    return Material(
//
//
//      child: SingleChildScrollView(
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//
//          children: <Widget>[
//
//            Stack(
//                children: <Widget>[
//                  Container(
//                    height: 200.0,
//                    width: double.infinity,
//                    color: Colors.green,
//                  ),
//                  Positioned(
//                    bottom: 55.0,
//                    right: 100.0,
//                    child: Container(
//                      height: 350.0,
//                      width: 350.0,
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.circular(320),
//                          color: Colors.yellowAccent
//                      ),
//                    ),
//                  ),
//                  Positioned(
//                    bottom: 100.0,
//                    right: 130.0,
//                    child: Container(
//                      height: 290.0,
//                      width: 300.0,
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.circular(320),
//                          color: Colors.blueAccent
//                      ),
//                    ),
//                  ),
//                  Positioned(
//                    bottom: 100.0,
//                    right: 150.0,
//                    child: Container(
//                      height: 330.0,
//                      width: 300.0,
//                      decoration: BoxDecoration(
//                          borderRadius: BorderRadius.circular(320),
//                          color: Colors.yellow
//                      ),
//                    ),
//                  ),
//                  Column(
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      SizedBox(height: 14.0),
//                      Row(
//                        children: <Widget>[
//                          SizedBox(width: 14.0),
//                          Container(
//                            alignment: Alignment.topLeft,
//                            height: 45.0,
//                            width: 50.0,
//                            decoration: BoxDecoration(
//                                borderRadius: BorderRadius.circular(30),
//                                border: Border.all(
//                                    color: Colors.white,
//                                    style: BorderStyle.solid,
//                                    width: 2.0
//                                ),
//                                image: DecorationImage(
//                                  image: AssetImage('assets/images/logo.jpg'),
//                                )
//                            ),
//                          )
//                        ],
//                      ),
//                      SizedBox(height: 15.0),
//                      Padding(
//                        padding: EdgeInsets.only(left: 15.0),
//                        child: Text(
//                          'Profile',
//                          style: TextStyle(
//                              fontSize: 25.0,
//                              fontWeight: FontWeight.bold,
//                              color: Colors.black87),
//                        ),
//                      ),
//                      SizedBox(height: 25.0),
//                      Padding(
//                        padding: EdgeInsets.only(left: 15.0,right: 15.0),
//                        child: Material(
//                          elevation: 5.0,
//                          borderRadius: BorderRadius.circular(25),
//                          child: TextFormField(
//                            decoration: InputDecoration(
//                                border: InputBorder.none,
//                                prefixIcon: Icon(
//                                  Icons.search,
//                                  color: Colors.green,
//                                  size: 30.0,
//                                ),
//                                contentPadding:
//                                EdgeInsets.only(left: 20,top: 15,bottom: 10),
//                                hintText: 'Search',hintStyle: TextStyle(
//                                color: Colors.grey
//                            )
//                            ),
//                          ),
//                        ),
//                      )
//                    ],
//                  ),
//                ]
//            ),
//            //
//            Container(
//                alignment: Alignment.center,
//                child: Text(
//                  '',
//                  style: TextStyle(fontSize:17, color: Colors.green),
//                )),
//
//// add profile functions ...do this quickly gon gaha mama
//            Container(
//
//                alignment: Alignment(-0.1,1),
//
//                child: new RaisedButton(
//                  child: const Text('Getting start'),
//                  color: Colors.green,
//                  textColor: Colors.white,
//
//                  onPressed: () {
//
//                  },
//                )
//            ),
//          ],
//
//        ),
//      ),
//    );
//
//  }
//}
