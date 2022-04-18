import 'package:flutter/material.dart';
import 'package:plugins/appcolor.dart';

class Con extends StatefulWidget {
  const Con({Key key}) : super(key: key);

  @override
  _ConState createState() => _ConState();
}

class _ConState extends State<Con> {
  bool select = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          color: AppColors.pink,
        ),
        actions: [
          Container(
            color: AppColors.pink,
          ),

        ],
      ),
      body: Column(
        children: [
          OutlineButton(
            shape: StadiumBorder(),
            highlightedBorderColor: Colors.blue,
            borderSide: BorderSide(width: 1, color: Colors.red),
            onPressed: () {
         select = true;
            },
            child: Text('OutlineButton with custom shape and border'),
          ),
          OutlineButton(
            shape: StadiumBorder(),
            highlightedBorderColor: Colors.blue,
            borderSide: BorderSide(width: 1, color: Colors.red),
            onPressed: () {
              select = false;
            },
            child: Text('OutlineButton with custom shape and border'),
          ),
         Center(
              child: select == true ?  Container(
                height: 20,
                color: Colors.pink,
              ) :Container(
                height: 20,
                color: Colors.green,
              ))
        ],
      ),
    );
  }
}
