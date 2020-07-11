// import 'dart:async';
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
//  final _formKey = GlobalKey<FormState>();

// class ItemDetails {
//   final int id;
//   final String category,itemName, currentBid, description, itemImageUrl;

//   ItemDetails(
//       {this.id,
//       this.category,
//       this.itemName,
//       this.currentBid,
//       this.description,
//       this.itemImageUrl = ''});

//   factory ItemDetails.fromJson(Map<String, dynamic> json) {
//     return new ItemDetails(
//       id: json['id'],
//       category: json['category'],
//       itemName: json['itemName'],
//       currentBid: json['currentBid'],
//       description: json['description'],
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

//     _itemDetails.forEach((itemDetail) {
//       if (itemDetail.itemName.contains(text) ||
//           itemDetail.currentBid.contains(text) ||
//           itemDetail.description.contains(text) || itemDetail.category.contains(text))
//         _searchResult.add(itemDetail);
//     });

//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       // appBar: new AppBar(
//       //   title: new Text('Search'),.
//       //   elevation: 0.0,
//       //   backgroundColor: Colors.green,
//       // ),
//      // widget(
//               child: Container(
//           child: widget(
//                     child: Column(
//               children: <Widget>[
//                 new Container(
//                   color: Colors.green,
//                   child: new Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: new Card(
//                       child: new ListTile(
//                         leading: new Icon(Icons.search),
//                         title: new TextField(
//                           controller: controller,
//                           decoration: new InputDecoration(
//                               hintText: 'Search', border: InputBorder.none),
//                           onChanged: onSearchTextChanged,
//                         ),
//                         trailing: new IconButton(
//                           icon: new Icon(Icons.cancel),
//                           onPressed: () {
//                             controller.clear();
//                             onSearchTextChanged('');
//                           },
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 //search
//                 new Expanded(
//                   child: _searchResult.length != 0 || controller.text.isNotEmpty
//                       ? new ListView.builder(
//                           itemCount: _searchResult.length,
//                           itemBuilder: (context, i) {
//                             return new Card(
//                               child: new ListTile(
//                                 leading: new CircleAvatar(
//                                   backgroundImage: new NetworkImage(
//                                     _searchResult[i].itemImageUrl,
//                                   ),
//                                 ),
//                                 title: new Text(_searchResult[i].itemName +
//                                     ' ' +
//                                     _searchResult[i].currentBid +
//                                     ' ' +
//                                     _searchResult[i].description),
//                               ),
//                               margin: const EdgeInsets.all(0.0),
//                             );
//                           },
//                         )
//                       //add design to view details
//                       : new ListView.builder(
//                           itemCount: _itemDetails.length,
//                           itemBuilder: (context, index) {
//                             if(_itemDetails[index].itemName == 'copper'){
//                             return Container(
//                               width: 200,
//                               child: new Card(
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(15.0),
//                                 ),
//                                 color: Colors.pink,
//                                 elevation: 10,
//                                 child: Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: <Widget>[
//                                       // new ListTile(
//                                       //   leading: new CircleAvatar(
//                                       //     backgroundImage: new NetworkImage(
//                                       //       _productDetails[index].itemImageUrl,
//                                       //     ),
//                                       //   ),
//                                       //   title:
//                                       //       new Text(_productDetails[index].itemName),
//                                       //   subtitle: 
//                                       //       new Text(
//                                       //       _productDetails[index].currentBid +
//                                       //           ' ' +
//                                       //           _productDetails[index].description),
//                                       // ),

//                                        new ListTile(
//                                         leading: new CircleAvatar(
//                                           backgroundImage: new NetworkImage(
//                                             _itemDetails[index].itemImageUrl,
//                                           ),
//                                         ),
//                                         title:
//                                             new Text(_itemDetails[index].itemName),
//                                         subtitle: 
//                                             Container(

//                                             )
//                                       ),
//                                       //margin: const EdgeInsets.all(0.0),
//                                     ]),
//                               ),
//                             );
//                             }else{
//                               return null;
//                             }
//                           },
//                         ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

  
// }









