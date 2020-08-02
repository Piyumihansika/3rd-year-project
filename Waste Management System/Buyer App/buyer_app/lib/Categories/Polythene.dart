import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:buyerapp/utils/ResponseData.dart';

class Polythene extends StatefulWidget {
  @override
  _PolytheneState createState() => _PolytheneState();
}

class _PolytheneState extends State<Polythene> {
  List<dynamic> data;
  final String viewitemUrl = "${ResponseData.apiUrl}/item/viewItem";
  @override
  void initState() {
    super.initState();
    this.getPolytheneItems(context);
  }

  void getPolytheneItems(BuildContext context) async {
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
      body: _allPolytheneList(),
    );
  }

  Widget _allPolytheneList() {
    return data != null && data.length != null && data.length > 0
        ? ListView.builder(
            itemCount: data.length == null ? 0 : data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(4.0),
                      ),
                      Card(
                        color: Colors.indigo,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        semanticContainer: true,
                        child: ListTile(
                          selected: false,
                          leading: CircleAvatar(
                            minRadius: 3.0,
                            maxRadius: 25.0,
                            backgroundImage:
                                AssetImage("assets/images/plastics.jpg"),
                            // AssetImage(
                            //     "${(data[index]['itemImage']).toString()}"),
                          ),
                          title: Text(
                            data[index]['category'],
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          onTap: () {
                            ResponseData.itemId =
                                (data[index]['_id']).toString();
                            print(ResponseData.itemId);
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => GuideProfileAdmin()),
                            // );
                          },
                        ),
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
