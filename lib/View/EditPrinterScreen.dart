import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Cubit/State.dart';
import 'package:omar/View/Data%20Table/model.dart';
import 'package:omar/View/Data%20Table/widget%20table.dart';
import 'package:omar/View/sewing%20invoice%20screen/pills_item_data.dart';
import 'package:omar/constant/constant.dart';
import 'dart:typed_data';
import 'dart:convert';

import 'package:qr_flutter/qr_flutter.dart';


class EditPrinterScreen extends StatefulWidget {
  const EditPrinterScreen({Key? key}) : super(key: key);

  @override
  EditPrinterScreenState createState() => EditPrinterScreenState();
}

class EditPrinterScreenState extends State<EditPrinterScreen> {
  final GlobalKey<State<StatefulWidget>> previewContainer = GlobalKey();

  // QrCodeTVL(context){
  //   BytesBuilder bytesBuilder =BytesBuilder();
  //   bytesBuilder.addByte(1);
  //   // List<int> getSetting=utf8.encode(SiteName.toString());
  //   List<int> getSetting=utf8.encode("test OMar Name");
  //   bytesBuilder.addByte(getSetting.length);
  //   bytesBuilder.add(getSetting);
  //
  //   bytesBuilder.addByte(2);
  //   List<int> getvat_no=utf8.encode("vat_no");
  //   bytesBuilder.addByte(getvat_no.length);
  //   bytesBuilder.add(getvat_no);
  //
  //   bytesBuilder.addByte(3);
  //   List<int> Datetaime=utf8.encode("datetaime");
  //   bytesBuilder.addByte(Datetaime.length);
  //   bytesBuilder.add(Datetaime);
  //
  //   bytesBuilder.addByte(4);
  //   List<int> Total=utf8.encode(500.toStringAsFixed(2));
  //   bytesBuilder.addByte(Total.length);
  //   bytesBuilder.add(Total);
  //
  //   bytesBuilder.addByte(5);
  //   List<int> getTax=utf8.encode(6000.toStringAsFixed(2));
  //   bytesBuilder.addByte(getTax.length);
  //   bytesBuilder.add(getTax);
  //
  //   Uint8List qrCodeAsBytes=bytesBuilder.toBytes();
  //   final Base64Encoder base64encoder=Base64Encoder();
  //   return base64encoder.convert(qrCodeAsBytes);
  // }


  // Future<void> _printScreen() async {
  //   final RenderRepaintBoundary boundary =
  //   previewContainer.currentContext!.findRenderObject() as RenderRepaintBoundary;
  //   final ui.Image im = await boundary.toImage();
  //   final ByteData? bytes =
  //   await im.toByteData(format: ui.ImageByteFormat.rawRgba);
  //   print('Print Screen ${im.width}x${im.height} ...');
  //
  //   Printing.layoutPdf(onLayout: (format) {
  //     final pdf.Document document = pdf.Document();
  //     final PdfImage image = PdfImage(document.document,
  //         image: bytes!.buffer.asUint8List(),
  //         width: im.width,
  //         height: im.height);
  //
  //     document.addPage(pdf.Page(
  //         pageFormat: format,
  //         build: (pdf.Context context) {
  //           return pdf.Center(
  //             child: pdf.Expanded(
  //               child: pdf.Image(image),
  //             ),
  //           ); // Center
  //         }));
  //     return document.save();
  //   },);
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return  RepaintBoundary(
            key: previewContainer,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // QrImage(
                //   data: QrCodeTVL(context),
                //   version: QrVersions.auto,
                //   size: 180.0,
                // ),
                // InkWell(
                //   onTap: () {
                //     _printScreen();
                //   },
                //   child: Text("Click me"),
                // )
            ],
            ),
          );

        },
      ),
    );
  }
}
