import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:buyerapp/utils/ResponseData.dart';

//String item = " ";

class Report extends StatefulWidget {
  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  List<dynamic> data;
  final String reportUrl = "";
  TextEditingController controller = new TextEditingController();
  @override
  void initState() {
    super.initState();
    this.getReportDetails(context);
    this._showList();
  }

  void getReportDetails(BuildContext context) async {
    var response = await http.get(Uri.encodeFull(reportUrl),
        headers: {"Accept": "application/json"});
    // var responseJson = json.decode(response.body);

    if (this.mounted) {
      setState(() {
        Map<String, dynamic> responseJson = json.decode(response.body);
        data = responseJson["item"];
        print(data);
        // for (Map item in responseJson["item"]) {
        //   _itemDetails.add(ItemDetails.fromJson(item));
        // }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Report"),
          backgroundColor: Colors.green,
        ),
        body: _showList());
  }

  // Widget searchBox() {
  //   return Scaffold(
  //     appBar: AppBar(
  //       flexibleSpace: Container(
  //         child: Container(
  //           color: Colors.green,
  //           child: new Card(
  //             child: new ListTile(
  //               leading: new Icon(Icons.search),
  //               title: new TextField(
  //                 controller: controller,
  //                 decoration: new InputDecoration(
  //                     hintText: 'Search', border: InputBorder.none),
  //                 // onChanged:
  //                 // onSearchTextChanged,
  //               ),
  //               trailing: new IconButton(
  //                 icon: new Icon(Icons.cancel),
  //                 onPressed: () {
  //                   controller.clear();
  //                   // onSearchTextChanged('Aluminium');
  //                 },
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //     body: _showList(),
  //   );
  // }

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
                      SizedBox(height: 20.0),
                      Container(
                        child: Text(data[index]['itemId']),
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
                          'Bid Price' + ':' + data[index]['bidValue'],
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

// import 'package:flutter/material.dart';
// import 'package:horizontal_data_table/horizontal_data_table.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// class Report extends StatefulWidget {
//   Report({Key key, this.title}) : super(key: key);
//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<Report> {

//   @override
//   void initState() {
//    // user.initData(100);
//     super.initState();
//   }

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
//     user.initData(100);
//     this.getItemDetails(context);

//   }

//   void getItemDetails(BuildContext context) async {
//     var response = await http.get(Uri.encodeFull(reportUrl),
//         headers: {"Accept": "application/json"});

//     if (this.mounted) {
//       setState(() {
//         Map<String, dynamic> responseJson = json.decode(response.body);
//         data = responseJson["auction"];
//         print(data);

//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Report"),
//          backgroundColor: Colors.green,
//       ),
//       body: _getBodyWidget(),
//     );
//   }

//   Widget _getBodyWidget() {
//     return Container(
//       child: HorizontalDataTable(
//         leftHandSideColumnWidth: 100,
//         rightHandSideColumnWidth: 600,
//         isFixedHeader: true,
//         headerWidgets: _getTitleWidget(),
//         leftSideItemBuilder: _generateFirstColumnRow,
//         rightSideItemBuilder: _generateRightHandSideColumnRow,
//         itemCount: user.userInfo.length,
//         rowSeparatorWidget: const Divider(
//           color: Colors.black54,
//           height: 1.0,
//           thickness: 0.0,
//         ),
//         leftHandSideColBackgroundColor: Color(0xFF2A2A2A),
//         rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
//       ),
//       height: MediaQuery.of(context).size.height,
//     );
//   }

//   List<Widget> _getTitleWidget() {
//     return [
//       _getTitleItemWidget('itemId', 100),
//       _getTitleItemWidget('customerId', 100),
//       _getTitleItemWidget('buyerId', 200),
//       _getTitleItemWidget('bidTime', 100),
//       _getTitleItemWidget('bidValue', 200),
//     ];
//   }

//   Widget _getTitleItemWidget(String label, double width) {
//     return Container(
//       child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
//       width: width,
//       height: 56,
//       padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//       alignment: Alignment.centerLeft,
//     );
//   }

//   Widget _generateFirstColumnRow(BuildContext context, int index) {
//     return Container(
//       child: Text(user.userInfo[index].itemId),
//       width: 100,
//       height: 52,
//       padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//       alignment: Alignment.centerLeft,
//     );
//   }

//   Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
//     return Row(
//       children: <Widget>[

//         Container(
//       child: Text(user.userInfo[index].customerId),
//       width: 200,
//       height: 52,
//       padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//       alignment: Alignment.centerLeft,
//     ),

//         Container(
//           child: Text(user.userInfo[index].buyerId),
//           width: 200,
//           height: 52,
//           padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//           alignment: Alignment.centerLeft,
//         ),
//         Container(
//           child: Text(user.userInfo[index].bidTime),
//           width: 100,
//           height: 52,
//           padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//           alignment: Alignment.centerLeft,
//         ),
//         Container(
//           child: Text(user.userInfo[index].bidValue),
//           width: 200,
//           height: 52,
//           padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
//           alignment: Alignment.centerLeft,
//         ),
//       ],
//     );
//   }
// }

// User user = User();

// class User {
//   List<UserInfo> _userInfo = List<UserInfo>();

//   void initData(int size) {

//   }

//   List<UserInfo> get userInfo => _userInfo;

//   set userInfo(List<UserInfo> value) {
//     _userInfo = value;
//   }

// }

// class UserInfo {
//   String itemId;
//   String customerId;
//   String buyerId;
//   String bidTime;
//   String bidValue;

//   UserInfo(this.name, this.status, this.phone, this.registerDate,
//       this.terminationDate);
// }
