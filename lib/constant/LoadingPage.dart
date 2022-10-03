import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:omar/constant/constant.dart';

class LoadingPage {
  final BuildContext _context;

  LoadingPage(this._context);

  void show() {
    showDialog(
      context: _context,
      barrierColor: Colors.transparent,
      builder: (context) {
        return  SpinKitFadingCircle(color: MyConstant().purpleColor,);
      },
    ).then((value) {
      // onClosed(value);
    });
  }

  /// Cerrar carga
  void close() {
    Navigator.of(_context).pop();
  }
}
