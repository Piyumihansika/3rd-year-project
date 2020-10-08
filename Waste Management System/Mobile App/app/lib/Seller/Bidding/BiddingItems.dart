import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:app/utils/ResponseData.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

String name = 'Polythin bag';
String date = '14.5.2020';

class BiddingItems extends StatefulWidget {
  @override
  _BiddingItemsState createState() => _BiddingItemsState();
}

class _BiddingItemsState extends State<BiddingItems> {
  List<dynamic> category;
  List<dynamic> bids;

  final String viewitemUrl =
      "${ResponseData.apiUrl}/auction/bidItems/${ResponseData.userId}";
  final String viewItemBids =
      "${ResponseData.apiUrl}/auction/itemBids/${ResponseData.bidItemId}";

  @override
  void initState() {
    super.initState();
    this.getItems(context);
  }

  void getItems(BuildContext context) async {
    var response = await http.get(Uri.encodeFull(viewitemUrl),
        headers: {"Accept": "application/json"});

    if (this.mounted) {
      setState(() {
        Map<String, dynamic> responseJson = json.decode(response.body);

        category = responseJson[ResponseData.bidCategory];
        // print(category[0]);
      });
    }
  }

  void getBids(BuildContext context) async {
    var response = await http.get(Uri.encodeFull(viewItemBids),
        headers: {"Accept": "application/json"});

    Map<String, dynamic> responseJson = json.decode(response.body);
    bids = responseJson["list"];
    // print(bids);

    if (bids.length != null) {
      Navigator.of(context).pushNamed('/chart');
    } else {
      Navigator.of(context).pushNamed('/nobids');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pushNamed('/biddingDetails'),
          ),
          title: Text(
            "Bidding Items",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
        backgroundColor: Colors.green[100],
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              for (int i = 0; i < category.length; i++)
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.shopping_cart, size: 50),
                        title: Text("Item " + (i + 1).toString()),
                        subtitle: Text(category[i]["finishDate"]),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          ResponseData.bidItemId = category[i]["_id"];
                          getBids(context);
                        },
                      ),
                    ],
                  ),
                ),
              // Container(
              //     alignment: Alignment(-0.1, 1),
              //     child: new RaisedButton(
              //       child: const Text('LOGIN'),
              //       color: Colors.green,
              //       textColor: Colors.white,
              //       onPressed: () async {
              //         Navigator.of(context).pushNamed('/dashboard');
              //       },
              //     )),
            ],
          ),
        ));
  }
}
