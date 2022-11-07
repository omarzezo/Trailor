import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/View/Data%20Table/custom%20table.dart';
import 'package:omar/View/sewing%20invoice%20screen/TabBar%20Screen.dart';
import 'package:omar/View/sewing%20invoice%20screen/customers_details_screen.dart';
import 'package:omar/View/sewing%20invoice%20screen/daily_report_screen.dart';
import 'package:omar/constant/LoadingPage.dart';
import 'package:omar/constant/constant.dart';
import 'package:omar/constant/widgets.dart';

import '../sewing invoice screen/settings_screen.dart';

class TabletHome extends StatefulWidget {
  const TabletHome({Key? key}) : super(key: key);

  @override
  State<TabletHome> createState() => _TabletHomeState();
}

class _TabletHomeState extends State<TabletHome> {
  @override
  Widget build(BuildContext context) {
    final currenWidth = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawerScrimColor: Colors.transparent,
      drawer:  Padding(
        padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/10.4, left: MediaQuery.of(context).size.width/1.2),
        child: Drawer(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 5,
                  height: MediaQuery.of(context).size.height / 1,
                  margin: const EdgeInsets.only(top: 48, bottom: 48,left: 0),
                  decoration: BoxDecoration(
                    color: MyConstant().greenColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                    // border: Border(top: BorderSide(color: Colors.deepPurpleAccent)),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 4.98,
                  height: MediaQuery.of(context).size.height / 1,
                  margin: const EdgeInsets.only(
                      top: 50, bottom: 50, left: 2),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                    // border: Border(top: BorderSide(color: Colors.deepPurpleAccent)),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 4.98,
                  height: MediaQuery.of(context).size.height / 1,
                  margin: const EdgeInsets.only(
                      top: 50, bottom: 50, left: 2),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                    // border: Border(top: BorderSide(color: Colors.deepPurpleAccent)),
                  ),
                  child: Column(
                    children: [
                      Container(height: 70,padding: const EdgeInsets.symmetric(horizontal: 5),child: RowName(),),
                      const Divider(color: Colors.green,endIndent: 10,indent: 30,thickness: 3,height: 10),
                      RowNameDetail(title: 'مبيعات التفصيل' , titleImage: 'image/tshirt.png'),
                      RowNameDetail(title: 'اقمسة-اكسسوارات' , titleImage: 'image/towels.png'),
                      RowNameDetail(title: 'الحجوزات' , titleImage: 'image/booking.png'),
                      RowNameDetail(title: 'الرسائل والاشعارات' , titleImage: 'image/email.png'),
                      RowNameDetail(title: 'الضرائب والحسابات' , titleImage: 'image/profit (1).png'),
                      RowNameDetail(title: 'ادارة المخزون' ,titleImage: 'image/warehouse (1).png'),
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, DailyReportScreen.routeName);
                          },
                          child: RowNameDetail(title: 'التقارير' , titleImage: 'image/report.png')),
                      InkWell(
                        onTap: () async{
                          LoadingPage(context).show();
                        await  LoginCubit.get(context).getCustomers();
                          LoadingPage(context).close();

                          Navigator.pushNamed(context, CustomerDetailsScreen.routeName);

                        },
                          child: RowNameDetail(title: 'العملاء' , titleImage: 'image/report.png')),

                      InkWell(
                          onTap: () async{
                            Navigator.of(context).push(createRoute(SettingScreen()));
                          },
                          child: RowNameDetail(title: 'الاعدادات' , iconData: Icons.settings,)),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Container(
            width: MediaQuery.of(context).size.width / 1,
            height: MediaQuery.of(context).size.height / 1,
            child: Column(
              children: [
                // todo bar
                Stack(
                  alignment: Alignment.center,
                  children: [
                    // Container(
                    //   height: MediaQuery.of(context).size.height / 10,
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //     border:  Border(
                    //         bottom: BorderSide(color: MyConstant().greenColor.withOpacity(0.1),)),
                    //     boxShadow: [
                    //       BoxShadow(
                    //       color: MyConstant().greenColor.withOpacity(0.1),
                    //           spreadRadius: 0,
                    //           blurRadius: 0,
                    //           offset: const Offset(1, 2),
                    //           blurStyle: BlurStyle.outer),
                    //     ],
                    //     // color: Colors.grey.withOpacity(0.6),
                    //   ),
                    // ),
                    Container(
                      height: MediaQuery.of(context).size.height / 10,
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 30),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border:  Border(
                            bottom: BorderSide(color: MyConstant().greenColor.withOpacity(0.3),width: 0.2)),
                        boxShadow: [
                          BoxShadow(
                              color: MyConstant().greenColor.withOpacity(0.3),
                              spreadRadius: 0,
                              blurRadius: 0,
                              offset: const Offset(1, 1),
                              blurStyle: BlurStyle.outer),
                        ],
                        color: Colors.white,
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          textDirection: TextDirection.rtl,
                          children: [
                            IconButton(
                                onPressed: () {
                                  _scaffoldKey.currentState!.openDrawer();
                                },
                                icon: const Icon(
                                  Icons.menu,
                                  color: Colors.purple,
                                  size: 30,
                                )),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text('الرئسية',
                                  style: GoogleFonts.notoKufiArabic(
                                      color: Colors.purple,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                            ),
                            // const SizedBox(width: 5,),
                            Container(height: 40,width:MediaQuery.of(context).size.width/5,
                                child:Image.asset('image/logo app.png',width: 40,height: 40,)),
                            // const Spacer(),
                            Container(
                              width: 1.2,
                              color: Colors.purple.withOpacity(0.5),
                              height: 50,
                              margin: const EdgeInsets.only(left: 5, right: 5),
                            ),
                             Text('مركز الابتكار للخياطة',
                                style: GoogleFonts.notoKufiArabic(
                                    color: Colors.purple,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                            const SizedBox(width: 10),
                            CustomContainer(
                                color: Colors.purple,
                                title: 'فاتورة خياطة',
                                titleImage: 'image/invoices.png'),
                            const SizedBox(width: 20,),
                            CustomContainer(
                              color: Colors.purple,
                              title: 'طباعة المقاسات',
                              titleImage: 'image/measurement.png',
                            ),
                            const SizedBox(width: 20,),
                            CustomContainer(
                                titleImage: 'image/cutting.png',
                                color: Colors.purple,
                                title: 'تاكيد القص'),
                            const SizedBox(width: 20,),
                            CustomContainer(
                                titleImage: 'image/task.png',
                                color: Colors.purple,
                                title: 'استلام المعمل'),
                            const SizedBox(width: 20,),
                            CustomContainer(
                                titleImage: 'image/clothes (1).png',
                                color: Colors.purple,
                                title: 'تسليم الثياب'),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // todo body
                Expanded(
                  flex: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1,
                    alignment: Alignment.center,
                    child: Row(
                      textDirection: TextDirection.rtl,
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                         const Expanded(
                            child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: TabBarScreen())),
                        // const SizedBox(width: 20,),
                        Container(
                          width: MediaQuery.of(context).size.width/17.98,
                          // color: Colors.amber,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 17.98,
                                height: MediaQuery.of(context).size.height / 2.95,
                                // margin: const EdgeInsets.only(top: 48, bottom: 48),
                                decoration:  BoxDecoration(
                                  color: MyConstant().purpleColor,
                                  // border:  Border(
                                  //     bottom: BorderSide(color: Colors.greenAccent)),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(8),
                                      bottomRight: Radius.circular(8)),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 18.90,
                                height: MediaQuery.of(context).size.height / 3,
                                // margin: const EdgeInsets.only(
                                //     top: 50, bottom: 50, right: 3),
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  // border:  Border(
                                  //     bottom: BorderSide(color: Colors.greenAccent)),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(8),
                                      bottomRight: Radius.circular(8)),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Image.asset('image/paint.png' , width: 40, height: 40,),
                                    Image.asset('image/admin (1).png' , width: 40, height: 40,),
                                    Image.asset('image/bill.png' , width: 40, height: 40,),
                                    Image.asset('image/wallet (1).png' , width: 40, height: 40,),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