import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Copper extends StatefulWidget {
  @override
  _CopperState createState() => new _CopperState();
}

List<ItemDetails> _searchResult = [];

List<ItemDetails> _itemDetails = [];

final String url = 'Enter url here/item';

class ItemDetails {
  final int id;
  final String category,itemName, currentBid, description, itemImageUrl;

  ItemDetails(
      {this.id,
      this.category,
      this.itemName,
      this.currentBid,
      this.description,
      this.itemImageUrl = ''});

  factory ItemDetails.fromJson(Map<String, dynamic> json) {
    return new ItemDetails(
      id: json['id'],
      category: json['category'],
      itemName: json['itemName'],
      currentBid: json['currentBid'],
      description: json['description'],
    );
  }
}

class _CopperState extends State<Copper> {

  TextEditingController controller = new TextEditingController();

  // Get json result and convert it to model. Then add
  Future<Null> getItemDetails() async {
    final response = await http.get(url);
    final responseJson = json.decode(response.body);

    setState(() {
      for (Map item in responseJson) {
        _itemDetails.add(ItemDetails.fromJson(item));
      }
    });
  }

  @override
  void initState() {
    super.initState();

    getItemDetails();
  }

//searching function
  onSearchTextChanged(String text) async {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _itemDetails.forEach((itemDetail) {
      if (itemDetail.itemName.contains(text) ||
          itemDetail.currentBid.contains(text) ||
          itemDetail.description.contains(text) || itemDetail.category.contains(text))
        _searchResult.add(itemDetail);
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Search'),
        elevation: 0.0,
        backgroundColor: Colors.green,
      ),
      body: new Column(
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
                    onChanged: onSearchTextChanged,
                  ),
                  trailing: new IconButton(
                    icon: new Icon(Icons.cancel),
                    onPressed: () {
                      controller.clear();
                      onSearchTextChanged('');
                    },
                  ),
                ),
              ),
            ),
          ),
          //search
          new Expanded(
            child: _searchResult.length != 0 || controller.text.isNotEmpty
                ? new ListView.builder(
                    itemCount: _searchResult.length,
                    itemBuilder: (context, i) {
                      return new Card(
                        child: new ListTile(
                          leading: new CircleAvatar(
                            backgroundImage: new NetworkImage(
                              _searchResult[i].itemImageUrl,
                            ),
                          ),
                          title: new Text(_searchResult[i].itemName +
                              ' ' +
                              _searchResult[i].currentBid +
                              ' ' +
                              _searchResult[i].description),
                        ),
                        margin: const EdgeInsets.all(0.0),
                      );
                    },
                  )
                //add design to view details
                : new ListView.builder(
                    itemCount: _itemDetails.length,
                    itemBuilder: (context, index) {
                      if(_itemDetails[index].itemName == 'copper'){
                      return Container(
                        width: 200,
                        child: new Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.pink,
                          elevation: 10,
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                // new ListTile(
                                //   leading: new CircleAvatar(
                                //     backgroundImage: new NetworkImage(
                                //       _productDetails[index].itemImageUrl,
                                //     ),
                                //   ),
                                //   title:
                                //       new Text(_productDetails[index].itemName),
                                //   subtitle: 
                                //       new Text(
                                //       _productDetails[index].currentBid +
                                //           ' ' +
                                //           _productDetails[index].description),
                                // ),

                                 new ListTile(
                                  leading: new CircleAvatar(
                                    backgroundImage: new NetworkImage(
                                      _itemDetails[index].itemImageUrl,
                                    ),
                                  ),
                                  title:
                                      new Text(_itemDetails[index].itemName),
                                  subtitle: 
                                      Container(

                                      )
                                ),
                                //margin: const EdgeInsets.all(0.0),
                              ]),
                        ),
                      );
                      }else{
                        return null;
                      }
                    },
                  ),
          ),
        ],
      ),
    );
  }

  
}
