import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {

  static Future<String?> getApiKey() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("ApiKey");
  }
  static Future<bool> setApiKey(String? value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("ApiKey", value!);
  }

  static Future<int?> getPrinterType() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("PrinterType");
  } static Future<int?> getPageSize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("PageSize");
  }

  static Future<String?> getMacAddress() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("MacJeson");
  }
  static Future<bool> setMacAddress(String? value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("MacJeson", value!);
  }

  static Future<String?> getMacPrinter() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("MacPinter");
  }
  static Future<bool> setMacPrinter(String? value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("MacPinter", value!);
  }

  static Future<String?> getIpPrinter() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("IpPrinter");
  }
  static Future<bool> setIpPrinter(String? value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("IpPrinter", value!);
  }

  static Future<bool> setPrinterType(int? value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt("PrinterType", value!);
  }
  static Future<bool> setPageSize(int? value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt("PageSize", value!);
  }

}
TextStyle getStyle({required Color color,required double fontSize}){
  return GoogleFonts.notoKufiArabic(
      color: color,
      fontWeight: FontWeight.bold,
      fontSize: fontSize);
}

TextStyle publicStyle=GoogleFonts.notoKufiArabic(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 18);