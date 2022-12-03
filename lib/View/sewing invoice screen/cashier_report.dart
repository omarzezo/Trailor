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
import 'package:omar/constant/LoadingPage.dart';
import 'package:omar/constant/appstrings.dart';
import 'package:omar/constant/constant.dart';
import 'package:omar/models/invoiceModel.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:flutter/services.dart' as p;

class CashierPillScreen extends StatefulWidget {
  static const routeName="CashierPillScreen";
  int? printerType;
  int? pageSize;
  CashierPillScreen({this.pageSize,this.printerType});

  @override
  State<CashierPillScreen> createState() => _CashierPillScreenState();
}

class _CashierPillScreenState extends State<CashierPillScreen> {
  ScreenshotController screenshotController = ScreenshotController();
  String dir = Directory.current.path;
  // BluePrinter bluePrinter=BluePrinter();
  SonomiPrinter sonomiPrinter=SonomiPrinter();

  double vatNo=0567218888;
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
              title: Text("معاينة الفاتورة", style: GoogleFonts.notoKufiArabic(
                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)), centerTitle: true,),
            body: (cubit.closeCashierResponse!=null&&cubit.closeCashierResponse!.status==true)?
            Center(
              child: SingleChildScrollView(

                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20,),
                      Screenshot(
                          controller: screenshotController,
                          child:getContent(size, context, )


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
            ):(cubit.closeCashierResponse!.status=true)?Center(
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
                                                  children: [Text("احصائيات الكاشير", style: getStyle(color: Colors.black, fontSize: textSize)
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
                                                  child:Text("Cashier Statistics", style: getStyle(color: Colors.black, fontSize: textSize)),),

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
                                                          "Warehouse",
                                                          style: getStyle(color: Colors.black, fontSize: textSize),
                                                        )),  Container(
                                                        width: 90,
                                                        alignment: Alignment.center,
                                                        child:Text(
                                                          " ",
                                                          style: getStyle(color: Colors.black, fontSize: textSize),
                                                        )),  Container(
                                                        width: 50,
                                                        alignment: Alignment.centerRight,
                                                        child: Text(
                                                          "المخزن",textAlign: TextAlign.center,
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
                                                          "Biller",
                                                          style: getStyle(color: Colors.black, fontSize: textSize),
                                                        )),  Container(
                                                        width: 80,
                                                        alignment: Alignment.center,
                                                        child:Text(
                                                           cubit.userNamevar!,textAlign: TextAlign.center,
                                                            style: getStyle(color: Colors.black, fontSize: textSize-1)
                                                        )),  Container(
                                                        width: 55,
                                                        alignment: Alignment.centerRight,
                                                        child: Text(
                                                          "الكاشير",textAlign: TextAlign.right,
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
                                                          "Date",
                                                          style:getStyle(color: Colors.black, fontSize: textSize-1),
                                                        )),
                                                    Container(
                                                        width: 80,
                                                        alignment: Alignment.center,
                                                        child:Text(
                                                          DateFormat("yyyy-MM-dd HH:mm").format(DateTime.now()).toString(),textAlign: TextAlign.center,
                                                          // invoiceModel!.invoiceData![0].referenceNo!,textAlign: TextAlign.center,
                                                          style:  getStyle(color: Colors.black, fontSize: textSize-1),
                                                        )),
                                                    Container(
                                                        width: 60,
                                                        alignment: Alignment.centerRight,
                                                        child: Text(
                                                          "التاريخ",textAlign: TextAlign.right,
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
                                                        width: 100,
                                                        alignment: Alignment.center,
                                                        child:Text(
                                                          // cubit.invoiceNumbers.toString(),textAlign: TextAlign.center,
                                                          cubit.closeCashierDetailsResponse!.invoiceCount.toString(),textAlign: TextAlign.center,

                                                          // invoiceModel!.invoiceData![0].date!,textAlign: TextAlign.center,
                                                          style: getStyle(color: Colors.black, fontSize: textSize-1),
                                                        )),  Container(
                                                        width: 45,
                                                        alignment: Alignment.centerRight,
                                                        child: Text(
                                                            "عدد الفواتير",textAlign: TextAlign.center,
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
                                                        width: 100,
                                                        alignment: Alignment.center,
                                                        child:Text(
                                                          cubit.closeCashierDetailsResponse!.returnInvoiceCount.toString(),textAlign: TextAlign.center,

                                                          // invoiceModel!.invoiceData![0].referenceNo!,textAlign: TextAlign.center,
                                                          style: getStyle(color: Colors.black, fontSize: textSize-1),
                                                        )),  Container(
                                                        width: 40,
                                                        alignment: Alignment.centerRight,
                                                        child: Text(
                                                          "عدد الفواتير المرتجع",textAlign: TextAlign.center,
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
                                                        width: 90,
                                                        alignment: Alignment.center,
                                                        child:Text(
                                                          // cubit.cashInHandController.text,textAlign: TextAlign.center,
                                                          double.parse(cubit.closeCashierDetailsResponse!.cashInHand!).toStringAsFixed(2),textAlign: TextAlign.center,

                                                          // invoiceModel!.invoiceData![0].customer!,textAlign: TextAlign.center,
                                                          style: getStyle(color: Colors.black, fontSize: textSize-1),
                                                        )),
                                                    Container(
                                                        width: 50,
                                                        alignment: Alignment.centerRight,
                                                        child: Text(
                                                          "المبلغ عند فتح الكاشير",textAlign: TextAlign.center,
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
                                                        width: 90,
                                                        alignment: Alignment.center,
                                                        child:Text(
                                                          // cubit.startDate!,textAlign: TextAlign.center,
                                                          cubit.closeCashierDetailsResponse!.openDate.toString(),textAlign: TextAlign.center,

                                                          // invoiceModel!.invoiceData![0].customer!,textAlign: TextAlign.center,
                                                          style: getStyle(color: Colors.black, fontSize: textSize-1),
                                                        )),
                                                    Container(
                                                        width: 50,
                                                        alignment: Alignment.centerRight,
                                                        child: Text(
                                                          "تاريخ فتح الكاشير",textAlign: TextAlign.center,
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
                                                        width: 80,
                                                        alignment: Alignment.center,
                                                        child:Text(
                                                          // cubit.endDate!,textAlign: TextAlign.left,
                                                          cubit.closeCashierDetailsResponse!.closeDate.toString(),textAlign: TextAlign.left,

                                                          // invoiceModel!.invoiceData![0].items![0].tax!,textAlign: TextAlign.left,
                                                          style: getStyle(color: Colors.black, fontSize: textSize-1),
                                                        )),
                                                    Container(
                                                        width: 55,
                                                        alignment: Alignment.centerRight,
                                                        child: Text(
                                                          "تاريخ اغلاق الكاشير",textAlign: TextAlign.right,
                                                          style: getStyle(color: Colors.black, fontSize: textSize-1),
                                                        )),

                                                  ],),

                                              ])),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 20,
                                        width: width,
                                        child:
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              // cubit.totalCash,
                                              cubit.closeCashierDetailsResponse!.totalCash.toString(),

                                              // invoiceModel!.invoiceData![0].id!,
                                              style: getStyle(color: Colors.black, fontSize: textSize-1),
                                            ),
                                            Text(
                                              "اجمالى المبيعات",
                                              style: getStyle(color: Colors.black, fontSize: textSize-1),
                                            ),
                                          ],),
                                      ),
                                      const SizedBox(height:5,),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 20,
                                        width: width,
                                        child:
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "0",

                                              // invoiceModel!.invoiceData![0].id!,
                                              style: getStyle(color: Colors.black, fontSize: textSize-1),
                                            ),
                                            Text(
                                              " ",
                                              style: getStyle(color: Colors.black, fontSize: textSize-1),
                                            ),
                                          ],),
                                      ),
                                      const SizedBox(height:5,),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 20,
                                        width: width,
                                        child:
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "0",

                                              // invoiceModel!.invoiceData![0].id!,
                                              style: getStyle(color: Colors.black, fontSize: textSize-1),
                                            ),
                                            Text(
                                              " هنجر استيشن",
                                              style: getStyle(color: Colors.black, fontSize: textSize-1),
                                            ),
                                          ],),
                                      ),
                                      const SizedBox(height:5,),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 20,
                                        width: width,
                                        child:
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              // cubit.totalCash,
                                              cubit.closeCashierDetailsResponse!.totalCash.toString(),

                                              // invoiceModel!.invoiceData![0].id!,
                                              style: getStyle(color: Colors.black, fontSize: textSize-1),
                                            ),
                                            Text(
                                              " اجمالى المبيعات نقدا",
                                              style: getStyle(color: Colors.black, fontSize: textSize-1),
                                            ),
                                          ],),
                                      ),
                                      const SizedBox(height:5,),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 20,
                                        width: width,
                                        child:
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              cubit.closeCashierDetailsResponse!.netSalesGrandTotal.toString(),

                                              // invoiceModel!.invoiceData![0].id!,
                                              style: getStyle(color: Colors.black, fontSize: textSize-1),
                                            ),
                                            Text(
                                              " اجمالى مبيعات الشبكات",
                                              style: getStyle(color: Colors.black, fontSize: textSize-1),
                                            ),
                                          ],),
                                      ),
                                      const SizedBox(height:5,),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 20,
                                        width: width,
                                        child:
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              cubit.closeCashierDetailsResponse!.totalAdvance.toString(),

                                              // invoiceModel!.invoiceData![0].id!,
                                              style: getStyle(color: Colors.black, fontSize: textSize-1),
                                            ),
                                            Text(
                                              " اجمالى مبيعات الاجل",
                                              style: getStyle(color: Colors.black, fontSize: textSize-1),
                                            ),
                                          ],),
                                      ),
                                      const SizedBox(height:5,),
                                      Container(
                                        alignment: Alignment.center,
                                        height: 20,
                                        width: width,
                                        child:
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              cubit.closeCashierDetailsResponse!.returnInvoiceGrandTotal.toString(),

                                              // invoiceModel!.invoiceData![0].id!,
                                              style: getStyle(color: Colors.black, fontSize: textSize-1),
                                            ),
                                            Text(
                                              " اجمالى المرتجعات",
                                              style: getStyle(color: Colors.black, fontSize: textSize-1),
                                            ),
                                          ],),
                                      ),
                                      const SizedBox(height:5,), Container(
                                        alignment: Alignment.center,
                                        height: 20,
                                        width: width,
                                        child:
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              // ((double.parse(cubit.totalCash))+(double.parse(cubit.cashInHand))).toString(),
                                              cubit.closeCashierDetailsResponse!.totalCash.toString(),

                                              // invoiceModel!.invoiceData![0].id!,
                                              style: getStyle(color: Colors.black, fontSize: textSize-1),
                                            ),
                                            Text(
                                              " اجمالى النقدية فى الصندوق",
                                              style: getStyle(color: Colors.black, fontSize: textSize-1),
                                            ),
                                          ],),
                                      ),
                                      const SizedBox(height:20,),





                                      // const Divider(
                                      //   color: Colors.black,
                                      // ),
                                      // QrImage(
                                      //   data: QrCodeTVL(context),
                                      //   version: QrVersions.auto,
                                      //   size: 140.0,
                                      // )
                                    ],
                                  )))



                      ),
                      SizedBox(height: 10,),
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

  getContent(size,context){
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
                            children: [Text("احصائيات الكاشير ", style: getStyle(color: Colors.black, fontSize: textSize)
                            )],
                          ),
                          const SizedBox(height: 10,),
        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Text("Cashier Statistics ", style: getStyle(color: Colors.black, fontSize: textSize)
                            )],
                          ),
                          const SizedBox(height: 10,),

                          // Container(
                          //   width: double.infinity,
                          //   alignment: Alignment.center,
                          //   decoration: BoxDecoration(
                          //     color: Colors.grey.shade300,
                          //   ),
                          //   padding: const EdgeInsets.only(top: 3,bottom: 3),
                          //   child:Text("مؤسسة وعد الوان", style: getStyle(color: Colors.black, fontSize: textSize)),),

                          // const SizedBox(height: 10,),
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
                                  // width: 50,
                                  alignment: Alignment.centerLeft,
                                  child:  Text(
                                    "Warehouse",
                                    style: getStyle(color: Colors.black, fontSize: textSize),
                                  )),  Container(
                                  width: 90,
                                  alignment: Alignment.center,
                                  child:Text(
                                    " ",
                                    style: getStyle(color: Colors.black, fontSize: textSize),
                                  )),  Container(
                                  width: 50,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "المخزن",textAlign: TextAlign.center,
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
                                    "Biller",
                                    style: getStyle(color: Colors.black, fontSize: textSize),
                                  )),  Container(
                                  width: 80,
                                  alignment: Alignment.center,
                                  child:Text(
                                      LoginCubit.get(context).userNamevar,textAlign: TextAlign.center,
                                      style: getStyle(color: Colors.black, fontSize: textSize-1)
                                  )),  Container(
                                  width: 55,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "الكاشير",textAlign: TextAlign.right,
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
                                    "Date",
                                    style:getStyle(color: Colors.black, fontSize: textSize-1),
                                  )),
                              Container(
                                  // width: 80,
                                  alignment: Alignment.center,
                                  child:Text(
                                    DateFormat("yyyy-MM-dd HH:mm").format(DateTime.now()).toString(),textAlign: TextAlign.center,
                                    // invoiceModel!.invoiceData![0].referenceNo!,textAlign: TextAlign.center,
                                    style:  getStyle(color: Colors.black, fontSize: textSize-1),
                                  )),
                              Container(
                                  width: 60,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "التاريخ",textAlign: TextAlign.right,
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
                          const Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  // width: 100,
                                  alignment: Alignment.center,
                                  child:Text(
                                    LoginCubit.get(context).invoiceNumbers.toString(),textAlign: TextAlign.center,

                                    // invoiceModel!.invoiceData![0].date!,textAlign: TextAlign.center,
                                    style: getStyle(color: Colors.black, fontSize: textSize-1),
                                  )),  Container(
                                  // width: 45,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                      "عدد الفواتير",textAlign: TextAlign.center,
                                      style: getStyle(color: Colors.black, fontSize: textSize-1)
                                  )),

                            ],),
                          const Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),

                          const SizedBox(
                            height: 5,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  // width: 100,
                                  alignment: Alignment.center,
                                  child:Text(
                                    "0",textAlign: TextAlign.center,

                                    // invoiceModel!.invoiceData![0].referenceNo!,textAlign: TextAlign.center,
                                    style: getStyle(color: Colors.black, fontSize: textSize-1),
                                  )),  Container(
                                  // width: 40,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "عدد الفواتير المرتجع",textAlign: TextAlign.center,
                                    style: getStyle(color: Colors.black, fontSize: textSize-1),
                                  )),

                            ],),
                          const Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),


                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  // width: 90,
                                  alignment: Alignment.center,
                                  child:Text(
                                    // LoginCubit.get(context).cashInHandController.text,textAlign: TextAlign.center,
                                    double.parse(LoginCubit.get(context).closeCashierDetailsResponse!.cashInHand!).toStringAsFixed(2),textAlign: TextAlign.center,

                                    // invoiceModel!.invoiceData![0].customer!,textAlign: TextAlign.center,
                                    style: getStyle(color: Colors.black, fontSize: textSize-1),
                                  )),
                              Container(
                                  // width: 50,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "المبلغ عند فتح الكاشير",textAlign: TextAlign.center,
                                    style: getStyle(color: Colors.black, fontSize: textSize-1),
                                  )),

                            ],),
                          const Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),


                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  // width: 90,
                                  alignment: Alignment.center,
                                  child:Text(
                                    LoginCubit.get(context).startDate!,textAlign: TextAlign.center,

                                    // invoiceModel!.invoiceData![0].customer!,textAlign: TextAlign.center,
                                    style: getStyle(color: Colors.black, fontSize: textSize-1),
                                  )),
                              Container(
                                  // width: 50,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "تاريخ فتح الكاشير",textAlign: TextAlign.center,
                                    style: getStyle(color: Colors.black, fontSize: textSize-1),
                                  )),

                            ],),
                          const Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),

                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  // width: 80,
                                  alignment: Alignment.center,
                                  child:Text(
                                    LoginCubit.get(context).endDate!,textAlign: TextAlign.left,

                                    // invoiceModel!.invoiceData![0].items![0].tax!,textAlign: TextAlign.left,
                                    style: getStyle(color: Colors.black, fontSize: textSize-1),
                                  )),
                              Container(
                                  // width: 55,
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    "تاريخ اغلاق الكاشير",textAlign: TextAlign.right,
                                    style: getStyle(color: Colors.black, fontSize: textSize-1),
                                  )),

                            ],),
                          const Divider(
                            thickness: 2,
                            color: Colors.black,
                          ),


                        ])),
                Container(
                  alignment: Alignment.center,
                  height: 20,
                  width: width,
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LoginCubit.get(context).totalCash,

                        // invoiceModel!.invoiceData![0].id!,
                        style: getStyle(color: Colors.black, fontSize: textSize-1),
                      ),
                      Text(
                        "اجمالى المبيعات",
                        style: getStyle(color: Colors.black, fontSize: textSize-1),
                      ),
                    ],),
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.black,
                ),

                const SizedBox(height:5,),
                Container(
                  alignment: Alignment.center,
                  height: 20,
                  width: width,
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "0",

                        // invoiceModel!.invoiceData![0].id!,
                        style: getStyle(color: Colors.black, fontSize: textSize-1),
                      ),
                      Text(
                        " ",
                        style: getStyle(color: Colors.black, fontSize: textSize-1),
                      ),
                    ],),
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.black,
                ),

                const SizedBox(height:5,),
                Container(
                  alignment: Alignment.center,
                  height: 20,
                  width: width,
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "0",

                        // invoiceModel!.invoiceData![0].id!,
                        style: getStyle(color: Colors.black, fontSize: textSize-1),
                      ),
                      Text(
                        " هنجر استيشن",
                        style: getStyle(color: Colors.black, fontSize: textSize-1),
                      ),
                    ],),
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.black,
                ),

                const SizedBox(height:5,),
                Container(
                  alignment: Alignment.center,
                  height: 20,
                  width: width,
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LoginCubit.get(context).totalCash,

                        // invoiceModel!.invoiceData![0].id!,
                        style: getStyle(color: Colors.black, fontSize: textSize-1),
                      ),
                      Text(
                        " اجمالى المبيعات نقدا",
                        style: getStyle(color: Colors.black, fontSize: textSize-1),
                      ),
                    ],),
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.black,
                ),

                const SizedBox(height:5,),
                Container(
                  alignment: Alignment.center,
                  height: 20,
                  width: width,
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "0",

                        // invoiceModel!.invoiceData![0].id!,
                        style: getStyle(color: Colors.black, fontSize: textSize-1),
                      ),
                      Text(
                        " اجمالى مبيعات الشبكات",
                        style: getStyle(color: Colors.black, fontSize: textSize-1),
                      ),
                    ],),
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.black,
                ),

                const SizedBox(height:5,),
                Container(
                  alignment: Alignment.center,
                  height: 20,
                  width: width,
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "0",

                        // invoiceModel!.invoiceData![0].id!,
                        style: getStyle(color: Colors.black, fontSize: textSize-1),
                      ),
                      Text(
                        " اجمالى مبيعات الاجل",
                        style: getStyle(color: Colors.black, fontSize: textSize-1),
                      ),
                    ],),
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.black,
                ),

                const SizedBox(height:5,),
                Container(
                  alignment: Alignment.center,
                  height: 20,
                  width: width,
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "0",

                        // invoiceModel!.invoiceData![0].id!,
                        style: getStyle(color: Colors.black, fontSize: textSize-1),
                      ),
                      Text(
                        " اجمالى المرتجعات",
                        style: getStyle(color: Colors.black, fontSize: textSize-1),
                      ),
                    ],),
                ),
                const Divider(
                  thickness: 2,
                  color: Colors.black,
                ),

                const SizedBox(height:5,),
                Container(
                  alignment: Alignment.center,
                  height: 20,
                  width: width,
                  child:
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ((double.parse(LoginCubit.get(context).totalCash))+(LoginCubit.get(context).cashInHand)).toString(),

                        // invoiceModel!.invoiceData![0].id!,
                        style: getStyle(color: Colors.black, fontSize: textSize-1),
                      ),
                      Text(
                        " اجمالى النقدية فى الصندوق",
                        style: getStyle(color: Colors.black, fontSize: textSize-1),
                      ),
                    ],),
                ),

                const SizedBox(height:5,),

                //
                // const Divider(
                //   color: Colors.black,
                // ),
                // QrImage(
                //   data: QrCodeTVL(context),
                //   version: QrVersions.auto,
                //   size: 140.0,
                // )
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
    List<int> getvat_no=utf8.encode(vatNo.toString());
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
