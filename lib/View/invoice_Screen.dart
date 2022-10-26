import 'dart:convert';
import 'dart:io';

import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

import '../constant/constant.dart';

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
  // BluePrinter bluePrinter=BluePrinter();
  SonomiPrinter sonomiPrinter=SonomiPrinter();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text("الطابعة", style: GoogleFonts.notoKufiArabic(
          color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16)),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Screenshot(
              controller: screenshotController,

              child: Padding(
                padding:
                 EdgeInsets.only(top: 20, left: MediaQuery.of(context).size.width/3.5, right: MediaQuery.of(context).size.width/3.5,
                     bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: 200,
                      child: Image.asset(

                        "image/splashScreen.png",fit: BoxFit.contain,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("فاتورة ضريبة مبسطة ", style: getStyle(color: Colors.black, fontSize: 16)
              )],
                    ),
                    Container(
                      color: Colors.grey[350],
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text("offline2 ", style: getStyle(color: Colors.black, fontSize: 16))],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("مؤسسة وعد الوان", style: getStyle(color: Colors.black, fontSize: 16))],
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
                            Text("الهاتف", style: getStyle(color: Colors.black, fontSize: 16),),
//
                            Padding(
                              padding: const EdgeInsets.only(left: 0,right: 5),
                              child: Text("0567218888", style: getStyle(color: Colors.black, fontSize: 16),),
                            ),
//
                            Text("phone", style: getStyle(color: Colors.black, fontSize: 16)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("الرقم الضريبى", style: getStyle(color: Colors.black, fontSize: 16),),
                            Padding(
                              padding: const EdgeInsets.only(left: 30,right: 0),
                              child: Text("0567218888", style: getStyle(color: Colors.black, fontSize: 16),),
                            ),
                            Text("Vat No", style: getStyle(color: Colors.black, fontSize: 16),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("السجل التجارى", style: getStyle(color: Colors.black, fontSize: 16),),
//
                            Padding(
                              padding: const EdgeInsets.only(left: 30,right: 0),
                              child: Text("057673637", style: getStyle(color: Colors.black, fontSize: 16),),
                            ),

                            Text("CR No", style: getStyle(color: Colors.black, fontSize: 16),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("التاريخ", style: getStyle(color: Colors.black, fontSize: 16),),
//

                            Padding(
                              padding: const EdgeInsets.only(left: 5,right: 5),
                              child: Text("20-5-2022", style: getStyle(color: Colors.black, fontSize: 16),),
                            ),
//
                            Text("Date", style: getStyle(color: Colors.black, fontSize: 16),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("المرجع", style: getStyle(color: Colors.black, fontSize: 16),),
//
                            Padding(
                              padding: const EdgeInsets.only(left: 0,right: 30),
                              child: Text("SALE_73_7320221015", style: getStyle(color: Colors.black, fontSize: 16),),
                            ),
//
                            Text("Refernce", style: getStyle(color: Colors.black, fontSize: 16),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("البائع", style: getStyle(color: Colors.black, fontSize: 16),),
//
                            Padding(
                              padding: const EdgeInsets.only(left: 0,right: 20),
                              child: Text("cashier1", style: getStyle(color: Colors.black, fontSize: 16),),
                            ),
//
                            Text("Seller", style: getStyle(color: Colors.black, fontSize: 16),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("العميل", style: getStyle(color: Colors.black, fontSize: 16),),
//
                            Padding(
                              padding: const EdgeInsets.only(left: 0,right: 40),
                              child: Text("default", style: getStyle(color: Colors.black, fontSize: 16),),
                            ),

//
                            Text("Customer", style: getStyle(color: Colors.black, fontSize: 16),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("الرقم الضريبى", style: getStyle(color: Colors.black, fontSize: 16),),
//

                            Padding(
                              padding: const EdgeInsets.only(left: 15,right: 0),
                              child: Text("654564532132", style: getStyle(color: Colors.black, fontSize: 16),),
                            ),
//
                            Text("Vat No", style: getStyle(color: Colors.black, fontSize: 16),),
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
                        Text("رقم الفاتورة", style: getStyle(color: Colors.black, fontSize: 16),),
//
                        Text("73", style: getStyle(color: Colors.black, fontSize: 16),),
//
                        Text("Invoice No", style: getStyle(color: Colors.black, fontSize: 16),),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Container(
                      width: double.infinity,

                      child: DataTable(

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
                                        Text("Total", style: getStyle(color: Colors.black, fontSize: 16),),

                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("price", style: getStyle(color: Colors.black, fontSize: 16),),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("Qty", style: getStyle(color: Colors.black, fontSize: 16),),

                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("الاجمالى", style: getStyle(color: Colors.black, fontSize: 16),),

                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("السعر", style: getStyle(color: Colors.black, fontSize: 16),),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text("الكمية", style: getStyle(color: Colors.black, fontSize: 16),),

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
                                        Text("Description", style: getStyle(color: Colors.black, fontSize: 16),),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("وصف الفاتورة", style: getStyle(color: Colors.black, fontSize: 16),),
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
                                    Text("500.0", style: getStyle(color: Colors.black, fontSize: 16),),

                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text("500.0", style: getStyle(color: Colors.black, fontSize: 16),),
                                    SizedBox(
                                      width: 20,

                                    ),
                                    Text("1.00", style: getStyle(color: Colors.black, fontSize: 16),),

                                  ],
                                ),
                              ),
                              DataCell(
                                Row(
                                  children: [
                                    Text("ثوب بقماش ابيض", style: getStyle(color: Colors.black, fontSize: 16),),
                                  ],
                                ),
                              ),
                            ]),
                            DataRow(cells: [
                              DataCell(
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("1000.0", style: getStyle(color: Colors.black, fontSize: 16),),

                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text("500.0", style: getStyle(color: Colors.black, fontSize: 16),),
                                    SizedBox(
                                      width: 20,

                                    ),
                                    Text("2.00", style: getStyle(color: Colors.black, fontSize: 16),),

                                  ],
                                ),
                              ),
                              DataCell(
                                Row(
                                  children: [
                                    Text("ثوب بقماش شتوى", style: getStyle(color: Colors.black, fontSize: 16),),
                                  ],
                                ),
                              ),
                            ]),
                          ]),
                    ),
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
                        Text("الاجمالى", style: getStyle(color: Colors.black, fontSize: 16),),
                        Padding(
                          padding: const EdgeInsets.only(left: 0,right: 20),
                          child: Text("1500.0", style: getStyle(color: Colors.black, fontSize: 16),),
                        ),

                        Text("Total", style: getStyle(color: Colors.black, fontSize: 16),),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("الضريبة", style: getStyle(color: Colors.black, fontSize: 16),),
                        Padding(
                          padding: const EdgeInsets.only(left: 0,right: 10),
                          child: Text("0.0", style: getStyle(color: Colors.black, fontSize: 16),),
                        ),

                        Text("Vat", style: getStyle(color: Colors.black, fontSize: 16),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("الخصم", style: getStyle(color: Colors.black, fontSize: 16),),
                        Padding(
                          padding: const EdgeInsets.only(left: 0,right: 50),
                          child: Text("0.0", style: getStyle(color: Colors.black, fontSize: 16),),
                        ),
                        Text("Discount", style: getStyle(color: Colors.black, fontSize: 16),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("شحن", style: getStyle(color: Colors.black, fontSize: 16),),
                        Padding(
                          padding: const EdgeInsets.only(left: 0,right: 55),
                          child: Text("0.0", style: getStyle(color: Colors.black, fontSize: 16),),
                        ),

                        Text("Shipping", style: getStyle(color: Colors.black, fontSize: 16),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("المبلغ المطلوب", style: getStyle(color: Colors.black, fontSize: 16),),
                        Padding(
                          padding: const EdgeInsets.only(left: 0,right: 30),
                          child: Text("1500.0", style: getStyle(color: Colors.black, fontSize: 16),),
                        ),

                        Text("Grand Total", style: getStyle(color: Colors.black, fontSize: 16),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("المبلغ المدفوع", style: getStyle(color: Colors.black, fontSize: 16),),
                        Padding(
                          padding: const EdgeInsets.only(left: 10,right: 0),
                          child: Text("1500.0", style: getStyle(color: Colors.black, fontSize: 16),),
                        ),

                        Text("Paid", style: getStyle(color: Colors.black, fontSize: 16),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("حالة الدفع", style: getStyle(color: Colors.black, fontSize: 16),),
                        Padding(
                          padding: const EdgeInsets.only(left: 0,right:80),
                          child: Text("paid", style: getStyle(color: Colors.black, fontSize: 16),),
                        ),

                        Text("Payment Status", style: getStyle(color: Colors.black, fontSize: 16),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("نقدى", style: getStyle(color: Colors.black, fontSize: 16),),
                        Padding(
                          padding: const EdgeInsets.only(left: 0,right:40),
                          child: Text("1500.0", style: getStyle(color: Colors.black, fontSize: 16),),
                        ),
                        Text("Cash", style: getStyle(color: Colors.black, fontSize: 16),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("اجل", style: getStyle(color: Colors.black, fontSize: 16),),
                        Padding(
                          padding: const EdgeInsets.only(left: 0,right:50),
                          child: Text("0.0", style: getStyle(color: Colors.black, fontSize: 16),),
                        ),

                        Text("Credit", style: getStyle(color: Colors.black, fontSize: 16),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("المتبقى", style: getStyle(color: Colors.black, fontSize: 16),),
                        Padding(
                          padding: const EdgeInsets.only(left: 0,right:35),
                          child: Text("0.0", style: getStyle(color: Colors.black, fontSize: 16),),
                        ),
                        Text("Chang", style: getStyle(color: Colors.black, fontSize: 16),),
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
                      child: Text("طباعة",
                          style: getStyle(color: Colors.white, fontSize: 16)
                      ),
                      onPressed: () async{
                        await screenshotController.capture(delay: const Duration(milliseconds: 10)).then((capturedImage) async {
                          Uint8List  theimageThatComesfromThePrinter = capturedImage!;
                          if( widget.printerType==0){

                            Navigator.of(context).pushNamed(BluePrinter.routeName);

                            // Navigator.of(context).push(createRoute(BluePrinter(theimageThatC: theimageThatComesfromThePrinter)));

                            BluePrinter(theimageThatC: theimageThatComesfromThePrinter);
                          }else if(await SharedPreferencesHelper.getPrinterType()==1){
                            Navigator.of(context).pushNamed(WifiThroughrIpPrinter.routeName);


                          }else if(await SharedPreferencesHelper.getPrinterType()==2){
                            await SunmiPrinter.initPrinter();
                            await SunmiPrinter.startTransactionPrint(true);
                            await SunmiPrinter.printImage(theimageThatComesfromThePrinter);
                            // await SunmiPrinter.lineWrap(2);
                            // await SunmiPrinter.exitTransactionPrint(true);
                          }
                          // Navigator.of(context).pushNamed(ChoosePrinterScreen.routeName,arguments: ChoosePrinterScreen(screenshotController: theimageThatComesfromThePrinter,));

                          // setState(() {
                          //   theimageThatComesfromThePrinter = capturedImage;
                          // });
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
