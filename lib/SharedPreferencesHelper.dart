import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {

  static Future<int?> getPrinterType() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("PrinterType");
  } static Future<int?> getPageSize() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("PageSize");
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

TextStyle publicStryle=GoogleFonts.notoKufiArabic(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: 18);