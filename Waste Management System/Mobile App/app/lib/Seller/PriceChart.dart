import 'package:flutter/material.dart';
class PriceChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
   leading: IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.black),
    onPressed: () => Navigator.of(context).pushNamed('/dashboard'),
  ), 
        title: Text("Price Chart",
      style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.green,
      ),
body: ListView(children: <Widget>[  
            // Center(  
            //     child: Text(  
            //       'People-Chart',  
            //       style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),  
            //     )),  
            DataTable(  
              columns: [  
                DataColumn(label: Text(  
                    'ID',  
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
                )),  
                DataColumn(label: Text(  
                    'Name',  
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
                )),  
                DataColumn(label: Text(  
                    'Profession',  
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)  
                )),  
              ],  
              rows: [  
                DataRow(cells: [  
                  DataCell(Text('1')),  
                  DataCell(Text('Stephen')),  
                  DataCell(Text('Actor')),  
                ]),  
                DataRow(cells: [  
                  DataCell(Text('5')),  
                  DataCell(Text('John')),  
                  DataCell(Text('Student')),  
                ]),  
                DataRow(cells: [  
                  DataCell(Text('10')),  
                  DataCell(Text('Harry')),  
                  DataCell(Text('Leader')),  
                ]),  
                DataRow(cells: [  
                  DataCell(Text('15')),  
                  DataCell(Text('Peter')),  
                  DataCell(Text('Scientist')),  
                ]),  
              ],  
            ),  
],
),
    );
  }
}