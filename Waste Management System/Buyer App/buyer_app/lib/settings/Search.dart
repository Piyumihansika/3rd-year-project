

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:geocoder/geocoder.dart';
// import 'package:geolocator/geolocator.dart';

// class Tracking extends StatefulWidget {
  

//   @override
//   _TrackingState createState() => _TrackingState();
// }

// class _TrackingState extends State<Tracking> {
//  Position _position;
//  StreamSubscription<Position> _streamSubscription;
//  Address _address;

//  @override
//  void initState(){
//    super.initState();
//  var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
//  _streamSubscription = Geolocator().getPositionStream(locationOptions).listen((Position position) {

//    setState(() {
//      print(position);
//      _position = position;
//      final coordinates = new Coordinates(position.latitude, position.longitude);
//      convertCoordinatesToAddress(coordinates).then((value) => _address = value);
//    });
//   });
// }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Location Tracking'),
//          backgroundColor: Colors.green,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text("lat: ${_position?. latitude?? '-'}, lon: ${_position?. longitude?? '-'}"),
//             SizedBox(height: 50,),
//             Text("Address from coordinates"),
//             SizedBox(height: 20,),
//             Text("${_address?.addressLine?? '-'}"),
//           ],),),
//     );
//   }

//    @override
//    void dispose(){
//      super.dispose();
//      _streamSubscription.cancel();
//    }

//    Future<Address> convertCoordinatesToAddress(Coordinates coordinates) async {
//      var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
//      return addresses.first;
//    }
// }

























// // import 'dart:async';

// // import 'package:flutter/material.dart';
// // import 'package:geocoder/geocoder.dart';
// // import 'package:geolocator/geolocator.dart';

// // class ConvertGeocodeToAddress extends StatefulWidget {
  

// //   @override
// //   _ConvertGeocodeToAddressState createState() => _ConvertGeocodeToAddressState();
// // }

// // class _ConvertGeocodeToAddressState extends State<ConvertGeocodeToAddress> {
// //  Position _position;
// //  StreamSubscription<Position> _streamSubscription;
// //  Address _address;

// //  @override
// //  void initState(){
// //    super.initState();
// //  var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
// //  _streamSubscription = Geolocator().getPositionStream(locationOptions).listen((Position position) {

// //    setState(() {
// //      print(position);
// //      _position = position;
// //      final coordinates = new Coordinates(position.latitude, position.longitude);
// //      convertCoordinatesToAddress(coordinates).then((value) => _address = value);
// //    });
// //   });
// // }
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Location Tracking'),
// //          backgroundColor: Colors.green,
// //       ),
// //       body: Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             Text("lat: ${_position?. latitude?? '-'}, lon: ${_position?. longitude?? '-'}"),
// //             SizedBox(height: 50,),
// //             Text("Address from coordinates"),
// //             SizedBox(height: 20,),
// //             Text("${_address?.addressLine?? '-'}"),
// //           ],),),
// //     );
// //   }

// //    @override
// //    void dispose(){
// //      super.dispose();
// //      _streamSubscription.cancel();
// //    }

// //    Future<Address> convertCoordinatesToAddress(Coordinates coordinates) async {
// //      var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
// //      return addresses.first;
// //    }
// // }


