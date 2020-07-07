import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  createAlertDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Are You sure you want deactivate your account ? '),
            actions: <Widget>[
              MaterialButton(
                child: Text('No',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
                onPressed: () {
                  Navigator.of(context).pushNamed('/settings');
                },
              ),
              MaterialButton(
                child: Text('Yes',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 18),),
                onPressed: () {
                  Navigator.of(context).pushNamed('/deactivateaccount');
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting Page'),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          // padding: const EdgeInsets.all(16.0),
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(children: <Widget>[
            Container(
              height: 200.0,
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
                    'SETTING',
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
          ]),
          const SizedBox(height: 10.0),
          Container(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.tag_faces, color: Colors.green),
                  title: Text("Edit Profile"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.of(context).pushNamed('/profile');
                  },
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.green,
                ),
                ListTile(
                  leading: Icon(Icons.location_on, color: Colors.green),
                  title: Text("Change Location"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                     Navigator.of(context).pushNamed('/changelocation');
                  },
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.green,
                ),
                ListTile(
                  leading: Icon(Icons.lock_outline, color: Colors.green),
                  title: Text("Change Password"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.of(context).pushNamed('/changepassword');
                  },
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.green,
                ),
                ListTile(
                  leading: Icon(Icons.exit_to_app, color: Colors.green),
                  title: Text("Delete My Account"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    createAlertDialog(context);
                  },
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.green,
                ),
              ],
            ),
          ),
          const SizedBox(height: 15.0),
          Padding(
            padding: EdgeInsets.only(left: 15.0),
            child: Text(
              'Notifications',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: SwitchListTile(
              dense: true,
              activeColor: Colors.black,
              contentPadding: const EdgeInsets.all(5),
              value: true,
              title:
                  Text("Receive Notification", style: TextStyle(fontSize: 16)),
              onChanged: (val) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: SwitchListTile(
              dense: true,
              activeColor: Colors.black,
              contentPadding: const EdgeInsets.all(5),
              value: false,
              title: Text("Receive Offer Notification",
                  style: TextStyle(fontSize: 16)),
              onChanged: (null),
            ),
          )
        ],
      )),
    );
  }
}
