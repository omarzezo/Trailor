import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:omar/View/choose_printer_screen.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';

class PrintPillScreen extends StatefulWidget {
  static const routeName="PrintPillScreen";
  const PrintPillScreen({Key? key}) : super(key: key);

  @override
  State<PrintPillScreen> createState() => _PrintPillScreenState();
}

class _PrintPillScreenState extends State<PrintPillScreen> {
  ScreenshotController screenshotController = ScreenshotController();
  String dir = Directory.current.path;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(

        body: SingleChildScrollView(
            child: Screenshot(
              controller: screenshotController,

              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(

                  children: [
                    SizedBox(height: 170,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Text("الهاتف"),
                        SizedBox(width: 10,),
                        Text("0567218888"),
                        SizedBox(width: 10,),

                        Text("phone"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("الرقم الضريبى"),
                        SizedBox(width: 10,),

                        Text("0567218888"),
                        SizedBox(width: 10,),

                        Text("Vat No"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("السجل التجارى"),
                        SizedBox(width: 10,),

                        Text("057673637"),
                        SizedBox(width: 10,),

                        Text("CR No"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("التاريخ"),
                        SizedBox(width: 10,),

                        Text("20_5_2022"),
                        SizedBox(width: 10,),

                        Text("Date"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("المرجع"),
                        SizedBox(width: 10,),

                        Text("SALE_73_7320221015"),
                        SizedBox(width: 10,),

                        Text("Refernce"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("البائع"),
                        SizedBox(width: 10,),

                        Text("cashier1"),
                        SizedBox(width: 10,),

                        Text("Seller"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("العميل"),
                        SizedBox(width: 10,),

                        Text("default"),
                        SizedBox(width: 10,),

                        Text("Customer"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("الرقم الضريبى"),
                        SizedBox(width: 10,),

                        Text("654564532132"),
                        SizedBox(width: 10,),

                        Text("Vat No"),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("رقم الفاتورة"),
                        SizedBox(width: 10,),

                        Text("73"),
                        SizedBox(width: 10,),

                        Text("Invoice No"),
                      ],
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Description"),
                                SizedBox(width: 20,),
                                Text("Qty"),
                                SizedBox(width: 10,),

                                Text("price"),
                                SizedBox(width: 10,),

                                Text("Total"),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("وصف الفاتورة"),
                                SizedBox(width: 20,),

                                Text("الكمية"),
                                SizedBox(width: 10,),

                                Text("سعر"),
                                SizedBox(width: 10,),

                                Text("الاجمالى"),
                              ],
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("ثوب بقماش ابيض"),
                                SizedBox(width: 20,),

                                Text("1.00"),
                                SizedBox(width: 10,),

                                Text("500.0"),
                                SizedBox(width: 10,),

                                Text("500.0"),
                              ],
                            ),
                            Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("ثوب بقماش اسود"),
                                SizedBox(width: 20,),

                                Text("2.00"),
                                SizedBox(width: 10,),

                                Text("500.0"),
                                SizedBox(width: 10,),

                                Text("1000.0"),
                              ],
                            ),
                            Divider(),


                          ],
                        ),
                      ],),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("الاجمال"),
                        SizedBox(width: 10,),

                        Text("1500"),
                        SizedBox(width: 10,),

                        Text("Total"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("الضريبة"),
                        SizedBox(width: 10,),

                        Text("0.0"),
                        SizedBox(width: 10,),

                        Text("Vat"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("الخصم"),
                        SizedBox(width: 10,),

                        Text("0.0"),
                        SizedBox(width: 10,),

                        Text("Discount"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("شحن"),
                        SizedBox(width: 10,),

                        Text("0.0"),
                        SizedBox(width: 10,),

                        Text("Shipping"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("المبلغ المطلوب"),
                        SizedBox(width: 10,),

                        Text("1500"),
                        SizedBox(width: 10,),

                        Text("Grand Total"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("المبلغ المدفوع"),
                        SizedBox(width: 10,),

                        Text("1500"),
                        SizedBox(width: 10,),

                        Text("Paid"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("حالة الدفع"),
                        SizedBox(width: 10,),

                        Text("Paid"),
                        SizedBox(width: 10,),

                        Text("Payment Status"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("نقدى"),
                        SizedBox(width: 10,),

                        Text("1500.0"),
                        SizedBox(width: 10,),

                        Text("Cash"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("اجل"),
                        SizedBox(width: 10,),

                        Text("0.0"),
                        SizedBox(width: 10,),

                        Text("Credit"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("المتبقى"),
                        SizedBox(width: 10,),

                        Text("0.0"),
                        SizedBox(width: 10,),

                        Text("Chang"),
                      ],
                    ),
Divider(),
                    Container(
                      width: 140,
                      child: QrImage(
                        data: QrCodeTVL(context),
                        version: QrVersions.auto,
                        size: 180.0,
                      ),
                    ),
                    ElevatedButton(
                      child: const Text(
                        'print Here',
                        style: TextStyle(fontSize: 40),
                      ),
                      onPressed: () {
                        screenshotController.capture(delay: const Duration(milliseconds: 10)).then((capturedImage) async {
                          Uint8List  theimageThatComesfromThePrinter = capturedImage!;
                          Navigator.of(context).pushNamed(ChoosePrinterScreen.routeName,arguments: ChoosePrinterScreen(screenshotController: theimageThatComesfromThePrinter,));

                          setState(() {
                            theimageThatComesfromThePrinter = capturedImage;
                          });
                        }).catchError((onError) {
                          print(onError);
                        });
                      },
                    ),



                  ],
                ),
              ),
            )),
      ),
    );
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

}
