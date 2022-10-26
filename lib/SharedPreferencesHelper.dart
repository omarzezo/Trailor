import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {

  static Future<int?> getPrinterType() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("PrinterType");
  }

  static Future<bool> setPrinterType(int? value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt("PrinterType", value!);
  }

}