import 'package:flutter/material.dart';



class History extends StatefulWidget {
  createState() => HistoryState();
}

List<String> listItems = [
  "Congrats!.Your Plastic bid is successfull.",
  "Congrats!.Your Metal bid is successfull.",
  "Sorry!.Your Plastic bid is cancel.Check your details",
  "Sunday Funday..Check our offers today !"
]; 

class HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
       //



       //


         appBar: AppBar(
        leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.black),
    onPressed: () => Navigator.of(context).pushNamed('/dashboard'),
  ), 
        elevation: 4.0,
        title: Text(
          'NOTIFICATION HISTORY',
      style: TextStyle(color: Colors.black),
          
        ),
        backgroundColor: Colors.green,
        brightness: Brightness.light,
        iconTheme: IconThemeData(color: Colors.black),
      ),
          body: Container(


              child: ListView.builder(
                
            itemCount: listItems.length,
            itemBuilder: (context, index)

            
             {
         
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
        );
  }

  void deleteItem(index) {
    
    setState(() {
      listItems.removeAt(index);
    });
  }

  void undoDeletion(index, item) {
    
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


