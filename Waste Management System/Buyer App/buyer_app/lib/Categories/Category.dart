import 'package:flutter/material.dart';
//import 'package:email_validator/email_validator.dart';

class Category extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Green wasteland'),
        backgroundColor: Colors.green,
      ),
      body: CategoryPage(),
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
                      image: new AssetImage('assets/images/category.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withAlpha(0xBF), BlendMode.darken))),
              child: Stack(children: <Widget>[
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
                        'CATEGORY',
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 45.0),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
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
                              contentPadding: EdgeInsets.only(
                                  left: 20, top: 15, bottom: 15),
                              hintText: 'Search',
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      ),
                    )
                  ],
                ),
              ]),
            ),
            //
            Container(
                alignment: Alignment.center,
                child: Text(
                  '',
                  style: TextStyle(fontSize: 17, color: Colors.green),
                )),

            Container(
              alignment: Alignment(-0.1, 1),
              child: new Container(
                child: const Text('Select Category You Want!',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.green,
                        fontWeight: FontWeight.bold)),
              ),
            ),

            //plastic
            Container(
              alignment: Alignment(-0.1, 1),
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(10.5)),
                  new GestureDetector(
                      child: Container(
                          width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                            // color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage("assets/images/plastics.jpg"),
                                fit: BoxFit.cover),
                            // child: Text("clickMe") // button text
                          )),
                      onTap: () {
                        //print("you clicked my");
                      }),
                  new Container(
                    child: Text('Plastic',style:TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),

            //aluminium
            Container(
              alignment: Alignment(-0.1, 1),
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(10.5)),
                  new GestureDetector(
                      child: Container(
                          width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage("assets/images/aluminum.png"),
                                fit: BoxFit.cover),
                            
                          )),
                      onTap: () {
                        Navigator.of(context).pushNamed('/aluminium');
                      }),
                  new Container(
                    child: Text('Aluminum',style:TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),

        //brash
            Container(
              alignment: Alignment(-0.1, 1),
              child: Column(
                children: <Widget>[
                   Padding(padding: EdgeInsets.all(10.5)),
                  new GestureDetector(
                      child: Container(
                          width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                image: AssetImage("assets/images/brash.png"),
                                fit: BoxFit.cover),
                            
                          )),
                      onTap: () {
                        
                      }),
                      new Container(
                    child: Text('Brash',style:TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),

            //copper
            Container(
              alignment: Alignment(-0.1, 1),
              child: Column(
                children: <Widget>[
                   Padding(padding: EdgeInsets.all(10.5)),
                  new GestureDetector(
                      child: Container(
                          width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                image: AssetImage("assets/images/copper.png"),
                                fit: BoxFit.cover),
                            
                          )),
                      onTap: () {
                        Navigator.of(context).pushNamed('/copper');
                      }),
                      new Container(
                    child: Text('Copper',style:TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),

            //glash
            Container(
              alignment: Alignment(-0.1, 1),
              child: Column(
                children: <Widget>[
                   Padding(padding: EdgeInsets.all(10.5)),
                  new GestureDetector(
                      child: Container(
                          width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                image: AssetImage("assets/images/glass.jpg"),
                                fit: BoxFit.cover),
                            
                          )),
                      onTap: () {
                        
                      }),
                      new Container(
                    child: Text('Glass',style:TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),

            //other metals
            Container(
              alignment: Alignment(-0.1, 1),
              child: Column(
                children: <Widget>[
                   Padding(padding: EdgeInsets.all(10.5)),
                  new GestureDetector(
                      child: Container(
                          width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                image: AssetImage("assets/images/other metals.png"),
                                fit: BoxFit.cover),
                            
                          )),
                      onTap: () {
                        
                      }),
                      new Container(
                    child: Text('Other Metals',style:TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),

            //paper and cardboard
            Container(
              alignment: Alignment(-0.1, 1),
              child: Column(
                children: <Widget>[
                   Padding(padding: EdgeInsets.all(10.5)),
                  new GestureDetector(
                      child: Container(
                          width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                image: AssetImage("assets/images/paper and cardboard.jpg"),
                                fit: BoxFit.cover),
                            
                          )),
                      onTap: () {
                        
                      }),
                      new Container(
                    child: Text('Paper & Cardboard',style:TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),

            //rune,lands and concrete
             Container(
              alignment: Alignment(-0.1, 1),
              child: Column(
                children: <Widget>[
                   Padding(padding: EdgeInsets.all(10.5)),
                  new GestureDetector(
                      child: Container(
                          width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                image: AssetImage("assets/images/rune lands and concrete.jpg"),
                                fit: BoxFit.cover),
                            
                          )),
                      onTap: () {
                        
                      }),
                      new Container(
                    child: Text('Rune, Lands & Concrete',style:TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),

            //scrap
             Container(
              alignment: Alignment(-0.1, 1),
              child: Column(
                children: <Widget>[
                   Padding(padding: EdgeInsets.all(10.5)),
                  new GestureDetector(
                      child: Container(
                          width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                image: AssetImage("assets/images/scrap.png"),
                                fit: BoxFit.cover),
                            
                          )),
                      onTap: () {
                        
                      }),
                      new Container(
                    child: Text('Scrap',style:TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),

            //specials
             Container(
              alignment: Alignment(-0.1, 1),
              child: Column(
                children: <Widget>[
                   Padding(padding: EdgeInsets.all(10.5)),
                  new GestureDetector(
                      child: Container(
                          width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                image: AssetImage("assets/images/specials.png"),
                                fit: BoxFit.cover),
                            
                          )),
                      onTap: () {
                        
                      }),
                      new Container(
                    child: Text('Specials',style:TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),

            //stainless
             Container(
              alignment: Alignment(-0.1, 1),
              child: Column(
                children: <Widget>[
                   Padding(padding: EdgeInsets.all(10.5)),
                  new GestureDetector(
                      child: Container(
                          width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                image: AssetImage("assets/images/stainless.png"),
                                fit: BoxFit.cover),
                            
                          )),
                      onTap: () {
                        
                      }),
                      new Container(
                    child: Text('Stainless',style:TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),

            //trash
             Container(
              alignment: Alignment(-0.1, 1),
              child: Column(
                children: <Widget>[
                   Padding(padding: EdgeInsets.all(10.5)),
                  new GestureDetector(
                      child: Container(
                          width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                image: AssetImage("assets/images/trash.jpg"),
                                fit: BoxFit.cover),
                            
                          )),
                      onTap: () {
                        
                      }),
                      new Container(
                    child: Text('Trash',style:TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),

            //wood
             Container(
              alignment: Alignment(-0.1, 1),
              child: Column(
                children: <Widget>[
                   Padding(padding: EdgeInsets.all(10.5)),
                  new GestureDetector(
                      child: Container(
                          width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                image: AssetImage("assets/images/wood.jpg"),
                                fit: BoxFit.cover),
                            
                          )),
                      onTap: () {
                        
                      }),
                       
                      new Container(
                    child: Text('Wood',style:TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold)),
                  ),
                  Padding(padding: EdgeInsets.all(10.5)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
