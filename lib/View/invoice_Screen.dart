import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:easy_localization/easy_localization.dart';
import 'package:esc_pos_printer/esc_pos_printer.dart' as eco;
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bluetooth_basic/flutter_bluetooth_basic.dart';
import 'package:flutter_esc_pos_network/flutter_esc_pos_network.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image/image.dart' as img;
import 'package:image/image.dart';
import 'package:maxx_sunmi_printer/maxx_sunmi_printer.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Cubit/State.dart';
import 'package:omar/SharedPreferencesHelper.dart';
import 'package:omar/View/sonomiPrinter.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import '../constant/LoadingPage.dart';
import '../constant/appstrings.dart';
import '../constant/constant.dart';
import '../models/invoiceModel.dart';
import 'package:flutter/services.dart' as p;

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
  // BluePrinter bluePrinter=BluePrinter();
  SonomiPrinter sonomiPrinter=SonomiPrinter();

  String vatNo="0567218888";
  // double vatNo=LoginCubit.get(context).allInvoices[ LoginCubit.get(context).allInvoices.length-1].items[0].;
  // double vatNo=LoginCubit.get(context).allInvoices[ cubit.allInvoices.length-1].items[0]!;
  double textSize=14;
  double width=400;
  BluetoothManager bluetoothManager = BluetoothManager.instance;
  var MacJeson;
  String ipPrinter="";
  // SharedPreferences? prefs;
  @override
  void initState() {
   onStartScreen();

   super.initState();
  }

  onStartScreen()async{
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      width=MediaQuery.of(context).size.width*0.60;
    });
    // prefs = await SharedPreferences.getInstance();

    MacJeson=await SharedPreferencesHelper.getMacAddress();
    ipPrinter=(await SharedPreferencesHelper.getIpPrinter())!;
    print("ipPrinter>>"+ipPrinter.toString());
    print("MacJeson>>"+MacJeson.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    var cubit=LoginCubit.get(context);
    cubit.companiesCustomerName.forEach((element) {if(element.company== cubit.invoiceModel!.invoiceData![0].customer){
      vatNo=element.vatNo!;
    }});
    Size size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: p.TextDirection.rtl,
      child: BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    
  },
  builder: (context, state) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text(AppStrings.printer.tr(), style: GoogleFonts.notoKufiArabic(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)), centerTitle: true,),
        body: (cubit.invoiceModel!=null)?  Center(
          child: SingleChildScrollView(

               child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20,),
                  Screenshot(
                    controller: screenshotController,
                    child:getContent(size, context, cubit.invoiceModel!)


//                     Container(
//                       margin: EdgeInsets.only(left: 20,right: 20),
//                       width: width,
//                       color: Colors.white,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text("مركز الابداع للخياطة", style: getStyle(color: MyConstant().purpleColor, fontSize: textSize)
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [Text("فاتورة ضريبة مبسطة ", style: getStyle(color: Colors.black, fontSize: textSize)
//                             )],
//                           ),
//                           const SizedBox(height: 20,),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [Text("مؤسسة وعد الوان", style: getStyle(color: Colors.black, fontSize: textSize))],
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Divider(
//                             height: 2,
//                             thickness: 2,
//                             color: Colors.black54,
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("الهاتف", style: getStyle(color: Colors.black, fontSize: textSize),),
// //
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 0,right: 5),
//                                     child: Text("0567218888", style: getStyle(color: Colors.black, fontSize: textSize),),
//                                   ),
// //
//                                   Text("phone", style: getStyle(color: Colors.black, fontSize: textSize)),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("الرقم الضريبى", style: getStyle(color: Colors.black, fontSize: textSize),),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 30,right: 0),
//                                     child: Text("0567218888", style: getStyle(color: Colors.black, fontSize: textSize),),
//                                   ),
//                                   Text("Vat No", style: getStyle(color: Colors.black, fontSize: textSize),),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("السجل التجارى", style: getStyle(color: Colors.black, fontSize: textSize),),
// //
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 30,right: 0),
//                                     child: Text("057673637", style: getStyle(color: Colors.black, fontSize: textSize),),
//                                   ),
//
//                                   Text("CR No", style: getStyle(color: Colors.black, fontSize: textSize),),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("التاريخ", style: getStyle(color: Colors.black, fontSize: textSize),),
// //
//
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 5,right: 5),
//                                     // child: Text(cubit.invoiceModel!.invoiceData![0].date??"".split(" ")
//
//                                     child: Text(cubit.invoiceModel!.invoiceData![0].date!.split(" ")
//                                         .first , style: getStyle(color: Colors.black, fontSize: textSize),),
//                                   ),
// //
//                                   Text("Date", style: getStyle(color: Colors.black, fontSize: textSize),),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("المرجع", style: getStyle(color: Colors.black, fontSize: textSize),),
// //
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 0,right: 30),
//                                     child: Text(cubit.invoiceModel!.invoiceData![0].referenceNo!??"", style: getStyle(color: Colors.black, fontSize: textSize),),
//                                   ),
// //
//                                   Text("Refernce", style: getStyle(color: Colors.black, fontSize: textSize),),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("البائع", style: getStyle(color: Colors.black, fontSize: textSize),),
// //
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 0,right: 20),
//                                     child: Text("cashier1", style: getStyle(color: Colors.black, fontSize: textSize),),
//                                   ),
// //
//                                   Text("Seller", style: getStyle(color: Colors.black, fontSize: textSize),),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("العميل", style: getStyle(color: Colors.black, fontSize: textSize),),
// //
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 0,right: 40),
//                                     child: Text(cubit.invoiceModel!.invoiceData![0].customer!??"", style: getStyle(color: Colors.black, fontSize: textSize),),
//                                   ),
//
// //
//                                   Text("Customer", style: getStyle(color: Colors.black, fontSize: textSize),),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("الرقم الضريبى", style: getStyle(color: Colors.black, fontSize: textSize),),
// //
//
//                                   Padding(
//                                     padding: const EdgeInsets.only(left: 15,right: 0),
//                                     child: Text("654564532132", style: getStyle(color: Colors.black, fontSize: textSize),),
//                                   ),
// //
//                                   Text("Vat No", style: getStyle(color: Colors.black, fontSize: textSize),),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Divider(
//                             height: 2,
//                             thickness: 2,
//                             color: Colors.black54,
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("رقم الفاتورة", style: getStyle(color: Colors.black, fontSize: textSize),),
// //
//                               Text(cubit.invoiceModel!.invoiceData![0].items![0].saleId!??"", style: getStyle(color: Colors.black, fontSize: textSize),),
// //
//                               Text("Invoice No", style: getStyle(color: Colors.black, fontSize: textSize),),
//                             ],
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//
//
//                           Container(
//                             // width: width,
//                             margin: const EdgeInsets.all(5),
//                             padding: const EdgeInsets.all(5),
//                             child: DataTable(
//                               horizontalMargin: 0,
//                               dividerThickness: 1,
//                               border: TableBorder(
//                                 borderRadius: BorderRadius.circular(10),
//                                 horizontalInside: BorderSide(color: Colors.black),
//                                 verticalInside: BorderSide(color: Colors.black),
//                                 bottom: BorderSide(color: Colors.black),
//                                 top: BorderSide(color: Colors.black),
//                                 left: BorderSide(color: Colors.black),
//                                 right: BorderSide(color: Colors.black),
//                               ),
//                               columns: [
//                                 DataColumn(
//
//                                     label:Row(
//                                       mainAxisAlignment: MainAxisAlignment.center,
//                                       crossAxisAlignment: CrossAxisAlignment.center,
//                                       children: [
//                                         Padding(
//                                           padding: const EdgeInsets.only(right: 8),
//                                           child: Text("الاجمالى"+"\n"+"Total", style: getStyle(color: Colors.black,
//                                               fontSize: textSize),),
//                                         ),
//
//                                         Padding(
//                                           padding: const EdgeInsets.only(right: 8),
//                                           child:
//                                           Text("السعر"+"\n"+"price", style: getStyle(color: Colors.black,
//                                               fontSize: textSize),),
//                                         ),
//
//                                         Padding(
//                                           padding: const EdgeInsets.only(right: 8),
//                                           child: Text("الكمية"+"\n"+"Qty", style: getStyle(color: Colors.black,
//                                               fontSize: textSize),),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.only(right: 8),
//                                           child: Text("Desc"+"\n"+"النوع", style: getStyle(color: Colors.black,
//                                               fontSize: textSize),),
//                                         ),
//
//
//                                       ],
//                                     ),
//                                 ),
//
//                               ],
//                               rows:
//                               List.generate(
//                                   cubit.invoiceModel!.invoiceData![0].items!.length,
//                                       (index) => DataRow(cells: [
//                                 DataCell(
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.only(right: 0),
//                                         child: Text(double.parse(cubit.invoiceModel!.invoiceData![0].items![index].subtotal!).toStringAsFixed(2), style: getStyle(color: Colors.black, fontSize: textSize),),
//                                       ),
//
//
//                                       Padding(
//                                         padding: const EdgeInsets.only(right: 8),
//                                         child: Text(double.parse(cubit.invoiceModel!.invoiceData![0].items![index].realUnitPrice!).toStringAsFixed(2), style: getStyle(color: Colors.black, fontSize: textSize),),
//                                       ),
//
//                                       Padding(
//                                         padding: const EdgeInsets.only(right: 8),
//                                         child: Text(double.parse(cubit.invoiceModel!.invoiceData![0].items![index].quantity!).toStringAsFixed(2), style: getStyle(color: Colors.black, fontSize: textSize),),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.only(right: 8),
//                                         child: Text(cubit.invoiceModel!.invoiceData![0].items![index].productName!,
//                                           style: getStyle(color: Colors.black, fontSize: textSize),),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//
//                               ]))
//                               ,
//                             ),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//
//                           Divider(
//                             height: 2,
//                             thickness: 2,
//                             color: Colors.black54,
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("الاجمالى", style: getStyle(color: Colors.black, fontSize: textSize),),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 0,right: 0),
//                                 child: Text("1500.0", style: getStyle(color: Colors.black, fontSize: textSize),),
//                               ),
//                               Text("Total", style: getStyle(color: Colors.black, fontSize: textSize),),
//                             ],
//                           ),
//
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("الضريبة", style: getStyle(color: Colors.black, fontSize: textSize),),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 0,right: 0),
//                                 child: Text(cubit.invoiceModel!.invoiceData![0].items![0].tax!, style: getStyle(color: Colors.black, fontSize: textSize),),
//                               ),
//
//                               Text("Vat", style: getStyle(color: Colors.black, fontSize: textSize),),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("الخصم", style: getStyle(color: Colors.black, fontSize: textSize),),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 0,right: 0),
//                                 child: Text(cubit.invoiceModel!.invoiceData![0].items![0].discount??"0.0", style: getStyle(color: Colors.black, fontSize: textSize),),
//                               ),
//                               Text("Discount", style: getStyle(color: Colors.black, fontSize: textSize),),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("شحن", style: getStyle(color: Colors.black, fontSize: textSize),),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 0,right: 0),
//                                 child: Text("0.0", style: getStyle(color: Colors.black, fontSize: textSize),),
//                               ),
//
//                               Text("Shipping", style: getStyle(color: Colors.black, fontSize: textSize),),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("المبلغ المطلوب", style: getStyle(color: Colors.black, fontSize: textSize),),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 0,right: 0),
//                                 child: Text("1500.0", style: getStyle(color: Colors.black, fontSize: textSize),),
//                               ),
//
//                               Text("Grand Total", style: getStyle(color: Colors.black, fontSize: textSize),),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("المبلغ المدفوع", style: getStyle(color: Colors.black, fontSize: textSize),),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 0,right: 0),
//                                 child: Text("1500.0", style: getStyle(color: Colors.black, fontSize: textSize),),
//                               ),
//
//                               Text("Paid", style: getStyle(color: Colors.black, fontSize: textSize),),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("حالة الدفع", style: getStyle(color: Colors.black, fontSize: textSize),),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 0,right:0),
//                                 child: Text(cubit.invoiceModel!.invoiceData![0].saleStatus!, style: getStyle(color: Colors.black, fontSize: textSize),),
//                               ),
//
//                               Text("Payment Status", style: getStyle(color: Colors.black, fontSize: textSize),),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("نقدى", style: getStyle(color: Colors.black, fontSize: textSize),),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 0,right:0),
//                                 child: Text("1500.0", style: getStyle(color: Colors.black, fontSize: textSize),),
//                               ),
//                               Text("Cash", style: getStyle(color: Colors.black, fontSize: textSize),),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("اجل", style: getStyle(color: Colors.black, fontSize: textSize),),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 0,right:0),
//                                 child: Text("0.0", style: getStyle(color: Colors.black, fontSize: textSize),),
//                               ),
//
//                               Text("Credit", style: getStyle(color: Colors.black, fontSize: textSize),),
//                             ],
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text("المتبقى", style: getStyle(color: Colors.black, fontSize: textSize),),
//                               Padding(
//                                 padding: const EdgeInsets.only(left: 0,right:0),
//                                 child: Text("0.0", style: getStyle(color: Colors.black, fontSize: textSize),),
//                               ),
//                               Text("Chang", style: getStyle(color: Colors.black, fontSize: textSize),),
//                             ],
//                           ),
//                           Divider(
//                             height: 2,
//                             thickness: 2,
//                             color: Colors.black54,
//                           ),
//                           Container(
//                             width: 140,
//                             child: QrImage(
//                               data: QrCodeTVL(context),
//                               version: QrVersions.auto,
//                               size: 180.0,
//                             ),
//                           ),
//
//                         ],
//                       )
//                     ),
                  ),
                  ElevatedButton(
                    child: Text(AppStrings.print.tr(),
                        style: getStyle(color: Colors.white, fontSize: 16)
                    ),
                    onPressed: () async{
                      LoadingPage(context).show();
                      widget.printerType=await SharedPreferencesHelper.getPrinterType();
                      int printerSize  =(await SharedPreferencesHelper.getPageSize())!;
                      if(widget.printerType==3){
                        textSize=10;
                        width=190;
                      }else{
                        textSize=20;
                        width=420;
                      }
                      setState(() {});
                      await screenshotController.capture(delay: const Duration(milliseconds: 10)).then((capturedImage) async {
                        if( widget.printerType==1){
                          LoadingPage(context).close();
                          if(printerSize==80){
                            printBluetooth80(capturedImage!);
                          }else{
                            printBluetooth58(capturedImage!);
                          }
                        }else if(widget.printerType==2){
                          LoadingPage(context).close();
                          if(printerSize==80){
                            PrinterWiFi80(ipPrinter,capturedImage!);
                          }else{
                            PrinterWiFi58(ipPrinter,capturedImage!);
                          }
                        }else if(widget.printerType==3){
                          LoadingPage(context).close();
                          await SanmiPrint(capturedImage!);
                          print("sonomi");
                        }else if(widget.printerType==4){
                          print("hhhhhhhhhhhhhhhhhhhh");
                          LoadingPage(context).close();
                          if(printerSize==80){
                            testPrint(80,ipPrinter,capturedImage!);
                          }else{
                            testPrint(58,ipPrinter,capturedImage!);
                          }
                        }

                      }).catchError((onError) {
                        print(onError);
                      });
                    },
                  ),
                ],
              )),
        ):(cubit.whatYouPay.text.isNotEmpty)?Center(
          child: SingleChildScrollView(

              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 20,),
                  Screenshot(
                      controller: screenshotController,
                      // child:getContent(size, context, cubit.invoiceModel!)
                      child:Container(
                          width: width,
                          color: Colors.white,
                          child: Directionality(
                              textDirection: p.TextDirection.ltr,
                              child:Column(
                                children: [

                                  Container(
                                      alignment: Alignment.center,
                                      width: double.infinity,
                                      child:Column(
                                          children: [

                                            Text(AppStrings.Tailoringinnovationcenter.tr(), style: getStyle(color: MyConstant().purpleColor, fontSize: textSize)
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [Text(AppStrings.Simplifiedtaxinvoice.tr(), style: getStyle(color: Colors.black, fontSize: textSize)
                                              )],
                                            ),
                                            const SizedBox(height: 10,),

                                            Container(
                                              width: double.infinity,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade300,
                                              ),
                                              padding: const EdgeInsets.only(top: 3,bottom: 3),
                                              child:Text(AppStrings.waadcompany.tr(), style: getStyle(color: Colors.black, fontSize: textSize)),),

                                            const SizedBox(height: 10,),
                                          ])),
                                  Container(
                                      alignment: Alignment.center,

                                      width: double.infinity,
                                      child:Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                    width: 50,
                                                    alignment: Alignment.centerLeft,
                                                    child:  Text(
                                                      "Phone",
                                                      style: getStyle(color: Colors.black, fontSize: textSize),
                                                    )),  Container(
                                                    width: 90,
                                                    alignment: Alignment.center,
                                                    child:Text(
                                                      "961751515151",
                                                      style: getStyle(color: Colors.black, fontSize: textSize),
                                                    )),  Container(
                                                    width: 50,
                                                    alignment: Alignment.centerRight,
                                                    child: Text(
                                                      "الهاتف",textAlign: TextAlign.center,
                                                      style: getStyle(color: Colors.black, fontSize: textSize),
                                                    )),
                                              ],),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                    width: 55,
                                                    alignment: Alignment.centerLeft,
                                                    child:  Text(
                                                      "Vat No",
                                                      style: getStyle(color: Colors.black, fontSize: textSize),
                                                    )),  Container(
                                                    width: 80,
                                                    alignment: Alignment.center,
                                                    child:Text(
                                                
                                                        
                                                        vatNo,textAlign: TextAlign.center,
                                                        style: getStyle(color: Colors.black, fontSize: textSize-1)
                                                    )),  Container(
                                                    width: 55,
                                                    alignment: Alignment.centerRight,
                                                    child: Text(
                                                      "الرقم الضريبي",textAlign: TextAlign.right,
                                                      style: getStyle(color: Colors.black, fontSize: textSize-1),
                                                    )),

                                              ],), const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                    width: 50,
                                                    alignment: Alignment.centerLeft,
                                                    child:  Text(
                                                      "CR No",
                                                      style:getStyle(color: Colors.black, fontSize: textSize-1),
                                                    )),
                                                Container(
                                                    width: 80,
                                                    alignment: Alignment.center,
                                                    child:Text(
                                                      cubit.allInvoices[ cubit.allInvoices.length-1].referenceNo!,textAlign: TextAlign.center,
                                                      // invoiceModel!.invoiceData![0].referenceNo!,textAlign: TextAlign.center,
                                                      style:  getStyle(color: Colors.black, fontSize: textSize-1),
                                                    )),
                                                Container(
                                                    width: 60,
                                                    alignment: Alignment.centerRight,
                                                    child: Text(
                                                      "السجل التجاري",textAlign: TextAlign.right,
                                                      style: getStyle(color: Colors.black, fontSize: textSize-1),
                                                    )),

                                              ],),


                                          ])),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                      alignment: Alignment.center,
                                      width: width,
                                      child:Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                    width: 45,
                                                    alignment: Alignment.centerLeft,
                                                    child:  Text(
                                                      "Date",
                                                      style: getStyle(color: Colors.black, fontSize: textSize-1),
                                                    )),  Container(
                                                    width: 100,
                                                    alignment: Alignment.center,
                                                    child:Text(
                                                      cubit.allInvoices[ cubit.allInvoices.length-1].date!.split(" ").first,textAlign: TextAlign.center,

                                                      // invoiceModel!.invoiceData![0].date!,textAlign: TextAlign.center,
                                                      style: getStyle(color: Colors.black, fontSize: textSize-1),
                                                    )),  Container(
                                                    width: 45,
                                                    alignment: Alignment.centerRight,
                                                    child: Text(
                                                        "التاريخ",textAlign: TextAlign.center,
                                                        style: getStyle(color: Colors.black, fontSize: textSize-1)
                                                    )),

                                              ],),
                                            const SizedBox(
                                              height: 5,
                                            ),

                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                    width: 50,
                                                    alignment: Alignment.centerLeft,
                                                    child:  Text(
                                                      "Reference",
                                                      style: getStyle(color: Colors.black, fontSize: textSize-1),
                                                    )),  Container(
                                                    width: 100,
                                                    alignment: Alignment.center,
                                                    child:Text(
                                                      cubit.allInvoices[ cubit.allInvoices.length-1].referenceNo!,textAlign: TextAlign.center,

                                                      // invoiceModel!.invoiceData![0].referenceNo!,textAlign: TextAlign.center,
                                                      style: getStyle(color: Colors.black, fontSize: textSize-1),
                                                    )),  Container(
                                                    width: 40,
                                                    alignment: Alignment.centerRight,
                                                    child: Text(
                                                      "المرجع",textAlign: TextAlign.center,
                                                      style: getStyle(color: Colors.black, fontSize: textSize-1),
                                                    )),

                                              ],),

                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                    width: 50,
                                                    alignment: Alignment.centerLeft,
                                                    child:  Text(
                                                      "Seller",
                                                      style: getStyle(color: Colors.black, fontSize: textSize-1),
                                                    )),  Container(
                                                    width: 90,
                                                    alignment: Alignment.center,
                                                    child:Text(
                                                      cubit.allInvoices[ cubit.allInvoices.length-1].customer!,textAlign: TextAlign.center,

                                                      // invoiceModel!.invoiceData![0].customer!,textAlign: TextAlign.center,
                                                      style: getStyle(color: Colors.black, fontSize: textSize-1),
                                                    )),  Container(
                                                    width: 50,
                                                    alignment: Alignment.centerRight,
                                                    child: Text(
                                                      "البائع",textAlign: TextAlign.center,
                                                      style: getStyle(color: Colors.black, fontSize: textSize-1),
                                                    )),

                                              ],),

                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                    width: 50,
                                                    alignment: Alignment.centerLeft,
                                                    child:  Text(
                                                      "Customer",
                                                      style: getStyle(color: Colors.black, fontSize: textSize-1),
                                                    )),  Container(
                                                    width: 90,
                                                    alignment: Alignment.center,
                                                    child:Text(
                                                      cubit.allInvoices[ cubit.allInvoices.length-1].customer!,textAlign: TextAlign.center,

                                                      // invoiceModel!.invoiceData![0].customer!,textAlign: TextAlign.center,
                                                      style: getStyle(color: Colors.black, fontSize: textSize-1),
                                                    )),  Container(
                                                    width: 50,
                                                    alignment: Alignment.centerRight,
                                                    child: Text(
                                                      "العميل",textAlign: TextAlign.center,
                                                      style: getStyle(color: Colors.black, fontSize: textSize-1),
                                                    )),

                                              ],),
                                            const SizedBox(
                                              height: 5,
                                            ),Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Container(
                                                    width: 55,
                                                    alignment: Alignment.centerLeft,
                                                    child:  Text(
                                                      "Vat_No",
                                                      style: getStyle(color: Colors.black, fontSize: textSize-1),
                                                    )),  Container(
                                                    width: 80,
                                                    alignment: Alignment.center,
                                                    child:Text(
                                                      vatNo,textAlign: TextAlign.left,

                                                      // invoiceModel!.invoiceData![0].items![0].tax!,textAlign: TextAlign.left,
                                                      style: getStyle(color: Colors.black, fontSize: textSize-1),
                                                    )),  Container(
                                                    width: 55,
                                                    alignment: Alignment.centerRight,
                                                    child: Text(
                                                      "الرقم الضريبي",textAlign: TextAlign.right,
                                                      style: getStyle(color: Colors.black, fontSize: textSize-1),
                                                    )),

                                              ],),

                                          ])),                            const Divider(
                                    color: Colors.black,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 20,
                                    width: width,
                                    child:
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [ Text(
                                        "Invoice No",
                                        style: getStyle(color: Colors.black, fontSize: textSize-1),
                                      ),
                                        Text(
                                          cubit.allInvoices[ cubit.allInvoices.length-1].id!,

                                          // invoiceModel!.invoiceData![0].id!,
                                          style: getStyle(color: Colors.black, fontSize: textSize-1),
                                        ),  Text(
                                          "رقم الفاتورة",
                                          style: getStyle(color: Colors.black, fontSize: textSize-1),
                                        ),
                                      ],),
                                  ),
                                  const SizedBox(height:5,),
                                  SizedBox(
                                    // height: 30,
                                      width: width,
                                      child:Table(
                                          border: TableBorder.all(),
                                          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                                          children: <TableRow>[
                                            TableRow(
                                                decoration: const BoxDecoration(
                                                  color: Colors.white,
                                                ),
                                                children: <Widget>[
                                                  Container(
                                                    // height: 35,
                                                      width: 95,
                                                      alignment: Alignment.centerLeft,
                                                      margin: const EdgeInsets.only(top: 4,left: 4),
                                                      child: Column(
                                                        children:  [
                                                          Text(
                                                            "Description",
                                                            textAlign: TextAlign.left,
                                                            style: getStyle(color: Colors.black, fontSize: textSize-1),
                                                          ),
                                                          Text(
                                                            cubit.allInvoices[ cubit.allInvoices.length-1].items![0].productName!,textAlign: TextAlign.left,

                                                            // invoiceModel!.invoiceData![0].items![0].productName!,
                                                            // textAlign: TextAlign.left,
                                                            style: getStyle(color: Colors.black, fontSize: textSize-1),
                                                          ),

                                                        ],)),
                                                  Container(
                                                    // height: 35,
                                                    width: 95,
                                                    alignment: Alignment.centerLeft,
                                                    margin: const EdgeInsets.only(top: 4,left: 4),
                                                    child: Column(
                                                      children:  [
                                                        Text(
                                                          "QTY   Price   Total",
                                                          style: getStyle(color: Colors.black, fontSize: textSize-1),
                                                        ),
                                                        Text(
                                                          "الاجمالي  سعر  الكمية",
                                                          style: getStyle(color: Colors.black, fontSize: textSize-1),
                                                        ),],),

                                                  )])])),

                                  SizedBox(
                                      width: width,
                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              width: 65,
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Total",
                                                textAlign: TextAlign.left,
                                                style: getStyle(color: Colors.black, fontSize: textSize-1),
                                              )),
                                          Container(
                                              width: 60,
                                              alignment: Alignment.center,
                                              child: Text(
                                                // cubit.allInvoices[ cubit.allInvoices.length-1].items![0].subtotal!,textAlign: TextAlign.center,
                                                    cubit.whatYouPay.text,
                                                // invoiceModel!.invoiceData![0].items![0].subtotal!,
                                                // textAlign: TextAlign.center,
                                                style: getStyle(color: Colors.black, fontSize: textSize-1),
                                              )),
                                          Container(
                                              width: 65,
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                "الاجمالي",
                                                textAlign: TextAlign.right,
                                                style: getStyle(color: Colors.black, fontSize: textSize-1),
                                              )),
                                        ],)),
                                  const SizedBox(height:3,),
                                  SizedBox(
                                      width: width,
                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              width: 65,
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "VAT",
                                                textAlign: TextAlign.left,
                                                style: getStyle(color: Colors.black, fontSize: textSize-1),
                                              )),
                                          Container(
                                              width: 60,
                                              alignment: Alignment.center,
                                              child: Text(
                                                // cubit.allInvoices[ cubit.allInvoices.length-1].items![0].tax!,textAlign: TextAlign.center,
                                                "${double.parse(cubit.tax.text).toStringAsFixed(0)} %",textAlign: TextAlign.center,

                                                // invoiceModel!.invoiceData![0].items![0].tax!,
                                                // textAlign: TextAlign.center,
                                                style: getStyle(color: Colors.black, fontSize: textSize-1),
                                              )),
                                          Container(
                                              width: 65,
                                              alignment: Alignment.centerRight,
                                              child:  Text(
                                                "الضريبة",
                                                textAlign: TextAlign.right,
                                                style: getStyle(color: Colors.black, fontSize: textSize-1),
                                              )),
                                        ],)),
                                  SizedBox(
                                      width: width,
                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              width: 60,
                                              alignment: Alignment.centerLeft,
                                              child:  Text(
                                                  "Discount",
                                                  textAlign: TextAlign.left,
                                                  style: getStyle(color: Colors.black, fontSize: textSize-1)
                                              )),
                                          Container(
                                              width: 60,
                                              alignment: Alignment.center,
                                              child: Text(
                                                  // cubit.allInvoices[ cubit.allInvoices.length-1].items![0].discount!=null? cubit.allInvoices[ cubit.allInvoices.length-1].items![0].discount!:"0",textAlign: TextAlign.center,
                                                  "${double.parse(cubit.discount.text).toStringAsFixed(0)} %",textAlign: TextAlign.center,

                                                  // invoiceModel!.invoiceData![0].items![0].discount!=null?invoiceModel!.invoiceData![0].items![0].discount!:"15",
                                                  // textAlign: TextAlign.center,
                                                  style:getStyle(color: Colors.black, fontSize: textSize-1)
                                              )),
                                          Container(
                                              width: 60,
                                              alignment: Alignment.centerRight,
                                              child:   Text(
                                                  "الخصم",
                                                  textAlign: TextAlign.right,
                                                  style: getStyle(color: Colors.black, fontSize: textSize-1)
                                              )),
                                        ],)),
                                  const SizedBox(height:3,),
                                  SizedBox(
                                      width: width,
                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              width:70,
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  "Grand Total",
                                                  textAlign: TextAlign.left,
                                                  style: getStyle(color: Colors.black, fontSize: textSize-1)
                                              )),
                                          Container(
                                              width: 50,
                                              alignment: Alignment.center,
                                              child: Text(
                                                  // cubit.allInvoices[ cubit.allInvoices.length-1].items![0].subtotal!,
                                                  double.parse(cubit.totalPrice.text).toStringAsFixed(0),
                                                  // invoiceModel!.invoiceData![0].items![0].subtotal!,
                                                  textAlign: TextAlign.center,
                                                  style: getStyle(color: Colors.black, fontSize: textSize-1)
                                              )),
                                          Container(
                                              width: 70,
                                              alignment: Alignment.centerRight,
                                              child:  Text(
                                                "المبلغ المطلوب",
                                                textAlign: TextAlign.right,
                                                style: getStyle(color: Colors.black, fontSize: textSize-1),
                                              )),
                                        ],)),
                                  const SizedBox(height:3,),
                                  SizedBox(
                                      width: width,
                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              width:70,
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  "Paid",
                                                  textAlign: TextAlign.left,
                                                  style: getStyle(color: Colors.black, fontSize: textSize-1)
                                              )),
                                          Container(
                                              width: 50,
                                              alignment: Alignment.center,
                                              child: Text(
                                                  // cubit.allInvoices[ cubit.allInvoices.length-1].items![0].realUnitPrice!,
                                                   double.parse(cubit.cash.text).toStringAsFixed(0),
                                                  // invoiceModel!.invoiceData![0].items![0].realUnitPrice!,
                                                  textAlign: TextAlign.center,
                                                  style: getStyle(color: Colors.black, fontSize: textSize-1)
                                              )),
                                          Container(
                                              width: 70,
                                              alignment: Alignment.centerRight,
                                              child:  Text(
                                                  "المبلغ المدفوع",
                                                  textAlign: TextAlign.right,
                                                  style: getStyle(color: Colors.black, fontSize: textSize-1)
                                              )),
                                        ],)),
                                  const SizedBox(height:3,),

                                  SizedBox(
                                      width: width,
                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              width: 70,
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                  "Payment Status",
                                                  textAlign: TextAlign.left,
                                                  style: getStyle(color: Colors.black, fontSize: textSize-1)
                                              )),
                                          Container(
                                              width: 50,
                                              alignment: Alignment.center,
                                              child: Text(
                                                  cubit.allInvoices[ cubit.allInvoices.length-1].saleStatus!,
                                                  // double.parse(cubit.delayMoney.text).toStringAsFixed(0),
                                                  // invoiceModel!.invoiceData![0].saleStatus!,
                                                  textAlign: TextAlign.center,
                                                  style: getStyle(color: Colors.black, fontSize: textSize)
                                              )),
                                          Container(
                                              width: 70,
                                              alignment: Alignment.centerRight,
                                              child:  Text(
                                                  "حالة الدفع",
                                                  textAlign: TextAlign.right,
                                                  style: getStyle(color: Colors.black, fontSize: textSize-1)
                                              )),
                                        ],)),




                                  const Divider(
                                    color: Colors.black,
                                  ),
                                  QrImage(
                                    data: QrCodeTVL(context),
                                    version: QrVersions.auto,
                                    size: 140.0,
                                  )
                                ],
                              )))



                  ),
                  ElevatedButton(
                    child: Text("طباعة",
                        style: getStyle(color: Colors.white, fontSize: 16)
                    ),
                    onPressed: () async{
                      LoadingPage(context).show();
                      widget.printerType=await SharedPreferencesHelper.getPrinterType();
                      int printerSize  =(await SharedPreferencesHelper.getPageSize())!;
                      if(widget.printerType==3){
                        textSize=10;
                        width=190;
                      }else{
                        textSize=20;
                        width=420;
                      }
                      setState(() {});
                      await screenshotController.capture(delay: const Duration(milliseconds: 10)).then((capturedImage) async {
                        if( widget.printerType==1){
                          LoadingPage(context).close();
                          if(printerSize==80){
                            printBluetooth80(capturedImage!);
                          }else{
                            printBluetooth58(capturedImage!);
                          }
                        }else if(widget.printerType==2){
                          LoadingPage(context).close();
                          if(printerSize==80){
                            PrinterWiFi80(ipPrinter,capturedImage!);
                          }else{
                            PrinterWiFi58(ipPrinter,capturedImage!);
                          }
                        }else if(widget.printerType==3){
                          LoadingPage(context).close();
                          await SanmiPrint(capturedImage!);
                          print("sonomi");
                        }

                      }).catchError((onError) {
                        print(onError);
                      });
                    },
                  ),
                ],
              )),
        ):Container(),
      );

  },
),
    );
  }

  getContent(size,context,InvoiceModel? invoiceModel){
    return  Container(
        width: width,
        color: Colors.white,
        child: Directionality(
            textDirection: p.TextDirection.ltr,
            child:Column(
              children: [

                Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child:Column(
                        children: [

                          Text("مركز الابداع للخياطة", style: getStyle(color: MyConstant().purpleColor, fontSize: textSize)
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("فاتورة ضريبة مبسطة ", style: getStyle(color: Colors.black, fontSize: textSize)
                            )],
                          ),
                          const SizedBox(height: 10,),

                          Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                            ),
                            padding: const EdgeInsets.only(top: 3,bottom: 3),
                            child:Text("مؤسسة وعد الوان", style: getStyle(color: Colors.black, fontSize: textSize)),),

                          const SizedBox(height: 10,),
                        ])),
                Container(
                    alignment: Alignment.center,

                    width: double.infinity,
                    child:Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 50,
                                  alignment: Alignment.centerLeft,
                                  child:  Text(
                                    "Phone",
                                    style: getStyle(color: Colors.black, fontSize: textSize),
                                  )),  Container(
                                  width: 90,
                                  alignment: Alignment.center,
                                  child:Text(
                                    "961751515151",
                                    style: getStyle(color: Colors.black, fontSize: textSize),
                                  )),  Container(
                                  width: 50,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "الهاتف",textAlign: TextAlign.center,
                                    style: getStyle(color: Colors.black, fontSize: textSize),
                                  )),
                            ],),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 55,
                                  alignment: Alignment.centerLeft,
                                  child:  Text(
                                    "Vat No",
                                    style: getStyle(color: Colors.black, fontSize: textSize),
                                  )),  Container(
                                  width: 80,
                                  alignment: Alignment.center,
                                  child:Text(
                                      vatNo,textAlign: TextAlign.center,
                                    style: getStyle(color: Colors.black, fontSize: textSize-1)
                                  )),  Container(
                                  width: 55,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "الرقم الضريبي",textAlign: TextAlign.right,
                                    style: getStyle(color: Colors.black, fontSize: textSize-1),
                                  )),

                            ],), const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 50,
                                  alignment: Alignment.centerLeft,
                                  child:  Text(
                                    "CR No",
                                    style:getStyle(color: Colors.black, fontSize: textSize-1),
                                  )),
                              Container(
                                  width: 80,
                                  alignment: Alignment.center,
                                  child:Text(
                                    invoiceModel!.invoiceData![0].referenceNo!,textAlign: TextAlign.center,
                                    style:  getStyle(color: Colors.black, fontSize: textSize-1),
                                  )),
                              Container(
                                  width: 60,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "السجل التجاري",textAlign: TextAlign.right,
                                    style: getStyle(color: Colors.black, fontSize: textSize-1),
                                  )),

                            ],),


                        ])),
                const SizedBox(
                  height: 5,
                ),
                Container(
                    alignment: Alignment.center,
                    width: width,
                    child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 45,
                                  alignment: Alignment.centerLeft,
                                  child:  Text(
                                    "Date",
                                    style: getStyle(color: Colors.black, fontSize: textSize-1),
                                  )),  Container(
                                  width: 100,
                                  alignment: Alignment.center,
                                  child:Text(
                                    invoiceModel!.invoiceData![0].date!,textAlign: TextAlign.center,
                                    style: getStyle(color: Colors.black, fontSize: textSize-1),
                                  )),  Container(
                                  width: 45,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "التاريخ",textAlign: TextAlign.center,
                                    style: getStyle(color: Colors.black, fontSize: textSize-1)
                                  )),

                            ],),
                          const SizedBox(
                            height: 5,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 50,
                                  alignment: Alignment.centerLeft,
                                  child:  Text(
                                    "Reference",
                                    style: getStyle(color: Colors.black, fontSize: textSize-1),
                                  )),  Container(
                                  width: 100,
                                  alignment: Alignment.center,
                                  child:Text(
                                    invoiceModel!.invoiceData![0].referenceNo!,textAlign: TextAlign.center,
                                    style: getStyle(color: Colors.black, fontSize: textSize-1),
                                  )),  Container(
                                  width: 40,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "المرجع",textAlign: TextAlign.center,
                                    style: getStyle(color: Colors.black, fontSize: textSize-1),
                                  )),

                            ],),

                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 50,
                                  alignment: Alignment.centerLeft,
                                  child:  Text(
                                    "Seller",
                                    style: getStyle(color: Colors.black, fontSize: textSize-1),
                                  )),  Container(
                                  width: 90,
                                  alignment: Alignment.center,
                                  child:Text(
                                    invoiceModel!.invoiceData![0].customer!,textAlign: TextAlign.center,
                                    style: getStyle(color: Colors.black, fontSize: textSize-1),
                                  )),  Container(
                                  width: 50,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "البائع",textAlign: TextAlign.center,
                                    style: getStyle(color: Colors.black, fontSize: textSize-1),
                                  )),

                            ],),

                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 50,
                                  alignment: Alignment.centerLeft,
                                  child:  Text(
                                    "Customer",
                                    style: getStyle(color: Colors.black, fontSize: textSize-1),
                                  )),  Container(
                                  width: 90,
                                  alignment: Alignment.center,
                                  child:Text(
                                    invoiceModel!.invoiceData![0].customer!,textAlign: TextAlign.center,
                                    style: getStyle(color: Colors.black, fontSize: textSize-1),
                                  )),  Container(
                                  width: 50,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "العميل",textAlign: TextAlign.center,
                                    style: getStyle(color: Colors.black, fontSize: textSize-1),
                                  )),

                            ],),
                          const SizedBox(
                            height: 5,
                          ),Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 55,
                                  alignment: Alignment.centerLeft,
                                  child:  Text(
                                    "Vat_No",
                                    style: getStyle(color: Colors.black, fontSize: textSize-1),
                                  )),  Container(
                                  width: 80,
                                  alignment: Alignment.center,
                                  child:Text(
                                    vatNo,textAlign: TextAlign.left,
                                    style: getStyle(color: Colors.black, fontSize: textSize-1),
                                  )),  Container(
                                  width: 55,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "الرقم الضريبي",textAlign: TextAlign.right,
                                    style: getStyle(color: Colors.black, fontSize: textSize-1),
                                  )),

                            ],),

                        ])),                            const Divider(
                  color: Colors.black,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 20,
                  width: width,
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [ Text(
                      "Invoice No",
                      style: getStyle(color: Colors.black, fontSize: textSize-1),
                    ),
                      Text(
                        invoiceModel!.invoiceData![0].id!,
                        style: getStyle(color: Colors.black, fontSize: textSize-1),
                      ),  Text(
                        "رقم الفاتورة",
                        style: getStyle(color: Colors.black, fontSize: textSize-1),
                      ),
                    ],),
                ),
                const SizedBox(height:5,),
                SizedBox(
                    // height: 30,
                    width: width,
                    child:Table(
                        border: TableBorder.all(),
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                        children: <TableRow>[
                          TableRow(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              children: <Widget>[
                                Container(
                                    // height: 35,
                                    width: 95,
                                    alignment: Alignment.centerLeft,
                                    margin: const EdgeInsets.only(top: 4,left: 4),
                                    child: Column(
                                      children:  [
                                        Text(
                                          "Description",
                                          textAlign: TextAlign.left,
                                          style: getStyle(color: Colors.black, fontSize: textSize-1),
                                        ),
                                        Text(
                                          invoiceModel!.invoiceData![0].items![0].productName!,
                                          textAlign: TextAlign.left,
                                          style: getStyle(color: Colors.black, fontSize: textSize-1),
                                        ),

                                      ],)),
                                Container(
                                  // height: 35,
                                  width: 95,
                                  alignment: Alignment.centerLeft,
                                  margin: const EdgeInsets.only(top: 4,left: 4),
                                  child: Column(
                                    children:  [
                                      Text(
                                        "QTY   Price   Total",
                                        style: getStyle(color: Colors.black, fontSize: textSize-1),
                                      ),
                                      Text(
                                        "الاجمالي  سعر  الكمية",
                                        style: getStyle(color: Colors.black, fontSize: textSize-1),
                                      ),],),

                                )])])),

                SizedBox(
                    width: width,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 65,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Total",
                              textAlign: TextAlign.left,
                              style: getStyle(color: Colors.black, fontSize: textSize-1),
                            )),
                        Container(
                            width: 60,
                            alignment: Alignment.center,
                            child: Text(
                              invoiceModel!.invoiceData![0].items![0].subtotal!,
                              textAlign: TextAlign.center,
                              style: getStyle(color: Colors.black, fontSize: textSize-1),
                            )),
                        Container(
                            width: 65,
                            alignment: Alignment.centerRight,
                            child: Text(
                              "الاجمالي",
                              textAlign: TextAlign.right,
                              style: getStyle(color: Colors.black, fontSize: textSize-1),
                            )),
                      ],)),
                const SizedBox(height:3,),
                SizedBox(
                    width: width,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 65,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "VAT",
                              textAlign: TextAlign.left,
                              style: getStyle(color: Colors.black, fontSize: textSize-1),
                            )),
                        Container(
                            width: 60,
                            alignment: Alignment.center,
                            child: Text(
                              invoiceModel!.invoiceData![0].items![0].tax!,
                              textAlign: TextAlign.center,
                              style: getStyle(color: Colors.black, fontSize: textSize-1),
                            )),
                        Container(
                            width: 65,
                            alignment: Alignment.centerRight,
                            child:  Text(
                              "الضريبة",
                              textAlign: TextAlign.right,
                              style: getStyle(color: Colors.black, fontSize: textSize-1),
                            )),
                      ],)),
                SizedBox(
                    width: width,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 60,
                            alignment: Alignment.centerLeft,
                            child:  Text(
                              "Discount",
                              textAlign: TextAlign.left,
                              style: getStyle(color: Colors.black, fontSize: textSize-1)
                            )),
                        Container(
                            width: 60,
                            alignment: Alignment.center,
                            child: Text(
                              invoiceModel!.invoiceData![0].items![0].discount!=null?invoiceModel!.invoiceData![0].items![0].discount!:"15",
                              textAlign: TextAlign.center,
                              style:getStyle(color: Colors.black, fontSize: textSize-1)
                            )),
                        Container(
                            width: 60,
                            alignment: Alignment.centerRight,
                            child:   Text(
                              "الخصم",
                              textAlign: TextAlign.right,
                              style: getStyle(color: Colors.black, fontSize: textSize-1)
                            )),
                      ],)),
                const SizedBox(height:3,),
                SizedBox(
                    width: width,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width:70,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Grand Total",
                              textAlign: TextAlign.left,
                              style: getStyle(color: Colors.black, fontSize: textSize-1)
                            )),
                        Container(
                            width: 50,
                            alignment: Alignment.center,
                            child: Text(
                              invoiceModel!.invoiceData![0].items![0].subtotal!,
                              textAlign: TextAlign.center,
                              style: getStyle(color: Colors.black, fontSize: textSize-1)
                            )),
                        Container(
                            width: 70,
                            alignment: Alignment.centerRight,
                            child:  Text(
                              "المبلغ المطلوب",
                              textAlign: TextAlign.right,
                              style: getStyle(color: Colors.black, fontSize: textSize-1),
                            )),
                      ],)),
                const SizedBox(height:3,),
                SizedBox(
                    width: width,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width:70,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Paid",
                              textAlign: TextAlign.left,
                              style: getStyle(color: Colors.black, fontSize: textSize-1)
                            )),
                        Container(
                            width: 50,
                            alignment: Alignment.center,
                            child: Text(
                              invoiceModel!.invoiceData![0].items![0].realUnitPrice!,
                              textAlign: TextAlign.center,
                              style: getStyle(color: Colors.black, fontSize: textSize-1)
                            )),
                        Container(
                            width: 70,
                            alignment: Alignment.centerRight,
                            child:  Text(
                              "المبلغ المدفوع",
                              textAlign: TextAlign.right,
                              style: getStyle(color: Colors.black, fontSize: textSize-1)
                            )),
                      ],)),
                const SizedBox(height:3,),

                SizedBox(
                    width: width,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 70,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Payment Status",
                              textAlign: TextAlign.left,
                              style: getStyle(color: Colors.black, fontSize: textSize-1)
                            )),
                        Container(
                            width: 50,
                            alignment: Alignment.center,
                            child: Text(
                              invoiceModel!.invoiceData![0].saleStatus!,
                              textAlign: TextAlign.center,
                              style: getStyle(color: Colors.black, fontSize: textSize)
                            )),
                        Container(
                            width: 70,
                            alignment: Alignment.centerRight,
                            child:  Text(
                              "حالة الدفع",
                              textAlign: TextAlign.right,
                              style: getStyle(color: Colors.black, fontSize: textSize-1)
                            )),
                      ],)),




                const Divider(
                  color: Colors.black,
                ),
                QrImage(
                  data: QrCodeTVL(context),
                  version: QrVersions.auto,
                  size: 140.0,
                )
              ],
            )));
  }

  SanmiPrint(Uint8List byte)async{
    await MaxxSunmiPrinter.initializePrinter();
    String base64String = base64Encode(byte);
    // log("base64String>>"+base64String.toString());
    MaxxSunmiPrinter.printImage(base64String, align: SunmiAlign.center);
    MaxxSunmiPrinter.paperFeed(number: 1);
    // await MaxxSunmiPrinter.cutPaper();
  }

  QrCodeTVL(context){
    BytesBuilder bytesBuilder =BytesBuilder();
    bytesBuilder.addByte(1);
    // List<int> getSetting=utf8.encode(SiteName.toString());
    List<int> getSetting=utf8.encode("test OMar Name");
    bytesBuilder.addByte(getSetting.length);
    bytesBuilder.add(getSetting);

    bytesBuilder.addByte(2);
    List<int> getvat_no=utf8.encode(vatNo);
    // bytesBuilder.addByte(getvat_no.length);
    bytesBuilder.addByte(getvat_no.length);
    bytesBuilder.add(getvat_no);

    bytesBuilder.addByte(3);
    List<int> Datetaime=utf8.encode("2022-11-23 00:00:00");
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

  // __________________________________________
// Wifi
  Future<List<int>> getGraphicsTicketWiFi80(Uint8List byte) async {
    List<int> bytes = [];
    const PaperSize paper = PaperSize.mm80;
    CapabilityProfile profile = await CapabilityProfile.load();
    final generator = Generator(paper, profile);
    final Uint8List bytess = byte.buffer.asUint8List();
    final img.Image image = img.decodeImage(bytess)!;
    bytes += generator.image(image);
    bytes += generator.feed(2);
    bytes += generator.cut();
    return bytes;
  }


  PrinterWiFi80(String printerIp, Uint8List theimageThatComesfr) async {
    final printer = PrinterNetworkManager(printerIp);
    PosPrintResult connect = await printer.connect();
    if (connect == PosPrintResult.success) {
      List<int> bytes = await getGraphicsTicketWiFi80(theimageThatComesfr);
      PosPrintResult printing = await printer.printTicket(bytes);
      print("Print $printing");
    } else {
      //Hadnle Not Connected Senario
    }
  }

  PrinterWiFi58(String printerIp, Uint8List theimageThatComesfr) async {
    final printer = PrinterNetworkManager(printerIp);
    PosPrintResult connect = await printer.connect();
    if (connect == PosPrintResult.success) {
      List<int> bytes = await getGraphicsTicketWiFi58(theimageThatComesfr);
      PosPrintResult printing = await printer.printTicket(bytes);
      print("Print $printing");
    } else {
      //Hadnle Not Connected Senario
    }
  }
  Future<List<int>> getGraphicsTicketWiFi58(Uint8List byte) async {
    List<int> bytes = [];
    const PaperSize paper = PaperSize.mm58;
    CapabilityProfile profile = await CapabilityProfile.load();
    final generator = Generator(paper, profile);
    final Uint8List bytess = byte.buffer.asUint8List();
    final img.Image image = img.decodeImage(bytess)!;
    bytes += generator.image(image);
    bytes += generator.feed(2);
    bytes += generator.cut();
    return bytes;
  }


// ________________________________________________________________________
// for Bluetooth Printer
  Future<List<int>> getGraphicsTicket58(Uint8List byte) async {
    List<int> bytes = [];
    const PaperSize paper = PaperSize.mm58;
    CapabilityProfile profile = await CapabilityProfile.load();
    final generator = Generator(paper, profile);
    final Uint8List bytess = byte.buffer.asUint8List();
    final img.Image image = img.decodeImage(bytess)!;
    bytes += generator.image(image);
    bytes += generator.cut();
    return bytes;
  }
  Future<List<int>> getGraphicsTicket80(Uint8List byte) async {
    List<int> bytes = [];
    const PaperSize paper = PaperSize.mm80;
    CapabilityProfile profile = await CapabilityProfile.load();
    final generator = Generator(paper, profile);
    final Uint8List bytess = byte.buffer.asUint8List();
    final img.Image image = img.decodeImage(bytess)!;
    bytes += generator.image(image);
    bytes += generator.cut();
    bytes += generator.reset();
    return bytes;
  }
  Future<void> printBluetooth58(Uint8List byte) async {
    final decodedMap = json.decode(MacJeson);
    await bluetoothManager.connect(decodedMap);
    List<int> bytes = await getGraphicsTicket58(byte);
    await bluetoothManager.writeData(bytes);
  }
  Future<void> printBluetooth80(Uint8List byte) async {
    final decodedMap = json.decode(MacJeson);
    await bluetoothManager.connect(decodedMap);
    List<int> bytes = await getGraphicsTicket80(byte);
    await bluetoothManager.writeData(bytes);
  }

  void testPrint(int size,String printerIp, Uint8List theimageThatComesfr) async {
    PaperSize paper = size==80?PaperSize.mm80:PaperSize.mm58;
    final profile = await CapabilityProfile.load();
    final printer = eco.NetworkPrinter(paper, profile);
    final eco.PosPrintResult res = await printer.connect(printerIp, port: 9100);

    if (res == eco.PosPrintResult.success) {
      // DEMO RECEIPT
      await testReceipt(printer, theimageThatComesfr);
      print(res.msg);
      await Future.delayed(const Duration(seconds: 3), () {
        print("prinnter desconect");
        printer.disconnect();
      });
    }
  }
  Future<void> testReceipt(
      eco.NetworkPrinter printer,  Uint8List theimageThatC) async {
    final img.Image? image = decodeImage(theimageThatC);
    printer.image(image! , align: PosAlign.center);
    printer.cut();
  }
}
