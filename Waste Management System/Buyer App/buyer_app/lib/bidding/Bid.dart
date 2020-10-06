// import 'dart:html';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:buyerapp/utils/ResponseData.dart';
import 'package:http/http.dart' as http;

var id;
var newid = id;
final String submitBidUrl = "http://10.0.2.2:3000/auction/addBid";

class Bid extends StatefulWidget {
  final String itemId;
  final String itemName;
  final String currentBid;
  final String description;
  final String itemImageUrl;
  final String startDate;
  final String duration;

  Bid(
      {Key key,
      this.itemId,
      this.itemName,
      this.currentBid,
      this.description,
      this.itemImageUrl,
      this.startDate,
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

  void initState() {
    super.initState();
    this.getMaxBid(context);
  }

  void getMaxBid(BuildContext context) async {
    final String viewMaxBid =
        "${ResponseData.apiUrl}/auction/maxBid/${ResponseData.itemId}";
    var response = await http.get(Uri.encodeFull(viewMaxBid),
        headers: {"Accept": "application/json"});

    if (this.mounted) {
      setState(() {
        print(response.statusCode);
        if (response.statusCode == 200) {
          //  Map<String, dynamic>ResponseData.currentMaxBid = (response.body).toString();
          Map<String, dynamic> map = json.decode(response.body);
          ResponseData.currentMaxBid = (map["bidValue"]).toString();
          id = ResponseData.itemId;
          print("---------------------- ID: " +
              id +
              "-----------------------------");
        } else {
          ResponseData.currentMaxBid = (json.decode(response.body)).toString();

          print('----------------------------' +
              ResponseData.currentMaxBid +
              '----------------------------');
        }
      });
    }
  }

  void submitBid(BuildContext context) async {
    var date = new DateTime.now().toString();
    print(date);
    Map<String, dynamic> data = {
      'customerId': ResponseData.customerId,
      'itemId': ResponseData.itemId,
      'biddingTime': date.toString(),
      'buyerId': ResponseData.userId,
      'bidValue': bid.text,
    };

    var response = await http.post(submitBidUrl,
        body: data, encoding: Encoding.getByName("Application/json"));
    if (response.statusCode == 200) {
      print(
          "--------------------------------submit Bid-----------------------");
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Container(
              height: 675,
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.brown[50],
                  elevation: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        child: Text(
                          'Item name' + ' : ' + ResponseData.category,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        height: 140.0,
                        width: 140.0,
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage("assets/images/aluminum.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 20,
                      // ),
                      // Container(
                      //   child: new CircleAvatar(
                      //     backgroundImage: new NetworkImage(
                      //      'itemImageUrl',
                      //     ),
                      //   ),
                      // ),

                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Container(
                          //color: Colors.lightBlue,
                          child: new Text(
                            'Description' + ' : ' + ResponseData.description,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Container(
                          //color: Colors.lightBlue,
                          child: new Text(
                            'Base Price' + ' : ' + ResponseData.basePrice,
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
                          color: Colors.yellowAccent,
                          child: new Text(
                            'Current Max Bid' +
                                ':' +
                                ResponseData.currentMaxBid,
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
                          //color: Colors.yellowAccent,
                          child: new Text(
                            'Duration' + ':' + ResponseData.duration,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Container(
                          //color: Colors.yellowAccent,
                          child: new Text(
                            'End Date' + ':' + ResponseData.endDate,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.red),
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
                              icon: const Icon(Icons.credit_card,
                                  color: Colors.black),
                              hintText: 'Please enter more than current bid',
                              labelText: 'Enter your Max bid',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
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
                            onPressed: () {
                              submitBid(context);
                              bid.clear();
                              // if (_formKey.currentState.validate()) {

                              // Navigator.of(context).pushNamed('');
                              // }
                            }),
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
