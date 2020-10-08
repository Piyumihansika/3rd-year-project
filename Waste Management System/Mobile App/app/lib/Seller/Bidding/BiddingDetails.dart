import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:app/utils/ResponseData.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

String name = 'Polythin bag';
String date = '14.5.2020';

class BiddingDetails extends StatefulWidget {
  @override
  _BiddingDetailsState createState() => _BiddingDetailsState();
}

class _BiddingDetailsState extends State<BiddingDetails> {
  List<dynamic> category;
  int categoryCount;

  final String viewitemUrl =
      "${ResponseData.apiUrl}/auction/bidItems/${ResponseData.userId}";

  @override
  void initState() {
    super.initState();
    this.getPolytheneItems(context);
    // this.build(context);
  }

  void getPolytheneItems(BuildContext context) async {
    var response = await http.get(Uri.encodeFull(viewitemUrl),
        headers: {"Accept": "application/json"});

    if (this.mounted) {
      setState(() {
        Map<String, dynamic> responseJson = json.decode(response.body);

        print(responseJson.length);
        category = responseJson["category"];
        categoryCount = responseJson["category"].length;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pushNamed('/dashboard'),
          ),
          title: Text(
            (categoryCount).toString() + " CATEGORY/S",
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
              for (int i = 0; i < (categoryCount); i++)
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.shopping_cart, size: 50),
                        title: Text(category[i]),
                        // subtitle: Text('date'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          ResponseData.bidCategory = category[i];
                          Navigator.of(context).pushNamed('/biddingItems');
                          // print(ResponseData.bidCategory);
                          
                        },
                      ),
                    ],
                  ),
                ),
              
            ],
          ),
        ));
  }
}
