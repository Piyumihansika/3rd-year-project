import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:buyerapp/utils/ResponseData.dart';

//String auctionDetails = " ";

class AuctionDetail extends StatefulWidget {
  @override
  _AuctionDetailState createState() => _AuctionDetailState();
}

class _AuctionDetailState extends State<AuctionDetail> {
  List<dynamic> data;
  var itemCount;
  final String viewAuctionUrl =
      "${ResponseData.apiUrl}/auction/biddingItems/${ResponseData.userId}";
  TextEditingController controller = new TextEditingController();
  @override
  void initState() {
    super.initState();
    this.getItemDetails(context);
    this._showList();
  }

  void getItemDetails(BuildContext context) async {
    var response = await http.get(Uri.encodeFull(viewAuctionUrl),
        headers: {"Accept": "application/json"});

    if (this.mounted) {
      setState(() {
        Map<String, dynamic> responseJson = json.decode(response.body);
        data = responseJson["items"];

        itemCount = data.length;
        print(itemCount);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Auction Details"),
          backgroundColor: Colors.green,
        ),
        body: searchBox());
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
                      hintText: itemCount.toString() + " ITEMS",
                      border: InputBorder.none),
                  // onChanged:
                  // onSearchTextChanged,
                ),
                trailing: new IconButton(
                  icon: new Icon(Icons.cancel),
                  onPressed: () {
                    controller.clear();
                  },
                ),
              ),
            ),
          ),
        ),
      ),
      body: _showList(),
    );
  }

  Widget _showList() {
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
                        child: new Text(
                          'Item' + ':' + data[index]['itemId'],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        child: new Text(
                          'Customer' + ':' + data[index]['customerId'],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        child: new Text(
                          'Buyer' + ':' + data[index]['buyerId'],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        child: new Text(
                          'Bidding Time' + ':' + data[index]['biddingTime'],
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Container(
                        child: new Text(
                          'Bid Price' +
                              ':' +
                              data[index]['bidValue'].toString(),
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
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
