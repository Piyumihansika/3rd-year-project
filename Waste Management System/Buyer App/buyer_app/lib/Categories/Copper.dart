import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:buyerapp/utils/ResponseData.dart';

String item = "Copper";

class Copper extends StatefulWidget {
  @override
  _CopperState createState() => _CopperState();
}

class _CopperState extends State<Copper> {
  List<dynamic> data;
  final String viewitemUrl = "${ResponseData.apiUrl}/item/viewItem/$item";
  TextEditingController controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    this.getCopperItems(context);
  }

  void getCopperItems(BuildContext context) async {
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
        title: Text('Copper Items'),
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
      body: _allCopperList(),
    );
  }

  Widget _allCopperList() {
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



// import 'dart:async';
// //import 'dart:html';
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class CopperDetail extends StatefulWidget {
//   @override
//   _CopperDetailState createState() => _CopperDetailState();
// }

// class _CopperDetailState extends State<CopperDetail> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Copper Items'),
//         backgroundColor: Colors.green,
//       ),
//       body: Copper(),
//     );
//   }
// }

// class Copper extends StatefulWidget {
//   @override
//   _CopperState createState() => new _CopperState();
// }

// List<ItemDetails> _searchResult = [];

// List<ItemDetails> _itemDetails = [];

// final String url = 'Enter url here/item';

// class ItemDetails {
//   final int id;
//   final String category,
//       itemName,
//       currentBid,
//       description,
//       itemImageUrl,
//       duration;
//   final DateTime startDate;

//   ItemDetails(
//       {this.id,
//       this.category,
//       this.itemName,
//       this.currentBid,
//       this.description,
//       this.startDate,
//       this.duration,
//       this.itemImageUrl = ''});

//   factory ItemDetails.fromJson(Map<String, dynamic> json) {
//     return new ItemDetails(
//       id: json['id'],
//       category: json['category'],
//       itemName: json['itemName'],
//       currentBid: json['currentBid'],
//       description: json['description'],
//       startDate: json['startDate'],
//       duration: json['duration'],
//     );
//   }
// }

// class _CopperState extends State<Copper> {
//   TextEditingController controller = new TextEditingController();

//   // Get json result and convert it to model. Then add
//   Future<Null> getItemDetails() async {
//     final response = await http.get(url);
//     final responseJson = json.decode(response.body);

//     setState(() {
//       for (Map item in responseJson) {
//         _itemDetails.add(ItemDetails.fromJson(item));
//       }
//     });
//   }

//   @override
//   void initState() {
//     super.initState();

//     getItemDetails();
//   }

// //searching function
//   onSearchTextChanged(String text) async {
//     _searchResult.clear();
//     if (text.isEmpty) {
//       setState(() {});
//       return;
//     }

// // view details
//     _itemDetails.forEach((itemDetail) {
//       if (itemDetail.itemName.contains(text) ||
//           itemDetail.currentBid.contains(text) ||
//           itemDetail.description.contains(text) ||
//           itemDetail.duration.contains(text) ||
//           itemDetail.category.contains(text)) _searchResult.add(itemDetail);
//     });

//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       child: SingleChildScrollView(
//         // appBar: new AppBar(
//         //   title: new Text('Search'),
//         //   elevation: 0.0,
//         //   backgroundColor: Colors.green,
//         // ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             new Container(
//               color: Colors.green,
//               child: new Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: new Card(
//                   child: new ListTile(
//                     leading: new Icon(Icons.search),
//                     title: new TextField(
//                       controller: controller,
//                       decoration: new InputDecoration(
//                           hintText: 'Search', border: InputBorder.none),
//                       onChanged: onSearchTextChanged,
//                     ),
//                     trailing: new IconButton(
//                       icon: new Icon(Icons.cancel),
//                       onPressed: () {
//                         controller.clear();
//                         onSearchTextChanged('');
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             //search
//             new Expanded(
//               child: _searchResult.length != 0 || controller.text.isNotEmpty
//                   ? new ListView.builder(
//                       itemCount: _searchResult.length,
//                       itemBuilder: (context, i) {
//                         return new Card(
//                             child: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: <Widget>[
//                             Container(
//                               child: new CircleAvatar(
//                                 backgroundImage: new NetworkImage(
//                                   _searchResult[i].itemImageUrl,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 20.0),
//                             Container(
//                               child: Text(_searchResult[i].itemName),
//                             ),
//                             SizedBox(height: 10.0),
//                             Container(
//                               child: new Text(
//                                 'Valid Duration' +
//                                     ':' +
//                                     _searchResult[i].duration,
//                                 style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black),
//                               ),
//                             ),
//                             SizedBox(height: 10.0),
//                             Container(
//                               child: new Text(
//                                 'Current Bid' +
//                                     ':' +
//                                     _searchResult[i].currentBid,
//                                 style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black),
//                               ),
//                             ),
//                             SizedBox(height: 10.0),
//                             Container(
//                               child: new Text(
//                                 'Description' +
//                                     ':' +
//                                     _searchResult[i].description,
//                                 style: TextStyle(
//                                     fontSize: 18,
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.black),
//                               ),
//                             ),
//                             SizedBox(height: 10.0),
//                             Container(
//                               child: new RaisedButton(
//                                   color: Colors.green,
//                                   child: new Text(
//                                     "Place a bid",
//                                     style: TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.white),
//                                   ),
//                                   onPressed: () {
//                                     Navigator.of(context).pushNamed('/bid');
//                                   }),
//                             ),
//                           ],
//                         )
//                             // child: new ListTile(
//                             //   leading: Container(
//                             //     child: new CircleAvatar(
//                             //       backgroundImage: new NetworkImage(
//                             //         _searchResult[i].itemImageUrl,
//                             //       ),
//                             //     ),
//                             //   ),
//                             //   title: Container(
//                             //     child: new Text(_searchResult[i].itemName +
//                             //         ' ' +
//                             //         _searchResult[i].currentBid +
//                             //         ' ' +
//                             //         _searchResult[i].description),
//                             //   ),

//                             // ),
//                             //margin: const EdgeInsets.all(0.0),
//                             );
//                       },
//                     )
//                   //add design to view details
//                   : new ListView.builder(
//                       itemCount: _itemDetails.length,
//                       itemBuilder: (context, index) {
//                         if (_itemDetails[index].category == 'copper') {
//                           return Container(
//                             width: 700,
//                             child: new Card(
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(15.0),
//                               ),
//                               color: Colors.white,
//                               elevation: 10,
//                               child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: <Widget>[
//                                     SizedBox(height: 10.0),
//                                     Container(
//                                       child: new CircleAvatar(
//                                         backgroundImage: new NetworkImage(
//                                           _itemDetails[index].itemImageUrl,
//                                         ),
//                                       ),
//                                     ),

//                                     SizedBox(height: 20.0),
//                                     Container(
//                                       child: Text(_itemDetails[index].itemName),
//                                     ),
//                                     SizedBox(height: 10.0),
//                                     Container(
//                                       child: new Text(
//                                         'Valid Duration' +
//                                             ':' +
//                                             _itemDetails[index].duration,
//                                         style: TextStyle(
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.black),
//                                       ),
//                                     ),
//                                     SizedBox(height: 10.0),
//                                     Container(
//                                       child: new Text(
//                                         'Current Bid' +
//                                             ':' +
//                                             _itemDetails[index].currentBid,
//                                         style: TextStyle(
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.black),
//                                       ),
//                                     ),
//                                     SizedBox(height: 10.0),
//                                     Container(
//                                       child: new Text(
//                                         'Description' +
//                                             ':' +
//                                             _itemDetails[index].description,
//                                         style: TextStyle(
//                                             fontSize: 18,
//                                             fontWeight: FontWeight.bold,
//                                             color: Colors.black),
//                                       ),
//                                     ),
//                                     SizedBox(height: 10.0),
//                                     Container(
//                                       child: new RaisedButton(
//                                           color: Colors.green,
//                                           child: new Text(
//                                             "Place a bid",
//                                             style: TextStyle(
//                                                 fontSize: 18,
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Colors.white),
//                                           ),
//                                           onPressed: () {
//                                             Navigator.of(context).pushNamed('/bid');
//                                           }),
//                                     ),

