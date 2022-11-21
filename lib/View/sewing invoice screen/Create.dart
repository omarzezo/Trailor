import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/constant/appstrings.dart';

import '../../constant/constant.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({Key? key}) : super(key: key);

  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Container(margin: const EdgeInsets.all(2.5),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width/1,
                      height: 20,
                      color: MyConstant().purpleColor,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(AppStrings.clothes.tr() , style: GoogleFonts.notoKufiArabic(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                      ),),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width/1,
                      height: MediaQuery.of(context).size.height/2,
                      decoration: BoxDecoration(
                        // color: Colors.amber,
                          border: Border(
                            left: BorderSide(color: MyConstant().greenColor),
                            right: BorderSide(color: MyConstant().greenColor),
                          )
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // const SizedBox(width: 80,),
                          Image.asset('image/download2.png',),
                          InkWell(
                            onTap: (){
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context){
                                    return  AlertDialog(
                                      // key: _key,
                                      backgroundColor: Colors.transparent,
                                      elevation: 0.0,
                                      alignment: Alignment.center,
                                      content:  Center(
                                        child: Stack(
                                          children: [
                                            Image.asset('image/download1.png',),
                                            Positioned(
                                                height: 100,
                                                width: 100,
                                                top: 150,
                                                left: 20,
                                                child: Image.asset('image/logo app.png',)),
                                            Positioned(
                                                height: 100,
                                                width: 100,
                                                top: -15,
                                                // bottom: -10,
                                                left: 80,
                                                child: Image.asset('image/logo app.png',)),
                                            Positioned(
                                                height: 100,
                                                width: 100,
                                                top: 50,
                                                // bottom: -10,
                                                left: 130,
                                                child: Image.asset('image/logo app.png',)),
                                            Positioned(
                                                height: 100,
                                                width: 100,
                                                top: 180,
                                                // bottom: -10,
                                                left: 160,
                                                child: Image.asset('image/logo app.png',)),
                                            Positioned(
                                                height: 100,
                                                width: 100,
                                                top: 100,
                                                // bottom: -10,
                                                left: 90,
                                                child: Image.asset('image/logo app.png',)),
                                          ],
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: Stack(
                              children: [
                                Image.asset('image/download1.png',),
                                Positioned(
                                    height: 100,
                                    width: 100,
                                    top: 150,
                                    left: 20,
                                    child: Image.asset('image/logo app.png',)),
                                Positioned(
                                    height: 100,
                                    width: 100,
                                    top: -15,
                                    // bottom: -10,
                                    left: 80,
                                    child: Image.asset('image/logo app.png',)),
                                Positioned(
                                    height: 100,
                                    width: 100,
                                    top: 50,
                                    // bottom: -10,
                                    left: 130,
                                    child: Image.asset('image/logo app.png',)),
                                Positioned(
                                    height: 100,
                                    width: 100,
                                    top: 180,
                                    // bottom: -10,
                                    left: 160,
                                    child: Image.asset('image/logo app.png',)),
                                Positioned(
                                    height: 100,
                                    width: 100,
                                    top: 100,
                                    // bottom: -10,
                                    left: 90,
                                    child: Image.asset('image/logo app.png',)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        child:  Container(
                          width: MediaQuery.of(context).size.width/1,
                          // height: 200,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 10),
                          decoration: BoxDecoration(
                            // color: Colors.amber,
                            border: Border(
                              left: BorderSide(color: MyConstant().greenColor),
                              right: BorderSide(color: MyConstant().greenColor),
                              bottom: BorderSide(color: MyConstant().greenColor),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                            Container(
                                width:  100,
                                height:  100 ,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border(
                                    left: BorderSide(color: MyConstant().greenColor),
                                    right: BorderSide(color: MyConstant().greenColor),
                                    bottom: BorderSide(color: MyConstant().greenColor),
                                    top: BorderSide(color: MyConstant().greenColor),
                                  ),
                                ),
                              child: Image.asset('image/download1.png',),
                            ),
                            Container(
                                width:  100,
                                height:  100 ,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border(
                                    left: BorderSide(color: MyConstant().greenColor),
                                    right: BorderSide(color: MyConstant().greenColor),
                                    bottom: BorderSide(color: MyConstant().greenColor),
                                    top: BorderSide(color: MyConstant().greenColor),
                                  ),
                                ),
                              child: Image.asset('image/download1.png',),
                            ),
                            Container(
                                width:  100,
                                height:  100 ,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border(
                                    left: BorderSide(color: MyConstant().greenColor),
                                    right: BorderSide(color: MyConstant().greenColor),
                                    bottom: BorderSide(color: MyConstant().greenColor),
                                    top: BorderSide(color: MyConstant().greenColor),
                                  ),
                                ),
                              child: Image.asset('image/download1.png',),
                            ),
                            Container(
                                width:  100,
                                height:  100 ,
                                alignment: Alignment.center,
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border(
                                    left: BorderSide(color: MyConstant().greenColor),
                                    right: BorderSide(color: MyConstant().greenColor),
                                    bottom: BorderSide(color: MyConstant().greenColor),
                                    top: BorderSide(color: MyConstant().greenColor),
                                  ),
                                ),
                              child: Image.asset('image/download1.png',),
                            ),
                            ],
                          ),
                          // ListView.builder(
                          //   scrollDirection: Axis.horizontal,
                          //   shrinkWrap: true,
                          //   // padding: const EdgeInsets.symmetric(horizontal: 10),
                          //   itemBuilder: (context , index)=>  Container(
                          //     width:  60,
                          //     height:  30 ,
                          //     alignment: Alignment.center,
                          //     margin: const EdgeInsets.symmetric(horizontal: 10),
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(5),
                          //       border: Border(
                          //         left: BorderSide(color: MyConstant().greenColor),
                          //         right: BorderSide(color: MyConstant().greenColor),
                          //         bottom: BorderSide(color: MyConstant().greenColor),
                          //         top: BorderSide(color: MyConstant().greenColor),
                          //       ),
                          //     ),
                          //     child: Image.asset('image/download1.png',) ,
                          //   ),
                          //   itemCount: 4,
                          // ),
                        ))
                  ],
                ),)),
        ],
      ),
    );
  }
}
