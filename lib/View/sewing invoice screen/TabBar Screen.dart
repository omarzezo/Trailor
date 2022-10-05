import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/View/sewing%20invoice%20screen/Size%20Screen.dart';
import 'package:omar/View/sewing%20invoice%20screen/custom_table_sweing.dart';
import 'package:omar/View/sewing%20invoice%20screen/sweing_screen.dart';

import '../../constant/constant.dart';
import 'Widgets.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 6,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children:  [
                  TabBar(
                    // isScrollable: true,
                    unselectedLabelColor: Colors.grey,
                      labelColor: Colors.purple,
                      unselectedLabelStyle: const TextStyle(
                        color: Colors.green
                      ),
                      // overlayColor: MaterialStateProperty.all(Colors.green),
                      indicator: BoxDecoration(
                        border: Border.all(color: Colors.transparent)
                      ),
                      tabs: [
                    Column(
                      children:  [
                        const Icon(Icons.add_to_photos_rounded,size: 20),
                         const SizedBox(height: 10,),
                        Text('اضافة',style: GoogleFonts.notoKufiArabic(
                            color: MyConstant().greenColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 8),)
                      ],
                    ),
                    Column(
                      children:  [
                        const Icon(Icons.print,size: 20,),
                        const SizedBox(height: 10,),
                        Text('طباعة فاتورة',style: GoogleFonts.notoKufiArabic(
                            color: MyConstant().greenColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 8),)
                      ],
                    ),
                    Column(
                      children:  [
                        const Icon(Icons.mode_edit_outlined,size: 20,),
                        const SizedBox(height: 10,),
                        Text('تعديل مقاسات',style: GoogleFonts.notoKufiArabic(
                            color: MyConstant().greenColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 8),)
                      ],
                    ),
                    Column(
                      children:  [
                        const Icon(Icons.tv_outlined,size: 20,),
                        const SizedBox(height: 10,),
                        Text('عرض',style: GoogleFonts.notoKufiArabic(
                            color: MyConstant().greenColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 8),)
                      ],
                    ),
                    Column(
                      children:  [
                        const Icon(Icons.clean_hands_sharp,size: 20,),
                        const SizedBox(height: 10,),
                        Text('دفعة نقدية',style: GoogleFonts.notoKufiArabic(
                            color: MyConstant().greenColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 8),)
                      ],
                    ),
                    Column(
                          children:  [
                            const Icon(Icons.subdirectory_arrow_left,size: 20,),
                            const SizedBox(height: 10,),
                            Text('مرتجع',style: GoogleFonts.notoKufiArabic(
                                color: MyConstant().greenColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 8),)
                          ],
                        ),
                  ]),
                  const Expanded(
                    child: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                        children: [
                      SewingScreen(),
                      SizeScreen(),
                      SewingScreen(),
                      SewingScreen(),
                      CustomTableSweing(),
                      SewingScreen(),
                    ]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}