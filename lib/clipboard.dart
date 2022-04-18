import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class Clip extends StatelessWidget{

  TextEditingController mytext = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text("Copy & Paste with Dart"),
          backgroundColor: Colors.indigoAccent,
        ),
        body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(20),
            child: Column(children: [

              TextField(
                controller: mytext,
              ),

              Row(
                  children:[
                    ElevatedButton(
                        onPressed: (){
                          Clipboard.setData(ClipboardData(text: mytext.text));
                        },
                        child: Text("Copy Text")
                    ),

                    Padding(
                      padding: EdgeInsets.only(left:20),
                      child:ElevatedButton(
                          onPressed: () async {
                            Clipboard.getData(Clipboard.kTextPlain).then((value){
                              mytext.text = mytext.text + value.text;
                            });
                          },
                          child: Text("Paste Text")
                      ),
                    )
                  ]
              ),
            ],)

        )
    );
  }
}