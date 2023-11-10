import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences prefs;

  static saveList(List<String> watchList) async {
    await prefs.setStringList("watchList", watchList);
  }

  static List<String> getList() {
    return prefs.getStringList("watchList") ?? [];
  }
}