//                                     // new ListTile(
//                                     //     leading: new CircleAvatar(
//                                     //       backgroundImage: new NetworkImage(
//                                     //         _itemDetails[index].itemImageUrl,
//                                     //       ),
//                                     //     ),
//                                     //     title: new Text(
//                                     //         _itemDetails[index].itemName),
//                                     //     subtitle: Container()),
//                                     //margin: const EdgeInsets.all(0.0),
//                                   ]),
//                             ),
//                           );
//                         } else {
//                           return null;
//                         }
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }













// // import 'dart:async';
// // import 'package:flutter/material.dart';
// // import 'dart:convert';
// // import 'package:http/http.dart' as http;

// // class CopperDetail extends StatefulWidget {
// //   @override
// //   _CopperDetailState createState() => _CopperDetailState();
// // }

// // class _CopperDetailState extends State<CopperDetail> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Copper Items'),
// //         backgroundColor: Colors.green,
// //       ),
// //       body: Copper(),
// //     );
// //   }
// // }

// // class Copper extends StatefulWidget {
// //   @override
// //   _CopperState createState() => new _CopperState();
// // }

// // List<ItemDetails> _searchResult = [];

// // List<ItemDetails> _itemDetails = [];

// // final String url = 'Enter url here/item';
// //  final _formKey = GlobalKey<FormState>();

// // class ItemDetails {
// //   final int id;
// //   final String category,itemName, currentBid, description, itemImageUrl;

// //   ItemDetails(
// //       {this.id,
// //       this.category,
// //       this.itemName,
// //       this.currentBid,
// //       this.description,
// //       this.itemImageUrl = ''});

