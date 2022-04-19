import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:plugins/realtimelocation.dart';
import 'package:plugins/utils/utils.dart';
import 'Language/language.dart';
import 'local/localization/demo_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:plugins/local/localization/demo_localization.dart';
import 'package:plugins/animation.dart';
import 'package:plugins/clipboard.dart';
import 'package:plugins/condition%20pratice.dart';
import 'package:plugins/darkthem.dart';
import 'package:plugins/geolocation.dart';
import 'package:plugins/googlepay.dart';
import 'package:flutter/cupertino.dart';
import 'package:plugins/hive.dart';
import 'package:plugins/map1.dart';
import 'package:plugins/polyline.dart';
import 'package:plugins/qrscanner.dart';
import 'package:plugins/slide.dart';
import 'package:plugins/slideup.dart';
import 'package:plugins/smoothpageindicator.dart';
import 'package:plugins/styletost.dart';
import 'package:plugins/url.dart';
import 'package:plugins/webview.dart';
import 'cachedimage.dart';
import 'chatbubble.dart';
import 'clipper.dart';
import 'country_pickers.dart';
import 'date.dart';

import 'imagepicker.dart';
import 'local/localization/language_constants.dart';
import 'localauth...dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'piecagrt.dart';
import 'pincode.dart';
import 'platform widgets.dart';
import 'razorpay.dart';
import 'reffersh.dart';
import 'searchdrop.dart';
import 'shimmer.dart';
import 'shredpref.dart';
import 'snackbar.dart';
import 'src/pages/index.dart';
import 'swiper.dart';
import 'videobox.dart';
import 'videoplayer.dart';



const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title// description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();


Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
  print(message.data);
  flutterLocalNotificationsPlugin.show(
      message.data.hashCode,
      message.data['title'],
      message.data['body'],
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,

        ),
      ));

  FirebaseMessaging.onMessage.listen((RemoteMessage event) {
    print("message recieved");
    print(event.notification.body);
    var context;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Notification"),
            content: Text(event.notification.body),
            actions: [
              TextButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  });



}


Future<void> main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();



  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );


  runApp(const MyApp());


  fcmSubscribe();
}
fcmSubscribe() async {

  // await FirebaseMessaging.instance.subscribeToTopic('SWORD_Testing');
  await FirebaseMessaging.instance.subscribeToTopic('default');
  print(FirebaseMessaging.onMessage.toString());
  print(FirebaseMessaging.onMessageOpenedApp.toString());

}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(newLocale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Locale _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    UtilsUrl.platform=Theme.of(context).platform;
  }

  @override
  Widget build(BuildContext context) {
    if (this._locale == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blue[800]),
          ),
        ),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:MyApp10(),


      //  LanguagePage(),
        locale: _locale,
        supportedLocales: [
          Locale("en", "US"),
          Locale("gu", "IN")
        ],
        localizationsDelegates: [
          DemoLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
      );
    }
  }
}

class Pluginclass extends StatefulWidget {
  const Pluginclass({Key key}) : super(key: key);

  @override
  _PluginclassState createState() => _PluginclassState();
}

class _PluginclassState extends State<Pluginclass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("plugin"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [



              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage0()),
                    );
                  },
                  child: Text("Image , video picker")),




              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Webview()),
                    );
                  },
                  child: Text("Web View")),




              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Urllauncher()),
                    );
                  },
                  child: Text("url launcher")),

              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>syncfusionDatepicker()),
                    );
                  },
                  child: Text("Date picker")),


              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>Pincode()),
                    );
                  },
                  child: Text("Pin code")),


              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>MyAppp()),
                    );
                  },
                  child: Text("Shimer")),


              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>VideoApp()),
                    );
                  },
                  child: Text("Video plaayer")),

              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>Chacheimg()),
                    );
                  },
                  child: Text("cached_network_image")),

              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>Swipper()),
                    );
                  },
                  child: Text("swiper")),



              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>Clipper()),
                    );
                  },
                  child: Text("Clipper")),



              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>MainScreen()),
                    );
                  },
                  child: Text("Chat BUbble")),









              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>Preferences()),
                    );
                  },
                  child: Text("shared_preferences")),



              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>Authe()),
                    );
                  },
                  child: Text("Local auth....")),





              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>Piechart()),
                    );
                  },
                  child: Text("pie chart")),




              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>DemoPage()),
                    );
                  },
                  child: Text("country_pickers")),







              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>Sliders()),
                    );
                  },
                  child: Text("Slider")),




              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>Clip()),
                    );
                  },
                  child: Text("Clipboard")),





              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>MyListPage()),
                    );
                  },
                  child: Text("reffresh")),

              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>MyApp0()),
                    );
                  },
                  child: Text("style toast")),


              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>VideoPlayerScreen()),
                    );
                  },
                  child: Text("Video box")),



              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>   Searchable ()),
                    );
                  },
                  child: Text("Search dropdown")),




              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>   Snack ()),
                    );
                  },
                  child: Text("Snak bar")),



              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp7()),
                    );
                  },
                  child: Text("Device info")),






              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Maps()),
                    );
                  },
                  child: Text("Map Marker")),


              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Polylinee()),
                    );
                  },
                  child: Text("map poliline")),



              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp10()),
                    );
                  },
                  child: Text("razorpay_flutter:")),



              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Paytm()),
                    // );
                  },
                  child: Text("paytm")),



              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PaySampleApp()),
                    );
                  },
                  child: Text("Google pay")),



              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => IndexPage()),
                    );
                  },
                  child: Text("agora ")),


              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Homeanimation()),
                    );
                  },
                  child: Text("Animation ")),



              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Smoothind()),
                    );
                  },
                  child: Text("Smoothpage ind....")),



              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Slideup()),
                    );
                  },
                  child: Text("Slide up")),

              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Hive_dataBase ()),
                    );
                  },
                  child: Text("Hive")),



              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Geolocation()),
                    );
                  },
                  child: Text("geolocation")),



              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Theam()),
                    );
                  },
                  child: Text("Dark them")),


              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Con()),
                    );
                  },
                  child: Text("conx")),


              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Qr_scanner()),
                    );
                  },
                  child: Text("Multi language")),



              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Realtime_location()),
                    );
                  },
                  child: Text("Realtime location trace")),




              

            ],
          ),
        ),
      ),
    );
  }
}



