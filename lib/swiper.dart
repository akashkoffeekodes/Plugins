import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';



class Swipper extends StatelessWidget {
  final imageList = [
'assets/image/image.png','assets/icon/Group 601.png','assets/image/userimg.png'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: Swiper(
          itemCount: imageList.length,
          itemBuilder: (context, index) {
            return Image.asset(
              imageList[index],
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}