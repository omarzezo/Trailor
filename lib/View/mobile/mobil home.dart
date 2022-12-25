import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/View/Data%20Table/custom%20table.dart';
import 'package:omar/View/sewing%20invoice%20screen/Size%20Screen.dart';
import 'package:omar/View/sewing%20invoice%20screen/TabBar%20Screen.dart';
import 'package:omar/View/sewing%20invoice%20screen/casher.dart';
import 'package:omar/View/sewing%20invoice%20screen/customers_details_screen.dart';
import 'package:omar/View/sewing%20invoice%20screen/daily_report_screen.dart';
import 'package:omar/View/sewing%20invoice%20screen/settings_screen.dart';
import 'package:omar/View/sewing%20invoice%20screen/sweing_screen.dart';
import 'package:omar/constant/LoadingPage.dart';
import 'package:omar/constant/appstrings.dart';
import 'package:omar/constant/constant.dart';
import 'package:flutter/services.dart' as p;

import '../../constant/widgets.dart';

class MobileHome extends StatelessWidget {

  const MobileHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawerScrimColor: Colors.transparent,
      backgroundColor: Colors.white,
      drawer:  Padding(
        padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/10.4, left: MediaQuery.of(context).size.width/2.2),
        child: Drawer(
          elevation: 0.0,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1,
                height: MediaQuery.of(context).size.height / 1,
                // margin: const EdgeInsets.only(top: 0, bottom: 0,left: 0),
                decoration:   BoxDecoration(
                  color:  const Color(0xffe4e4e4).withOpacity(0.5),
                  // borderRadius: const BorderRadius.only(
                  //     topLeft: Radius.circular(20),
                  //     bottomLeft: Radius.circular(20)),
                  border: Border.all(color: MyConstant().greenColor, width: 0.9),
                ),
                child: Column(
                  children: [
                    Container(height: 70,padding: const EdgeInsets.symmetric(horizontal: 5),child: RowName(),),
                    const Divider(color: Colors.green,endIndent: 10,indent: 30,thickness: 3,height: 10),
                    // RowNameDetail(title: AppStrings.InventoryManagement.tr() , titleImage: 'image/tshirt.png'),
                    // RowNameDetail(title: AppStrings.TextilesAccessories.tr() , titleImage: 'image/towels.png'),
                    // RowNameDetail(title: AppStrings.bookings.tr() , titleImage: 'image/booking.png'),
                    // RowNameDetail(title: AppStrings.Messagesandnotifications.tr() , titleImage: 'image/email.png'),
                    // RowNameDetail(title:  AppStrings.Taxesandaccounts.tr() , titleImage: 'image/profit (1).png'),
                    // RowNameDetail(title: AppStrings.InventoryManagement.tr() ,titleImage: 'image/warehouse (1).png'),
                    InkWell(
                        onTap: () async{
                          await LoginCubit.get(context).getPillsDetails();

                          Navigator.pushNamed(context, DailyReportScreen.routeName);

                        },
                        child: RowNameDetail(title: AppStrings.reports.tr() , titleImage: 'image/report.png')),
                    InkWell(
                        onTap: ()async {
                          LoadingPage(context).show();

                          await  LoginCubit.get(context).getCustomers();
                          LoadingPage(context).close();

                          Navigator.pushNamed(context, CustomerDetailsScreen.routeName);
                        },
                        child: RowNameDetail(title:  AppStrings.customers.tr() , titleImage: 'image/report.png')),
                    InkWell(
                        onTap: () async{
                          Navigator.of(context).push(createRoute(SettingScreen()));
                        },
                        child: RowNameDetail(title:  AppStrings.settings.tr()  , iconData: Icons.settings,)),


                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(

          children: [
            Container(
              padding: const EdgeInsets.only(left: 10),
              margin: const EdgeInsets.symmetric(horizontal: 7),
              height: 50,
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.green )),
                  color: Colors.white
              ),
              child: Row(children: [
                IconButton(
                  onPressed: (){
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  icon: const Icon(Icons.menu , color: Colors.purple,),padding: EdgeInsets.zero, iconSize: 33,),
                Text( AppStrings.Main.tr(),
                    style: GoogleFonts.notoKufiArabic(
                        color: Colors.black,
                        fontSize: 14
                    )
                ),
                const SizedBox(width: 20,),
                Container(height: 55,width:MediaQuery.of(context).size.width/4,
                    child:Image.asset('image/logo app.png',)),
                const Spacer(),
                Container(width: 1,color: Colors.grey,height: 18,),
                const SizedBox(width: 10,),
                Text(AppStrings.Tailoringinnovationcenter.tr(),
                    style: GoogleFonts.notoKufiArabic(
                        color: Colors.purple,
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                    )),
              ],),
            ),
            Container(
              height: 70,
              // width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              margin: const EdgeInsets.symmetric(vertical: 7,horizontal: 10),
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.green)),
                  color: Colors.white
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomContainer(
                        color: Colors.purple,
                        title: AppStrings.sewingbill.tr(),
                        titleImage: 'image/invoices.png'),
                    const SizedBox(width: 10),

                    CustomContainer(
                      color: Colors.purple,
                      title: AppStrings.printsizes.tr(),
                      titleImage: 'image/measurement.png',
                    ),
                    const SizedBox(width: 10),

                    CustomContainer(
                        titleImage: 'image/cutting.png',
                        color: Colors.purple,
                        title: AppStrings.CheckConfirmation.tr()),
                    const SizedBox(width: 10),


                    InkWell(
                      onTap: () {
                        LoginCubit.get(context).cashierOpened?SizedBox(): AwesomeDialog(context: context,
                          dialogType: DialogType.question,
                          animType: AnimType.rightSlide,
                          width:MediaQuery.of(context).size.width/1.2,
                          // width:400,
                          body: OpenCashier(),

                        ).show();
                      },
                      child: CustomContainer(
                          titleImage: 'image/task.png',
                          color: Colors.purple,
                          title: AppStrings.Openthecashregister.tr()),
                    ),
                    const SizedBox(width: 10),


                    InkWell(
                      onTap: () {
                        LoginCubit.get(context).cashierClosed?SizedBox(): AwesomeDialog(context: context,
                          dialogType: DialogType.noHeader,
                          animType: AnimType.rightSlide,
                          width:MediaQuery.of(context).size.width,
                          // width:400,
                          body:  CashierScreen(),

                        ).show();
                      },
                      child: CustomContainer(
                          titleImage: 'image/clothes (1).png',
                          color: Colors.purple,
                          title: AppStrings.Closethecashier.tr()),
                    ),
                  ],
                ),
              ),
            ),
            // const Spacer(),
            // Expanded(
            //     child: Directionality(
            //         textDirection: TextDirection.ltr,
            //         child: SingleChildScrollView(
            //           physics: const BouncingScrollPhysics(),
            //             child: Column(
            //               children: [
            //                 Directionality(
            //                   textDirection: TextDirection.rtl,
            //                   child: Padding(
            //                     padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
            //                     child: Row(
            //                       children: [
            //                         Container(width: 3,height: 30,color: MyConstant().purpleColor,),
            //                         const SizedBox(width: 20,),
            //                         Text('الثياب المتاخرة علي القص',
            //                             style: GoogleFonts.notoKufiArabic(
            //                               color: MyConstant().greenColor,
            //                               fontWeight: FontWeight.w600,
            //                               fontSize: 16,
            //                             )),
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //                 Container(
            //                     padding: const EdgeInsets.symmetric(horizontal: 0),
            //                     height: MediaQuery.of(context).size.height/3,
            //                     // color: Colors.amber,
            //                     child: const CustomTable()),
            //                 Directionality(
            //                   textDirection: TextDirection.rtl,
            //                   child: Padding(
            //                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
            //                     child: Row(
            //                       children: [
            //                         Container(width: 3,height: 30,color: MyConstant().purpleColor,),
            //                         const SizedBox(width: 20,),
            //                         Text('الثياب المتاخرة علي التسليم',
            //                             style: GoogleFonts.notoKufiArabic(
            //                               color: MyConstant().greenColor,
            //                               fontWeight: FontWeight.w600,
            //                               fontSize: 16,
            //                             )),
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //                 Container(
            //                     padding: const EdgeInsets.symmetric(horizontal: 0),
            //                     height: MediaQuery.of(context).size.height/3,
            //                     // color: Colors.amber,
            //                     child: const CustomTable()),
            //                 Directionality(
            //                   textDirection: TextDirection.rtl,
            //                   child: Padding(
            //                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
            //                     child: Row(
            //                       children: [
            //                         Container(width: 3,height: 30,color: MyConstant().purpleColor,),
            //                         const SizedBox(width: 20,),
            //                         Text('ثياب سوف تسلم خلال اسبوع',
            //                             style: GoogleFonts.notoKufiArabic(
            //                               color: MyConstant().greenColor,
            //                               fontWeight: FontWeight.w600,
            //                               fontSize: 16,
            //                             )),
            //                       ],
            //                     ),
            //                   ),
            //                 ),
            //                 Container(
            //                     padding: const EdgeInsets.symmetric(horizontal: 0),
            //                     height: MediaQuery.of(context).size.height/3,
            //                     // color: Colors.amber,
            //                     child: const CustomTable()),
            //               ],
            //             )
            //         ))),
            const Expanded(child: TabBarScreen()),
            Container(
              height: 40,
              // color: Colors.amber,
              width: MediaQuery.of(context).size.width/1,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width/1.6,
                    decoration: const BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(8) , topRight: Radius.circular(8)),
                    ),
                  ),
                  Container(
                    height: 38,
                    width: MediaQuery.of(context).size.width/1.61,
                    // margin: const EdgeInsets.only(top: 10 , right: 10 , left: 10),
                    decoration:  const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(8) , topRight: Radius.circular(8)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:  [
                        Image.asset('image/wallet (1).png' , width: 30, height: 30,),
                        Image.asset('image/bill.png' , width: 30, height: 30,),
                        Image.asset('image/admin (1).png' , width: 30, height: 30,),
                        Image.asset('image/paint.png' , width: 30, height: 30,),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
