
import 'package:flutter/material.dart';



class AboutUs extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AboutUs> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Green wasteland'),
        backgroundColor: Colors.green,),
      body:About(),

      //add drawer to the app
      drawer: Drawer(

        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Buyer App',style: TextStyle(fontSize: 20,color: Colors.white),),
              decoration: BoxDecoration(
                color: Colors.green,
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
                              width: 2.0
                          ),
                          image: DecorationImage(
                            image: AssetImage('assets/images/logo.jpg'),
                          )
                      ),
                    )
                  ],
                ),
              ],
            ),
            ListTile(
              leading: Icon(Icons.event_note),
              title: Text('About Us'),
              onTap: () {
                Navigator.of(context).pushNamed('/aboutus');
              },
            ),
            ListTile(
              leading: Icon(Icons.contacts),
              title: Text('Contact Us'),
              onTap: () {
                Navigator.of(context).pushNamed('/contactus');
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Login'),
              onTap: () {
                Navigator.of(context).pushNamed('/login');
              },
            ), //ListTitle
          ],
        ),
      ),


    );

  }
}
class About extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<About> {



  @override
  Widget build(BuildContext context) {
    return Material(


      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

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
                          'About Us',
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                      ),
                      SizedBox(height: 25.0),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0,right: 15.0),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(25),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.search,
                                  color: Colors.green,
                                  size: 30.0,
                                ),
                                contentPadding:
                                EdgeInsets.only(left: 20,top: 15,bottom: 10),
                                hintText: 'Search',hintStyle: TextStyle(
                                color: Colors.grey
                            )
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ]
            ),
          ],

        ),
      ),
    );

  }
}
