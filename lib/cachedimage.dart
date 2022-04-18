import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';



class Chacheimg extends StatelessWidget {
  const Chacheimg({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Cached Images';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: Center(
          child: CachedNetworkImage(
            imageUrl: "http://via.placeholder.com/350x150",
            placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
      ),
    );
  }
}