// //   factory ItemDetails.fromJson(Map<String, dynamic> json) {
// //     return new ItemDetails(
// //       id: json['id'],
// //       category: json['category'],
// //       itemName: json['itemName'],
// //       currentBid: json['currentBid'],
// //       description: json['description'],
// //     );
// //   }
// // }

// // class _CopperState extends State<Copper> {

// //   TextEditingController controller = new TextEditingController();

// //   // Get json result and convert it to model. Then add
// //   Future<Null> getItemDetails() async {
// //     final response = await http.get(url);
// //     final responseJson = json.decode(response.body);

// //     setState(() {
// //       for (Map item in responseJson) {
// //         _itemDetails.add(ItemDetails.fromJson(item));
// //       }
// //     });
// //   }

// //   @override
// //   void initState() {
// //     super.initState();

// //     getItemDetails();
// //   }

// // //searching function
// //   onSearchTextChanged(String text) async {
// //     _searchResult.clear();
// //     if (text.isEmpty) {
// //       setState(() {});
// //       return;
// //     }

// //     _itemDetails.forEach((itemDetail) {
// //       if (itemDetail.itemName.contains(text) ||
// //           itemDetail.currentBid.contains(text) ||
// //           itemDetail.description.contains(text) || itemDetail.category.contains(text))
// //         _searchResult.add(itemDetail);
// //     });

// //     setState(() {});
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Form(
// //       key: _formKey,
// //       // appBar: new AppBar(
// //       //   title: new Text('Search'),.
// //       //   elevation: 0.0,
// //       //   backgroundColor: Colors.green,
// //       // ),
// //      // widget(
// //               child: Container(
// //           child: widget(
// //                     child: Column(
// //               children: <Widget>[
// //                 new Container(
// //                   color: Colors.green,
// //                   child: new Padding(
// //                     padding: const EdgeInsets.all(8.0),
// //                     child: new Card(
// //                       child: new ListTile(
// //                         leading: new Icon(Icons.search),
// //                         title: new TextField(
// //                           controller: controller,
// //                           decoration: new InputDecoration(
// //                               hintText: 'Search', border: InputBorder.none),
// //                           onChanged: onSearchTextChanged,
// //                         ),
// //                         trailing: new IconButton(
// //                           icon: new Icon(Icons.cancel),
// //                           onPressed: () {
// //                             controller.clear();
// //                             onSearchTextChanged('');
// //                           },
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //                 //search
// //                 new Expanded(
// //                   child: _searchResult.length != 0 || controller.text.isNotEmpty
// //                       ? new ListView.builder(
// //                           itemCount: _searchResult.length,
// //                           itemBuilder: (context, i) {
// //                             return new Card(
// //                               child: new ListTile(
// //                                 leading: new CircleAvatar(
// //                                   backgroundImage: new NetworkImage(
// //                                     _searchResult[i].itemImageUrl,
// //                                   ),
// //                                 ),
// //                                 title: new Text(_searchResult[i].itemName +
// //                                     ' ' +
// //                                     _searchResult[i].currentBid +
// //                                     ' ' +
// //                                     _searchResult[i].description),
// //                               ),
// //                               margin: const EdgeInsets.all(0.0),
// //                             );
// //                           },
// //                         )
// //                       //add design to view details
// //                       : new ListView.builder(
// //                           itemCount: _itemDetails.length,
// //                           itemBuilder: (context, index) {
// //                             if(_itemDetails[index].itemName == 'copper'){
// //                             return Container(
// //                               width: 200,
// //                               child: new Card(
// //                                 shape: RoundedRectangleBorder(
// //                                   borderRadius: BorderRadius.circular(15.0),
// //                                 ),
// //                                 color: Colors.pink,
// //                                 elevation: 10,
// //                                 child: Column(
// //                                     mainAxisSize: MainAxisSize.min,
// //                                     children: <Widget>[
// //                                       // new ListTile(
// //                                       //   leading: new CircleAvatar(
// //                                       //     backgroundImage: new NetworkImage(
// //                                       //       _productDetails[index].itemImageUrl,
// //                                       //     ),
// //                                       //   ),
// //                                       //   title:
// //                                       //       new Text(_productDetails[index].itemName),
// //                                       //   subtitle:
// //                                       //       new Text(
// //                                       //       _productDetails[index].currentBid +
// //                                       //           ' ' +
// //                                       //           _productDetails[index].description),
// //                                       // ),

// //                                        new ListTile(
// //                                         leading: new CircleAvatar(
// //                                           backgroundImage: new NetworkImage(
// //                                             _itemDetails[index].itemImageUrl,
// //                                           ),
// //                                         ),
// //                                         title:
// //                                             new Text(_itemDetails[index].itemName),
// //                                         subtitle:
// //                                             Container(

// //                                             )
// //                                       ),
// //                                       //margin: const EdgeInsets.all(0.0),
// //                                     ]),
// //                               ),
// //                             );
// //                             }else{
// //                               return null;
// //                             }
// //                           },
// //                         ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// // }
