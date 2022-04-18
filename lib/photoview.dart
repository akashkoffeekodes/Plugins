import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class Imageview extends StatelessWidget {
  const Imageview({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text("Image view"),
      ),
      body: Column(
        children: [
      Container(
        height: 200,
      width: 300,
      child: PhotoView(
      imageProvider: AssetImage("assets/image/image.png"),
    )
    )
        ],
      ),
    );
  }
}
