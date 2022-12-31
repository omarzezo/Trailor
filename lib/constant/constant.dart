
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
// String replaceArabicNumber(String? input) {
//   if(input==null||input.isEmpty){
//     input="";
//     return input;
//   }else{
//     const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
//     const arabic = ['٠', '١', '۲', '۳', '٤', '٥', '٦', '٧', '٨', '٩'];
//   // ٠، ١، ٢، ٣، ٤، ٥، ٦، ٧، ٨، ٩
//     for (int i = 0; i < english.length; i++) {
//       input = input!.replaceAll(arabic[i], english[i]);
//     }
//   }
//
// print(input);
//   return input!;
// }
String replaceArabicNumber(String? s) {
  if(s==null||s.isEmpty)return '';
  var sb = new StringBuffer();
  for (int i = 0; i < s.length; i++) {
    switch (s[i]) {
//Persian digits
      case '\u06f0':
        sb.write('0');
        break;
      case '\u06f1':
        sb.write('1');
        break;
      case '\u06f2':
        sb.write('2');
        break;
      case '\u06f3':
        sb.write('3');
        break;
      case '\u06f4':
        sb.write('4');
        break;
      case '\u06f5':
        sb.write('5');
        break;
      case '\u06f6':
        sb.write('6');
        break;
      case '\u06f7':
        sb.write('7');
        break;
      case '\u06f8':
        sb.write('8');
        break;
      case '\u06f9':
        sb.write('9');
        break;

//Arabic digits
      case '\u0660':
        sb.write('0');
        break;
      case '\u0661':
        sb.write('1');
        break;
      case '\u0662':
        sb.write('2');
        break;
      case '\u0663':
        sb.write('3');
        break;
      case '\u0664':
        sb.write('4');
        break;
      case '\u0665':
        sb.write('5');
        break;
      case '\u0666':
        sb.write('6');
        break;
      case '\u0667':
        sb.write('7');
        break;
      case '\u0668':
        sb.write('8');
        break;
      case '\u0669':
        sb.write('9');
        break;
      default:
        sb.write(s[i]);
        break;
    }
  }
  return sb.toString();
}
//۰۱۲۳٤۵٦۷۸۹