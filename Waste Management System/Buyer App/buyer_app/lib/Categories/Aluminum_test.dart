// import 'dart:async';
//import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:buyerapp/utils/ResponseData.dart';

class AluminiumDetail extends StatefulWidget {
  @override
  _AluminiumDetailState createState() => _AluminiumDetailState();
}

class _AluminiumDetailState extends State<AluminiumDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aluminium Items'),
        backgroundColor: Colors.green,
      ),
      body: Aluminium(),
    );
  }
}

class Aluminium extends StatefulWidget {
  @override
  _AluminiumState createState() => _AluminiumState();
}

List<ItemDetails> _searchResult = [];

// List<ItemDetails> _itemDetails = [];

class ItemDetails {
  ItemDetails(
      this.price,
      this.customerId,
      this.state,
      // this.finishDate,
      this.id,
      this.category,
      this.description,
      // this.startDate,
      this.duration,
      this.itemImage);

  final int price;
  final String id,
      customerId,
      state,
      category,
      description,
      itemImage,
      duration;
  // final DateTime startDate, finishDate;

  ItemDetails.fromJson(Map json)
      : id = json['id'],
        price = json['price'],
        customerId = json['customerId'],
        state = json['state'],
        itemImage = json['itemImage'],
        category = json['category'],
        description = json['description'],
        // startDate = json['startDate'],
        // finishDate = json['finishDate'],
        duration = json['duration'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'price': price.toString(),
        'customerId': customerId,
        'state': state,
        'itemImage': itemImage,
        'category': category,
        'description': description,
        // 'startDate': startDate.toIso8601String(),
        // 'finishDate': finishDate.toIso8601String(),
        'duration': duration
      };
}

class _AluminiumState extends State<Aluminium> {
  List<dynamic> data;
  final String viewitemUrl = "${ResponseData.apiUrl}/item/viewItem";
  TextEditingController controller = new TextEditingController();

  @override
  void initState() {
    super.initState();

    this.getItemDetails(context);
  }

  // Get json result and convert it to model. Then add
  void getItemDetails(BuildContext context) async {
    var response = await http.get(Uri.encodeFull(viewitemUrl),
        headers: {"Accept": "application/json"});
    var responseJson = json.decode(response.body);
    print(responseJson);

    if (this.mounted) {
      setState(() {
        Map<String, dynamic> responseJson = json.decode(response.body);
        // print(responseJson);
        data = responseJson["item"];
        // for (Map item in responseJson["item"]) {
        //   _itemDetails.add(ItemDetails.fromJson(item));
        // }
      });
    }
  }

// // searching function
//   onSearchTextChanged(String text) async {
//     _searchResult.clear();
//     // if (text.isEmpty) {
//     //   setState(() {});
//     //   return;
//     // }

// // // view details
//     data.forEach((itemDetail) {
//       if (itemDetail.customerId.contains(text) ||
//           itemDetail.id.contains(text) ||
//           itemDetail.state.contains(text) ||
//           // itemDetail.startDate.toIso8601String().contains(text) ||
//           // itemDetail.finishDate.toIso8601String().contains(text) ||
//           itemDetail.itemImage.contains(text) ||
//           itemDetail.price.toString().contains(text) ||
//           itemDetail.description.contains(text) ||
//           itemDetail.duration.contains(text) ||
//           itemDetail.category.contains(text)) _searchResult.add(itemDetail);
//     });

//     setState(() {});
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pushNamed('/category'),
        ),
        title: Text(
          "Aluminium Items",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
      ),
      body: _showList(),
    );
  }

  Widget _showList() {
    return data != null && data.length != null && data.length > 0
        ? Material(
            child: Center(
              child: Column(
                // appbar: new AppBar(
                //    title: new Text('Search'),
                // elevation: 0.0,
                // backgroundColor: Colors.green,
                // ),
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new Container(
                    color: Colors.green,
                    child: new Padding(
                      padding: const EdgeInsets.all(8.0),
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

                  //search
                  new Expanded(
                      child: data.length != 0 || controller.text.isNotEmpty
                          ? new ListView.builder(
                              itemCount: _searchResult.length,
                              itemBuilder: (context, i) {
                                return new Card(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Container(
                                        child: new CircleAvatar(
                                          backgroundImage: new NetworkImage(
                                            _searchResult[i].itemImage,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20.0),
                                      Container(
                                        child: Text(_searchResult[i].category),
                                      ),
                                      SizedBox(height: 10.0),
                                      Container(
                                        child: new Text(
                                          'Valid Duration' +
                                              ':' +
                                              _searchResult[i].duration,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ),
                                      SizedBox(height: 10.0),
                                      // Container(
                                      //   child: new Text(
                                      //     'Current Bid' +
                                      //         ':' +
                                      //         _searchResult[i].currentBid,
                                      //     style: TextStyle(
                                      //         fontSize: 18,
                                      //         fontWeight: FontWeight.bold,
                                      //         color: Colors.black),
                                      //   ),
                                      // ),
                                      // SizedBox(height: 10.0),
                                      Container(
                                        child: new Text(
                                          'Description' +
                                              ':' +
                                              _searchResult[i].description,
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
                                              Navigator.of(context)
                                                  .pushNamed('/bid');
                                            }),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )

                          //add design to view details

                          : ListView.builder(
                              itemCount: data.length == null ? 0 : data.length,
                              itemBuilder: (BuildContext context, int index) {
                                if (data[index]['category'] == 'Aluminium') {
                                  return Container(
                                    width: 700,
                                    child: new Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      ),
                                      color: Colors.white,
                                      elevation: 10,
                                      child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            SizedBox(height: 10.0),
                                            Container(
                                              child: new CircleAvatar(
                                                backgroundImage:
                                                    new NetworkImage(
                                                  data[index]['itemImage'],
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 20.0),
                                            Container(
                                              child:
                                                  Text(data[index]['category']),
                                            ),
                                            SizedBox(height: 10.0),
                                            Container(
                                              child: new Text(
                                                'Valid Duration' +
                                                    ':' +
                                                    data[index]['duration'],
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                            ),
                                            SizedBox(height: 10.0),
                                            // Container(
                                            //   child: new Text(
                                            //     'Current Bid' +
                                            //         ':' +
                                            //         _itemDetails[index].currentBid,
                                            //     style: TextStyle(
                                            //         fontSize: 18,
                                            //         fontWeight: FontWeight.bold,
                                            //         color: Colors.black),
                                            //   ),
                                            // ),
                                            // SizedBox(height: 10.0),
                                            Container(
                                              child: new Text(
                                                'Description' +
                                                    ':' +
                                                    data[index]['description'],
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pushNamed('/bid');
                                                  }),
                                            ),
                                          ]),
                                    ),
                                  );
                                } else {
                                  return null;
                                }
                              },
                            )),
                ],
              ),
            ),
          )
        : Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
