import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'appcolor.dart';

class Sliders extends StatefulWidget {
  const Sliders({Key key}) : super(key: key);

  @override
  _SlidersState createState() => _SlidersState();
}

class _SlidersState extends State<Sliders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
                height: 250.0,
                width: 500.0,
                child: Carousel(
                  images: [
                    Image.asset("assets/image/image.png"),
                    Image.asset("assets/image/detail.png"),
                    Image.asset("assets/image/homepageimg.png"),
                  ],

                  dotSize: 0.0,
                  dotSpacing: 00.0,
                  dotColor: Colors.pinkAccent,
                  indicatorBgPadding: 0.0,
                  borderRadius: false,
                  dotBgColor: AppColors.pink,
                  moveIndicatorFromBottom: 180.0,
                  noRadiusForIndicator: true,
                  overlayShadow: true,
                  overlayShadowColors: Colors.pinkAccent,
                  overlayShadowSize: 0.1,
                )),
            
          ],
        ),
      ),
    );
  }
}
