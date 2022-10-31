import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/View/BlutothPrinter.dart';
import 'package:ping_discover_network_forked/ping_discover_network_forked.dart';

class ChoosePrinterScreen extends StatefulWidget {
  static const routeName="ChoosePrinterScreen";
  Uint8List? screenshotController ;
   ChoosePrinterScreen({this.screenshotController});

  @override
  State<ChoosePrinterScreen> createState() => _ChoosePrinterScreenState();
}

class _ChoosePrinterScreenState extends State<ChoosePrinterScreen> {
  TextEditingController controller =TextEditingController();
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

                      height: 40,
                      width: 125,
                      child: InkWell(
                        onTap: () async{
                          final info = NetworkInfo();
                           String? ip = await info.getWifiIP();
                          final String subnet = ip!.substring(0, ip.lastIndexOf('.'));
                          final int port = 9100;

                          final stream = NetworkAnalyzer.discover2(subnet, port);
                          stream.listen((NetworkAddress addr) {
                            if (addr.exists) {
                              print('Found device: ${addr.ip}');
                              controller.text=addr.ip;

                            }
                          });


                        },
                        child: TextField(
                          controller: controller,
                          readOnly: true,

                          style: GoogleFonts.notoKufiArabic(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          onChanged: (value) {

                          },


                          decoration: InputDecoration(
                            hintText: "البحث عن Ip",
                            hintStyle:  GoogleFonts.notoKufiArabic(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),

                          ),
                        ),
                      ),
                    ),

                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("طابعة بلوتوث",style: GoogleFonts.notoKufiArabic(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                    Container(
                      // padding: const EdgeInsets.only(left: 10),
                      height: 40,
                      width: 160,
                      child:                     ElevatedButton(
                        child:  Text(
                          'اعدادات الطابعة',
                          style: GoogleFonts.notoKufiArabic(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        onPressed: () {
                       Navigator.of(context).pushNamed(BluePrinter.routeName);
                        },
                      ),

                    ),

                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("طابعة sonomi",style: GoogleFonts.notoKufiArabic(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                    Container(
                      // padding: const EdgeInsets.only(left: 10),
                      height: 30,
                      width: 160,
                      child:                     ElevatedButton(
                        child:  Text(
                          'طباعة',
                          style: GoogleFonts.notoKufiArabic(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                        ),
                        onPressed: () {
LoginCubit.get(context).printsonomi(widget.screenshotController)       ;               },
                      ),

                    ),


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
}
