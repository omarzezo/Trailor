import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{

  static late SharedPreferences sharedPreferences;
static init() async
{
  return  sharedPreferences = await SharedPreferences.getInstance();
}
  static Future<bool> setBoolean ({
    required String key,
    required bool value,
  })async
  {
    return await sharedPreferences.setBool(key, value);
  }
  static dynamic getData ({
    required String key,
  })
  {
    return sharedPreferences.get(key);
  }

  static Future<dynamic> saveData ({
    required String key,
    required dynamic value,
  })async
  {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);

    // lw 7aga 8er keda htro7ll double
    return await sharedPreferences.setDouble(key, value);
  }


 static Future<void> setIsUserLoggedIn() async {
    sharedPreferences.setBool('userIsLoggedIn', true);
  }


  static Future<bool> isUserLoggedIn() async {
    return sharedPreferences.getBool('userIsLoggedIn') ?? false;
  }
  static Future<void> setIsUserAuthIn() async {
    sharedPreferences.setBool('userIsAuthed', true);
  }

  static Future<bool> isUserAuthIn() async {
    return sharedPreferences.getBool('userIsAuthed') ?? false;
  }
}