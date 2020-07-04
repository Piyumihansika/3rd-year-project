import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:app/utils/ResponseData.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

final String logoutUrl =
    "http://192.168.8.100:3000/auth/logout/${ResponseData.userId}";

// final String viewProfileUrl =
// "http://192.168.8.100:3000/customer/viewCustomer/${ResponseData.userId}";

String newId = ResponseData.userId;
// String userFname = ResponseData.firstName;
// String userLname = ResponseData.lastName;
// String userEmail = ResponseData.email;
var value;

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //LOGOUT FUNCTION
  void logout(BuildContext context) async {
    var response = await http.get(Uri.encodeFull(logoutUrl),
        headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      value = json.decode(response.body);
      ResponseData.userId = (value["id"].toString());
      print(newId);
      Navigator.of(context).pushNamed('/login');
    }
  }

  // void viewProfile(BuildContext context) async {
  //   var response = await http.get(Uri.encodeFull(viewProfileUrl),
  //       headers: {"Accept": "application/json"});
  //   if (response.statusCode == 200) {
  //     details = json.decode(response.body);
  //     firstName = (details["firstname"].toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MENU SELECT"),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.green[100],
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
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
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.of(context).pushNamed('/buyerhome');
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.of(context).pushNamed('/profile');
              },
            ), //ListTitle
            ListTile(
              leading: Icon(Icons.category),
              title: Text('Categories'),
              onTap: () {
                // Navigator.of(context).pushNamed('/');
              },
            ), //ListTitle
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {
                Navigator.of(context).pushNamed('/');
              },
            ), //ListTitle
            ListTile(
              leading: Icon(Icons.history),
              title: Text('History'),
              onTap: () {
                Navigator.of(context).pushNamed('/');
              },
            ), //ListTitle
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Logout'),
              onTap: () {
                logout(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
          padding: EdgeInsets.all(30.0),
          child: GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              MyMenu1(
                title: 'Home',
                icon: Icons.home,
                warna: Colors.green,
              ),
              MyMenu2(
                title: 'Sell Item',
                icon: Icons.local_grocery_store,
                warna: Colors.yellow,
              ),
              MyMenu3(
                title: 'Bidding Details',
                icon: Icons.people,
                warna: Colors.blue,
              ),
//MyMenu4(title: 'Orders',icon: Icons.photo,warna: Colors.blue,),
              MyMenu4(
                title: 'Notifications',
                icon: Icons.add_alert,
                warna: Colors.red,
              ),
              MyMenu5(
                title: 'Setting',
                icon: Icons.tag_faces,
                warna: Colors.pink,
              ),
            ],
          )),
    );
  }
}

class MyMenu1 extends StatelessWidget {
  MyMenu1({this.title, this.icon, this.warna});

  final String title;
  final IconData icon;
  final MaterialColor warna;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // Navigator.of(context).pushNamed('/login');
        },
        splashColor: Colors.green[100],
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RawMaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/login');
                },
                elevation: 2.0,
                fillColor: warna,
                child: Icon(
                  icon,
                  size: 35.0,
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              Text(title, style: new TextStyle(fontSize: 17.0))
            ],
          ),
        ),
      ),
    );
  }
}

//second one

class MyMenu2 extends StatelessWidget {
  MyMenu2({this.title, this.icon, this.warna});

  final String title;
  final IconData icon;
  final MaterialColor warna;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // Navigator.of(context).pushNamed('/scheduled');
        },
        splashColor: Colors.green[100],
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RawMaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/sell');
                },
                elevation: 2.0,
                fillColor: warna,
                child: Icon(
                  icon,
                  size: 35.0,
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              Text(title, style: new TextStyle(fontSize: 17.0))
            ],
          ),
        ),
      ),
    );
  }
}
//third one

class MyMenu3 extends StatelessWidget {
  MyMenu3({this.title, this.icon, this.warna});

  final String title;
  final IconData icon;
  final MaterialColor warna;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
//  Navigator.of(context).pushNamed('/special');
        },
        splashColor: Colors.green[100],
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RawMaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/special');
                },
                elevation: 2.0,
                fillColor: warna,
                child: Icon(
                  icon,
                  size: 35.0,
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              Text(title, style: new TextStyle(fontSize: 17.0))
            ],
          ),
        ),
      ),
    );
  }
}

//4th one

class MyMenu4 extends StatelessWidget {
  MyMenu4({this.title, this.icon, this.warna});

  final String title;
  final IconData icon;
  final MaterialColor warna;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // Navigator.of(context).pushNamed('/order');
        },
        splashColor: Colors.green[100],
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RawMaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/order');
                },
                elevation: 2.0,
                fillColor: warna,
                child: Icon(
                  icon,
                  size: 35.0,
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              Text(title, style: new TextStyle(fontSize: 17.0))
            ],
          ),
        ),
      ),
    );
  }
}

//5th one

class MyMenu5 extends StatelessWidget {
  MyMenu5({this.title, this.icon, this.warna});

  final String title;
  final IconData icon;
  final MaterialColor warna;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // Navigator.of(context).pushNamed('/history');
          // Navigator.of(context).pushNamed('/test');
        },
        splashColor: Colors.green[100],
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RawMaterialButton(
                onPressed: () {
                  //
                  Navigator.of(context).pushNamed('/setting');
                },
                elevation: 2.0,
                fillColor: warna,
                child: Icon(
                  icon,
                  size: 35.0,
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(15.0),
                shape: CircleBorder(),
              ),
              Text(title, style: new TextStyle(fontSize: 17.0))
            ],
          ),
        ),
      ),
    );
  }
}

//6th one

// class MyMenu6 extends StatelessWidget {
//   MyMenu6({this.title,this.icon,this.warna});

//   final String title;
//   final IconData icon;
//   final MaterialColor warna;

//   @override
//   Widget build(BuildContext context) {
//     return   Card(
//      margin: EdgeInsets.all(8.0),
//      child: InkWell(
// onTap: (){
//   Navigator.of(context).pushNamed('/profile');
// },
// splashColor:Colors.green[100],
// child: Center(
// child:Column(

// mainAxisSize:MainAxisSize.min ,

//   children: <Widget>[

// Icon(
//   icon,
//   size:70.0 ,
//   color: warna,
//   ),
// Text(title, style:new TextStyle(fontSize:17.0))

//   ],
// ),

// ),
//      ),

//       );

//   }
// }
