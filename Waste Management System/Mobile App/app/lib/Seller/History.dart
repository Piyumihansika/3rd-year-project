import 'package:flutter/material.dart';


class History extends StatefulWidget {
  createState() => HistoryState();
}

List<String> listItems = [
  "Hello",
  "World",
  "Flutter",
  "Love"
]; //dummy list of items

class HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Swipe List"),
          ),
          body: Container(
              child: ListView.builder(
            itemCount: listItems.length,
            itemBuilder: (context, index) {
              return Dismissible(
                background: stackBehindDismiss(),
                key: ObjectKey(listItems[index]),
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Text(listItems[index]),
                ),
                onDismissed: (direction) {
                  var item = listItems.elementAt(index);
                  //To delete
                  deleteItem(index);
                  //To show a snackbar with the UNDO button
                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Item deleted"),
                      action: SnackBarAction(
                          label: "UNDO",
                          onPressed: () {
                            //To undo deletion
                            undoDeletion(index, item);
                          })));
                },
              );
            },
          )),
        ));
  }

  void deleteItem(index) {
    /*
    By implementing this method, it ensures that upon being dismissed from our widget tree, 
    the item is removed from our list of items and our list is updated, hence
    preventing the "Dismissed widget still in widget tree error" when we reload.
    */
    setState(() {
      listItems.removeAt(index);
    });
  }

  void undoDeletion(index, item) {
    /*
    This method accepts the parameters index and item and re-inserts the {item} at
    index {index}
    */
    setState(() {
      listItems.insert(index, item);
    });
  }

  Widget stackBehindDismiss() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.0),
      color: Colors.red,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }
}


// List<String> listItems = [
//   "Your Plastic bid is over .Max price is Rs.450",
//   "World",
//   "Flutter",
//   "Love"
// ]; 


// class History extends StatefulWidget {
//   @override
//   _HistoryState createState() => _HistoryState();
// }

// class _HistoryState extends State<History> {
  
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//  appBar: AppBar(
//    leading: IconButton(
//     icon: Icon(Icons.arrow_back, color: Colors.black),
//     onPressed: () => Navigator.of(context).pushNamed('/dashboard'),
//   ), 
//         title: Text("NOTIFICATION HISTORY",
//       style: TextStyle(color: Colors.black),),
//         backgroundColor: Colors.green,
//       ),
//       backgroundColor: Colors.green[100],     
    


// body : SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//   Padding(padding: const EdgeInsets.all(10.0)),

// Container(child: ListView.builder(
//   shrinkWrap: true,
//           itemCount: listItems.length,
//           itemBuilder: (context, index) {
//             return Dismissible(
//               key: ObjectKey(listItems[index]),
//               child: Container(
//                 padding: EdgeInsets.all(20.0),
//                 child: Text(listItems[index]),
//               ),
// //
//    onDismissed: (direction) {
//                   var item = listItems.elementAt(index);
//                   //
                  
//                   //To delete
//                   deleteItem(index);
//                   //To show a snackbar with the UNDO button
//                   Scaffold.of(context).showSnackBar(SnackBar(
//                       content: Text("Item deleted"),
//                       action: SnackBarAction(
//                           label: "UNDO",
//                           onPressed: () {
//                             //To undo deletion
//                             undoDeletion(index, item);
//                           })));
//                 },


//             );
//           },
//         )
        
//         ),


//             ],
//           ),
// ),


            




//     );
//   }


//   //

// void deleteItem(index) {
//     //


//     setState(() {
//       listItems.removeAt(index);
//     });
//   }

//   void undoDeletion(index, item) {
    

//     setState(() {
//       listItems.insert(index, item);
//     });
//   }

//   Widget stackBehindDismiss() {
//     return Container(
//       alignment: Alignment.centerRight,
//       padding: EdgeInsets.only(right: 20.0),
//       color: Colors.red,
//       child: Icon(
//         Icons.delete,
//         color: Colors.black,
//       ),
//     );
//   }


//   //
// }




// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';


// class History extends StatefulWidget {
//   History({Key key}) : super(key: key);

//   @override
//   HistoryState createState() {
//     return HistoryState();
//   }
// }

// class HistoryState extends State<History> {
//   final items = List<String>.generate(5, (i) => "Item ${i + 1}");

//   @override
//   Widget build(BuildContext context) {
//     final title = 'History';

//     return MaterialApp(
//       title: title,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//    leading: IconButton(
//     icon: Icon(Icons.arrow_back, color: Colors.black),
//     onPressed: () => Navigator.of(context).pushNamed('/dashboard'),
//   ), 
//         title: Text("NOTIFICATION HISTORY",
//       style: TextStyle(color: Colors.black),),
//         backgroundColor: Colors.green,
//       ),
//       backgroundColor: Colors.green[100],
//         body: ListView.builder(
//           itemCount: items.length,
//           itemBuilder: (context, index) {
//             final item = items[index];

//             return Dismissible(
            
//               key: Key(item),
              
//               onDismissed: (direction) {
              
//                 setState(() {
//                   items.removeAt(index);
//                 });

              
//                 Scaffold.of(context)
//                     .showSnackBar(SnackBar(content: Text("Notification dismissed")));
//               },
             
//               background: Container(color: Colors.red),
//               child: ListTile(title: Text('Polythin bid is over')),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
