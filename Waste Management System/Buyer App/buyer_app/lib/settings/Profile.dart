import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:buyerapp/utils/ResponseData.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
        backgroundColor: Colors.green,
      ),
      body: ProfileDetail(),
    );
  }
}

class ProfileDetail extends StatefulWidget {
  @override
  ProfileDetailState createState() {
    return ProfileDetailState();
  }
}

class ProfileDetailState extends State<ProfileDetail>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    //getUsers();
  }

  File _image;
  openGallery(BuildContext context) async {
    // ignore: deprecated_member_use
    var profile = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = profile;
    });

    Navigator.of(context).pop();
  }

  openCamera(BuildContext context) async {
    // ignore: deprecated_member_use
    var profile = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = profile;
    });

    Navigator.of(context).pop();
  }

  Future<void> imagepickdialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              content: SingleChildScrollView(
                  child: ListBody(
            children: <Widget>[
              new GestureDetector(
                onTap: () {
                  openGallery(context);
                },
                child: roundedButton(
                    "Gallery",
                    EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    const Color(0xFF167F67),
                    const Color(0xFFFFFFFF)),
              ),
              Padding(padding: EdgeInsets.all(10.5)),
              new GestureDetector(
                onTap: () {
                  openCamera(context);
                },
                child: roundedButton(
                    "Camera",
                    EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                    const Color(0xFF167F67),
                    const Color(0xFFFFFFFF)),
              ),
              const SizedBox(height: 15.0),
              new GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: new Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                  child: roundedButton(
                      "Cancel",
                      EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                      const Color(0xFF167F67),
                      const Color(0xFFFFFFFF)),
                ),
              ),
              Padding(padding: EdgeInsets.all(10.5)),
            ],
          )));
        });
  }

  Widget decide() {
    if (_image == null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: new Stack(fit: StackFit.loose, children: <Widget>[
              new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 14.0),
                  Container(
                    alignment: Alignment.topLeft,
                    height: 140.0,
                    width: 140.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(140),
                        border: Border.all(
                            color: Colors.red,
                            style: BorderStyle.solid,
                            width: 2.0),
                        image: DecorationImage(
                          image: AssetImage('assets/images/profile.png'),
                        )),
                  ),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(top: 90.0, right: 100.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 25.0,
                        child: new Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )),
            ]),
          )
        ],
      );
    } else {
      return Image.file(_image, width: 150, height: 150);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  decide(),
                  Container(),
                  RaisedButton(
                    color: Colors.green,
                    child: Text("Change Profile",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                    onPressed: () {
                      imagepickdialog(context);
                    },
                  ),
                ],
              ),
            ),

//
            new Container(
              color: Color(0xffFFFFFF),
              child: Padding(
                padding: EdgeInsets.only(bottom: 25.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding:
                            EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text(
                                  'Parsonal Information',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                _status ? _getEditIcon() : new Container(),
                              ],
                            )
                          ],
                        )),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 25.0, right: 25.0, top: 3.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Flexible(
                              child: new TextFormField(
                                initialValue: ResponseData.firstName,
                                //initialValue: "${usersData[index]["firstname"]}",
                                decoration: const InputDecoration(
                                  labelText: 'First Name',
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                  //hintText: "Enter User Name",
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter first name';
                                  }
                                  return null;
                                },
                                enabled: !_status,
                                autofocus: !_status,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 25.0, right: 25.0, top: 3.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Flexible(
                              child: new TextFormField(
                                initialValue: ResponseData.lastName,
                                //initialValue: "${usersData[index]["lastname"]}",
                                decoration: const InputDecoration(
                                  labelText: 'Last Name',
                                  labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                  //hintText: "Enter User Name",
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter last name';
                                  }
                                  return null;
                                },
                                enabled: !_status,
                                autofocus: !_status,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 25.0, right: 25.0, top: 3.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Flexible(
                              child: new TextFormField(
                                initialValue: ResponseData.email,
                                //initialValue: "${usersData[index]["email"]}",
                                decoration: const InputDecoration(
                                    labelText: 'Email',
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                    hintText: "Enter Email"),

                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter email';
                                  }
                                  return null;
                                },
                                enabled: !_status,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 25.0, right: 25.0, top: 3.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Flexible(
                              child: new TextFormField(
                                initialValue: ResponseData.address1 +
                                    " , " +
                                    ResponseData.address2 +
                                    " , " +
                                    ResponseData.city,
                                //initialValue: "${usersData[index]["address1"]} ${usersData[index]["address2"]} ${usersData[index]["city"]} ${usersData[index]["district"]}",
                                decoration: const InputDecoration(
                                    labelText: 'Address',
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                    hintText: "Enter Your Address"),

                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter address';
                                  }
                                  return null;
                                },
                                enabled: !_status,
                              ),
                            ),
                          ],
                        )),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 25.0, right: 25.0, top: 3.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Flexible(
                              child: new TextFormField(
                                initialValue: ResponseData.contactNumber,
                                //initialValue: "${usersData[index]["contactNumber"]}",
                                decoration: const InputDecoration(
                                    labelText: 'Mobile Number',
                                    labelStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                    hintText: "Enter Mobile Number"),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter mobile number';
                                  }
                                  return null;
                                },
                                enabled: !_status,
                              ),
                            ),
                          ],
                        )),
                    !_status ? _getActionButtons() : new Container(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  //

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Save"),
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    setState(() {
                      _status = true;
                      FocusScope.of(context).requestFocus(new FocusNode());
                    });
                  }
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Cancel"),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  //if (_formKey.currentState.validate()) {
                  setState(() {
                    _status = true;
                    //FocusScope.of(context).requestFocus(new FocusNode());
                    Navigator.of(context).pushNamed('/profile');
                  });
                  // }
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.red,
        radius: 25.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 25.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }

