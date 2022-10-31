
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:omar/SharedPreferencesHelper.dart';


class BluePrinter extends StatefulWidget {
  Uint8List? theimageThatC;

  static const routeName="BluePrinter";
   BluePrinter({Key? key, this.theimageThatC}) : super(key: key);





  @override
  State<BluePrinter> createState() => _BluePrinterState();
}

class _BluePrinterState extends State<BluePrinter> {
  List<BluetoothDevice> devices=[];

   Future<void >printScreenShot({ required Uint8List theimageThatC})async{

    BluetoothPrint bluetoothPrint=BluetoothPrint.instance;

    Map<String,dynamic> config=Map();
    List<LineText> list=[];
    List<int> imageBytes = theimageThatC.buffer.asUint8List(theimageThatC.offsetInBytes, theimageThatC.lengthInBytes);
    String base64Image = base64Encode(imageBytes);
    list.add(LineText(type: LineText.TYPE_IMAGE, content: base64Image, align: LineText.ALIGN_CENTER, linefeed: 1));
    await bluetoothPrint.printReceipt(config, list);

  }

  BluetoothPrint bluetoothPrint=BluetoothPrint.instance;
  String deviceMsg="";
  final f=NumberFormat("\$###,###.00","en_us");
  @override
  void initState() {
    super.initState();


    initPrinter().then((value) {
      print("heeeeeeeeee");
      printScreenShot(theimageThatC: widget.theimageThatC!);
    });
  }
  Future<void> initPrinter()async{
  await  bluetoothPrint.startScan(timeout: Duration(seconds: 10));
    if(!mounted) return;
    bluetoothPrint.scanResults.listen((value) {
      if(!mounted) return;
      setState(() {
        devices=value;
      });
      if( devices.isEmpty)
        setState(() {
          deviceMsg="No devices";
        });
    });

  }


  //  Future<void>printScreenShot( Uint8List theimageThatC)async{
  //   await bluetoothPrint.startScan(timeout: Duration(seconds: 2));
  //     if(!mounted) return;
  //     bluetoothPrint.scanResults.listen((value) {
  //       if(!mounted) return;
  //       setState(() {
  //         devices=value;
  //       });
  //       if( devices.isEmpty)
  //         setState(() {
  //           deviceMsg="No devices";
  //         });
  //     });
  //
  //
  //
  //   Map<String,dynamic> config=Map();
  //   List<LineText> list=[];
  //   List<int> imageBytes = theimageThatC.buffer.asUint8List(theimageThatC.offsetInBytes, theimageThatC.lengthInBytes);
  //   String base64Image = base64Encode(imageBytes);
  //   list.add(LineText(type: LineText.TYPE_IMAGE, content: base64Image, align: LineText.ALIGN_CENTER, linefeed: 1));
  //   await bluetoothPrint.printReceipt(config, list);
  // }
  Future<void> testReceipt(BluetoothPrint printer,  Uint8List theimageThatC) async {
    Map<String,dynamic> config=Map();
    List<LineText> list=[];
    list.add(
        LineText(
        type: LineText.TYPE_TEXT,
        content: "el tarzy",
        width: 2,
        weight: 2,
        height: 2,
        align: LineText.ALIGN_CENTER,linefeed: 1
    ));
    ///to do loop for data that will be printed
    for(var i=0;i<10;i++){
      list.add(LineText(type: LineText.TYPE_TEXT,content: "the title of the data that will be print",weight: 0,align: LineText.ALIGN_LEFT,linefeed: 1));
      list.add(LineText(type: LineText.TYPE_TEXT,content: "the content of the data that will be print with the format",weight: 0,align: LineText.ALIGN_LEFT,linefeed: 1));
    }
    // ByteData data = await rootBundle.load(theimageThatC.buffer.toString());
    List<int> imageBytes = theimageThatC.buffer.asUint8List(theimageThatC.offsetInBytes, theimageThatC.lengthInBytes);
    String base64Image = base64Encode(imageBytes);
    list.add(LineText(type: LineText.TYPE_IMAGE, content: base64Image, align: LineText.ALIGN_CENTER, linefeed: 1));
    await printer.printReceipt(config, list);
    // await bluetoothPrint.printReceipt(config, list);
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("طابعة بلوتوث",style:getStyle(color: Colors.white,fontSize: 18)),),
        body:  devices.isEmpty?Center(child: Text(deviceMsg??""),):ListView.builder(
          itemCount:  devices.length,
          itemBuilder:(context, index) {
            return ListTile(
              leading: const Icon(Icons.print),
              title: Text( devices[index].name!),
              subtitle: Text( devices[index].address!),
              onTap: (){},
            );
          }, )
    );
  }


  Future<void> startPrint(BluetoothDevice? device)async{
    if(device!=null&&device.address!=null){
      await bluetoothPrint.connect(device);
      Map<String,dynamic> config=Map();
      List<LineText> list=[];
      list.add(LineText(
          type: LineText.TYPE_QRCODE,
          content: "el tarzy",
          width: 2,
          weight: 2,
          height: 2,
          align: LineText.ALIGN_CENTER,linefeed: 1
      ));
      ///to do loop for data that will be printed
      for(var i=0;i<10;i++){
        list.add(LineText(type: LineText.TYPE_TEXT,content: "the title of the data that will be print",weight: 0,align: LineText.ALIGN_LEFT,linefeed: 1));
        list.add(LineText(type: LineText.TYPE_TEXT,content: "the content of the data that will be print with the format",weight: 0,align: LineText.ALIGN_LEFT,linefeed: 1));
      }
    }
  }
}
