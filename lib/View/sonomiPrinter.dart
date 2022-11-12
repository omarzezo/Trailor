
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SonomiPrinter extends StatefulWidget {
  const SonomiPrinter({Key? key}) : super(key: key);

  @override
  SonomiPrinterState createState() => SonomiPrinterState();
}

class SonomiPrinterState extends State<SonomiPrinter> {
  bool printBinded = false;
  int paperSize = 0;
  String serialNumber = "";
  String printerVersion = "";
  @override
  void initState() {
    super.initState();

    // _bindingPrinter().then((bool? isBind) async {
      // SunmiPrinter.paperSize().then((int size) {
      //   setState(() {
      //     paperSize = size;
      //   });
      // });
      //
      // SunmiPrinter.printerVersion().then((String version) {
      //   setState(() {
      //     printerVersion = version;
      //   });
      // });
      //
      // SunmiPrinter.serialNumber().then((String serial) {
      //   setState(() {
      //     serialNumber = serial;
      //   });
      // });

    //   setState(() {
    //     printBinded = isBind!;
    //   });
    // });
  }

  /// must binding ur printer at first init in app
  // Future<bool?> _bindingPrinter() async {
  //   final bool? result = await SunmiPrinter.bindingPrinter();
  //   return result;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sunmi printer '),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(
              //     top: 10,
              //   ),
              //   child: Text("Print binded: " + printBinded.toString()),
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 2.0),
              //   child: Text("Paper size: " + paperSize.toString()),
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 2.0),
              //   child: Text("Serial number: " + serialNumber),
              // ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 2.0),
              //   child: Text("Printer version: " + printerVersion),
              // ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () async {

                          ///todo assign image to the funcation

                        },
                        child: const Text('طباعة فاتورة')),
                  ],
                ),
              ),
              const Divider(),
            ],
          ),
        ));
  }
  // printsonomi(Uint8List? theimageThatC)async{
  //
  //   await SunmiPrinter.initPrinter();
  //   await SunmiPrinter.startTransactionPrint(true);
  //   await SunmiPrinter.printImage(theimageThatC!);
  //   await SunmiPrinter.lineWrap(2);
  //   await SunmiPrinter.exitTransactionPrint(true);
  // }
}
