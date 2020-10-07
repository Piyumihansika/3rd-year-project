import 'package:flutter/material.dart';
import 'package:buyerapp/utils/ResponseData.dart';

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
                child: Text(
                  'No',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/settings');
                },
              ),
              MaterialButton(
                child: Text(
                  'Yes',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
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
           
           
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 14.0),
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
                                image: AssetImage("assets/images/setting.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        // Padding(padding: EdgeInsets.only(left:10.5)),
                      ],
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
                    if (ResponseData.username.toString() == "Company") {
                      Navigator.of(context).pushNamed('/companyProfile');

                      print("------------------" +
                          ResponseData.username +
                          "------------------------------");
                    } else {
                      Navigator.of(context).pushNamed('/profile');
                      print("------------------" +
                          ResponseData.username +
                          "------------------------------");
                    }
                  },
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.green,
                ),
                // ListTile(
                //   leading: Icon(Icons.location_on, color: Colors.green),
                //   title: Text("Change Location"),
                //   trailing: Icon(Icons.keyboard_arrow_right),
                //   onTap: () {
                //     Navigator.of(context).pushNamed('/usertype');
                //   },
                // ),
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
