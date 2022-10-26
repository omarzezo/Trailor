import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:ping_discover_network_forked/ping_discover_network_forked.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'dart:io';
import 'package:image/image.dart' as img;



class WifiThroughrIpPrinter extends StatefulWidget {


  @override
  State<WifiThroughrIpPrinter> createState() => WifiThroughrIpPrinterState();
}

class WifiThroughrIpPrinterState extends State<WifiThroughrIpPrinter> {
  ScreenshotController screenshotController = ScreenshotController();
  String dir = Directory.current.path;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print(dir);
    // setState(() {
    //   Process.run('$dir/images/installerX64/install.exe', [' start '])
    //       .then((ProcessResult results) {
    //     print(results.stdout);
    //   });
    // });
  }
   void  testPrint(String printerIp, Uint8List theimageThatComesfr) async {
    print("im inside the test print 2");
    const PaperSize paper = PaperSize.mm80;
    final profile = await CapabilityProfile.load();
    final printer = NetworkPrinter(paper, profile);
    final PosPrintResult res = await printer.connect(printerIp, port: 9100);
    if (res == PosPrintResult.success) {
      await testReceipt(printer, theimageThatComesfr);
      print(res.msg);
      await Future.delayed(const Duration(seconds: 3), () {
        print("prinnter desconect");
        printer.disconnect();
      });
    }
  }
  Future<void> testReceipt(NetworkPrinter printer,  Uint8List theimageThatC) async {
    final img.Image? image = img.decodeImage(theimageThatC);
    printer.image(image! , align: PosAlign.center);
    printer.cut();
  }
  QrCodeTVL(context){
    BytesBuilder bytesBuilder =BytesBuilder();
    bytesBuilder.addByte(1);
    // List<int> getSetting=utf8.encode(SiteName.toString());
    List<int> getSetting=utf8.encode("test OMar Name");
    bytesBuilder.addByte(getSetting.length);
    bytesBuilder.add(getSetting);

    bytesBuilder.addByte(2);
    List<int> getvat_no=utf8.encode("vat_no");
    bytesBuilder.addByte(getvat_no.length);
    bytesBuilder.add(getvat_no);

    bytesBuilder.addByte(3);
    List<int> Datetaime=utf8.encode("datetaime");
    bytesBuilder.addByte(Datetaime.length);
    bytesBuilder.add(Datetaime);

    bytesBuilder.addByte(4);
    List<int> Total=utf8.encode(50.toStringAsFixed(2));
    bytesBuilder.addByte(Total.length);
    bytesBuilder.add(Total);

    bytesBuilder.addByte(5);
    List<int> getTax=utf8.encode(60.toStringAsFixed(2));
    bytesBuilder.addByte(getTax.length);
    bytesBuilder.add(getTax);
    Uint8List qrCodeAsBytes=bytesBuilder.toBytes();
    final Base64Encoder base64encoder=Base64Encoder();
    return base64encoder.convert(qrCodeAsBytes);
  }

  TextEditingController Printer = TextEditingController();
  String? passedPrinterIp;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: Printer,
                    decoration: const InputDecoration(hintText: "يرجي كتابة ip الطابعة"),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Screenshot(
                    controller: screenshotController,
                    child: Container(
                        width: 140,
                        child: QrImage(
                          data: QrCodeTVL(context),
                          version: QrVersions.auto,
                          size: 180.0,
                        ),
                    ),
                  ),
                  ElevatedButton(
                    child: const Text(
                      'print Here',
                      style: TextStyle(fontSize: 40),
                    ),
                    onPressed: () async{
                      final info = NetworkInfo();
                      String? ip = await info.getWifiIP();
                      Printer.text=ip!;
                      final String subnet = ip!.substring(0, ip.lastIndexOf('.'));
                      final int port = 9100;

                      final stream = NetworkAnalyzer.discover2(subnet, port);
                      stream.listen((NetworkAddress addr) {
                        if (addr.exists) {
                          print('Found device: ${addr.ip}');
                          // Printer.text=addr.ip;
                           passedPrinterIp=addr.ip;

                        }
                      });
                      screenshotController.capture(delay: const Duration(milliseconds: 10)).then((capturedImage) async {
                        Uint8List  theimageThatComesfromThePrinter = capturedImage!;
                        setState(() {
                          theimageThatComesfromThePrinter = capturedImage;
                          testPrint(passedPrinterIp!, theimageThatComesfromThePrinter);
                        });
                      }).catchError((onError) {
                        print(onError);
                      });
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ],
          )),
    );
  }
}