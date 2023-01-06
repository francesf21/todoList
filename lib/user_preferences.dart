import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static SharedPreferences? _preferences;

  static const _taskDataKey = "taskData";

  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future setData(String data) async {
    await _preferences?.setString(_taskDataKey, data);
  }

  static String? getData() {
    return _preferences?.getString(_taskDataKey);
  }
}
