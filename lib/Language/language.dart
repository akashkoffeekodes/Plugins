
import 'package:flutter/material.dart';
import 'package:plugins/local/localization/language_constants.dart';
import 'package:plugins/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key key}) : super(key: key);

  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {

  bool gujarati=false;
  var currentLanguage;
  SharedPreferences preferences;

  void _changeLanguage(String lan) async {
    Locale _locale = await setLocale(lan);
    MyApp.setLocale(context, _locale);
  }

  void getLan()async{
    preferences=await SharedPreferences.getInstance();
    currentLanguage=preferences.getString('lan');

   

    if(currentLanguage=='gu'){
      UtilsUrl.currentLanguage="gu";
    }else{
      UtilsUrl.currentLanguage="en";
    }

    if(currentLanguage=="en"){
      setState(() {
        gujarati=true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getLan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF1c2431),
        centerTitle: true,
        shape: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xFF374151))),
        title: Text(
          getTranslated(context, "language_Page"),
          // "Language",
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 18,
            fontWeight: FontWeight.w700
          ),
        ),
        leading: GestureDetector(
          onTap:(){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Pluginclass()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Image.asset(
              "assets/icon/backmenu.png",
              color: Color(0xFFFFFFFF),
              width: 10,
              height: 20,
            ),
          ),
        ),
      ),
      body: Padding(

        padding:  EdgeInsets.fromLTRB(12,20,12,0),

        child: Column(
          children: [
            InkWell(
              // splashColor: Color(0xFF1c2431),
              // focusColor: Color(0xFF1c2431),
              // hoverColor: Color(0xFF1c2431),
              // highlightColor: Color(0xFF1c2431),
              onTap: (){
                setState(() {
                  gujarati=true;
                  preferences.setString('lan', 'en');
                  _changeLanguage('en');
                  getLan();
                });
              },
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'English',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF1c2431),
                      ),
                    ),
                  ),
                  gujarati==false
                      ?
                  Icon(Icons.radio_button_unchecked,
                    color: Color(0xFF000000),
                  ): Icon(Icons.radio_button_checked,
                    color: Color(0xFF6A40F3),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(color: Color(0xFF9CA3AF)),
            SizedBox(height: 10),
            InkWell(
              // splashColor: Color(0xFF1c2431),
              // focusColor: Color(0xFF1c2431),
              // highlightColor: Color(0xFF1c2431),
              onTap: (){
                setState(() {
                  gujarati=false;
                  preferences.setString('lan', 'gu');
                  _changeLanguage('gu');
                  getLan();
                });
              },
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'ગુજરાતી',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF1c2431),
                      ),
                    ),
                  ),

                  gujarati
                      ?
                  Icon(Icons.radio_button_unchecked,
                    color: Color(0xFF000000),
                  )
                      :
                  Icon(Icons.radio_button_checked,
                    color: Color(0xFF6A40F3),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(color: Color(0xFF9CA3AF)),
            SizedBox(height: 10),
          ],
        ),

      ),
    );
  }
}
