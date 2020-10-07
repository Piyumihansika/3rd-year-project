import 'package:flutter/material.dart';
import 'package:app/utils/ResponseData.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final String logoutUrl =
    "${ResponseData.apiUrl}/auth/logout/${ResponseData.userId}";

final String viewProfileUrl =
    "${ResponseData.apiUrl}/customer/viewCustomer/${ResponseData.userId}";

String newId = ResponseData.userId;
// String userFname = ResponseData.firstName;
// String userLname = ResponseData.lastName;
// String userEmail = ResponseData.email;
var value;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //LOGOUT FUNCTION
  void logout(BuildContext context) async {
    var response = await http.get(Uri.encodeFull(logoutUrl),
        headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      value = json.decode(response.body);
      ResponseData.userId = (value["id"].toString());
      Navigator.of(context).pushNamed('/login');
      print("-------------------------logout-----------------------------");
      print(newId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "WELCOME",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.green[300],
      drawer: new Drawer(
        child: ListView(
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
                backgroundImage: AssetImage('assets/images/icon.jpg'),
                // backgroundImage: NetworkImage(
                //     "https://cdn0.iconfinder.com/data/icons/avatar-78/128/12-512.png"),
              ),
            ),

            ListTile(
              leading: Icon(Icons.credit_card),
              title: Text('Price Chart'),
              onTap: () {
                Navigator.of(context).pushNamed('/price');
              },
            ),
            ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('Sell Item'),
              onTap: () {
                Navigator.of(context).pushNamed('/sell');
              },
            ), //ListTitle
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Bidding Details'),
              onTap: () {
                Navigator.of(context).pushNamed('/biddingDetails');
              },
            ), //ListTitle

            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              onTap: () {
                Navigator.of(context).pushNamed('/notification');
              },
            ), //ListTitle
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              onTap: () {
                Navigator.of(context).pushNamed('/setting');
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
          padding: EdgeInsets.all(5.0),
          //
        
decoration: BoxDecoration(
          image: DecorationImage(
           image: NetworkImage("https://www.robynltherapy.com/wp-content/uploads/2020/05/iStock-1129110491-600x600.jpg"),
       
    fit: BoxFit.cover,
          ),
        ),


          //
          child: GridView.count(
            crossAxisCount: 2,
            children: <Widget>[
              MyMenu1(
                title: 'Sell Item',
                icon: Icons.local_grocery_store,
                warna: Colors.yellow,
              ),
              MyMenu2(
                title: 'Bidding Details',
                icon: Icons.people,
                warna: Colors.brown,
              ),
              MyMenu3(
                title: 'Price Chart',
                icon: Icons.credit_card,
                warna: Colors.blue,
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
      color: Colors.yellow[100],
      margin: EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {},
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
                  size: 15.0,
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

//

class MyMenu2 extends StatelessWidget {
  MyMenu2({this.title, this.icon, this.warna});

  final String title;
  final IconData icon;
  final MaterialColor warna;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.brown[200],
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        splashColor: Colors.green[100],
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RawMaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/biddingDetails');
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

//

class MyMenu3 extends StatelessWidget {
  MyMenu3({this.title, this.icon, this.warna});

  final String title;
  final IconData icon;
  final MaterialColor warna;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[100],
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        splashColor: Colors.green[100],
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RawMaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/price');
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
