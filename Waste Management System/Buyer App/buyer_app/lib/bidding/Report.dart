import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

class Report extends StatefulWidget {
  Report({Key key}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  void initState() {
    data.initData(100);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Report Page"),
        backgroundColor: Colors.green,
      ),
      body: _getBodyWidget(),
    );
  }

  Widget _getBodyWidget() {
    return SingleChildScrollView(
      child: Container(
        child: HorizontalDataTable(
          leftHandSideColumnWidth: 100,
          rightHandSideColumnWidth: 600,
          isFixedHeader: true,
          headerWidgets: _getTitleWidget(),
          leftSideItemBuilder: _generateFirstColumnRow,
          rightSideItemBuilder: _generateRightHandSideColumnRow,
          itemCount: data.auctionInfo.length,
          rowSeparatorWidget: const Divider(
            color: Colors.black54,
            height: 1.0,
            thickness: 0.0,
          ),
          leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
          rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
        ),
        height: MediaQuery.of(context).size.height,
      ),
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('itemId', 200),
      _getTitleItemWidget('customerId', 200),
      _getTitleItemWidget('buyerId', 200),
      _getTitleItemWidget('biddingTime', 100),
      _getTitleItemWidget('bidValue', 200),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      child: Text(data.auctionInfo[index].itemId),
      width: 100,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          child: Text(data.auctionInfo[index].customerId),
          width: 200,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(data.auctionInfo[index].buyerId),
          width: 150,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(data.auctionInfo[index].biddingTime),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(data.auctionInfo[index].bidValue),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ],
    );
  }
}

Data data = Data();

class Data {
  List<AuctionInfo> _auctionInfo = List<AuctionInfo>();

  void initData(int size) {
    for (int i = 0; i < size; i++) {
      _auctionInfo
          .add(AuctionInfo("$i", "C00$i", "B00$i", "8.3$i am", "105$i.00"));
      //"$itemId", "$customerId", "$buyerId", "$biddingTime", "$bidValue"));
    }
  }

  // ignore: unnecessary_getters_setters
  List<AuctionInfo> get auctionInfo => _auctionInfo;
  // ignore: unnecessary_getters_setters
  set auctionInfo(List<AuctionInfo> value) {
    _auctionInfo = value;
  }
}

class AuctionInfo {
  String itemId;
  String customerId;
  String buyerId;
  String biddingTime;
  String bidValue;

  AuctionInfo(this.itemId, this.customerId, this.buyerId, this.biddingTime,
      this.bidValue);
}






// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// //import 'package:buyerapp/utils/ResponseData.dart';

// //String item = " ";

// class Report extends StatefulWidget {
//   @override
//   _ReportState createState() => _ReportState();
// }

// class _ReportState extends State<Report> {
//   List<dynamic> data;
//   final String reportUrl = "";
//   TextEditingController controller = new TextEditingController();
//   @override
//   void initState() {
//     super.initState();
//     this.getReportDetails(context);
//     this._showList();
//   }

//   void getReportDetails(BuildContext context) async {
//     var response = await http.get(Uri.encodeFull(reportUrl),
//         headers: {"Accept": "application/json"});
//     // var responseJson = json.decode(response.body);

//     if (this.mounted) {
//       setState(() {
//         Map<String, dynamic> responseJson = json.decode(response.body);
//         data = responseJson["item"];
//         print(data);
//         // for (Map item in responseJson["item"]) {
//         //   _itemDetails.add(ItemDetails.fromJson(item));
//         // }
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Report"),
//           backgroundColor: Colors.green,
//         ),
//         body: _showList());
//   }

//   // Widget searchBox() {
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       flexibleSpace: Container(
//   //         child: Container(
//   //           color: Colors.green,
//   //           child: new Card(
//   //             child: new ListTile(
//   //               leading: new Icon(Icons.search),
//   //               title: new TextField(
//   //                 controller: controller,
//   //                 decoration: new InputDecoration(
//   //                     hintText: 'Search', border: InputBorder.none),
//   //                 // onChanged:
//   //                 // onSearchTextChanged,
//   //               ),
//   //               trailing: new IconButton(
//   //                 icon: new Icon(Icons.cancel),
//   //                 onPressed: () {
//   //                   controller.clear();
//   //                   // onSearchTextChanged('Aluminium');
//   //                 },
//   //               ),
//   //             ),
//   //           ),
//   //         ),
//   //       ),
//   //     ),
//   //     body: _showList(),
//   //   );
//   // }

//   Widget _showList() {
//     return data != null && data.length != null && data.length > 0
//         ? ListView.builder(
//             itemCount: data.length == null ? 0 : data.length,
//             itemBuilder: (BuildContext context, int index) {
//               return Container(
//                 width: 700,
//                 child: new Card(
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(15.0),
//                   ),
//                   color: Colors.white,
//                   elevation: 10,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       SizedBox(height: 20.0),
//                       Container(
//                         child: Text(data[index]['itemId']),
//                       ),
//                       SizedBox(height: 10.0),
//                       Container(
//                         child: new Text(
//                           'Customer' + ':' + data[index]['customerId'],
//                           style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black),
//                         ),
//                       ),
//                       SizedBox(height: 10.0),
//                       Container(
//                         child: new Text(
//                           'Buyer' + ':' + data[index]['buyerId'],
//                           style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black),
//                         ),
//                       ),
//                       SizedBox(height: 10.0),
//                       Container(
//                         child: new Text(
//                           'Bidding Time' + ':' + data[index]['biddingTime'],
//                           style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black),
//                         ),
//                       ),
//                       SizedBox(height: 10.0),
//                       Container(
//                         child: new Text(
//                           'Bid Price' + ':' + data[index]['bidValue'],
//                           style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             })
//         : Container(
//             child: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//   }
// }

