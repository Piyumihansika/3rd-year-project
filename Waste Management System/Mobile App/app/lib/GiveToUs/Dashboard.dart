import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MENU SELECT'),
        backgroundColor: Colors.green,
      ),

backgroundColor: Colors.green[100],

drawer: new Drawer(
  child:ListView(

    children:<Widget>[

UserAccountsDrawerHeader(
  accountName: new Text("Piyumi Hansika", style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0,)),
  accountEmail: new Text("piyumi@gmil.com"),
  currentAccountPicture: CircleAvatar(
    backgroundImage:NetworkImage("https://cdn0.iconfinder.com/data/icons/avatar-78/128/12-512.png"),
  ),

),
ListTile(

  leading:Icon(Icons.person),
  title: Text('profile'),
),
ListTile(

  leading:Icon(Icons.vpn_key),
  title: Text('password'),
),
ListTile(

  leading:Icon(Icons.info),
  title: Text('Tenting'),
),

    ],
  ),
) ,
body: Container(
  padding:EdgeInsets.all(30.0) ,
  child:GridView.count(
    crossAxisCount:2,
    children: <Widget>[

    

MyMenu1(title: 'Home',icon: Icons.home,warna: Colors.green,),
// MyMenu2(title: 'Scheduled Pickup',icon: Icons.access_alarm,warna: Colors.yellow,),
// MyMenu3(title: 'Special Pickup',icon: Icons.directions_bus,warna: Colors.red,),
// MyMenu4(title: 'Orders',icon: Icons.photo,warna: Colors.blue,),
MyMenu2(title: 'Sell Item',icon: Icons.access_alarm,warna: Colors.yellow,),
MyMenu3(title: 'Bidding Details',icon: Icons.directions_bus,warna: Colors.red,),
//MyMenu4(title: 'Orders',icon: Icons.photo,warna: Colors.blue,),
MyMenu4(title: 'Notifications',icon: Icons.message,warna: Colors.brown,),
MyMenu5(title: 'Profile',icon: Icons.library_books,warna: Colors.pink,),


    ],
    
    )
),






    );
  }
}

class MyMenu1 extends StatelessWidget {
  MyMenu1({this.title,this.icon,this.warna});

  final String title;
  final IconData icon;
  final MaterialColor warna;


  @override
  Widget build(BuildContext context) {
    return   Card(
     margin: EdgeInsets.all(8.0),   
     child: InkWell(
onTap: (){
 // Navigator.of(context).pushNamed('/login');
},
splashColor:Colors.green[100],
child: Center(
child:Column(

mainAxisSize:MainAxisSize.min ,

  children: <Widget>[

RawMaterialButton(
  onPressed: () {
    Navigator.of(context).pushNamed('/login');
  },
  elevation: 2.0,
  fillColor: warna,
  child: Icon(
    icon,
    size: 35.0,
    color: Colors.white,
  ),
  padding: EdgeInsets.all(15.0),
  shape: CircleBorder(),
),
Text(title, style:new TextStyle(fontSize:17.0))

  ],
),

),
     ),

     
      );

    


  }
}


//second one

class MyMenu2 extends StatelessWidget {
  MyMenu2({this.title,this.icon,this.warna});

  final String title;
  final IconData icon;
  final MaterialColor warna;


  @override
  Widget build(BuildContext context) {
    return   Card(
     margin: EdgeInsets.all(8.0),   
     child: InkWell(
onTap: (){
  Navigator.of(context).pushNamed('/scheduled');
},
splashColor:Colors.green[100] ,
child: Center(
child:Column(

mainAxisSize:MainAxisSize.min ,

  children: <Widget>[

Icon(
  icon,
  size:70.0 ,
  color: warna,
  ),
Text(title, style:new TextStyle(fontSize:17.0))

  ],
),

),
     ),

     
      );

    


  }
}
//third one

class MyMenu3 extends StatelessWidget {
  MyMenu3({this.title,this.icon,this.warna});

  final String title;
  final IconData icon;
  final MaterialColor warna;


  @override
  Widget build(BuildContext context) {
    return   Card(
     margin: EdgeInsets.all(8.0),   
     child: InkWell(
onTap: (){
 Navigator.of(context).pushNamed('/special');
},
splashColor:Colors.green[100] ,
child: Center(
child:Column(

mainAxisSize:MainAxisSize.min ,

  children: <Widget>[

Icon(
  icon,
  size:70.0 ,
  color: warna,
  ),
Text(title, style:new TextStyle(fontSize:17.0))

  ],
),

),
     ),

     
      );

    


  }
}

//4th one

class MyMenu4 extends StatelessWidget {
  MyMenu4({this.title,this.icon,this.warna});

  final String title;
  final IconData icon;
  final MaterialColor warna;


  @override
  Widget build(BuildContext context) {
    return   Card(
     margin: EdgeInsets.all(8.0),   
     child: InkWell(
onTap: (){
  Navigator.of(context).pushNamed('/order');
},
splashColor:Colors.green[100] ,
child: Center(
child:Column(

mainAxisSize:MainAxisSize.min ,

  children: <Widget>[

Icon(
  icon,
  size:70.0 ,
  color: warna,
  ),
Text(title, style:new TextStyle(fontSize:17.0))

  ],
),

),
     ),

     
      );

    


  }
}

//5th one

class MyMenu5 extends StatelessWidget {
  MyMenu5({this.title,this.icon,this.warna});

  final String title;
  final IconData icon;
  final MaterialColor warna;


  @override
  Widget build(BuildContext context) {
    return   Card(
     margin: EdgeInsets.all(8.0),   
     child: InkWell(
onTap: (){
  // Navigator.of(context).pushNamed('/history');
  Navigator.of(context).pushNamed('/test');
},
splashColor:Colors.green[100] ,
child: Center(
child:Column(

mainAxisSize:MainAxisSize.min ,

  children: <Widget>[

Icon(
  icon,
  size:70.0 ,
  color: warna,
  ),
Text(title, style:new TextStyle(fontSize:17.0))

  ],
),

),
     ),

     
      );

    


  }
}

//6th one


// class MyMenu6 extends StatelessWidget {
//   MyMenu6({this.title,this.icon,this.warna});

//   final String title;
//   final IconData icon;
//   final MaterialColor warna;


//   @override
//   Widget build(BuildContext context) {
//     return   Card(
//      margin: EdgeInsets.all(8.0),   
//      child: InkWell(
// onTap: (){
//   Navigator.of(context).pushNamed('/profile');
// },
// splashColor:Colors.green[100],
// child: Center(
// child:Column(

// mainAxisSize:MainAxisSize.min ,

//   children: <Widget>[

// Icon(
//   icon,
//   size:70.0 ,
//   color: warna,
//   ),
// Text(title, style:new TextStyle(fontSize:17.0))

//   ],
// ),

// ),
//      ),

     
//       );

    


//   }
// }

