import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

final String apiUrl = "http://192.168.8.100:3000/auth/logout";

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  void logout(BuildContext context) async {
    var response = await http.get(apiUrl);
    if (response.statusCode == 200) {
      Navigator.of(context).pushNamed('/login');
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[200],
      appBar: AppBar(
        elevation: 4.0,
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.lightGreen[200],
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 10.0),
              Text(
                "Account",
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              ),
              // Card(
              //   margin: const EdgeInsets.all(8.0),
              //   child:ListTile(
              //     title: Text("piyumi"),
              //    // leading: CircleAvatar(),
              //   ) ,),

              //1st card
              Card(
                elevation: 8.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.tag_faces, color: Colors.green),
                      title: Text("Edit Profile"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        Navigator.of(context).pushNamed('/editProfile');
                      },
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      width: double.infinity,
                      height: 1.0,
                      color: Colors.green.shade400,
                    ),
                    ListTile(
                      leading: Icon(Icons.location_on, color: Colors.green),
                      title: Text("Change Location"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {},
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      width: double.infinity,
                      height: 1.0,
                      color: Colors.green.shade400,
                    ),
                    ListTile(
                      leading: Icon(Icons.lock_outline, color: Colors.green),
                      title: Text("Change Password"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: Icon(Icons.exit_to_app, color: Colors.green),
                      title: Text("Sign Out"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        logout(context);
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10.0),
              Text(
                "Notification",
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              ),

              SwitchListTile(
                dense: true,
                activeColor: Colors.black,
                contentPadding: const EdgeInsets.all(0),
                value: true,
                title: Text("Received Notification"),
                onChanged: (val) {},
              ),

              SwitchListTile(
                dense: true,
                activeColor: Colors.black,
                contentPadding: const EdgeInsets.all(0),
                value: false,
                title: Text("Received Offer Notification"),
                onChanged: (null),
              )
            ],
          )),
    );
  }
}
