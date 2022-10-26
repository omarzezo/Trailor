import 'dart:convert';
import 'dart:io';

import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;

import 'package:flutter/material.dart';
import 'package:omar/SharedPreferencesHelper.dart';
import 'package:omar/View/BlutothPrinter.dart';
import 'package:omar/View/WifiThroughIpPrinter.dart';
import 'package:omar/View/choose_printer_screen.dart';
import 'package:omar/View/sonomiPrinter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sunmi_printer_plus/sunmi_printer_plus.dart';

class PrintPillScreen extends StatefulWidget {
  static const routeName="PrintPillScreen";
  int? printerType;
  int? pageSize;
   PrintPillScreen({this.pageSize,this.printerType});

  @override
  State<PrintPillScreen> createState() => _PrintPillScreenState();
}

class _PrintPillScreenState extends State<PrintPillScreen> {
  ScreenshotController screenshotController = ScreenshotController();
  String dir = Directory.current.path;
  WifiThroughrIpPrinter wifiThroughrIpPrinter=WifiThroughrIpPrinter();
  BluePrinter bluePrinter=BluePrinter();
  SonomiPrinter sonomiPrinter=SonomiPrinter();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
            child: Screenshot(
              controller: screenshotController,

              child: Padding(
                padding:
                const EdgeInsets.only(top: 70, left: 20, right: 20, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Divider(
                      height: 2,
                      thickness: 4,
                      color: Colors.black54,
                    ),
                    SizedBox(height: 10,),
                    Container(
                      height: 80,
                      width: 200,
                      child: Image.asset(

                        "image/splashScreen.png",fit: BoxFit.contain,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("فاتورة ضريبة مبسطة ")],
                    ),
                    Container(
                      color: Colors.grey[350],
                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("offline2 ")],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("مؤسسة وعد الوان")],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      height: 2,
                      thickness: 2,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("الهاتف"),
//
                            Padding(
                              padding: const EdgeInsets.only(left: 0,right: 5),
                              child: Text("0567218888"),
                            ),
//
                            Text("phone"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("الرقم الضريبى"),
                            Padding(
                              padding: const EdgeInsets.only(left: 30,right: 0),
                              child: Text("0567218888"),
                            ),
                            Text("Vat No"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("السجل التجارى"),
//
                            Padding(
                              padding: const EdgeInsets.only(left: 30,right: 0),
                              child: Text("057673637"),
                            ),

                            Text("CR No"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("التاريخ"),
//

                            Padding(
                              padding: const EdgeInsets.only(left: 5,right: 5),
                              child: Text("20-5-2022"),
                            ),
//
                            Text("Date"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("المرجع"),
//
                            Padding(
                              padding: const EdgeInsets.only(left: 0,right: 30),
                              child: Text("SALE_73_7320221015"),
                            ),
//
                            Text("Refernce"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("البائع"),
//
                            Padding(
                              padding: const EdgeInsets.only(left: 0,right: 20),
                              child: Text("cashier1"),
                            ),
//
                            Text("Seller"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("العميل"),
//
                            Padding(
                              padding: const EdgeInsets.only(left: 0,right: 40),
                              child: Text("default"),
                            ),

//
                            Text("Customer"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("الرقم الضريبى"),
//

                            Padding(
                              padding: const EdgeInsets.only(left: 15,right: 0),
                              child: Text("654564532132"),
                            ),
//
                            Text("Vat No"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      height: 2,
                      thickness: 2,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("رقم الفاتورة"),
//
                        Text("73"),
//
                        Text("Invoice No"),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    DataTable(
                        border: TableBorder(
                          borderRadius: BorderRadius.circular(10),
                          horizontalInside: BorderSide(color: Colors.black),
                          verticalInside: BorderSide(color: Colors.black),
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                        ),
                        columns: [
                          DataColumn(
                              label: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text("Total"),

                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("price"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Qty"),

                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("الاجمالى"),

                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("السعر"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("الكمية"),

                                    ],
                                  ),
                                ],
                              )),
                          DataColumn(
                              label: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Text("Description"),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text("وصف الفاتورة"),
                                    ],
                                  ),
                                ],
                              )),
                        ],
                        rows: [
                          DataRow(cells: [
                            DataCell(
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("500.0"),

                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("500.0"),
                                  SizedBox(
                                    width: 10,

                                  ),
                                  Text("1.00"),

                                ],
                              ),
                            ),
                            DataCell(
                              Row(
                                children: [
                                  Text("ثوب بقماش ابيض"),
                                ],
                              ),
                            ),
                          ]),
                          DataRow(cells: [
                            DataCell(
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("1000.0"),

                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("500.0"),
                                  SizedBox(
                                    width: 10,

                                  ),
                                  Text("2.00"),

                                ],
                              ),
                            ),
                            DataCell(
                              Row(
                                children: [
                                  Text("ثوب بقماش شتوى"),
                                ],
                              ),
                            ),
                          ]),
                        ]),
                    SizedBox(
                      height: 10,
                    ),

