import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/View/BluetoothPrinterSearch.dart';
import 'package:omar/constant/constant.dart';
import 'package:responsive_framework/responsive_value.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import '../../SharedPreferencesHelper.dart';



class SettingScreen extends StatefulWidget {

  @override
  State<SettingScreen> createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingScreen> {


  int printerType=-1;
  String printerText="";
  String sizeText="",ipPrinter="";
  int pageSize=0;
  TextEditingController ipPntroller=TextEditingController();
  @override
  void initState() {

      getPrinterType();

    super.initState();
  }

  Future getPrinterType() async {
    printerType =(await SharedPreferencesHelper.getPrinterType())!;
    ipPrinter =(await SharedPreferencesHelper.getIpPrinter())!;
    ipPntroller.text=ipPrinter!=null?ipPrinter:"";
    if(printerType==1){
      printerText="طابعة bluetooth";
    }if(printerType==2){
      printerText="طابعة wifi";
    }if(printerType==3){
      printerText="طابعة sunmi";
    }
    pageSize =(await SharedPreferencesHelper.getPageSize())!;
    print("pageSize>>"+pageSize.toString());
    if(pageSize==80){
      sizeText="80";
    }if(pageSize==58){
      sizeText="58";
    }
    setState(() {});
  }

  Widget buildTile(String endColor,String startColor , String icon, String title, String subtitle, BuildContext context,) {
    double width = MediaQuery.of(context).size.width;
    return
      Column(
        children: [
          Container(
              padding: const EdgeInsets.only(left: 25,right: 25,top: 30,bottom: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: MyConstant().purpleColor,
                      blurRadius: 1.0,
                      offset: const Offset(10.0, 8.0))
                ],
                borderRadius:const BorderRadius.only(
                  bottomRight: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                  topRight: Radius.circular(80),
                  topLeft: Radius.circular(12),
                ),
                border: Border.all(width: 1, color: MyConstant().purpleColor),
              ),
              child: Center(
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFAFAFA).withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Align(
                    child: SizedBox(
                      width: 80,
                      height: 80,
                      child: Image.asset(icon,fit: BoxFit.fill,),
                    ),
                  ),
                ),
              )
          ),
          const SizedBox(height: 16,),
          Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              color: MyConstant().purpleColor,
              fontFamily: 'regular',
            ),
            textAlign: TextAlign.center,
          ),
        ],
      );

