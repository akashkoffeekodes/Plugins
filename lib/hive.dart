import 'package:flutter/material.dart';
import 'package:hive/hive.dart';



class Hive_dataBase extends StatefulWidget {
  const Hive_dataBase({Key key}) : super(key: key);

  @override
  _Hive_dataBaseState createState() => _Hive_dataBaseState();
}

class _Hive_dataBaseState extends State<Hive_dataBase> {
  @override
   Box box1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    createBox();
    // print("hi");
  }
  void createBox() async{
    box1 = await Hive.openBox('database1');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(onPressed: (){



              box1.put('name', 'predator');
              box1.put('myname', 'Akash gupta');
              print(box1);

              print('DATA ADDED');
            }, child: const Text("Add")),



            ElevatedButton(onPressed: () async{
              print(box1.get('myname'));
              print(box1.get('name'));
            }, child: const Text("Read")),




            ElevatedButton(onPressed: (){
              box1.put('name', 'Sagar');
            }, child:const   Text("Update")),




            ElevatedButton(onPressed: (){
              box1.delete('name');
            }, child: const Text("Delete")),


            ElevatedButton(onPressed: (){
              print(box1.toMap());
            }, child: const Text("Read All Data")),



            ElevatedButton(onPressed: (){
              Hive.box('database1').clear();
            }, child: const  Text("Delete BOX")),
          ],
        ),
      ),
    );
  }
}