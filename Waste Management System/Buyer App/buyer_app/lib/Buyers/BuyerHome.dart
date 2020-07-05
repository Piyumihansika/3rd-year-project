import 'dart:convert';
import 'package:flutter/material.dart';
//import 'package:email_validator/email_validator.dart';
import 'package:buyerapp/utils/ResponseData.dart';
//import 'package:passwordfield/passwordfield.dart';
import 'package:http/http.dart' as http;

var value, newAuth;
String newId = ResponseData.userId;
final String logoutUrl =
    // "http://192.168.8.188:3000/auth/logout/${ResponseData.userId}";
    "http://10.0.2.2:3000/auth/logout/${ResponseData.userId}";

class BuyerHome extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<BuyerHome> {
  void logout(BuildContext context) async {
    var response = await http.get(Uri.encodeFull(logoutUrl),
        headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      value = json.decode(response.body);
      ResponseData.userId = (value["id"].toString());
      print(newId);
      Navigator.of(context).pushNamed('/login');
      print(newId);
      print(
          "-------------------------------logout-----------------------------");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Green wasteland'),
        backgroundColor: Colors.green,
      ),
      body: Home(),

      //add drawer to the app
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              // DrawerHeader(
              // child: Column(
              //   children: <Widget>[
              //     //add logo
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: <Widget>[
              //         SizedBox(height: 0.0),
              //         Row(
              //           children: <Widget>[
              //             SizedBox(width: 14.0),
              //             Container(
              //               alignment: Alignment.topLeft,
              //               height: 45.0,
              //               width: 50.0,
              //               decoration: BoxDecoration(
              //                   borderRadius: BorderRadius.circular(30),
              //                   border: Border.all(
              //                       color: Colors.white,
              //                       style: BorderStyle.solid,
              //                       width: 2.0),
              //                   image: DecorationImage(
              //                     image: AssetImage('assets/images/logo.jpg'),
              //                   )),
              //             )
              //           ],
              //         ),
              //         Row(
              //           children: <Widget>[
              //             SizedBox(height: 60.0),
              //             Text(
              //               'Buyer App',
              //               style: TextStyle(fontSize: 20, color: Colors.white),
              //             ),
              //           ],
              //         )
              //       ],
              //     ),
              //   ],
              // ),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              accountName:
                  new Text(ResponseData.firstName + " " + ResponseData.lastName,
                      style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                      )),
              accountEmail: new Text(ResponseData.email),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://cdn0.iconfinder.com/data/icons/avatar-78/128/12-512.png"),
              ),
            ),

            //add logo
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
              ],
            ),

            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.of(context).pushNamed('/buyerhome');
              },
            ),
            // ListTile(
            //   leading: Icon(Icons.person),
            //   title: Text('Profile'),
            //   onTap: () {
            //     Navigator.of(context).pushNamed('/profile');
            //   },
            // ), //ListTitle
            ListTile(
              leading: Icon(Icons.category),
              title: Text('Categories'),
              onTap: () {
                Navigator.of(context).pushNamed('/category');
              },
            ), //ListTitle
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {
                Navigator.of(context).pushNamed('/notifications');
              },
            ),
            ListTile(
              leading: Icon(Icons.details),
              title: Text('About Us'),
              onTap: () {
                Navigator.of(context).pushNamed('/aboutus');
              },
            ), //ListTitle
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Contact Us'),
              onTap: () {
                Navigator.of(context).pushNamed('/contactus');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              onTap: () {
                Navigator.of(context).pushNamed('/settings');
              },
            ), //ListTitle
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Logout'),
              onTap: () {
                logout(context);
                // Navigator.of(context).pushNamed('/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _BuyerHomeState createState() => _BuyerHomeState();
}

class _BuyerHomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(children: <Widget>[
              Container(
                height: 150.0,
                width: double.infinity,
                color: Colors.white,
              ),
              Positioned(
                bottom: 1.0,
                right: 90.0,
                child: Container(
                  height: 350.0,
                  width: 350.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(320),
                      color: Colors.yellowAccent),
                ),
              ),
              Positioned(
                bottom: 10.0,
                right: 130.0,
                child: Container(
                  height: 290.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(320),
                      color: Colors.blueAccent),
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
                      color: Colors.yellow),
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
                      'HOME',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  //SizedBox(height: 25.0),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  //   child: Material(
                  //     elevation: 5.0,
                  //     borderRadius: BorderRadius.circular(25),
                  //     child: TextFormField(
                  //       decoration: InputDecoration(
                  //           border: InputBorder.none,
                  //           prefixIcon: Icon(
                  //             Icons.search,
                  //             color: Colors.green,
                  //             size: 30.0,
                  //           ),
                  //           contentPadding:
                  //               EdgeInsets.only(left: 20, top: 15, bottom: 10),
                  //           hintText: 'Search',
                  //           hintStyle: TextStyle(color: Colors.grey)),
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ]),
            //
            Container(
                alignment: Alignment.center,
                child: Text(
                  '',
                  style: TextStyle(fontSize: 17, color: Colors.green),
                )),

            // Container(
            //     alignment: Alignment(-0.1, 1),
            //     child: new RaisedButton(
            //       child: const Text('Getting start'),
            //       color: Colors.green,
            //       textColor: Colors.white,
            //       onPressed: () {
            //         Navigator.of(context).pushNamed('/category');
            //       },
            //     )),

            Container(
              alignment: Alignment(-0.1, 1),
              child: Column(
                children: <Widget>[
                  //Padding(padding: EdgeInsets.all(0.5)),
                  new GestureDetector(
                      child: Container(
                        width: 350,
                        height: 450,
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage("assets/images/home.PNG"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          // height: 20,
                          // width: 150,
                          alignment: Alignment(-0.1, 1),
                          padding: const EdgeInsets.all(90.0),

                          child: new Padding(
                            padding: EdgeInsets.fromLTRB(0.0, 50.0, 30.0, 0.0),
                            child: roundedButton(
                                "START",
                                EdgeInsets.fromLTRB(0.0, 150.0, 0.0, 0.0),
                                const Color(0xFF167F67),
                                const Color(0xFFFFFFFF)),
                          ),

                          // child: Text("GETTING START",
                          //     style: TextStyle(
                          //         color: Colors.white,
                          //         fontSize: 20,
                          //         backgroundColor: Colors.blue,
                          //         fontWeight: FontWeight.bold)),
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed('/category');
                      }),
                  Padding(padding: EdgeInsets.all(10.5)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //rounded button
  Widget roundedButton(
      String buttonLabel, EdgeInsets margin, Color bgColor, Color textColor) {
    var loginBtn = new Container(
      margin: margin,
      padding: EdgeInsets.all(15.0),
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: bgColor,
        borderRadius: new BorderRadius.all(const Radius.circular(100.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0xFF696969),
            offset: Offset(1.0, 6.0),
            blurRadius: 0.001,
          ),
        ],
      ),
      child: Text(
        buttonLabel,
        style: new TextStyle(
            color: textColor, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
    return loginBtn;
  }
}
