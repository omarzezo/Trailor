
import 'dart:ui';

import 'package:flutter/material.dart';

class MyConstant{
  // final  Color purpleColor = const Color(0xff9A3CAD);
  final  Color purpleColor = const Color(0xff10A9F4);
  final  Color greenColor = const Color(0xff3B9E3F);
}
Route createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,

    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0); //animation From left like android
      var end = Offset.zero;
      var tween = Tween(begin: begin, end: end);
      var offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
String replaceArabicNumber(String? input) {
  if(input==null||input.isEmpty){
    input="";
    return input;
  }else{
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const arabic = ['۰', '۱', '۲', '۳', '٤', '۵', '٦', '۷', '۸', '۹'];

    for (int i = 0; i < english.length; i++) {
      input = input!.replaceAll(arabic[i], english[i]);
    }
  }

print(input);
  return input!;
}
//۰۱۲۳٤۵٦۷۸۹