import 'dart:typed_data';

// import 'package:esc_pos_bluetooth/esc_pos_bluetooth.dart 'as blue;
import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:google_fonts/google_fonts.dart';



class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            backgroundColor: Colors.purple,
            title: Text("الطابعة"),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("ادخال ip الطابعة ",style: GoogleFonts.notoKufiArabic(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                    Container(
                      // padding: const EdgeInsets.only(left: 10),
                      height: 30,
                      width: 125,
                      child: TextField(
                        style: GoogleFonts.notoKufiArabic(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        onChanged: (value) {

                        },


                        decoration: InputDecoration(
                          hintStyle:  GoogleFonts.notoKufiArabic(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),

                        ),
                      ),
                    ),

                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("ادخال ip طابعة المطبخ",style: GoogleFonts.notoKufiArabic(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                    Container(
                      // padding: const EdgeInsets.only(left: 10),
                      height: 30,
                      width: 125,
                      child: TextField(
                        style: GoogleFonts.notoKufiArabic(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        onChanged: (value) {

                        },


                        decoration: InputDecoration(
                          hintStyle:  GoogleFonts.notoKufiArabic(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),

                        ),
                      ),
                    ),

                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("البحث عن طابعة بلوتوث",style: GoogleFonts.notoKufiArabic(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),

                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  ],
                ),
              ],
            ),
          ),
        ));
  }
  SanmiPrint(Uint8List byte)async{
    await MaxxSunmiPrinter.initializePrinter();
    String base64String = base64Encode(byte);
    await MaxxSunmiPrinter.printImage(base64String);
  }
  // void testReceipt(NetworkPrinter printer) {
  //
  //   printer.feed(2);
  //   printer.cut();
  // }
  // void bluetoothPrinter()async{
  //   blue.PrinterBluetoothManager printerManager = blue.PrinterBluetoothManager();
  //   List<blue.PrinterBluetooth> _devices = [];
  //
  //   printerManager.scanResults.listen((printers) async {
  //     _devices=printers;
  //
  //   });
  //   printerManager.startScan(Duration(seconds: 4));
  //
  //
  //   // printerManager.selectPrinter();
  //
  // }
  void networkprinter()async{
    // const PaperSize paper = PaperSize.mm80;
    // final profile = await CapabilityProfile.load();
    // final printer = NetworkPrinter(paper, profile);
    //
    // final PosPrintResult res = await printer.connect('192.168.0.123', port: 9100);
    //
    // if (res == PosPrintResult.success) {
    //   // testReceipt(printer);
    //   printer.disconnect();
    }

    // print('Print result: ${res.msg}');
  // }
  // void takeScreenshot(Uint8List? image) async {
  //   final dac=await getApplicationDocumentsDirectory();
  //   final inmag=File("${dac.path}/فاتورة ${printInvoiceViewModel.getId().toString()}.png");
  //   inmag.writeAsBytesSync(image!);
  //   Share.shareFiles([inmag.path], text: "فاتورة ${printInvoiceViewModel.getId().toString()}");
  // }

}

class MaxxSunmiPrinter {
  static const channel = MethodChannel('maxx_sunmi_printer');

  static const String INIT_PRINTER = "initPrinter";
  static const String PRINT_TEXT = "printText";
  static const String PAPER_FEED = "paperFeed";
  static const String PRINT_TABLE = "printTable";
  static const String PRINT_IMAGE = "printImage";
  static const String PRINT_BARCODE = "printBarcode";
  static const String PRINT_QR_CODE = "printQrCode";
  static const IS_LABEL_MODE = "isLabelMode";
  static const String PRINT_LABEL = "printLabel";
  static const String PRINT_STICKER = "printSticker";

  static const String BOLD_ON = "boldOn";
  static const String BOLD_OFF = "boldOff";
  static const String UNDERLINE_ON = "underlineOn";
  static const String UNDERLINE_OFF = "underlineOff";

  static Future<String> initializePrinter() async {
    try {
      return await channel.invokeMethod(INIT_PRINTER);
    } catch (ex) {
      return "[initializePrinter] ${ex.toString()}";
    }
  }

  static Future<String> printText(String text, {SunmiStyles styles = const SunmiStyles(), int linesAfter = 0}) async {
    try {
      final arguments = {
        "text": text,
        "size": styles.size.value,
        "isBold": styles.isBold,
        "isUnderLine": styles.isUnderLine,
        "alignment": styles.alignment.value,
        "typeface": styles.font.value,
        "linesAfter": linesAfter,
      };

      return await channel.invokeMethod(PRINT_TEXT, arguments);
    } catch (ex) {
      return "[printText]\n${ex.toString()}";
    }
  }

