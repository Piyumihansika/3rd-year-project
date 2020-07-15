// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:image_picker/image_picker.dart';

// final String nodeEndPoint = 'http://10.0.2.2:3000/imageC/image';
// File file;

//  void _choose() async {
//   // file = await ImagePicker.pickImage(source: ImageSource.camera);
// file = await ImagePicker.pickImage(source: ImageSource.gallery);
//  }

//  void _upload() {
//    if (file == null) return;
//    String base64Image = base64Encode(file.readAsBytesSync());
//    String fileName = file.path.split("/").last;

// http.post(nodeEndPoint, body: {
//      "image": base64Image,
//      "name": fileName,
//    }).then((res) {
//      print(res.statusCode);
//    }).catchError((err) {
//      print(err);
//    });
//  }
//   //

// class Upload extends StatefulWidget {
//   @override
//   _UploadState createState() => _UploadState();
// }

// class _UploadState extends State<Upload> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: <Widget>[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               RaisedButton(
//                 onPressed: _choose,
//                 child: Text('Choose Image'),
//               ),
//               SizedBox(width: 10.0),
//               RaisedButton(
//                 onPressed: _upload,
//                 child: Text('Upload Image'),
//               )
//             ],
//           ),
//           file == null
//             ? Text('No Image Selected')
//             : Image.file(file)
//         ],
//       ),
//     );
//   }
// }

// import 'package:app/Seller/Sell_Items/Sellitempage1.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class UploadImageDemo extends StatefulWidget {
  final String selectCategory;
  final String selectDuration;
  final String price;
  final String description;

  // UploadImageDemo() : super();

  final String title = "Upload Image Demo";

  const UploadImageDemo(
      {Key key,
      this.selectCategory,
      this.selectDuration,
      this.price,
      this.description})
      : super(key: key);

  @override
  UploadImageDemoState createState() => UploadImageDemoState();
}

class UploadImageDemoState extends State<UploadImageDemo> {
  //
  static final String uploadEndPoint = "http://10.0.2.2:3000/item/addItem";

  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';

  chooseImage() {
    setState(() {
      file = ImagePicker.pickImage(source: ImageSource.gallery);
    });
    setStatus('');
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  startUpload() {
    setStatus('Uploading Image...');
    if (tmpFile == null) {
      setStatus(errMessage);
      return;
    }
    String fileName = tmpFile.path.split('/').last;
    upload(fileName);
  }

  upload(String fileName) {
    http.post(uploadEndPoint, body: {
      "image": base64Image,
      "name": fileName,
      "category": widget.selectCategory,
      "description": widget.description,
      "price": widget.price,
      "duration": widget.selectDuration
    }).then((result) {
      setStatus(result.statusCode == 201 ? "successfully added" : errMessage);
    }).catchError((error) {
      setStatus(error);
    });
  }

  Widget showImage() {
    return FutureBuilder<File>(
      future: file,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {
          tmpFile = snapshot.data;
          base64Image = base64Encode(snapshot.data.readAsBytesSync());
          return Flexible(
            child: Image.file(
              snapshot.data,
              fit: BoxFit.fill,
            ),
          );
        } else if (null != snapshot.error) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Image Demo"),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            OutlineButton(
              onPressed: chooseImage,
              child: Text('Choose Image'),
            ),
            SizedBox(
              height: 20.0,
            ),
            showImage(),
            SizedBox(
              height: 20.0,
            ),
            OutlineButton(
              onPressed: startUpload,
              child: Text('Upload Image'),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              status,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w500,
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
