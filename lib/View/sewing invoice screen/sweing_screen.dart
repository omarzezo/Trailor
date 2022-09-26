import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/constant/constant.dart';
import 'Widgets.dart';

class SewingScreen extends StatefulWidget {
  const SewingScreen({Key? key}) : super(key: key);

  @override
  _SewingScreenState createState() => _SewingScreenState();
}

class _SewingScreenState extends State<SewingScreen> {
  List<String> items = ['item1' , 'item2' ,'item3' ,'item4' ,];
  String ? valueItem;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  iconAndText(iconData: Icons.add_to_photos_rounded, nameText: 'اضافة'),
                  iconAndText(iconData: Icons.print , nameText: 'طباعة الفاتورة'),
                  iconAndText(iconData: Icons.mode_edit_outlined, nameText: 'تعديل المقاسات'),
                  iconAndText(iconData: Icons.tv_outlined, nameText: 'عرض'),
                  iconAndText(iconData: Icons.clean_hands_sharp, nameText: 'دفعه نقدية'),
                  iconAndText(iconData: Icons.subdirectory_arrow_left, nameText: 'مرتجع'),
                ],),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height/1.5,
                margin: const EdgeInsets.symmetric(horizontal: 40 , vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(color: MyConstant().purpleColor,width: 3),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 100,
                      width: double.infinity,
                      color: MyConstant().purpleColor,
                      padding: const EdgeInsets.only(left: 30 , right: 20),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                            Text('تاريخ الفاتورة', style: GoogleFonts.notoKufiArabic(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 19
                            )),
                             Row(
                               children: [
                                 Text('18:30:05',style: GoogleFonts.notoKufiArabic(
                                     color: Colors.white,
                                     fontWeight: FontWeight.bold,
                                     fontSize: 17
                                 )),
                                 const SizedBox(width: 5,),
                                 Text('25-9-2022',style: GoogleFonts.notoKufiArabic(
                                     color: Colors.white,
                                     fontWeight: FontWeight.bold,
                                     fontSize: 17
                                 )),
                               ],
                             ),

                          ],),
                          SizedBox(width: MediaQuery.of(context).size.width/10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              Text('تاريخ التسليم',style: GoogleFonts.notoKufiArabic(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19
                              )),
                             Row(
                               children: [
                                 Text('18:30:05',style: GoogleFonts.notoKufiArabic(
                                     color: Colors.white,
                                     fontWeight: FontWeight.bold,
                                     fontSize: 17
                                 )),
                                 const SizedBox(width: 5,),
                                 Text('25-9-2022',style: GoogleFonts.notoKufiArabic(
                                     color: Colors.white,
                                     fontWeight: FontWeight.bold,
                                     fontSize: 17
                                 )),
                               ],
                             ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  [
                              Text('المرجع',style: GoogleFonts.notoKufiArabic(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19
                              )),
                             Text('25489',style: GoogleFonts.notoKufiArabic(
                                 color: Colors.white,
                                 fontWeight: FontWeight.bold,
                                 fontSize: 17
                             )),

                            ],
                          ),
                        ],
                      )
                    ),
                    Container(
                      width: double.infinity,
                      height: 150,
                      // color: Colors.amber,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.only(left: 30 , right: 30),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width/2,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('العميل',style: GoogleFonts.notoKufiArabic(
                                    color: MyConstant().purpleColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19
                                )),
                                const SizedBox(height: 10,),
                                Container(
                                  width: MediaQuery.of(context).size.width/3,
                                  padding: const EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),

                                    border: Border.all(color: MyConstant().greenColor , width: 1.5)
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      items: items.map(itemBuild).toList(),
                                      value: valueItem,
                                      isExpanded: true,
                                      onChanged: (value){
                                        setState(() {
                                          valueItem = value as String?  ;
                                        });
                                      },
                                      iconEnabledColor: Colors.white,
                                      iconSize: 50,
                                      icon: Container(
                                        color: Colors.green,
                                        child: const Icon(Icons.keyboard_arrow_down_sharp),
                                      ),

                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),

                          Expanded(
                            // width: MediaQuery.of(context).size.width/2,
                            // color: Colors.grey,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('الموظف',style: GoogleFonts.notoKufiArabic(
                                    color: MyConstant().purpleColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19
                                )),
                                const SizedBox(height: 10,),
                                Container(
                                  width: MediaQuery.of(context).size.width/3,
                                  padding: const EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: MyConstant().greenColor , width: 1.5)
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton(
                                      items: items.map(itemBuild).toList(),
                                      value: valueItem,
                                      isExpanded: true,
                                      onChanged: (value){
                                        setState(() {
                                          valueItem = value as String?  ;
                                        });
                                      },
                                      iconEnabledColor: Colors.white,
                                      iconSize: 50,
                                      icon: Container(
                                        color: Colors.green,
                                        child: Icon(Icons.keyboard_arrow_down_sharp),
                                      ),

                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
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
    );
  }
  DropdownMenuItem<String> itemBuild(String item) =>
    DropdownMenuItem(value: item, child: Text(item,style: GoogleFonts.notoKufiArabic(
        color: MyConstant().purpleColor,
        fontWeight: FontWeight.bold,
        fontSize: 19
    )),);

}
