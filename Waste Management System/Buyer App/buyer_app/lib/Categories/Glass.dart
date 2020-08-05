import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:buyerapp/utils/ResponseData.dart';

String item = "Glass";

class Glass extends StatefulWidget {
  @override
  _GlassState createState() => _GlassState();
}

class _GlassState extends State<Glass> {
  List<dynamic> data;
  final String viewitemUrl = "${ResponseData.apiUrl}/item/viewItem/$item";
  TextEditingController controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    this.getGlassItems(context);
  }

  void getGlassItems(BuildContext context) async {
    var response = await http.get(Uri.encodeFull(viewitemUrl),
        headers: {"Accept": "application/json"});

    if (this.mounted) {
      setState(() {
        Map<String, dynamic> responseJson = json.decode(response.body);
        print(responseJson);
        data = responseJson["item"];

        // for (Map item in responseJson) {
        //   _itemDetails.add(ItemDetails.fromJson(item));
        // }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Glass Items'),
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
                      hintText: 'Search', border: InputBorder.none),
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
      body: _allGlassList(),
    );
  }

  Widget _allGlassList() {
    return data != null && data.length != null && data.length > 0
        ? ListView.builder(
            itemCount: data.length == null ? 0 : data.length,
            itemBuilder: (BuildContext context, int index) {
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
                      Container(
                        child: new CircleAvatar(
                          backgroundImage: new NetworkImage(
                            data[index]['_id'],
                          ),
                        ),
                      ),
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
                              Navigator.of(context).pushNamed('/bid');
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



