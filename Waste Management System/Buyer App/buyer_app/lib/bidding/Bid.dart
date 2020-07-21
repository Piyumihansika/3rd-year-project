import 'package:flutter/material.dart';

class Bid extends StatefulWidget {
  final String itemName;
  final String currentBid;
  final String description;
  final String itemImageUrl;
  final String duration;

  Bid(
      {Key key,
      this.itemName,
      this.currentBid,
      this.description,
      this.itemImageUrl,
      this.duration})
      : super(key: key);

  @override
  _BidState createState() => _BidState();
}

class _BidState extends State<Bid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bid'),
        backgroundColor: Colors.green,
      ),
      body: PlaceBid(),
    );
  }
}

class PlaceBid extends StatefulWidget {
  @override
  _PlaceBidState createState() => _PlaceBidState();
}

class _PlaceBidState extends State<PlaceBid> {
  TextEditingController bid = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 600,
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  //color: Colors.green[50],
                  elevation: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        height: 140.0,
                        width: 140.0,
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage("assets/images/logo.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Text(
                          'Item name',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Container(
                          child: new Text(
                            'Current Bid' + ':' + 'rs.12',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Container(
                          child: new Text(
                            'Description' +
                                ' : ' +
                                'hsgggggggggggg gggggggggg ',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Container(
                          child: TextFormField(
                            controller: bid,
                            scrollPadding: EdgeInsets.all(10),
                            decoration: const InputDecoration(
                              icon:
                                  const Icon(Icons.person, color: Colors.black),
                              hintText: 'Please enter more than current bid',
                              labelText: 'Enter your Max bid',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter your bid';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        child: new RaisedButton(
                            color: Colors.green,
                            padding: const EdgeInsets.only(
                                left: 130.0,
                                top: 10.0,
                                bottom: 10.0,
                                right: 130.0),
                            child: new Text(
                              "Submit bid",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            onPressed: () {}),
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
