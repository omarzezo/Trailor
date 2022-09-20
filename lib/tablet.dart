import 'package:flutter/material.dart';

import 'constant/widgets.dart';

class TabletHome extends StatelessWidget {
  const TabletHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currenWidth = MediaQuery.of(context).size.width;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawer:  Drawer(backgroundColor: Colors.white,child: Column(
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
        ],),),
      body: Container(
        width: MediaQuery.of(context).size.width / 1,
        height: MediaQuery.of(context).size.height / 1,
        child: Column(
          children: [
            // todo bar
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 7,
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
                  height: MediaQuery.of(context).size.height / 7,
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 15),
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
                            Icons.description,
                            color: Colors.deepPurpleAccent,
                            size: 30,
                          )),
                      const Text('الرئسية',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(
                        width: 7,
                      ),
                      const Text('Texture',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 30,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(
                        width: 3,
                      ),
                      const Text('E - ',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 30,
                              fontWeight: FontWeight.w400)),
                      Container(
                        width: 1.2,
                        color: Colors.deepPurpleAccent.withOpacity(0.5),
                        height: 50,
                        margin: const EdgeInsets.only(left: 15, right: 15),
                      ),
                      const Text('مركز الابتكار للخياطة',
                          style: TextStyle(
                              color: Colors.deepPurpleAccent,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 12,
                      ),
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
              ],
            ),
            // todo body
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width / 1,
                alignment: Alignment.center,
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width:  MediaQuery.of(context).size.width / 5.5,
                          height: MediaQuery.of(context).size.height / 1,
                          margin: const EdgeInsets.only(top: 48, bottom: 48),
                          decoration:    BoxDecoration(
                            color: Colors.greenAccent.withOpacity(0.4),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            // border: Border(top: BorderSide(color: Colors.deepPurpleAccent)),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 5.5,
                          height: MediaQuery.of(context).size.height / 1,
                          margin: const EdgeInsets.only(top: 50, bottom: 50 , left: 2),
                          decoration:    BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            // border: Border(top: BorderSide(color: Colors.deepPurpleAccent)),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 5.2,
                          height: MediaQuery.of(context).size.height / 1,
                          margin: const EdgeInsets.only(top: 50, bottom: 50,left: 2),
                          decoration:   BoxDecoration(
                            color: Colors.grey.withOpacity(0.2),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                            // border: Border(top: BorderSide(color: Colors.deepPurpleAccent)),
                          ),
                          child: Column(
                            children: [
                              Container(height: 70,padding: const EdgeInsets.symmetric(horizontal: 10),child: RowName(),),
                              RowNameDetail(title: 'مبيعات التفصيل' , iconData: Icons.clean_hands),
                              RowNameDetail(title: 'اقمسة-اكسسوارات' , iconData: Icons.clean_hands),
                              RowNameDetail(title: 'الحجوزات' , iconData: Icons.clean_hands),
                              RowNameDetail(title: 'الرسائل والاشعارات' , iconData: Icons.clean_hands),
                              RowNameDetail(title: 'الضرائب والحسابات' , iconData: Icons.clean_hands),
                              RowNameDetail(title: 'ادارة المخزون' , iconData: Icons.clean_hands),
                              RowNameDetail(title: 'التقارير' , iconData: Icons.clean_hands),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 14,
                          height: MediaQuery.of(context).size.height / 2.95,
                          margin: const EdgeInsets.only(top: 48, bottom: 48),
                          decoration: const BoxDecoration(
                            color: Colors.purple,
                            // border:  Border(
                            //     bottom: BorderSide(color: Colors.greenAccent)),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                          ),),
                        Container(
                          width: MediaQuery.of(context).size.width / 14.35,
                          height: MediaQuery.of(context).size.height / 3,
                          margin: const EdgeInsets.only(top: 50, bottom: 50 ,right: 3),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            // border:  Border(
                            //     bottom: BorderSide(color: Colors.greenAccent)),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                          ),),
                        Container(
                          width: MediaQuery.of(context).size.width / 14.35,
                          height: MediaQuery.of(context).size.height / 3,
                          margin: const EdgeInsets.only(top: 50, bottom: 50 ,right: 3),
                          decoration:  BoxDecoration(
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
                              ...List.generate(4, (int IconData ){return const Icon(Icons.clean_hands , color: Colors.green,size: 35,);})
                            ],),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ) ,
          ],
        ),
      ),
    );
  }
}
