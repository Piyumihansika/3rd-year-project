import 'package:flutter/material.dart';
//import 'package:email_validator/email_validator.dart';

//import 'package:passwordfield/passwordfield.dart';


class BuyerHome extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<BuyerHome> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Green wasteland'),
        backgroundColor: Colors.green,),
      body:Home(),

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
                Navigator.of(context).pushNamed('/');
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
              title: Text('Histry'),
              onTap: () {
                Navigator.of(context).pushNamed('/');
              },
            ),//ListTitle
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Logout'),
              onTap: () {
                Navigator.of(context).pushNamed('/login');
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
                          'HOME',
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
            //
            Container(
                alignment: Alignment.center,
                child: Text(
                  '',
                  style: TextStyle(fontSize:17, color: Colors.green),
                )),


            Container(

                alignment: Alignment(-0.1,1),

                child: new RaisedButton(
                  child: const Text('Getting start'),
                  color: Colors.green,
                  textColor: Colors.white,

                  onPressed: () {
                      alertBox(context);
                  },
                )
            ),
          ],

        ),
      ),
    );

  }
}

void alertBox(BuildContext context){
  var alertDialog = AlertDialog(
    title: Text("Signup messege"),
    content: Text("You are registered successfully"),

    actions: <Widget>[
        FlatButton(
          child: Text("Continue"),
          onPressed: (){
            
          },
        ),
        FlatButton(
          child: Text("Cancel"),
          onPressed: (){
            
          },
        )
    ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context){
        return alertDialog;
      });
}


