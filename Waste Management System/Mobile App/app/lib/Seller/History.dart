import 'package:flutter/material.dart';
//import 'package:badges/badges.dart';

List<String> listItems = [
  "Hello",
  "World",
  "Flutter",
  "Love"
]; 


class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(
   leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.black),
    onPressed: () => Navigator.of(context).pushNamed('/dashboard'),
  ), 
        title: Text("NOTIFICATION HISTORY",
      style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.green[100],     
    

//Here add coding about badges

body : SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
  Padding(padding: const EdgeInsets.all(10.0)),

Container(child: ListView.builder(
  shrinkWrap: true,
          itemCount: listItems.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: ObjectKey(listItems[index]),
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Text(listItems[index]),
              ),
//
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
        )
        
        ),


            ],
          ),
),


            

// 
// body:Column(

// children: <Widget>[

// Container(

//    child: ListView.builder(
//           itemCount: listItems.length,
//           itemBuilder: (context, index) {
//             return Dismissible(
//               key: ObjectKey(listItems[index]),
//               child: Container(
//                 padding: EdgeInsets.all(20.0),
//                 child: Text(listItems[index]),
//               ),
//             );
//           },
//         )
// )
// Badge(
  
//   // child:Icon(Icons.add),
//   child:RaisedButton(child: Text('notification'),onPressed: (){},),
//   badgeContent: Text("2"),
//   badgeColor: Colors.red,
//   animationType: BadgeAnimationType.slide,


// )

// ],


// ) ,


    );
  }


  //

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


  //
}



