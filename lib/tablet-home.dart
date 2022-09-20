import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
      drawer: Directionality(
        textDirection: TextDirection.rtl,
        child: Drawer(
          backgroundColor: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomContainer(
                  icon: Icons.description,
                  color: Colors.deepPurpleAccent,
                  title: 'فاتورة خياطة'),
              const SizedBox(
                width: 20,
              ),
              CustomContainer(
                  icon: Icons.backpack,
                  color: Colors.deepPurpleAccent,
                  title: 'طباعة المقاسات'),
              const SizedBox(
                width: 20,
              ),
              CustomContainer(
                  icon: Icons.stop_circle_sharp,
                  color: Colors.deepPurpleAccent,
                  title: 'تاكيد القص'),
              const SizedBox(
                width: 20,
              ),
              CustomContainer(
                  icon: Icons.height,
                  color: Colors.deepPurpleAccent,
                  title: 'استلام المعمل'),
              const SizedBox(
                width: 20,
              ),
              CustomContainer(
                  icon: Icons.clean_hands_outlined,
                  color: Colors.deepPurpleAccent,
                  title: 'تسليم الثياب'),
            ],
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
                    Container(
                      height: MediaQuery.of(context).size.height / 10,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: const Border(
                            bottom: BorderSide(color: Colors.greenAccent)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.greenAccent.withOpacity(0.1),
                              spreadRadius: 0,
                              blurRadius: 0,
                              offset: const Offset(1, 2),
                              blurStyle: BlurStyle.outer),
                        ],
                        // color: Colors.grey.withOpacity(0.6),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 10,
                      width: double.infinity,
                      padding: const EdgeInsets.only(left: 30),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: const Border(
                            bottom: BorderSide(color: Colors.greenAccent)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.greenAccent.withOpacity(0.1),
                              spreadRadius: 0,
                              blurRadius: 0,
                              offset: const Offset(1, 2),
                              blurStyle: BlurStyle.outer),
                        ],
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        textDirection: TextDirection.rtl,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.menu,
                                color: Colors.purple,
                                size: 30,
                              )),
                          Text('الرئسية',
                              style: GoogleFonts.notoKufiArabic(
                                  color: Colors.purple,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          const Spacer(),
                           Text('Texture',
                              style: GoogleFonts.lobster(
                                  color: Colors.green,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(
                            width: 3,
                          ),
                          Container(
                            width: 1.2,
                            color: Colors.deepPurpleAccent.withOpacity(0.5),
                            height: 50,
                            margin: const EdgeInsets.only(left: 15, right: 15),
                          ),
                           Text('مركز الابتكار للخياطة',
                              style: GoogleFonts.notoKufiArabic(
                                  color: Colors.purple,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                          const Spacer(),
                          CustomContainer(
                              icon: Icons.description,
                              color: Colors.purple,
                              title: 'فاتورة خياطة'),
                          const SizedBox(
                            width: 20,
                          ),
                          CustomContainer(
                              icon: Icons.backpack,
                              color: Colors.purple,
                              title: 'طباعة المقاسات'),
                          const SizedBox(
                            width: 20,
                          ),
                          CustomContainer(
                              icon: Icons.stop_circle_sharp,
                              color: Colors.purple,
                              title: 'تاكيد القص'),
                          const SizedBox(
                            width: 20,
                          ),
                          CustomContainer(
                              icon: Icons.height,
                              color: Colors.purple,
                              title: 'استلام المعمل'),
                          const SizedBox(
                            width: 20,
                          ),
                          CustomContainer(
                              icon: Icons.clean_hands_outlined,
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
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 3.98,
                              height: MediaQuery.of(context).size.height / 1,
                              margin: const EdgeInsets.only(top: 48, bottom: 48),
                              decoration: BoxDecoration(
                                color: Colors.greenAccent.withOpacity(0.4),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20)),
                                // border: Border(top: BorderSide(color: Colors.deepPurpleAccent)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 4,
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
                              width: MediaQuery.of(context).size.width / 4,
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
                                  Container(
                                    height: 70,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: RowName(),
                                  ),
                                  RowNameDetail(
                                      title: 'مبيعات التفصيل',
                                      iconData: Icons.clean_hands),
                                  RowNameDetail(
                                      title: 'اقمسة-اكسسوارات',
                                      iconData: Icons.clean_hands),
                                  RowNameDetail(
                                      title: 'الحجوزات',
                                      iconData: Icons.clean_hands),
                                  RowNameDetail(
                                      title: 'الرسائل والاشعارات',
                                      iconData: Icons.clean_hands),
                                  RowNameDetail(
                                      title: 'الضرائب والحسابات',
                                      iconData: Icons.clean_hands),
                                  RowNameDetail(
                                      title: 'ادارة المخزون',
                                      iconData: Icons.clean_hands),
                                  RowNameDetail(
                                      title: 'التقارير',
                                      iconData: Icons.clean_hands),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 13.98,
                              height: MediaQuery.of(context).size.height / 2.98,
                              // margin: const EdgeInsets.only(top: 48, bottom: 48),
                              decoration: const BoxDecoration(
                                color: Colors.purple,
                                // border:  Border(
                                //     bottom: BorderSide(color: Colors.greenAccent)),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
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
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 14.30,
                              height: MediaQuery.of(context).size.height / 3,
                              // margin: const EdgeInsets.only(
                              //     top: 50, bottom: 50, right: 3),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                // border:  Border(
                                //     bottom: BorderSide(color: Colors.greenAccent)),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  ...List.generate(4, (int IconData) {
                                    return const Icon(
                                      Icons.clean_hands,
                                      color: Colors.green,
                                      size: 35,
                                    );
                                  })
                                ],
                              ),
                            ),
                          ],
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
