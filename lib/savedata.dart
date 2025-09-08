import 'package:shared_preferences/shared_preferences.dart';

class SaveData {
  // دالة لحفظ بيانات الجنس
  static Future<void> saveUserData(bool isBoy) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isBoy', isBoy);  // حفظ الجنس
  }

  // دالة لاسترجاع بيانات الجنس
  static Future<bool?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isBoy'); // استرجاع الجنس
  }
}
