import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static   SharedPreferences? sharedPreferencesApp;
  static init() async {
    sharedPreferencesApp = await SharedPreferences.getInstance();
  }

  // static Future<bool> savePrefs(
  //     { @required String! key, @required  dynamic value}) async {
  //   if (value is String)
  //     return await sharedPreferences.setString(key, value);
  //   else if (value is int)
  //     return await sharedPreferences.setInt(key, value);
  //   else if (value is double)
  //     return await sharedPreferences.setDouble(key, value);
  //
  //   return await sharedPreferences.setBool(key, value);
  // }
  //
  // static dynamic getPrefs({@required String key}) {
  //   return sharedPreferences.get(key);
  // }
  //
  // static Future<bool> clearPrefs({@required String key}) async {
  //   return await sharedPreferences.remove(key);
  // }
  //
  // static Future<bool> clearAll() async {
  //   return await sharedPreferences.clear();
  // }
}
