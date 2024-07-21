import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskema/design/string/app_string.dart';

class Pref {
  static set({required String key, required dynamic input}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (input is String) {
      await prefs.setString(key, input);
    } else if (input is bool) {
      await prefs.setBool(key, input);
    } else if (input is double) {
      await prefs.setDouble(key, input);
    } else if (input is int) {
      await prefs.setInt(key, input);
    } else if (input is List<String>) {
      await prefs.setStringList(key, input);
    } else {
      throw const PrefsException(AppString.UNKNOW_VALUE_CATE);
    }
  }

  static dynamic get({required dynamic key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key) ?? AppString.NOT_EXIST;
  }

  static remove({required String key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }

  static clean() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  static Future<bool> containsKey(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(key);
  }


}

class PrefsException implements Exception {
  final String message;

  const PrefsException(this.message);
}

