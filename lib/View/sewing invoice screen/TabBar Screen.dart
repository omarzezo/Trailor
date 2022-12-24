import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/View/Data%20Table/custom%20table.dart';
import 'package:omar/View/present_all_tables_screen.dart';
import 'package:omar/View/sewing%20invoice%20screen/change_size_screen.dart';
import 'package:omar/View/sewing%20invoice%20screen/new_add_customer_screen.dart';
import 'package:omar/View/sewing%20invoice%20screen/return_items_screen.dart';
import 'package:omar/View/sewing%20invoice%20screen/sweing_screen.dart';
import 'package:omar/constant/appstrings.dart';
import '../../constant/constant.dart';
import '../AllCustomersHomeScreen.dart';
import 'package:flutter/services.dart' as p;

class TabBarScreen extends StatefulWidget {
  static const routeName = "TabBarScreen";

  const TabBarScreen({Key? key}) : super(key: key);

  @override
  _TabBarScreenState createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialIndex=0;
    setScreen(0);
  }
 static int initialIndex=0;
  Widget screen= Container();
   void setScreen (int index){
    if(index==0){
      initialIndex=0;
       screen= AllCustomersHomeScreen();
    }else if(index==1){
      initialIndex=1;
     screen= SewingScreen();
    }else if(index==2){
      initialIndex=2;
     screen= CustomTable();
    }else if(index==3){
      initialIndex=3;
     screen=ChangeSizeScreen();
    }else if(index==4){
      initialIndex=4;
     screen= PresentAllTablesScreen();
    }else if(index==5){
      initialIndex=5;
      screen= ReturnItemsScreen();}
    else if(index==6){
      initialIndex=6;
      screen= NewAddCustomerScreen();}
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: p.TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: SingleChildScrollView(
              child: Column(

                children:  [
                  Container(
                    height: 100,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              setScreen(0);
                            },
                            child: Column(
                              children:  [
                                Icon(Icons.add_to_photos_rounded,size: 20,color: initialIndex==0?MyConstant().purpleColor:Colors.grey,),
                                const SizedBox(height: 10,),
                                Text(AppStrings.customers.tr(),style: GoogleFonts.notoKufiArabic(
                                    color: MyConstant().greenColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),)
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              setScreen(1);
                            },
                            child: Column(
                              children:  [
                                Icon(Icons.add_to_photos_rounded,size: 20,color: initialIndex==1?MyConstant().purpleColor:Colors.grey,),
                                const SizedBox(height: 10,),
                                Text(AppStrings.add.tr(),style: GoogleFonts.notoKufiArabic(
                                    color: MyConstant().greenColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),)
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              setScreen(2);
                            },
                            child: Column(
                              children:  [
                                Icon(Icons.print,size: 20,color: initialIndex==2?MyConstant().purpleColor:Colors.grey,),
                                const SizedBox(height: 10,),
                                Text(AppStrings.printInvoice.tr(),style: GoogleFonts.notoKufiArabic(
                                    color: MyConstant().greenColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),textAlign: TextAlign.center,)
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              setScreen(3);
                            },
                            child: Column(
                              children:  [
                                Icon(Icons.mode_edit_outlined,size: 20,color: initialIndex==3?MyConstant().purpleColor:Colors.grey,),
                                const SizedBox(height: 10,),
                                Text(AppStrings.editSizes.tr(),style: GoogleFonts.notoKufiArabic(
                                    color: MyConstant().greenColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),textAlign: TextAlign.center,)
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: ()async {
                              setScreen(4);
                            await  LoginCubit.get(context).getPillsDetails();
                            },
                            child: Column(
                              children:  [
                                Icon(Icons.tv_outlined,size: 20,color: initialIndex==4?MyConstant().purpleColor:Colors.grey,),
                                const SizedBox(height: 10,),
                                Text(AppStrings.show.tr(),style: GoogleFonts.notoKufiArabic(
                                    color: MyConstant().greenColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),)
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: ()async {
                              setScreen(5);
                            await  LoginCubit.get(context).getPillsDetails();
                            },
                            child: Column(
                              children:  [
                                Icon(Icons.remove_shopping_cart_outlined,size: 20,color: initialIndex==5?MyConstant().purpleColor:Colors.grey,),
                                const SizedBox(height: 10,),
                                Text(AppStrings.returnitems.tr(),style: GoogleFonts.notoKufiArabic(
                                    color: MyConstant().greenColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),)
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              setScreen(6);
                            // await  LoginCubit.get(context).getPillsDetails();
                            },
                            child: Column(
                              children:  [
                                Icon(Icons.person_add_alt_1,size: 20,color: initialIndex==6?MyConstant().purpleColor:Colors.grey,),
                                const SizedBox(height: 10,),
                                Text(AppStrings.addnewcustomer.tr(),style: GoogleFonts.notoKufiArabic(
                                    color: MyConstant().greenColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  screen
                  // TabBar(
                  //   isScrollable: vlaue,
                  //   unselectedLabelColor: Colors.grey,
                  //     labelColor: Colors.purple,
                  //
                  //     unselectedLabelStyle: const TextStyle(
                  //       color: Colors.green
                  //     ),
                  //     // overlayColor: MaterialStateProperty.all(Colors.green),
                  //     indicator: BoxDecoration(
                  //       border: Border.all(color: Colors.transparent)
                  //     ),
                  //     onTap: (value) {
                  //       // setState(() {});
                  //     },
                  //     tabs: [
                  //       Column(
                  //         children:  [
                  //           const Icon(Icons.add_to_photos_rounded,size: 20),
                  //           const SizedBox(height: 10,),
                  //           Text('العملاء',style: GoogleFonts.notoKufiArabic(
                  //               color: MyConstant().greenColor,
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 14),)
                  //         ],
                  //       ),
                  //   Column(
                  //     children:  [
                  //       const Icon(Icons.add_to_photos_rounded,size: 20),
                  //        const SizedBox(height: 10,),
                  //       Text('اضافة',style: GoogleFonts.notoKufiArabic(
                  //           color: MyConstant().greenColor,
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 14),)
                  //     ],
                  //   ),
                  //   Column(
                  //     children:  [
                  //       const Icon(Icons.print,size: 20,),
                  //       const SizedBox(height: 10,),
                  //       Text('طباعة فاتورة',style: GoogleFonts.notoKufiArabic(
                  //           color: MyConstant().greenColor,
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 14),textAlign: TextAlign.center,)
                  //     ],
                  //   ),
                  //   Column(
                  //     children:  [
                  //       const Icon(Icons.mode_edit_outlined,size: 20,),
                  //       const SizedBox(height: 10,),
                  //       Text('تعديل مقاسات',style: GoogleFonts.notoKufiArabic(
                  //           color: MyConstant().greenColor,
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 14),textAlign: TextAlign.center,)
                  //     ],
                  //   ),
                  //   Column(
                  //     children:  [
                  //       const Icon(Icons.tv_outlined,size: 20,),
                  //       const SizedBox(height: 10,),
                  //       Text('عرض',style: GoogleFonts.notoKufiArabic(
                  //           color: MyConstant().greenColor,
                  //           fontWeight: FontWeight.bold,
                  //           fontSize: 14),)
                  //     ],
                  //   ),
                  //   // Column(
                  //   //   children:  [
                  //   //     const Icon(Icons.clean_hands_sharp,size: 20,),
                  //   //     const SizedBox(height: 10,),
                  //   //     Text('دفعة نقدية',style: GoogleFonts.notoKufiArabic(
                  //   //         color: MyConstant().greenColor,
                  //   //         fontWeight: FontWeight.bold,
                  //   //         fontSize: 14),)
                  //   //   ],
                  //   // ),
                  //   Column(
                  //         children:  [
                  //           const Icon(Icons.subdirectory_arrow_left,size: 20,),
                  //           const SizedBox(height: 10,),
                  //           Text('مرتجع',style: GoogleFonts.notoKufiArabic(
                  //               color: MyConstant().greenColor,
                  //               fontWeight: FontWeight.bold,
                  //               fontSize: 14),)
                  //         ],
                  //       ),
                  // ]),
                  //  Expanded(
                  //   child: TabBarView(
                  //
                  //     physics: NeverScrollableScrollPhysics(),
                  //       children: [
                  //         AllCustomersHomeScreen(),
                  //         SewingScreen(),
                  //         // CustomTableSweing(),
                  //         CustomTable(),
                  //         ChangeSizeScreen(),
                  //         // EditPrinterScreen(),
                  //         PresentAllTablesScreen(),
                  //         // SizedBox(),
                  //         SizedBox(),
                  //   ]),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


}
