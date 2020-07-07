import 'package:flutter/material.dart';
import 'package:buyerapp/read_more_text.dart';

class AboutUs extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Green wasteland'),
        backgroundColor: Colors.green,
      ),
      body: About(),
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
            Stack(children: <Widget>[
              Container(
                height: 200.0,
                width: double.infinity,
                color: Colors.white,
              ),
              Positioned(
                bottom: 100.0,
                right: 90.0,
                child: Container(
                  height: 350.0,
                  width: 350.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(320),
                      color: Colors.yellow[50]),
                ),
              ),
              Positioned(
                bottom: 120.0,
                right: 130.0,
                child: Container(
                  height: 290.0,
                  width: 300.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(320),
                      color: Colors.green[50]),
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
                      'ABOUT US',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 25.0),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: ReadMoreText(
                      'Green wasteland is a platform connecting people for selling & buying waste.',
                      style: TextStyle(fontSize: 20.0, color: Colors.red),
                    ),
                  ),
                  Divider(
                    color: const Color(0xFF167F67),
                  ),
                  SizedBox(height: 25.0),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: ReadMoreText(
                      'To implement a collaborative environment on the web and mobile space to connect people on buying & selling waste items while contributing to reducing environmental pollution. The mobile application running on both Android and IOS  platforms.Platform to sell and buy waste items through the bidding system.Web application for the admin dashboard & public promotions.',
                      style: TextStyle(fontSize: 20.0, color: Colors.black),
                      trimLines: 2,
                      colorClickableText: Colors.pink,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: '...Show more',
                      trimExpandedText: ' show less',
                    ),
                  ),
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