//      ],
//    );
  }




  @override
  Widget build(BuildContext context) {
    final printerContainer =Container(
        child: Material(
            child: Container(
              margin: const EdgeInsets.fromLTRB(4,4,4,4),
              decoration: BoxDecoration(
                border: Border.all(color: MyConstant().purpleColor),
                color: const Color(0xffffffff),
                borderRadius: const BorderRadius.all(
                    Radius.circular(10.0) //                 <--- border radius here
                ),
              ),
              child:  Theme(
                data: Theme.of(context).copyWith(accentColor: Colors.black),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height / 16,
                        // height: 40,
                        width: double.infinity,
                        color: MyConstant().purpleColor,
                        padding:
                        const EdgeInsets.only(left: 30, right: 20),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text('اعدادات الطابعة',
                              style: GoogleFonts.notoKufiArabic(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "نوع الطابعة",
                              style: GoogleFonts.notoKufiArabic(
                                  color:  MyConstant().purpleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)
                          ),
                          const SizedBox(height: 10,),

                      ResponsiveVisibility( replacement:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width*0.2,
                              padding: const EdgeInsets.all(4),
                              height: 40,
                              decoration:  BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(0)),
                                border: Border.all(width: 1, color: MyConstant().greenColor),
                              ),
                              child: Text(printerText,style: GoogleFonts.notoKufiArabic(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                              )),
                          const SizedBox(width: 10,),
                          InkWell(
                            onTap: () async{

                                await SharedPreferencesHelper.setPrinterType(1);
                                printerType=1;
                                printerText="طابعة bluetooth";
                               setState(() {});
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width*0.2,
                                padding: const EdgeInsets.all(4),
                                height: 40,
                                decoration:  BoxDecoration(
                                  color: printerType==1?MyConstant().purpleColor:Colors.white,
                                  border: Border.all(width: 1, color: MyConstant().purpleColor),
                                ),
                                child: Text("طابعة bluetooth",style: GoogleFonts.notoKufiArabic(
                                    color: printerType==1?Colors.white:Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                )),
                          ),
                          const SizedBox(width: 10,),
                          InkWell(
                            onTap: () async{
                                await SharedPreferencesHelper.setPrinterType(2);
                                printerType=2;
                                printerText="طابعة Wifi";
                              setState(() { });
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width*0.2,
                                padding: const EdgeInsets.all(4),
                                height: 40,
                                decoration:  BoxDecoration(
                                  color: printerType==2?MyConstant().purpleColor:Colors.white,
                                  border: Border.all(width: 1, color: MyConstant().purpleColor),
                                ),
                                child: Text("طابعة Wifi",style: GoogleFonts.notoKufiArabic(
                                    color:printerType==2?Colors.white: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                )),
                          ),
                          const SizedBox(width: 10,),
                          InkWell(
                            onTap: () async{
                                await SharedPreferencesHelper.setPrinterType(3);
                                printerType=3;
                                printerText="طابعة Sunmi";
                                setState(() {});
                            },
                            child: Container(
                                width: MediaQuery.of(context).size.width*0.2,
                                padding: const EdgeInsets.all(4),
                                height: 40,
                                decoration:  BoxDecoration(
                                  color:printerType==3?MyConstant().purpleColor: Colors.white,
                                  border: Border.all(width: 1, color: MyConstant().purpleColor),
                                ),
                                child: Text("طابعة Sunmi",style: GoogleFonts.notoKufiArabic(
                                    color:printerType==3?Colors.white: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                )),
                          )
                        ],
                      ),
                        hiddenWhen: const [Condition.largerThan(name: MOBILE)],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width*0.60,
                                  padding: const EdgeInsets.all(4),
                                  height: 40,
                                  decoration:  BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(0)),
                                    border: Border.all(width: 1, color: MyConstant().greenColor),
                                  ),
                                  child: Text(printerText,style: GoogleFonts.notoKufiArabic(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  )),
                              const SizedBox(width: 10,height: 20,),
                              InkWell(
                                onTap: () async{
                                    await SharedPreferencesHelper.setPrinterType(1);
                                    printerType=1;
                                    printerText="طابعة bluetooth";
                                    setState(() {});
                                },
                                child: Container(
                                    width: MediaQuery.of(context).size.width*0.60,
                                    padding: const EdgeInsets.all(4),
                                    height: 40,
                                    decoration:  BoxDecoration(
                                      color: printerType==1?MyConstant().purpleColor:Colors.white,
                                      border: Border.all(width: 1, color: MyConstant().purpleColor),
                                    ),
                                    child: Text("طابعة bluetooth",style: GoogleFonts.notoKufiArabic(
                                        color: printerType==1?Colors.white:Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    )),
                              ),
                              printerType==1?InkWell(
                                onTap: () async{
                                  Navigator.of(context).push(createRoute(BluetoothPrinterSearch()));
                                },
                                child: Container(
                                    width: MediaQuery.of(context).size.width*0.60,
                                    padding: const EdgeInsets.all(4),
                                    // height: 40,
                                    child: Column(
                                      children: [
                                        Text("يرجي عمل بحث عن  Bluetooth ",style: GoogleFonts.notoKufiArabic(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                        Text("من فضلك اضغط هنا",style: GoogleFonts.notoKufiArabic(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)
                                        ),
                                      ],
                                    ),),
                              ):SizedBox.shrink(),
                              const SizedBox(width: 10,height: 20,),
                              InkWell(
                                onTap: () async {

                                   await SharedPreferencesHelper.setPrinterType(2);
                                    printerType=2;
                                    printerText="طابعة Wifi";
                                    setState(() { });
                                },
                                child: Container(
                                    width: MediaQuery.of(context).size.width*0.60,
                                    padding: const EdgeInsets.all(4),
                                    height: 40,
                                    decoration:  BoxDecoration(
                                      color: printerType==2?MyConstant().purpleColor:Colors.white,
                                      border: Border.all(width: 1, color: MyConstant().purpleColor),
                                    ),
                                    child: Text("طابعة Wifi",style: GoogleFonts.notoKufiArabic(
                                        color:printerType==2?Colors.white: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    )),
                              ),

                              const SizedBox(width: 10,height: 10,),

                            if(printerType==2)  Container(
                              height: 50,
                                  width: MediaQuery.of(context).size.width*0.60,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                      border: Border.all(color: MyConstant().purpleColor),
                                    borderRadius: new BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                      padding:
                                      EdgeInsets.only(left: 15, right: 15, top: 0),
                                      child: TextFormField(
                                        controller: ipPntroller,
                                          style: GoogleFonts.notoKufiArabic(
                                          color:printerType==3?Colors.white: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                          onChanged: (value) {
                                            SharedPreferencesHelper.setIpPrinter(value);
                                          },
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'الرجاء ادخال IP الطابعة',
                                          )))),
                              const SizedBox(width: 10,height: 20,),
                              InkWell(
                                onTap: () async{

                                    await SharedPreferencesHelper.setPrinterType(3);
                                    printerType=3;
                                    printerText="طابعة Sunmi";
                                    setState(() {});
                                },
                                child: Container(
                                    width: MediaQuery.of(context).size.width*0.60,
                                    padding: const EdgeInsets.all(4),
                                    height: 40,
                                    decoration:  BoxDecoration(
                                      color:printerType==3?MyConstant().purpleColor: Colors.white,
                                      border: Border.all(width: 1, color: MyConstant().purpleColor),
                                    ),
                                    child: Text("طابعة Sunmi",style: GoogleFonts.notoKufiArabic(
                                        color:printerType==3?Colors.white: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    )),
                              )
                            ],
                          ),),


                          const SizedBox(height: 40,),
                          Text(
                              "حجم الصفحة",
                              style: GoogleFonts.notoKufiArabic(
                                  color: MyConstant().purpleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)
                          ),
                          const SizedBox(height: 10,),
                          ResponsiveVisibility( replacement:
                          Row(
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width*0.2,
                                  padding: const EdgeInsets.all(4),
                                  height: 40,
                                  decoration:  BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(Radius.circular(0)),
                                    border: Border.all(width: 1, color: MyConstant().greenColor),
                                  ),
                                  child: Text(sizeText,style: GoogleFonts.notoKufiArabic(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  )),
                              const SizedBox(width: 20,height: 20,),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    SharedPreferencesHelper.setPageSize(80);
                                    pageSize=1;
                                    sizeText="80";
                                  });
                                },
                                child: Container(
                                    padding: const EdgeInsets.only(left: 10,right: 10,top: 4,bottom: 4),
                                    height: 40,
                                    decoration:  BoxDecoration(
                                      color: pageSize==1?MyConstant().purpleColor:Colors.white,
                                      border: Border.all(width: 1, color: MyConstant().purpleColor),
                                    ),
                                    child: Text("80",style: GoogleFonts.notoKufiArabic(
                                        color: pageSize==1?Colors.white:Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    )),
                              ),
                              const SizedBox(width: 20,height: 20,),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    SharedPreferencesHelper.setPageSize(58);
                                    pageSize=2;
                                    sizeText="58";
                                  });
                                },
                                child: Container(
                                    padding: const EdgeInsets.only(left: 10,right: 10,top: 4,bottom: 4),
                                    height: 40,
                                    decoration:  BoxDecoration(
                                      color: pageSize==2?MyConstant().purpleColor:Colors.white,
                                      border: Border.all(width: 1, color: MyConstant().purpleColor),
                                    ),
                                    child: Text("58",style: GoogleFonts.notoKufiArabic(
                                        color: pageSize==2?Colors.white:Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    )),
                              ),
                            ],
                          ),
                            hiddenWhen: const [Condition.largerThan(name: MOBILE)],
                            child: Column(
                              children: [
                                Container(
                                    width: MediaQuery.of(context).size.width*0.40,
                                    padding: const EdgeInsets.all(4),
                                    height: 40,
                                    decoration:  BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(Radius.circular(0)),
                                      border: Border.all(width: 1, color: MyConstant().greenColor),
                                    ),
                                    child: Text(sizeText,style: GoogleFonts.notoKufiArabic(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    )),
                                const SizedBox(width: 20,height: 20,),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      SharedPreferencesHelper.setPageSize(80);
                                      pageSize=1;
                                      sizeText="80";
                                    });
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.only(left: 10,right: 10,top: 4,bottom: 4),
                                      height: 40,
                                      width: MediaQuery.of(context).size.width*0.40,
                                      decoration:  BoxDecoration(
                                        color: pageSize==1?MyConstant().purpleColor:Colors.white,
                                        border: Border.all(width: 1, color: MyConstant().purpleColor),
                                      ),
                                      child: Text("80",style: GoogleFonts.notoKufiArabic(
                                          color: pageSize==1?Colors.white:Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                      )),
                                ),
                                const SizedBox(width: 20,height: 20,),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      SharedPreferencesHelper.setPageSize(58);
                                      pageSize=2;
                                      sizeText="58";
                                    });
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.only(left: 10,right: 10,top: 4,bottom: 4),
                                      height: 40,
                                      width: MediaQuery.of(context).size.width*0.40,
                                      decoration:  BoxDecoration(
                                        color: pageSize==2?MyConstant().purpleColor:Colors.white,
                                        border: Border.all(width: 1, color: MyConstant().purpleColor),
                                      ),
                                      child: Text("58",style: GoogleFonts.notoKufiArabic(
                                          color: pageSize==2?Colors.white:Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                      )),
                                ),
                              ],
                            ),
                          ),



                        ],


                      ),


                    )

                  ],
                ),
              ),
            )));

    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            // toolbarHeight: 100,
            backgroundColor: Colors.purple,
            title: Text("اعدادات الطابعة ",style: GoogleFonts.notoKufiArabic(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  printerContainer,
                  const SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        child: OutlinedButton(
                          style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(
                                MyConstant().purpleColor),
                          ),
                          onPressed: () async {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 14,right: 14),
                            child: Text('حفظ',
                                style: GoogleFonts.notoKufiArabic(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        ));
  }


  // SanmiPrint(Uint8List byte)async{
  //   await MaxxSunmiPrinter.initializePrinter();
  //   String base64String = base64Encode(byte);
  //   await MaxxSunmiPrinter.printImage(base64String);
  // }
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

// class MaxxSunmiPrinter {
//   static const channel = MethodChannel('maxx_sunmi_printer');
//
//   static const String INIT_PRINTER = "initPrinter";
//   static const String PRINT_TEXT = "printText";
//   static const String PAPER_FEED = "paperFeed";
//   static const String PRINT_TABLE = "printTable";
//   static const String PRINT_IMAGE = "printImage";
//   static const String PRINT_BARCODE = "printBarcode";
//   static const String PRINT_QR_CODE = "printQrCode";
//   static const IS_LABEL_MODE = "isLabelMode";
//   static const String PRINT_LABEL = "printLabel";
//   static const String PRINT_STICKER = "printSticker";
//   static const String BOLD_ON = "boldOn";
//   static const String BOLD_OFF = "boldOff";
//   static const String UNDERLINE_ON = "underlineOn";
//   static const String UNDERLINE_OFF = "underlineOff";
//
//   static Future<String> initializePrinter() async {
//     try {
//       print("intisonomi");
//       return await channel.invokeMethod(INIT_PRINTER);
//
//     } catch (ex) {
//       return "[initializePrinter] ${ex.toString()}";
//     }
//   }
//
//   static Future<String> printText(String text, {SunmiStyles styles = const SunmiStyles(), int linesAfter = 0}) async {
//     try {
//       final arguments = {
//         "text": text,
//         "size": styles.size.value,
//         "isBold": styles.isBold,
//         "isUnderLine": styles.isUnderLine,
//         "alignment": styles.alignment.value,
//         "typeface": styles.font.value,
//         "linesAfter": linesAfter,
//       };
//
//       return await channel.invokeMethod(PRINT_TEXT, arguments);
//     } catch (ex) {
//       return "[printText]\n${ex.toString()}";
//     }
//   }
//
//   static Future<void> paperFeed({int number = 1}) async {
//     final arguments = {"number": number};
//     await channel.invokeMethod(PAPER_FEED, arguments);
//   }
//
//   static Future<void> cutPaper() async {
//     await channel.invokeMethod("cutPaper");
//   }
//
//   static Future<void> printTextLine({String ch = '-', int len = 31}) async {
//     await printText(List.filled(len, ch[0]).join());
//   }
//
//   static Future<void> boldOn() async {
//     await channel.invokeMethod(BOLD_ON);
//   }
//
//   static Future<void> boldOff() async {
//     await channel.invokeMethod(BOLD_OFF);
//   }
//
//   static Future<void> underlineOn() async {
//     await channel.invokeMethod(UNDERLINE_ON);
//   }
//
//   static Future<void> underlineOff() async {
//     await channel.invokeMethod(UNDERLINE_OFF);
//   }
//
//   static Future<void> printTable({
//     required List<SunmiCol> cols,
//     bool isBold = false,
//     bool isUnderLine = false,
//     SunmiSize size = SunmiSize.md,
//     int linesAfter = 0,
//   }) async {
//     final isSumValid = cols.fold(0, (int sum, col) => sum + col.width) == 12;
//     if (!isSumValid) {
//       throw Exception('Total columns width must be equal to 12');
//     }
//
//     final colsJson = List<Map<String, String>>.from(cols.map<Map<String, String>>((SunmiCol col) => col.toJson()));
//
//     final arguments = {
//       "cols": json.encode(colsJson),
//       "isBold": isBold,
//       "isUnderLine": isUnderLine,
//       "size": size.value,
//       "linesAfter": linesAfter,
//     };
//
//     await channel.invokeMethod(PRINT_TABLE, arguments);
//   }
//
//   static Future<void> printImage(String base64, {SunmiAlign align = SunmiAlign.center}) async {
//     final arguments = {"base64": base64, "alignment": align.value};
//     print("print image sonomi");
//
//     await channel.invokeMethod(PRINT_IMAGE, arguments);
//   }
//
//   static Future<void> printBarcode(
//       String text, {
//         SunmiTypeBarCode encode = SunmiTypeBarCode.CODE128A,
//         SunmiTypePositionBarcode position = SunmiTypePositionBarcode.uponBarcode,
//         int height = 162,
//         int width = 2,
//       }) async {
//     final arguments = {
//       "text": text,
//       "encode": encode.value,
//       "position": position.value,
//       "height": height,
//       "width": width,
//     };
//     await channel.invokeMethod(PRINT_BARCODE, arguments);
//   }
//
//   static Future<void> printQrCode(
//       String text, {
//         SunmiQrCodePrintSize printSize = SunmiQrCodePrintSize.size8,
//         SunmiQrCodeErrorLevel errorLevel = SunmiQrCodeErrorLevel.errorLevel3,
//       }) async {
//     final arguments = {"text": text, "printSize": printSize.value, "errorLevel": errorLevel.value};
//     await channel.invokeMethod(PRINT_QR_CODE, arguments);
//   }
//
//   static Future<String> isLabelMode() async {
//     final arguments = {"text": ""};
//     String result = await channel.invokeMethod(IS_LABEL_MODE, arguments);
//     return result;
//   }
//
//   static Future<String> printLabel({
//     required String barcode,
//     required String price,
//     String description = '',
//     int copy = 1,
//     SunmiTypeBarCode encodeBarcode = SunmiTypeBarCode.CODE128A,
//     SunmiTypePositionBarcode positionBarcode = SunmiTypePositionBarcode.beneathBarcode,
//     int heightBarcode = 90,
//     int widthBarcode = 2,
//   }) async {
//     String result = await isLabelMode();
//
//     if (result != "success") {
//       return result;
//     }
//
//     final arguments = {
//       "barcode": barcode,
//       "price": price,
//       "description": description,
//       "copy": copy,
//       "encodeBarcode": encodeBarcode.value,
//       "positionBarcode": positionBarcode.value,
//       "heightBarcode": heightBarcode,
//       "widthBarcode": widthBarcode,
//     };
//     await channel.invokeMethod(PRINT_LABEL, arguments);
//
//     return "success";
//   }
//
//   static Future<String> printSticker({
//     required List<String> lineContents,
//     SunmiStyles styles = const SunmiStyles(),
//     int copy = 1,
//     int lineWrapTop = 1,
//     int lineWrapBottom = 1,
//   }) async {
//     String result = await isLabelMode();
//
//     if (result != "success") {
//       return result;
//     }
//
//     final arguments = {
//       "lineContents": lineContents,
//       "copy": copy,
//       "size": styles.size.value,
//       "isBold": styles.isBold,
//       "isUnderLine": styles.isUnderLine,
//       "alignment": styles.alignment.value,
//       "lineWrapTop": lineWrapTop,
//       "lineWrapBottom": lineWrapBottom,
//     };
//     await channel.invokeMethod(PRINT_STICKER, arguments);
//
//     return "success";
//   }
// }

class SunmiFont {
  const SunmiFont._internal(this.value);
  final String value;
  static const defaultFont = SunmiFont._internal("test.ttf");
  static const khmerOs = SunmiFont._internal("test.ttf");
}

// class SunmiAlign {
//   const SunmiAlign._internal(this.value);
//   final int value;
//   static const left = SunmiAlign._internal(0);
//   static const center = SunmiAlign._internal(1);
//   static const right = SunmiAlign._internal(2);
// }

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
// class SunmiCol {
//   SunmiCol({
//     this.text = '',
//     this.width = 2,
//     this.alignment = SunmiAlign.left,
//   }) {
//     if (width < 1 || width > 12) {
//       throw Exception('Column width must be between 1..12');
//     }
//   }
//
//   String text;
//   int width;
//   SunmiAlign alignment;
//
//   Map<String, String> toJson() {
//     return {
//       "text": text,
//       "width": width.toString(),
//       "align": alignment.value.toString(),
//     };
//   }
// }
// class SunmiStyles {
//   const SunmiStyles({
//     this.isBold = false,
//     this.isUnderLine = false,
//     this.alignment = SunmiAlign.left,
//     this.size = SunmiSize.md,
//     this.font = SunmiFont.defaultFont,
//   });
//
//   final bool isBold;
//   final bool isUnderLine;
//   final SunmiAlign alignment;
//   final SunmiSize size;
//   final SunmiFont font;
// }
