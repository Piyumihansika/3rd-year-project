import 'package:app/CommonPages/Homepage.dart';
import 'package:flutter/material.dart';
import 'SettingPage.dart';
import 'History.dart';
//import 'package:bottom_navigation_badge/bottom_navigation_badge.dart';



class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
 
  

int selectedPage=0;
final pageoption = [
  HomePage(),
  History(),
  SettingPage(),
 

];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.green[100],
  


body: pageoption[selectedPage],
bottomNavigationBar: BottomNavigationBar(
  
 currentIndex: selectedPage,
 onTap: (int index){
setState(() {
  
  selectedPage=index;

});

 },

  items: [
    BottomNavigationBarItem(
      
     icon:IconTheme(child: Icon(Icons.home),
   data:IconThemeData(color:Colors.black)),
      // title: Text("Home",
        // ignore: deprecated_member_use
        title: Text("Home",
      style: TextStyle(color: Colors.black),
      ),
     backgroundColor: Colors.red,

      
      ),
      
// BottomNavigationBarItem(
    
//       icon:IconTheme(child: Icon(Icons.add_alert),
//    data:IconThemeData(color:Colors.black)),
//       title: Text("Notification",
      
//       style: TextStyle(color: Colors.black),
//       ),
      
      
//       ),
BottomNavigationBarItem(
  icon: new Stack(
    children: <Widget>[
      new Icon(Icons.notifications),
      new Positioned(
        right: 0,
        child: new Container(
          padding: EdgeInsets.all(1),
          decoration: new BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(6),
          ),
          constraints: BoxConstraints(
            minWidth: 12,
            minHeight: 12,
          ),
          child: new Text(
            '3',
            style: new TextStyle(
              color: Colors.white,
              fontSize: 8,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      )
    ],
  ),
 
  // ignore: deprecated_member_use
  title: Text('Notification',style: TextStyle(color: Colors.black),),


),


     
BottomNavigationBarItem(
      
      icon:IconTheme(child: Icon(Icons.settings),
   data:IconThemeData(color:Colors.black)),
      // ignore: deprecated_member_use
      title: Text("Setting",
      
      style: TextStyle(color: Colors.black),
      ),
      
      
      ),
  ],
  
  ),




    );
  }
}

























// //5th one

// class MyMenu5 extends StatelessWidget {
//   MyMenu5({this.title, this.icon, this.warna});

//   final String title;
//   final IconData icon;
//   final MaterialColor warna;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.all(8.0),
//       child: InkWell(
//         onTap: () {
//           // Navigator.of(context).pushNamed('/history');
//           // Navigator.of(context).pushNamed('/test');
//         },
//         splashColor: Colors.green[100],
//         child: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               RawMaterialButton(
//                 onPressed: () {
//                   //
//                   Navigator.of(context).pushNamed('/setting');
//                 },
//                 elevation: 2.0,
//                 fillColor: warna,
//                 child: Icon(
//                   icon,
//                   size: 35.0,
//                   color: Colors.white,
//                 ),
//                 padding: EdgeInsets.all(15.0),
//                 shape: CircleBorder(),
//               ),
//               Text(title, style: new TextStyle(fontSize: 17.0))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

