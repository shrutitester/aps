import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  Future setStringPreference(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  logoutPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }


  setBooleanPreference(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  Future<String> getStringPreference(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String prefValue = prefs.getString(key) ?? '';
    return prefValue;
  }

  // Future<String> getAccessToken() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String token = prefs.getString(Strings.accessToken) ?? '';
  //
  //   return token;
  // }

  // Future<String> getId() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String ID = prefs.getString(Strings.name) ?? '';
  //
  //   return ID;
  // }

  Future<bool> getBoolPreference(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool prefValue = prefs.getBool(key) ?? false;

    return prefValue;
  }
}
