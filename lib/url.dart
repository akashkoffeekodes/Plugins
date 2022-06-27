import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Urllauncher extends StatefulWidget {
  const Urllauncher({Key key}) : super(key: key);

  @override
  _UrllauncherState createState() => _UrllauncherState();
}

class _UrllauncherState extends State<Urllauncher> {
  _launchURL()async{
    const url = "https://pub.dev/";

      await launch(url);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Url launcher"),
      ),
      body:Center(
        child: ElevatedButton(
          onPressed: _launchURL,
          child: Text("Go to flutter ",style: TextStyle(fontSize: 15),),
        ),
      ) ,
    );
  }
}
