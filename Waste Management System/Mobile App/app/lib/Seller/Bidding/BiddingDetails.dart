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
  List<dynamic> data;
  var itemCount;

  final String viewitemUrl =
      "${ResponseData.apiUrl}/auction/bidItems/${ResponseData.userId}";

  void getPolytheneItems(BuildContext context) async {
    var response = await http.get(Uri.encodeFull(viewitemUrl),
        headers: {"Accept": "application/json"});

    if (this.mounted) {
      print(ResponseData.userId);
      setState(() {
        Map<String, dynamic> responseJson = json.decode(response.body);

        print(responseJson);
        data = responseJson["items"];
        itemCount = data.length;
        print(itemCount);

        // String resJson = json.decode(res.body);
        // tmpFile = base64.decode(resJson) as File;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    this.getPolytheneItems(context);
    this.build(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pushNamed('/dashboard'),
          ),
          title: Text(
            "Items",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
        backgroundColor: Colors.green[100],

//
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              for (int i = 0; i < 2; i++)
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.shopping_cart, size: 50),
                        title: Text("Polythin"),
                        subtitle: Text('date'),
                        trailing: Icon(Icons.keyboard_arrow_right),
                        onTap: () {
                          if (5 != null) {
                            Navigator.of(context).pushNamed('/chart');
                          } else {
                            Navigator.of(context).pushNamed('/nobids');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              Container(
                  alignment: Alignment(-0.1, 1),
                  child: new RaisedButton(
                    child: const Text('LOGIN'),
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: () async {
                      Navigator.of(context).pushNamed('/dashboard');
                    },
                  )),
            ],
          ),
        ));
  }
}
