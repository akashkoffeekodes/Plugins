
import 'package:flutter/material.dart';
import 'package:plugins/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'demo_localization.dart';

const String LAGUAGE_CODE = 'languageCode';

//languages code
const String ENGLISH = 'en';
const String GUJARATI = 'gu';

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(LAGUAGE_CODE, languageCode);
  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(LAGUAGE_CODE) ?? "gu";
  if(languageCode=='gu'){
    UtilsUrl.currentLanguage="gu";
  }else{
    UtilsUrl.currentLanguage="en";
  }
  return _locale(languageCode);
}



Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return Locale(ENGLISH, 'US');
    case GUJARATI:
      return Locale(GUJARATI, "IN");
    default:
      return Locale(ENGLISH, 'US');
  }
}

String getTranslated(BuildContext context, String key) {
  return DemoLocalization.of(context).translate(key);
}