                    Divider(
                      height: 2,
                      thickness: 2,
                      color: Colors.black54,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("الاجمالى"),
                        Padding(
                          padding: const EdgeInsets.only(left: 0,right: 20),
                          child: Text("1500.0"),
                        ),

                        Text("Total"),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("الضريبة"),
                        Padding(
                          padding: const EdgeInsets.only(left: 0,right: 10),
                          child: Text("0.0"),
                        ),

                        Text("Vat"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("الخصم"),
                        Padding(
                          padding: const EdgeInsets.only(left: 0,right: 50),
                          child: Text("0.0"),
                        ),
                        Text("Discount"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("شحن"),
                        Padding(
                          padding: const EdgeInsets.only(left: 0,right: 55),
                          child: Text("0.0"),
                        ),

                        Text("Shipping"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("المبلغ المطلوب"),
                        Padding(
                          padding: const EdgeInsets.only(left: 0,right: 30),
                          child: Text("1500.0"),
                        ),

                        Text("Grand Total"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("المبلغ المدفوع"),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 0),
                          child: Text("1500.0"),
                        ),

                        Text("Paid"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("حالة الدفع"),
                        Padding(
                          padding: const EdgeInsets.only(left: 0,right:80),
                          child: Text("paid"),
                        ),

                        Text("Payment Status"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("نقدى"),
                        Padding(
                          padding: const EdgeInsets.only(left: 0,right:40),
                          child: Text("1500.0"),
                        ),
                        Text("Cash"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("اجل"),
                        Padding(
                          padding: const EdgeInsets.only(left: 0,right:50),
                          child: Text("0.0"),
                        ),

                        Text("Credit"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("المتبقى"),
                        Padding(
                          padding: const EdgeInsets.only(left: 0,right:35),
                          child: Text("0.0"),
                        ),
                        Text("Chang"),
                      ],
                    ),
                    Divider(
                      height: 2,
                      thickness: 2,
                      color: Colors.black54,
                    ),
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
                          if(widget.printerType==0){
                            BluePrinter.printScreenShot(theimageThatC: theimageThatComesfromThePrinter);
                          }else if(widget.printerType==1){
                            //  PaperSize papers;
                            // if(widget.pageSize==1) {
                            //   papers= PaperSize.mm80;
                            // } else if(widget.pageSize==2) {
                            //   papers = PaperSize.mm58;
                            // }

                          }else if(widget.printerType==2){

                            await SunmiPrinter.initPrinter();
                            await SunmiPrinter.startTransactionPrint(true);
                            await SunmiPrinter.printImage(theimageThatComesfromThePrinter);
                            await SunmiPrinter.lineWrap(2);
                            await SunmiPrinter.exitTransactionPrint(true);
                          }
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
