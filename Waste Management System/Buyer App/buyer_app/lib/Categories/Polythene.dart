// import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:buyerapp/utils/ResponseData.dart';

String item = ResponseData.category;
String base64Image;

class Polythene extends StatefulWidget {
  @override
  _PolytheneState createState() => _PolytheneState();
}

class _PolytheneState extends State<Polythene> {
  List<dynamic> data;
  // File tmpFile;
  var itemCount;
  final String viewitemUrl =
      "${ResponseData.apiUrl}/item/viewItem/${ResponseData.category}";
  // final String viewImage =
  //     "${ResponseData.apiUrl}/item/viewImage/${ResponseData.itemImage}";

  TextEditingController controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    this.getPolytheneItems(context);
  }

  void getPolytheneItems(BuildContext context) async {
    var response = await http.get(Uri.encodeFull(viewitemUrl),
        headers: {"Accept": "application/json"});

    // var res = await http.get(Uri.encodeFull(viewImage),
    //     headers: {"Accept": "application/json"});

    if (this.mounted) {
      setState(() {
        Map<String, dynamic> responseJson = json.decode(response.body);

        print(responseJson);
        data = responseJson["item"];
        itemCount = data.length;

        // String resJson = json.decode(res.body);
        // tmpFile = base64.decode(resJson) as File;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ResponseData.category + ' Items'),
        backgroundColor: Colors.green,
      ),
      body: searchBox(),
    );
  }

  Widget searchBox() {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          child: Container(
            color: Colors.green,
            child: new Card(
              child: new ListTile(
                leading: new Icon(Icons.search),
                title: new TextField(
                  controller: controller,
                  decoration: new InputDecoration(
                      hintText: itemCount.toString() + " ITEM/S",
                      border: InputBorder.none),
                  // onChanged:
                  // onSearchTextChanged,
                ),
                trailing: new IconButton(
                  icon: new Icon(Icons.cancel),
                  onPressed: () {
                    controller.clear();
                    // onSearchTextChanged('Aluminium');
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      body: _allPolytheneList(),
    );
  }

  // Widget getImage() {}

  Widget _allPolytheneList() {
    return data != null && data.length != null && data.length > 0
        ? ListView.builder(
            itemCount: data.length == null ? 0 : data.length,
            itemBuilder: (BuildContext context, int index) {
              ResponseData.itemId = data[index]['_id'];
              return Container(
                width: 700,
                child: new Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Colors.white,
                  elevation: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: 10.0),
                      // Container(
                      //   child: new CircleAvatar(
                      //     backgroundImage: new NetworkImage("polythene.jpg"),
                      //   ),
                      // ),
                      SizedBox(height: 20.0),
                      Container(
                        child: Text(data[index]['category']),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        child: new Text(
                          'Valid Duration' + ':' + data[index]['duration'],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        child: new Text(
                          'Description' + ':' + data[index]['description'],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        child: new RaisedButton(
                            color: Colors.green,
                            child: new Text(
                              "Place a bid",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            onPressed: () {
                              ResponseData.itemId = data[index]['_id'];
                              ResponseData.category = data[index]['category'];
                              ResponseData.description =
                                  data[index]['description'];
                              ResponseData.basePrice =
                                  (data[index]['price']).toString();
                              ResponseData.duration = data[index]['duration'];
                              ResponseData.customerId =
                                  data[index]['customerId'];
                              ResponseData.endDate = data[index]['finishData'];
                              Navigator.of(context).pushNamed('/bid');
                              print(ResponseData.itemId);
                            }),
                      ),
                    ],
                  ),
                ),
              );
            })
        : Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
