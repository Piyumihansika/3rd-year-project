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
  SizedBox(   //Use of SizedBox 
                height: 30, 
              ), 
  
            Center(  
                child: Text(  
                  'For 1 Kg',  
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),  
                )),  
                SizedBox(   //Use of SizedBox 
                height: 15, 
              ), 
  
            DataTable(  
              columns: [  
                DataColumn(label: Text(  
                    'No',  
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)  
                )),  
                DataColumn(label: Text(  
                    'Item',  
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)  
                )),  
                DataColumn(label: Text(  
                    'Max Price(Rs)',  
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)  
                )),  
              ],  
              rows: [  
                DataRow(cells: [  
                  DataCell(Text('1')),  
                  DataCell(Text('Paper')),  
                  DataCell(Text('15')),  
                ]),  
                DataRow(cells: [  
                  DataCell(Text('2')),  
                  DataCell(Text('Glass')),  
                  DataCell(Text('25')),  
                ]),  
                DataRow(cells: [  
                  DataCell(Text('3')),  
                  DataCell(Text('Metal')),  
                  DataCell(Text('30')),  
                ]),  
                DataRow(cells: [  
                  DataCell(Text('4')),  
                  DataCell(Text('Electronics')),  
                  DataCell(Text('30')),  
                ]),
 DataRow(cells: [  
                  DataCell(Text('5')),  
                  DataCell(Text('Plastic')),  
                  DataCell(Text('15')),  
                ]),
                 
                 DataRow(cells: [  
                  DataCell(Text('6')),  
                  DataCell(Text('Organic')),  
                  DataCell(Text('10')),  
                ]),



              ],  
            ),  
],
),
    );
  }
}