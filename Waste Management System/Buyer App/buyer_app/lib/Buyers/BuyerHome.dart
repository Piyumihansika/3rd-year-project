import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:buyerapp/read_more_text.dart';
// import 'package:buyerapp/settings/Settings.dart';
// import 'package:buyerapp/settings/Notification.dart';
import 'package:buyerapp/utils/ResponseData.dart';
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
                    // SizedBox(width: 14.0),
                    // Container(
                    //   alignment: Alignment.topLeft,
                    //   height: 45.0,
                    //   width: 50.0,
                    //   decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(30),
                    //       border: Border.all(
                    //           color: Colors.white,
                    //           style: BorderStyle.solid,
                    //           width: 2.0),
                    //       image: DecorationImage(
                    //         image: AssetImage('assets/images/logo.jpg'),
                    //       )),
                    // )
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

            ListTile(
              leading: Icon(Icons.category),
              title: Text('Categories'),
              onTap: () {
                Navigator.of(context).pushNamed('/category');
              },
            ), //ListTitle
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notification History'),
              onTap: () {
                Navigator.of(context).pushNamed('/notifications');
              },
            ),
            
            ListTile(
              leading: Icon(Icons.details),
              title: Text('Auction Details'),
              onTap: () {
                Navigator.of(context).pushNamed('/auctiondetail');
              },
            ),
            ListTile(
              leading: Icon(Icons.report),
              title: Text('Report'),
              onTap: () {
                Navigator.of(context).pushNamed('/report');
              },
            ),
            ListTile(
              leading: Icon(Icons.chrome_reader_mode),
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
  // int _currentIndex = 0;
  // final List<Widget> _children = [BuyerHome(), Notifications(), SettingPage()];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(children: <Widget>[
              Container(
                height: 50.0,
                width: double.infinity,
                //color: Colors.white,
              ),
              
              
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20.0),
                  
                 
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      'HOME',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                  ),
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

            Container(
              alignment: Alignment(-0.1, 1),
              child: Column(
                children: <Widget>[
                  new GestureDetector(
                    child: Container(
                      width: 400,
                      height: 250,
                      decoration: BoxDecoration(
                        // color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage("assets/images/logo.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(10.5)),
                ],
              ),
            ),

            SizedBox(height: 5.0),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20),
              child: ReadMoreText(
                'Green wasteland is a platform connecting people for selling & buying waste.',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 5.0),
            Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20),
              child: ReadMoreText(
                'Start to bidding!hurry up get your chance',
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment(-0.1, 1),
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(0.0)),
                  new GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/category');
                    },
                    child: new Padding(
                      padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 20.0),
                      child: roundedButton(
                          "START",
                          EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                          const Color(0xFF167F67),
                          const Color(0xFFFFFFFF)),
                    ),
                  ),
                ],
              ),
            ),
            // _children[_currentIndex],
            // SizedBox(height: 70.0),
            // BottomNavigationBar(
            //   currentIndex: _currentIndex,
            //   onTap: (int index) {
            //     setState(() {
            //       _currentIndex = index;
            //     });
            //   },
            //   items: [
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.home),
            //        //data:IconThemeData(color:Colors.black)),
            //       title: Text('Home'),
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.notifications),
            //       title: Text('Notifications'),
            //     ),
            //     BottomNavigationBarItem(
            //         icon: Icon(Icons.settings), title: Text('Settings'))
            //   ],
            // ),
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

// class PlaceholderWidget extends StatelessWidget {
//   final Color color;

//   PlaceholderWidget(this.color);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: color,
//     );
//   }
// }
