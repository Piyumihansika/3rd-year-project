import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:app/utils/ResponseData.dart';
// import 'package:flutter_image_compress/flutter_image_compress.dart';

// final String nodeEndPoint = 'http://10.0.2.2:3000/imageC/image';
final String nodeEndPoint = '${ResponseData.apiUrl}/category/addCategory';

File file;

void _choose() async {
  // file = await ImagePicker.pickImage(source: ImageSource.camera);
  file = await ImagePicker.pickImage(source: ImageSource.gallery);
}

void _upload() {
  if (file == null) return;
  String categoryImage = base64Encode(file.readAsBytesSync());
  // String fileName = file.path.split("/").last;

  http.post(nodeEndPoint, body: {
    "categoryImage": categoryImage,
    "categoryName": "plastic",
    "unitPrice": "10"
    // "name": fileName,
  }).then((res) {
    print(res.statusCode);
    print(nodeEndPoint);
  }).catchError((err) {
    print(err);
  });
}
//

class Upload extends StatefulWidget {
  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: _choose,
                child: Text('Choose Image'),
              ),
              SizedBox(width: 10.0),
              RaisedButton(
                onPressed: _upload,
                child: Text('Upload Image'),
              )
            ],
          ),
          file == null ? Text('No Image Selected') : Image.file(file)
        ],
      ),
    );
  }
}
