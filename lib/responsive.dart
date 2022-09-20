import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Responsive extends StatelessWidget {
  final Widget mobilWidget;
  final Widget? tabletWidget;
  Responsive({required this.mobilWidget, this.tabletWidget});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth >= 800) {
        return tabletWidget ?? mobilWidget;
      } else {
        return mobilWidget;
      }
    });
  }
}
