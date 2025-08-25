import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? prefs;
  static Future<void> init()async{
    prefs =await SharedPreferences.getInstance();
  }
}

class Prefrences{
  Prefrences._();
  static const String userId="userId";
  static const String token="token";
  static const bool iisNewuser=false;
}