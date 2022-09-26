import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/View/Data%20Table/custom%20table.dart';
import 'package:omar/constant/constant.dart';
import 'package:omar/constant/widgets.dart';

class TebletHome extends StatefulWidget {
  const TebletHome({Key? key}) : super(key: key);

  @override
  State<TebletHome> createState() => _TebletHomeState();
}

class _TebletHomeState extends State<TebletHome> {
  @override
  Widget build(BuildContext context) {
    final currenWidth = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawerScrimColor: Colors.transparent,
      // drawer: const Drawer(),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        textDirection: TextDirection.rtl,
                        children: [
                          // IconButton(
                          //     onPressed: () {
                          //       _scaffoldKey.currentState!.openDrawer();
                          //     },
                          //     icon: const Icon(
                          //       Icons.menu,
                          //       color: Colors.purple,
                          //       size: 30,
                          //     )),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text('الرئسية',
                                style: GoogleFonts.notoKufiArabic(
                                    color: Colors.purple,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(width: 20,),
                          Container(height: 55,width:MediaQuery.of(context).size.width/5,
                              child:Image.asset('image/logo app.png',width: 80,height: 50,)),
                          // const Spacer(),
                          Container(
                            width: 1.2,
                            color: Colors.purple.withOpacity(0.5),
                            height: 50,
                            margin: const EdgeInsets.only(left: 15, right: 15),
                          ),
                           Text('مركز الابتكار للخياطة',
                              style: GoogleFonts.notoKufiArabic(
                                  color: Colors.purple,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(width: 200),
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
                        Container(
                          // color: Colors.amber,
                          width: MediaQuery.of(context).size.width/4,
                          child: Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 4.98,
                                height: MediaQuery.of(context).size.height / 1,
                                margin: const EdgeInsets.only(top: 49, bottom: 49),
                                decoration: BoxDecoration(
                                    color: MyConstant().greenColor,
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      bottomLeft: Radius.circular(20)),
                                  // border: Border(top: BorderSide(color: Colors.deepPurpleAccent)),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 5,
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
                                width: MediaQuery.of(context).size.width / 5,
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
                                    RowNameDetail(title: 'التقارير' , titleImage: 'image/report.png'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                         Expanded(
                            child: Directionality(
                            textDirection: TextDirection.ltr,
                            child: SingleChildScrollView(
                              // dragStartBehavior: DragStartBehavior.start ,
                                physics: const BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 40.0,vertical: 10.0),
                                      child: Row(
                                        children: [
                                          Container(width: 3,height: 30,color: MyConstant().purpleColor,),
                                          const SizedBox(width: 20,),
                                          Text('الثياب المتاخرة علي القص',
                                              style: GoogleFonts.notoKufiArabic(
                                                color: MyConstant().greenColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      height: MediaQuery.of(context).size.height/2,
                                      // color: Colors.amber,
                                      child:  const Scrollbar(
                                        // controller: ScrollController(
                                        //   initialScrollOffset: 0,
                                        //   keepScrollOffset: true
                                        // ),
                                        thickness: 16,
                                        radius:  Radius.circular(0),
                                        trackVisibility: true,
                                        interactive: true,
                                        isAlwaysShown: true,
                                        showTrackOnHover: true,
                                        // hoverThickness: 12,
                                        child:  CustomTable(),
                                      ),),
                                  // Scrollbar(
                                  //     thickness: 16,
                                  //     controller: ScrollController(),
                                  //     radius: const Radius.circular(0),
                                  //     trackVisibility: true,
                                  //     interactive: true,
                                  //     isAlwaysShown: true,
                                  //     // showTrackOnHover: true,
                                  //     hoverThickness: 12,
                                  //     child:  CustomTable(),
                                  // ),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                                      child: Row(
                                        children: [
                                          Container(width: 3,height: 30,color: MyConstant().purpleColor,),
                                          const SizedBox(width: 20,),
                                          Text('الثياب المتاخرة علي التسليم',
                                              style: GoogleFonts.notoKufiArabic(
                                                color: MyConstant().greenColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      height: MediaQuery.of(context).size.height/2,
                                      // color: Colors.amber,
                                      child: const CustomTable()),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                                      child: Row(
                                        children: [
                                          Container(width: 3,height: 30,color: MyConstant().purpleColor,),
                                          const SizedBox(width: 20,),
                                          Text('ثياب سوف تسلم خلال اسبوع',
                                              style: GoogleFonts.notoKufiArabic(
                                                color: MyConstant().greenColor,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      height: MediaQuery.of(context).size.height/2,
                                      // color: Colors.amber,
                                      child: const CustomTable()),
                                ],
                              )
                            ))),
                        // const SizedBox(width: 20,),
                        Container(
                          width: MediaQuery.of(context).size.width/13.98,
                          // color: Colors.amber,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 13.98,
                                height: MediaQuery.of(context).size.height / 2.98,
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
                                width: MediaQuery.of(context).size.width / 14.30,
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
