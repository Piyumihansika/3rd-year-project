import 'package:flutter/material.dart';


class UserType extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<UserType> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('UserType'),
        backgroundColor: Colors.green,),
      body:Type(),

    );

  }
}
class Type extends StatefulWidget {
  @override
  _UserTypeState createState() => _UserTypeState();
}

class _UserTypeState extends State<Type> {

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
                          'User Type',
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87),
                        ),
                      ),

                      SizedBox(height: 45.0),
                      Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text(
                          'Are you a household user or a company user ?',
                          style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ]
            ),
            //
            

          SizedBox(height: 60.0),
            Container(

                alignment: Alignment(-0.1,1),

                child: Padding(
                   padding: EdgeInsets.only(left: 15.0,right: 15.0),
                  child: new RaisedButton(
                    child: const Text('Household User',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                    color: Colors.green,
                    textColor: Colors.white,
                    padding:
                    const EdgeInsets.only(left: 110.0, top: 10.0,bottom: 10.0, right: 110.0),

                    onPressed: () {
                      Navigator.of(context).pushNamed('/signuphousehold');
                    },
                  ),
                )
            ),

            SizedBox(height: 20.0),
            Container(

                alignment: Alignment(-0.1,1),

                child: Padding(
                  padding: EdgeInsets.only(left: 15.0,right: 15.0),
                  child: new RaisedButton(
                    child: const Text('Company User',style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                    color: Colors.green,
                    textColor: Colors.white,
padding:
                    const EdgeInsets.only(left: 110.0, top: 10.0,bottom: 10.0, right: 120.0),
                    onPressed: () {
                      Navigator.of(context).pushNamed('/signupcompany');
                    },
                  ),
                )
            ),
          ],

        ),
      ),
    );

  }
}


