import 'dart:convert';
import 'package:http/http.dart' as http;
class CallApi{
  final String _url='https://fcm.googleapis.com/fcm/';

  postData(data,apiUrl) async {
    var fullUrl = _url + apiUrl;
    var mainUrl = Uri.parse(fullUrl);


    return await http.post(
      mainUrl,
      headers: _setHeaders(),
      body: jsonEncode(data),

    );
  }


  _setHeaders()=>{
    'Authorization' : 'key=AAAARMUnMvw:APA91bHbQou2dYyBtuA8M00lXNTeLnwtTxNqR3eBGWN6pxVGitMr9KPa7mnY3BKqY09m5l3O404t28rzRgRnSoVzuyAxzpToXN53UHSJdjuqZ23RXU2CoSRKBAPCp2fTi9HKCiZyKKrZ',
    'Content-type' : 'application/json',
  };
}