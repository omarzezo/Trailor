import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant/widgets.dart';

class MobileHome extends StatelessWidget {
  const MobileHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      drawerScrimColor: Colors.transparent,
      drawer:  Padding(
        padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/9.4, left: MediaQuery.of(context).size.width/2.2),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Drawer(
            elevation: 0.0,
            // backgroundColor: Colors.white70,
            child: Stack(
              children: [
                // Container(
                //   width: MediaQuery.of(context).size.width / 1,
                //   height: MediaQuery.of(context).size.height / 1,
                //   // margin: const EdgeInsets.only(top: 0, bottom: 0,left: 0),
                //   decoration:   BoxDecoration(
                //     color: Colors.white.withOpacity(0.1),
                //     // borderRadius: const BorderRadius.only(
                //     //     topLeft: Radius.circular(20),
                //     //     bottomLeft: Radius.circular(20)),
                //     border: Border.all(color: Colors.greenAccent),
                //   ),
                //   child: Column(
                //     children: [
                //       Container(height: 70,padding: const EdgeInsets.symmetric(horizontal: 5),child: RowName(),),
                //       RowNameDetail(title: 'مبيعات التفصيل' , iconData: Icons.clean_hands),
                //       RowNameDetail(title: 'اقمسة-اكسسوارات' , iconData: Icons.clean_hands),
                //       RowNameDetail(title: 'الحجوزات' , iconData: Icons.clean_hands),
                //       RowNameDetail(title: 'الرسائل والاشعارات' , iconData: Icons.clean_hands),
                //       RowNameDetail(title: 'الضرائب والحسابات' , iconData: Icons.clean_hands),
                //       RowNameDetail(title: 'ادارة المخزون' , iconData: Icons.clean_hands),
                //       RowNameDetail(title: 'التقارير' , iconData: Icons.clean_hands),
                //     ],
                //   ),
                // ) ,
                Container(
                  width: MediaQuery.of(context).size.width / 1,
                  height: MediaQuery.of(context).size.height / 1,
                  // margin: const EdgeInsets.only(top: 0, bottom: 0,left: 0),
                  decoration:   BoxDecoration(
                    color:  const Color(0xffe4e4e4),
                    // borderRadius: const BorderRadius.only(
                    //     topLeft: Radius.circular(20),
                    //     bottomLeft: Radius.circular(20)),
                    border: Border.all(color: Colors.greenAccent, width: 0.9),
                  ),
                  child: Column(
                    children: [
                      Container(height: 70,padding: const EdgeInsets.symmetric(horizontal: 5),child: RowName(),),
                      RowNameDetail(title: 'مبيعات التفصيل' , iconData: Icons.clean_hands),
                      RowNameDetail(title: 'اقمسة-اكسسوارات' , iconData: Icons.clean_hands),
                      RowNameDetail(title: 'الحجوزات' , iconData: Icons.clean_hands),
                      RowNameDetail(title: 'الرسائل والاشعارات' , iconData: Icons.clean_hands),
                      RowNameDetail(title: 'الضرائب والحسابات' , iconData: Icons.clean_hands),
                      RowNameDetail(title: 'ادارة المخزون' , iconData: Icons.clean_hands),
                      RowNameDetail(title: 'التقارير' , iconData: Icons.clean_hands),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10),
                height: 60,
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.green))
                ),
                child: Row(children: [
                  IconButton(
                      onPressed: (){
                        _scaffoldKey.currentState?.openDrawer();
                      },
                      icon: const Icon(Icons.menu , color: Colors.purple,),padding: EdgeInsets.zero, iconSize: 33,),
                   Text('الرئسية',
                      style: GoogleFonts.notoKufiArabic(
                        color: Colors.black,
                        fontSize: 20
                      )
                   ),
                  // const SizedBox(width: 35,),
                  // IconButton(onPressed: (){}, icon: const Icon(Icons.menu , color: Colors.deepPurpleAccent,)),
                  const Spacer(),
                  Container(width: 1,color: Colors.grey,height: 18,),
                  const SizedBox(width: 10,),
                   Text('مركز الابتكار للخياطة',
                      style: GoogleFonts.notoKufiArabic(
                          color: Colors.purple,
                          fontSize: 18,
                        fontWeight: FontWeight.bold
                      )),
                ],),
              ),
              Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.green))
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomContainer(
                        icon: Icons.description,
                        color: Colors.purple,
                        title: 'فاتورة خياطة'),
                    CustomContainer(
                        icon: Icons.backpack,
                        color: Colors.purple,
                        title: 'طباعة المقاسات'),
                    CustomContainer(
                        icon: Icons.stop_circle_sharp,
                        color: Colors.purple,
                        title: 'تاكيد القص'),

                    CustomContainer(
                        icon: Icons.height,
                        color: Colors.purple,
                        title: 'استلام المعمل'),

                    CustomContainer(
                        icon: Icons.clean_hands_outlined,
                        color: Colors.purple,
                        title: 'تسليم الثياب'),
                  ],
                ),
              ),
              const Spacer(),
             Stack(
               alignment: Alignment.center,
               children: [
                 Container(
                   height: 62,
                   width: MediaQuery.of(context).size.width/1.6,
                   decoration: const BoxDecoration(
                     color: Colors.purple,
                     borderRadius: BorderRadius.only(topLeft: Radius.circular(8) , topRight: Radius.circular(8)),
                   ),
                 ),
                 Container(
                   height: 60,
                   width: MediaQuery.of(context).size.width/1.61,
                   // margin: const EdgeInsets.only(top: 10 , right: 10 , left: 10),
                   decoration: const BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.only(topLeft: Radius.circular(8) , topRight: Radius.circular(8)),
                   ),
                 ),
                 Container(
                   height: 60,
                   width: MediaQuery.of(context).size.width/1.61,
                   // margin: const EdgeInsets.only(top: 10 , right: 10 , left: 10),
                   decoration:  BoxDecoration(
                     color: Colors.grey.withOpacity(0.2),
                     borderRadius: const BorderRadius.only(topLeft: Radius.circular(8) , topRight: Radius.circular(8)),
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: const [
                       Icon(Icons.animation,color: Colors.green,size: 40,),
                       Icon(Icons.backpack,color: Colors.green,size: 40,),
                       Icon(Icons.description,color: Colors.green,size: 40,),
                       Icon(Icons.eco,color: Colors.green,size: 40,),
                     ],
                   ),
                 ),
               ],
             ),
            ],
          ),
        ),
      ),
    );
  }
}
