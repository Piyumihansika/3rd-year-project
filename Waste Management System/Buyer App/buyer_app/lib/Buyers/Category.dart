import 'package:flutter/material.dart';
//import 'package:email_validator/email_validator.dart';


class Category extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Category> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Green wasteland'),
        backgroundColor: Colors.green,),
      body:CategoryPage(),

    );

  }
}
class CategoryPage extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<CategoryPage> {

  @override
  Widget build(BuildContext context) {
    return Material(


      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
            Container(
              decoration: new BoxDecoration(
            image: new DecorationImage(
                image: new AssetImage('assets/images/logo.jpg'),
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withAlpha(0xBF), BlendMode.darken))),
              child: Stack(
                  children: <Widget>[
                    // Container(
                    //   height: 200.0,
                    //   width: double.infinity,
                    //   color: Colors.green,
                    // ),
                  
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
                            'CATEGORY',
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        SizedBox(height: 45.0),
                        Padding(
                          padding: EdgeInsets.only(left: 15.0,right: 15.0),
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(30),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.green,
                                    size: 30.0,
                                  ),
                                  contentPadding:
                                  EdgeInsets.only(left: 20,top: 15,bottom: 15),
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
            ),
            //
            Container(
                alignment: Alignment.center,
                child: Text(
                  '',
                  style: TextStyle(fontSize:17, color: Colors.green),
                )),


            Container (

                alignment: Alignment(-0.1,1),

                child: new Container(
                  child: const Text('Select Category You Want!',
                  style:TextStyle(fontSize:17, color: Colors.green,fontWeight: FontWeight.bold)),
                  
                )
            ),
          ],

        ),
      ),
    );

  }
}