  static Future<void> paperFeed({int number = 1}) async {
    final arguments = {"number": number};
    await channel.invokeMethod(PAPER_FEED, arguments);
  }

  static Future<void> cutPaper() async {
    await channel.invokeMethod("cutPaper");
  }

  static Future<void> printTextLine({String ch = '-', int len = 31}) async {
    await printText(List.filled(len, ch[0]).join());
  }

  static Future<void> boldOn() async {
    await channel.invokeMethod(BOLD_ON);
  }

  static Future<void> boldOff() async {
    await channel.invokeMethod(BOLD_OFF);
  }

  static Future<void> underlineOn() async {
    await channel.invokeMethod(UNDERLINE_ON);
  }

  static Future<void> underlineOff() async {
    await channel.invokeMethod(UNDERLINE_OFF);
  }

  static Future<void> printTable({
    required List<SunmiCol> cols,
    bool isBold = false,
    bool isUnderLine = false,
    SunmiSize size = SunmiSize.md,
    int linesAfter = 0,
  }) async {
    final isSumValid = cols.fold(0, (int sum, col) => sum + col.width) == 12;
    if (!isSumValid) {
      throw Exception('Total columns width must be equal to 12');
    }

    final colsJson = List<Map<String, String>>.from(cols.map<Map<String, String>>((SunmiCol col) => col.toJson()));

    final arguments = {
      "cols": json.encode(colsJson),
      "isBold": isBold,
      "isUnderLine": isUnderLine,
      "size": size.value,
      "linesAfter": linesAfter,
    };

    await channel.invokeMethod(PRINT_TABLE, arguments);
  }

  static Future<void> printImage(String base64, {SunmiAlign align = SunmiAlign.center}) async {
    final arguments = {"base64": base64, "alignment": align.value};
    await channel.invokeMethod(PRINT_IMAGE, arguments);
  }

  static Future<void> printBarcode(
      String text, {
        SunmiTypeBarCode encode = SunmiTypeBarCode.CODE128A,
        SunmiTypePositionBarcode position = SunmiTypePositionBarcode.uponBarcode,
        int height = 162,
        int width = 2,
      }) async {
    final arguments = {
      "text": text,
      "encode": encode.value,
      "position": position.value,
      "height": height,
      "width": width,
    };
    await channel.invokeMethod(PRINT_BARCODE, arguments);
  }

  static Future<void> printQrCode(
      String text, {
        SunmiQrCodePrintSize printSize = SunmiQrCodePrintSize.size8,
        SunmiQrCodeErrorLevel errorLevel = SunmiQrCodeErrorLevel.errorLevel3,
      }) async {
    final arguments = {"text": text, "printSize": printSize.value, "errorLevel": errorLevel.value};
    await channel.invokeMethod(PRINT_QR_CODE, arguments);
  }

  static Future<String> isLabelMode() async {
    final arguments = {"text": ""};
    String result = await channel.invokeMethod(IS_LABEL_MODE, arguments);
    return result;
  }

  static Future<String> printLabel({
    required String barcode,
    required String price,
    String description = '',
    int copy = 1,
    SunmiTypeBarCode encodeBarcode = SunmiTypeBarCode.CODE128A,
    SunmiTypePositionBarcode positionBarcode = SunmiTypePositionBarcode.beneathBarcode,
    int heightBarcode = 90,
    int widthBarcode = 2,
  }) async {
    String result = await isLabelMode();

    if (result != "success") {
      return result;
    }

    final arguments = {
      "barcode": barcode,
      "price": price,
      "description": description,
      "copy": copy,
      "encodeBarcode": encodeBarcode.value,
      "positionBarcode": positionBarcode.value,
      "heightBarcode": heightBarcode,
      "widthBarcode": widthBarcode,
    };
    await channel.invokeMethod(PRINT_LABEL, arguments);

    return "success";
  }

  static Future<String> printSticker({
    required List<String> lineContents,
    SunmiStyles styles = const SunmiStyles(),
    int copy = 1,
    int lineWrapTop = 1,
    int lineWrapBottom = 1,
  }) async {
    String result = await isLabelMode();

    if (result != "success") {
      return result;
    }

    final arguments = {
      "lineContents": lineContents,
      "copy": copy,
      "size": styles.size.value,
      "isBold": styles.isBold,
      "isUnderLine": styles.isUnderLine,
      "alignment": styles.alignment.value,
      "lineWrapTop": lineWrapTop,
      "lineWrapBottom": lineWrapBottom,
    };
    await channel.invokeMethod(PRINT_STICKER, arguments);

    return "success";
  }
}

class SunmiFont {
  const SunmiFont._internal(this.value);
  final String value;
  static const defaultFont = SunmiFont._internal("test.ttf");
  static const khmerOs = SunmiFont._internal("test.ttf");
}

