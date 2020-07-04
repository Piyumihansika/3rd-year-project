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
                child: Text('No'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/setting');
                },
              ),
              MaterialButton(
                child: Text('Yes'),
                onPressed: () {
                  Navigator.of(context).pushNamed('/deactivate');
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
        leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.black),
    onPressed: () => Navigator.of(context).pushNamed('/dashboard'),
  ), 
        elevation: 4.0,
        title: Text(
          'SETTING',
      style: TextStyle(color: Colors.black),
          
        ),
        backgroundColor: Colors.green,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      backgroundColor: Colors.green[100],   
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 10.0),
              
              Text(
                "Account",
                style: TextStyle(fontSize: 20.0, color: Colors.black,fontWeight: FontWeight.bold),
                
              ),
              
 
              //1st card
              
              Card(
                
                color: Colors.green[100],
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
                      onTap: () {
                        Navigator.of(context).pushNamed('/changepassword');
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.exit_to_app, color: Colors.green),
                      title: Text("Delete My Account"),
                      trailing: Icon(Icons.keyboard_arrow_right),
                      onTap: () {
                        createAlertDialog(context);
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10.0),
              
              Text(
                
                "Notification",
                style: TextStyle(fontSize: 20.0, color: Colors.black,fontWeight: FontWeight.bold),
                
              ),

              SwitchListTile(
                dense: true,
                activeColor: Colors.black,
                contentPadding: const EdgeInsets.all(0),
                value: true,
                title: Text("Receive Notification"),
                onChanged: (val) {},
              ),

              SwitchListTile(
                dense: true,
                activeColor: Colors.black,
                contentPadding: const EdgeInsets.all(0),
                value: false,
                title: Text("Receive Offer Notification"),
                onChanged: (null),
              )
            ],
          )),
    );
  }
}
