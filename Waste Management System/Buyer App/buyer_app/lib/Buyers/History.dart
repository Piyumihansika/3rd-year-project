import 'package:flutter/material.dart';



class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        backgroundColor: Colors.green,
      ),
      body: HistoryPage(),
    );
  }
}

class HistoryPage extends StatefulWidget {
  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Tile(text: Text("place bid for plastic", style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),)),
        Tile(text: Text("place bid for aluminum", style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),)),
        Tile(text: Text("place bid for polythene", style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),)),
      ],
    ));
  }
}

int count = 0;
List<Histories> historyList = [];

class Histories {
  String data;
  DateTime dateTime;

  Histories({this.data, this.dateTime});
}

class Tile extends StatefulWidget {
  final Text text;
  Tile({this.text});

  @override
  TileState createState() => TileState();
}

class TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: widget.text,
      onTap: () {
        count++;
        print(count);
        historyList
            .add(Histories(data: widget.text.data, dateTime: DateTime.now()));
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HistoriesPage(),
            ));
      },
    );
  }
}

class HistoriesPage extends StatefulWidget {
  @override
  HistoriesPageState createState() => HistoriesPageState();
}

class HistoriesPageState extends State<HistoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        title: Text('Swipe to Dismiss History'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: historyList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
                ' ${historyList[index].data}   ${historyList[index].dateTime.toString()}'),
          );
         
        },
      ),
    );
  }
}