class SunmiAlign {
  const SunmiAlign._internal(this.value);
  final int value;
  static const left = SunmiAlign._internal(0);
  static const center = SunmiAlign._internal(1);
  static const right = SunmiAlign._internal(2);
}

class SunmiSize {
  const SunmiSize._internal(this.value);
  final int value;
  static const xs = SunmiSize._internal(14);
  static const sm = SunmiSize._internal(18);
  static const md = SunmiSize._internal(24);
  static const lg = SunmiSize._internal(36);
  static const xl = SunmiSize._internal(42);

  static SunmiSize customSize(int size) {
    return SunmiSize._internal(size);
  }
}

class SunmiTypeBarCode {
  const SunmiTypeBarCode._internal(this.value);
  final int value;
  static const UPC_A = SunmiTypeBarCode._internal(0); // UPC-A
  // static const UPC_E = SunmiTypeBarCode._internal(1); // UPC-E
  static const EAN13 = SunmiTypeBarCode._internal(2); // EAN13
  // static const EAN8 = SunmiTypeBarCode._internal(3); // EAN8
  static const CODE39 = SunmiTypeBarCode._internal(4); // CODE39
  static const ITF = SunmiTypeBarCode._internal(5); // ITF
  static const CODABAR = SunmiTypeBarCode._internal(6); // CODABAR
  static const CODE93 = SunmiTypeBarCode._internal(7); // CODE93
  static const CODE128A = SunmiTypeBarCode._internal(8); // CODE128A
// static const CODE128B = SunmiTypeBarCode._internal(9); // CODE128B
// static const CODE128C = SunmiTypeBarCode._internal(10); // CODE128C
}

class SunmiTypePositionBarcode {
  const SunmiTypePositionBarcode._internal(this.value);
  final int value;
  static const textNull = SunmiTypePositionBarcode._internal(0);
  static const uponBarcode = SunmiTypePositionBarcode._internal(1);
  static const beneathBarcode = SunmiTypePositionBarcode._internal(2);
  static const up_andBeneath = SunmiTypePositionBarcode._internal(3);
}

class SunmiTypeWidthBarcode {
  const SunmiTypeWidthBarcode._internal(this.value);
  final int value;
  static const s = SunmiTypeWidthBarcode._internal(2);
  static const m = SunmiTypeWidthBarcode._internal(4);
  static const l = SunmiTypeWidthBarcode._internal(6);
}

class SunmiQrCodePrintSize {
  const SunmiQrCodePrintSize._internal(this.value);
  final int value;
  static const size1 = SunmiQrCodePrintSize._internal(1);
  static const size2 = SunmiQrCodePrintSize._internal(2);
  static const size3 = SunmiQrCodePrintSize._internal(3);
  static const size4 = SunmiQrCodePrintSize._internal(4);
  static const size5 = SunmiQrCodePrintSize._internal(5);
  static const size6 = SunmiQrCodePrintSize._internal(6);
  static const size7 = SunmiQrCodePrintSize._internal(7);
  static const size8 = SunmiQrCodePrintSize._internal(8);
  static const size9 = SunmiQrCodePrintSize._internal(9);
  static const size10 = SunmiQrCodePrintSize._internal(10);
  static const size11 = SunmiQrCodePrintSize._internal(11);
  static const size12 = SunmiQrCodePrintSize._internal(12);
}

class SunmiQrCodeErrorLevel {
  const SunmiQrCodeErrorLevel._internal(this.value);
  final int value;
  static const errorLevel0 = SunmiQrCodeErrorLevel._internal(0);
  static const errorLevel1 = SunmiQrCodeErrorLevel._internal(1);
  static const errorLevel2 = SunmiQrCodeErrorLevel._internal(2);
  static const errorLevel3 = SunmiQrCodeErrorLevel._internal(3);
}
class SunmiCol {
  SunmiCol({
    this.text = '',
    this.width = 2,
    this.alignment = SunmiAlign.left,
  }) {
    if (width < 1 || width > 12) {
      throw Exception('Column width must be between 1..12');
    }
  }

  String text;
  int width;
  SunmiAlign alignment;

  Map<String, String> toJson() {
    return {
      "text": text,
      "width": width.toString(),
      "align": alignment.value.toString(),
    };
  }
}
class SunmiStyles {
  const SunmiStyles({
    this.isBold = false,
    this.isUnderLine = false,
    this.alignment = SunmiAlign.left,
    this.size = SunmiSize.md,
    this.font = SunmiFont.defaultFont,
  });

  final bool isBold;
  final bool isUnderLine;
  final SunmiAlign alignment;
  final SunmiSize size;
  final SunmiFont font;
}