//rounded button
  Widget roundedButton(
      String buttonLabel, EdgeInsets margin, Color bgColor, Color textColor) {
    var loginBtn = new Container(
      margin: margin,
      padding: EdgeInsets.all(15.0),
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: bgColor,
        borderRadius: new BorderRadius.all(const Radius.circular(100.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0xFF696969),
            offset: Offset(1.0, 6.0),
            blurRadius: 0.001,
          ),
        ],
      ),
      child: Text(
        buttonLabel,
        style: new TextStyle(
            color: textColor, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
    return loginBtn;
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';

// class Profile extends StatefulWidget {
//   @override
//   MapScreenState createState() => MapScreenState();
// }

// class MapScreenState extends State<Profile>
//     with SingleTickerProviderStateMixin {
//   bool _status = true;
//   final FocusNode myFocusNode = FocusNode();

//   @override
//   void initState() {

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//         appBar: AppBar(title: Text('Profile Page'),
//           backgroundColor: Colors.green,),
//         body: new Container(
//           color: Colors.white,
//           child: new ListView(
//             children: <Widget>[
//               Column(
//                 children: <Widget>[
//                   new Container(
//                     height: 250.0,
//                     color: Colors.white,
//                     child: new Column(
//                       children: <Widget>[

//                         Stack(
//                             children: <Widget>[
//                               Container(
//                                 height: 200.0,
//                                 width: double.infinity,
//                                 color: Colors.green,
//                               ),
//                               Positioned(
//                                 bottom: 55.0,
//                                 right: 100.0,
//                                 child: Container(
//                                   height: 350.0,
//                                   width: 350.0,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(320),
//                                       color: Colors.yellowAccent
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                 bottom: 100.0,
//                                 right: 130.0,
//                                 child: Container(
//                                   height: 290.0,
//                                   width: 300.0,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(320),
//                                       color: Colors.blueAccent
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                 bottom: 100.0,
//                                 right: 150.0,
//                                 child: Container(
//                                   height: 330.0,
//                                   width: 300.0,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(320),
//                                       color: Colors.yellow
//                                   ),
//                                 ),
//                               ),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: <Widget>[

//                                   SizedBox(height: 25.0),
//                                   Padding(
//                                     padding: EdgeInsets.only(top: 20.0),
//                                     child: new Stack(fit: StackFit.loose, children: <Widget>[
//                                       new Row(
//                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         children: <Widget>[
//                                           new Container(
//                                               width: 140.0,
//                                               height: 140.0,
//                                               decoration: new BoxDecoration(
//                                                 shape: BoxShape.circle,
//                                                 image: new DecorationImage(
//                                                   image: new ExactAssetImage(
//                                                       'assets/images/profile.png'),
//                                                   fit: BoxFit.cover,
//                                                 ),
//                                               )),
//                                         ],
//                                       ),
//                                       Padding(
//                                           padding: EdgeInsets.only(top: 90.0, right: 100.0),
//                                           child: new Row(
//                                             mainAxisAlignment: MainAxisAlignment.center,
//                                             children: <Widget>[
//                                               new CircleAvatar(
//                                                 backgroundColor: Colors.red,
//                                                 radius: 25.0,
//                                                 child: new Icon(
//                                                   Icons.camera_alt,
//                                                   color: Colors.white,
//                                                 ),
//                                               ),
//                                             ],
//                                           )),
//                                     ]),
//                                   )
//                                 ],
//                               ),
//                             ]
//                         ),
//                       ],
//                     ),
//                   ),

//                   new Container(
//                     color: Color(0xffFFFFFF),
//                     child: Padding(
//                       padding: EdgeInsets.only(bottom: 25.0),
//                       child: new Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: <Widget>[
//                           Padding(
//                               padding: EdgeInsets.only(
//                                   left: 25.0, right: 25.0, top: 25.0),
//                               child: new Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: <Widget>[
//                                   new Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: <Widget>[
//                                       new Text(
//                                         'Parsonal Information',
//                                         style: TextStyle(
//                                             fontSize: 18.0,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ],
//                                   ),
//                                   new Column(
//                                     mainAxisAlignment: MainAxisAlignment.end,
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: <Widget>[
//                                       _status ? _getEditIcon() : new Container(),
//                                     ],
//                                   )
//                                 ],
//                               )),
//                           Padding(
//                               padding: EdgeInsets.only(
//                                   left: 25.0, right: 25.0, top: 25.0),
//                               child: new Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: <Widget>[
//                                   new Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: <Widget>[
//                                       new Text(
//                                         'User Name',
//                                         style: TextStyle(
//                                             fontSize: 16.0,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               )),
//                           Padding(
//                               padding: EdgeInsets.only(
//                                   left: 25.0, right: 25.0, top: 2.0),
//                               child: new Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: <Widget>[
//                                   new Flexible(
//                                     child: new TextField(
//                                       decoration: const InputDecoration(
//                                         hintText: "Enter User Name",
//                                       ),
//                                       enabled: !_status,
//                                       autofocus: !_status,

//                                     ),
//                                   ),
//                                 ],
//                               )),
//                           Padding(
//                               padding: EdgeInsets.only(
//                                   left: 25.0, right: 25.0, top: 25.0),
//                               child: new Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: <Widget>[
//                                   new Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: <Widget>[
//                                       new Text(
//                                         'Email',
//                                         style: TextStyle(
//                                             fontSize: 16.0,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               )),
//                           Padding(
//                               padding: EdgeInsets.only(
//                                   left: 25.0, right: 25.0, top: 2.0),
//                               child: new Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: <Widget>[
//                                   new Flexible(
//                                     child: new TextField(
//                                       decoration: const InputDecoration(
//                                           hintText: "Enter Email"),
//                                       enabled: !_status,
//                                     ),
//                                   ),
//                                 ],
//                               )),
//                           Padding(
//                               padding: EdgeInsets.only(
//                                   left: 25.0, right: 25.0, top: 25.0),
//                               child: new Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: <Widget>[
//                                   new Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: <Widget>[
//                                       new Text(
//                                         'Address',
//                                         style: TextStyle(
//                                             fontSize: 16.0,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               )),
//                           Padding(
//                               padding: EdgeInsets.only(
//                                   left: 25.0, right: 25.0, top: 2.0),
//                               child: new Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: <Widget>[
//                                   new Flexible(
//                                     child: new TextField(
//                                       decoration: const InputDecoration(
//                                           hintText: "Enter Your Address"),
//                                       enabled: !_status,
//                                     ),
//                                   ),
//                                 ],
//                               )),
//                           Padding(
//                               padding: EdgeInsets.only(
//                                   left: 25.0, right: 25.0, top: 25.0),
//                               child: new Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: <Widget>[
//                                   new Column(
//                                     mainAxisAlignment: MainAxisAlignment.start,
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: <Widget>[
//                                       new Text(
//                                         'Mobile',
//                                         style: TextStyle(
//                                             fontSize: 16.0,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                     ],
//                                   ),
//                                 ],
//                               )),
//                           Padding(
//                               padding: EdgeInsets.only(
//                                   left: 25.0, right: 25.0, top: 2.0),
//                               child: new Row(
//                                 mainAxisSize: MainAxisSize.max,
//                                 children: <Widget>[
//                                   new Flexible(
//                                     child: new TextField(
//                                       decoration: const InputDecoration(
//                                           hintText: "Enter Mobile Number"),
//                                       enabled: !_status,
//                                     ),
//                                   ),
//                                 ],
//                               )),
// //                          Padding(
// //                              padding: EdgeInsets.only(
// //                                  left: 25.0, right: 25.0, top: 25.0),
// //                              child: new Row(
// //                                mainAxisSize: MainAxisSize.max,
// //                                mainAxisAlignment: MainAxisAlignment.start,
// //                                children: <Widget>[
// //                                  Expanded(
// //                                    child: Container(
// //                                      child: new Text(
// //                                        'Pin Code',
// //                                        style: TextStyle(
// //                                            fontSize: 16.0,
// //                                            fontWeight: FontWeight.bold),
// //                                      ),
// //                                    ),
// //                                    flex: 2,
// //                                  ),
// //                                  Expanded(
// //                                    child: Container(
// //                                      child: new Text(
// //                                        'State',
// //                                        style: TextStyle(
// //                                            fontSize: 16.0,
// //                                            fontWeight: FontWeight.bold),
// //                                      ),
// //                                    ),
// //                                    flex: 2,
// //                                  ),
// //                                ],
// //                              )),
// //                          Padding(
// //                              padding: EdgeInsets.only(
// //                                  left: 25.0, right: 25.0, top: 2.0),
// //                              child: new Row(
// //                                mainAxisSize: MainAxisSize.max,
// //                                mainAxisAlignment: MainAxisAlignment.start,
// //                                children: <Widget>[
// //                                  Flexible(
// //                                    child: Padding(
// //                                      padding: EdgeInsets.only(right: 10.0),
// //                                      child: new TextField(
// //                                        decoration: const InputDecoration(
// //                                            hintText: "Enter Pin Code"),
// //                                        enabled: !_status,
// //                                      ),
// //                                    ),
// //                                    flex: 2,
// //                                  ),
// //                                  Flexible(
// //                                    child: new TextField(
// //                                      decoration: const InputDecoration(
// //                                          hintText: "Enter State"),
// //                                      enabled: !_status,
// //                                    ),
// //                                    flex: 2,
// //                                  ),
// //                                ],
// //                              )),
//                           !_status ? _getActionButtons() : new Container(),
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ));
//   }

//   @override
//   void dispose() {
//     // Clean up the controller when the Widget is disposed
//     myFocusNode.dispose();
//     super.dispose();
//   }

//   Widget _getActionButtons() {
//     return Padding(
//       padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
//       child: new Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.only(right: 10.0),
//               child: Container(
//                   child: new RaisedButton(
//                     child: new Text("Save"),
//                     textColor: Colors.white,
//                     color: Colors.green,
//                     onPressed: () {
//                       setState(() {
//                         _status = true;
//                         FocusScope.of(context).requestFocus(new FocusNode());
//                       });
//                     },
//                     shape: new RoundedRectangleBorder(
//                         borderRadius: new BorderRadius.circular(20.0)),
//                   )),
//             ),
//             flex: 2,
//           ),
//           Expanded(
//             child: Padding(
//               padding: EdgeInsets.only(left: 10.0),
//               child: Container(
//                   child: new RaisedButton(
//                     child: new Text("Cancel"),
//                     textColor: Colors.white,
//                     color: Colors.red,
//                     onPressed: () {
//                       setState(() {
//                         _status = true;
//                         FocusScope.of(context).requestFocus(new FocusNode());
//                       });
//                     },
//                     shape: new RoundedRectangleBorder(
//                         borderRadius: new BorderRadius.circular(20.0)),
//                   )),
//             ),
//             flex: 2,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _getEditIcon() {
//     return new GestureDetector(
//       child: new CircleAvatar(
//         backgroundColor: Colors.red,
//         radius: 14.0,
//         child: new Icon(
//           Icons.edit,
//           color: Colors.white,
//           size: 16.0,
//         ),
//       ),
//       onTap: () {
//         setState(() {
//           _status = false;
//         });
//       },
//     );
//   }
// }
