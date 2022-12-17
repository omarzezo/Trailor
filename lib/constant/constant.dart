
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
