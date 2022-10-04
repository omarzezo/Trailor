// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:omar/Controller/Cubit/Cubit.dart';
// import 'package:omar/Controller/Cubit/State.dart';
// import 'package:omar/constant/constant.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:omar/models/TypesModel.dart';
// import '../../constant/List Of Image.dart';
// import 'Widgets.dart';
// class PrintScreen extends StatelessWidget {
//   static const routeName="PrintScreen";
//   const PrintScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     var cubit=LoginCubit.get(context);
//     return  Directionality(
//       textDirection: TextDirection.rtl,
//       child: BlocConsumer<LoginCubit, LoginState>(
//   listener: (context, state) {
//     // TODO: implement listener
//   },
//   builder: (context, state) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: SafeArea(
//             child: SingleChildScrollView(
//
//                 child: Column(
//                   children: [
//
//                     Column(
//                       children: [
//                         Container(
//                           // height: MediaQuery.of(context).size.height/16,
//                           height: 40,
//                           width: MediaQuery.of(context).size.width/1,
//                           color: MyConstant().purpleColor,
//                           child: Row(
//                             // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               SizedBox(width: 20,),
//                               Expanded(
//                                 child: Text('المقاسات',style: GoogleFonts.notoKufiArabic(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 8
//                                 )),
//                               ),
//                               Expanded(
//                                 child: Text('${cubit.tailor.text}الخياط',style: GoogleFonts.notoKufiArabic(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 8
//                                 )),
//                               ),
//                               // Expanded(child: customTextField(text: '${cubit.tailor.text}الخياط',readOnly: true)),
//
//                             ],
//                           ),
//                         ),
//                         Container(
//                           height: MediaQuery.of(context).size.height/1.56,
//                           width: MediaQuery.of(context).size.width/1,
//                           // color: MyConstant().greenColor,
//                           child: Column(
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                 children: [
//                                   // Container( width: MediaQuery.of(context).size.width/2.52, height: 40,child: Text( '${cubit.tailor.text} القماش')),
//                                   Container( width: MediaQuery.of(context).size.width/2.52, height: 40,child:  Text('${cubit.tailor.text} القماش',
//                                       style: GoogleFonts.notoKufiArabic(
//                                           color: MyConstant().purpleColor,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 10))),
//                                   Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: '${cubit.frontHeight.text} طول امام',readOnly: true)),
//                                   Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: '${cubit.backHeight.text} طول خلف',readOnly: true)),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Container( width: MediaQuery.of(context).size.width/6,  height: 40,child: customTextField(text: '${cubit.shoulderWidth.text} عرض الكتف',readOnly: true)),
//                                   Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: '${cubit.shoulderSlope.text} ميل الكتف',readOnly: true)),
//                                   Container(width: MediaQuery.of(context).size.width/6 , height: 40,child: customTextField(text: ' ${cubit.sleeveLengthPlain.text} طول الكم سادة',readOnly: true)),
//                                   Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: ' ${cubit.sleeveLengthIsHigher.text} طول الكم اعلي',readOnly: true)),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Container( width: MediaQuery.of(context).size.width/6,  height: 40,child: customTextField(text: '${cubit.wideWrist.text} وسع المعصم',readOnly: true)),
//                                   Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: '${cubit.plainCuff.text} كفة المصم سادة',readOnly: true)),
//                                   Container(width: MediaQuery.of(context).size.width/6 , height: 40,child: customTextField(text: '${cubit.cuffLength.text} طول الكبك',readOnly: true)),
//                                   Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: '${cubit.cuffShow.text} عرض الكبك',readOnly: true)),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Container( width: MediaQuery.of(context).size.width/6,  height: 40,child: customTextField(text: '${cubit.wideMiddle.text} وسع الوسط ',readOnly: true)),
//                                   Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: ' ${cubit.expandTheChestInFront.text} وسع الصدر امام',readOnly: true)),
//                                   Container(width: MediaQuery.of(context).size.width/6 , height: 40,child: customTextField(text: '${cubit.expandTheChestBehind.text} وسع الصدر خلف',readOnly: true)),
//                                   Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: '${cubit.koftaBottom.text} كفتة اسفل',readOnly: true)),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Container( width: MediaQuery.of(context).size.width/6,  height: 40,child: customTextField(text: '${cubit.expandDown.text} وسع اسفل',readOnly: true)),
//                                   Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: '${cubit.wideNeckPillow.text} وسع الرقبة سادة',readOnly: true)),
//                                   Container(width: MediaQuery.of(context).size.width/6 , height: 40,child: customTextField(text: '${cubit.neckHeight.text} ارتفاع الرقبة',readOnly: true)),
//                                   Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: '${cubit.gypsumHeight.text} ارتفاع الجبزور',readOnly: true)),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Container( width: MediaQuery.of(context).size.width/6,  height: 40,child: customTextField(text: '${cubit.viewGypsum.text} عرض الجبزور',readOnly: true)),
//                                   Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: '${cubit.lengthChestPocket.text} ط-جيب الصدر',readOnly: true)),
//                                   Container(width: MediaQuery.of(context).size.width/6 , height: 40,child: customTextField(text: '${cubit.wideChestPocket.text} ع-جيب الصدر',readOnly: true)),
//                                   Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: '${cubit.wideMobilePocket.text} ع-جيب الجوال',readOnly: true)),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Container( width: MediaQuery.of(context).size.width/6,  height: 40,child: customTextField(text: '${cubit.wideMobilePocket2.text} ع-جيب الجوال',readOnly: true)),
//                                   Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: '${cubit.lengthPocketWallet.text} ط-جيب المحفظة',readOnly: true)),
//                                   Container(width: MediaQuery.of(context).size.width/6 , height: 40,child: customTextField(text: '${cubit.widePocketWallet.text} ع-جيب المحفظة',readOnly: true)),
//                                   Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: '${cubit.hipWidth.text} وسع الورك',readOnly: true)),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Container( width: MediaQuery.of(context).size.width/6,  height: 40,child: customTextField(text: '${cubit.buttonNumber.text} رقم الزرار',readOnly: true)),
//                                   Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: '${cubit.embroideryNumber.text}رقم التطريز',readOnly: true)),
//                                   Container(width: MediaQuery.of(context).size.width/6 , height: 40,child: customTextField(text: '${cubit.betweenTheChestPocketAndTheShoulder.text} بين جيب الصدر والكتف',readOnly: true)),
//                                   Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: '${cubit.sidePocket.text}جيب الجنب',readOnly: true)),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                 // crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   // const SizedBox(width: 0.7,),
//                                   Container( width: MediaQuery.of(context).size.width/6,  height: 40,child: customTextField(text: '${cubit.quantumCapacityMedium.text} وسع الكم وسط',readOnly: true)),
//                                   // const SizedBox(width: 1,),
//                                   Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: '${cubit.Takhalis.text} تخاليص',readOnly: true)),
//                                   // const SizedBox(width: 1,),
//                                   Container(width: MediaQuery.of(context).size.width/6 , height: 40,child: customTextField(text: '${cubit.expectedFabricInMeter.text}القماش المتوقع بالمتر',readOnly: true)),
//                                   // const SizedBox(width: 125,)
//                                 ],
//                               ),
//
//
//
//                             ],
//                           ),
//                         ),
//                         Container(
//                           width: MediaQuery.of(context).size.width/1,
//                           // height: MediaQuery.of(context).size.height/1.5,
//                           margin: const EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
//                           decoration: BoxDecoration(
//                             border: Border.all(color: MyConstant().purpleColor,width: 3),
//                           ),
//                           child: Column(
//                             children: [
//                               Container(
//                                   height: MediaQuery.of(context).size.height/16,
//                                   // height: 40,
//                                   width: double.infinity,
//                                   color: MyConstant().purpleColor,
//                                   padding: const EdgeInsets.only(left: 30 , right: 20),
//                                   child: Row(
//                                     children: [
//                                       Column(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children:  [
//                                           Text('تاريخ الفاتورة', style: GoogleFonts.notoKufiArabic(
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 12
//                                           )),
//                                           Row(
//                                             children: [
//                                               Text('18:30:05',style: GoogleFonts.notoKufiArabic(
//                                                   color: Colors.white,
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 10
//                                               )),
//                                               const SizedBox(width: 5,),
//                                               Text('25-9-2022',style: GoogleFonts.notoKufiArabic(
//                                                   color: Colors.white,
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 10
//                                               )),
//                                             ],
//                                           ),
//
//                                         ],),
//                                       SizedBox(width: MediaQuery.of(context).size.width/10,),
//                                       Column(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children:  [
//                                           Text('تاريخ التسليم',style: GoogleFonts.notoKufiArabic(
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 12
//                                           )),
//                                           Row(
//                                             children: [
//                                               Text('18:30:05',style: GoogleFonts.notoKufiArabic(
//                                                   color: Colors.white,
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 10
//                                               )),
//                                               const SizedBox(width: 5,),
//                                               Text('25-9-2022',style: GoogleFonts.notoKufiArabic(
//                                                   color: Colors.white,
//                                                   fontWeight: FontWeight.bold,
//                                                   fontSize: 10
//                                               )),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                       const Spacer(),
//                                       Column(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children:  [
//                                           Text('المرجع',style: GoogleFonts.notoKufiArabic(
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 12
//                                           )),
//                                           Text('25489',style: GoogleFonts.notoKufiArabic(
//                                               color: Colors.white,
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 10
//                                           )),
//
//                                         ],
//                                       ),
//                                     ],
//                                   )
//                               ),
//                               Container(
//                                 width: double.infinity,
//                                 height: MediaQuery.of(context).size.height/9,
//                                 // color: Colors.amber,
//                                 alignment: Alignment.center,
//                                 padding: const EdgeInsets.only(left: 30 , right: 30),
//                                 child: Row(
//                                   // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                   children: [
//                                     Container(
//                                       width: MediaQuery.of(context).size.width/2,
//                                       child: Column(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Text('العميل',style: GoogleFonts.notoKufiArabic(
//                                               color: MyConstant().purpleColor,
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 12
//                                           )),
//                                           const SizedBox(height: 10,),
//                                         ],
//                                       ),
//                                     ),
//
//                                     Expanded(
//                                       // width: MediaQuery.of(context).size.width/2,
//                                       // color: Colors.grey,
//                                       child:
//                                       Column(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Text('الموظف',style: GoogleFonts.notoKufiArabic(
//                                               color: MyConstant().purpleColor,
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 12
//                                           )),
//                                           const SizedBox(height: 10,),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 height: 25,
//                                 width: double.infinity,
//                                 alignment: Alignment.centerRight,
//                                 padding: const EdgeInsets.only(right: 20),
//                                 color: MyConstant().purpleColor,
//                                 child: Text('الثياب',style: GoogleFonts.notoKufiArabic(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 12
//                                 )),
//                               ),
//                               Container(
//                                 width: double.infinity,
//                                 height: MediaQuery.of(context).size.height/8,
//                                 // color: Colors.amber,
//                                 child: Row(
//                                   // mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Container(
//                                       width: MediaQuery.of(context).size.width/6.2,
//                                       // width: 100,
//                                       padding: const EdgeInsets.only(right: 5),
//                                       child: Column(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Text('الصنف',style: GoogleFonts.notoKufiArabic(
//                                               color: MyConstant().purpleColor,
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 12
//                                           )),
//                                           const SizedBox(height: 10,),
//                                         ],
//                                       ),
//                                     ),
//                                     const SizedBox(width: 5,),
//                                     Container(
//                                       width: MediaQuery.of(context).size.width/6.8,
//                                       // width: 100,
//                                       // padding: const EdgeInsets.only(right: 30),
//                                       child: Column(
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Text('المقاس',style: GoogleFonts.notoKufiArabic(
//                                               color: MyConstant().purpleColor,
//                                               fontWeight: FontWeight.bold,
//                                               fontSize: 12
//                                           )),
//                                           const SizedBox(height: 10,),
//                                         ],
//                                       ),
//                                     ),
//                                     const SizedBox(width: 10,),
//                                     textField(
//                                       readOnly: true,
//                                       context: context ,text: 'الكمية' , borderSide: const BorderSide(color: Colors.green,width: 1) ,
//                                       radius: const BorderRadius.only(topRight: Radius.circular(5) , bottomRight: Radius.circular(5)),),
//                                     // const SizedBox(width: 5,),
//                                     textField(
//                                         readOnly: true,
//
//                                         context:  context , text: 'سعر الوحدة',borderSide: const BorderSide(color: Colors.green,width: 1) ,
//                                         radius: BorderRadius.zero),
//                                     // const SizedBox(width: 5,),
//                                     textField(
//                                       readOnly: true,
//
//                                       context: context , text:  'الاجمالي',borderSide: const BorderSide(color: Colors.green,width: 1) ,
//                                       radius: const BorderRadius.only(topLeft: Radius.circular(5) , bottomLeft: Radius.circular(5)),),
//                                     const SizedBox(width: 18,),
//
//
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 height: 25,
//                                 width: double.infinity,
//                                 alignment: Alignment.centerRight,
//                                 padding: const EdgeInsets.only(right: 20),
//                                 color: MyConstant().purpleColor,
//                                 child: Text('اسعار وتفاصيل',style: GoogleFonts.notoKufiArabic(
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 12
//                                 )),
//                               ),
//
//                               Container(
//                                 // height: 450,
//                                 //   height: MediaQuery.of(context).size.height/8,
//                                   width: double.infinity,
//                                   padding: const EdgeInsets.only(top: 0 ),
//                                   // color: Colors.amber,
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                                         child: Row(
//                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Container(width: MediaQuery.of(context).size.width/6,child: customTextField(text: 'الاجمالي')),
//                                             Container(width: MediaQuery.of(context).size.width/6,child: customTextField(text: 'الخصم')),
//                                             Container(width: MediaQuery.of(context).size.width/6,child: customTextField(text: 'الضريبة')),
//                                             Container(width: MediaQuery.of(context).size.width/6,child: customTextField(text: 'الصافي')),
//                                           ],
//                                         ),
//                                       ),
//                                       // const SizedBox(height: 30,),
//                                       Padding(
//                                         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                                         child: Row(
//                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                           // crossAxisAlignment: CrossAxisAlignment.center,
//                                           children: [
//                                             Container(width: MediaQuery.of(context).size.width/6,child: customTextField(text: 'المدفوع النقدي')),
//                                             Container(width: MediaQuery.of(context).size.width/6,child: customTextField(text: 'المدفوع الشبكي')),
//                                             Container(
//                                                 width: MediaQuery.of(context).size.width/6,
//                                                 margin: const EdgeInsets.only(top: 10),
//                                                 alignment: Alignment.center,
//                                                 child: Column(
//                                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                                   children: [
//                                                     Text('نوع الشبكة',style: GoogleFonts.notoKufiArabic(
//                                                         color: MyConstant().purpleColor,
//                                                         fontWeight: FontWeight.bold,
//                                                         fontSize: 10
//                                                     )),
//                                                     // const SizedBox(height: 5,),
//                                                   ],
//                                                 )
//                                             ),
//                                             Container(width: MediaQuery.of(context).size.width/6),
//                                           ],
//                                         ),
//                                       ),
//                                       Container(width: MediaQuery.of(context).size.width/6,
//                                           margin: const EdgeInsets.only(right: 20,top: 15),
//
//                                           child: customTextField(text: 'المبلغ المتبقي')),
//                                     ],
//                                   )
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                             width: 100,
//                             height: 30,
//                             margin: const EdgeInsets.only(left: 10,bottom: 5),
//                             child: OutlinedButton(
//                               style: ButtonStyle(
//                                 backgroundColor:MaterialStateProperty.all(MyConstant().purpleColor),
//                               ),
//                               onPressed: (){}, child: Text('حفظ',style: GoogleFonts.notoKufiArabic(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 12
//                             )),
//                             )),
//
//                       ],
//                     ),
//                     Column()
//                   ],
//                 ),
//               ),
//             ));
//
//   },
// ),
//     );
//
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Cubit/State.dart';
import 'package:omar/constant/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/models/TypesModel.dart';
import '../../constant/List Of Image.dart';
import 'Widgets.dart';
class PrintScreen extends StatelessWidget {
  static const routeName="PrintScreen";
  const PrintScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit=LoginCubit.get(context);
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(

                child: Column(
                  children: [

                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          // height: MediaQuery.of(context).size.height/16,
                          height: 40,
                          width: MediaQuery.of(context).size.width/1,
                          color: MyConstant().purpleColor,
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Text('المقاسات',style: GoogleFonts.notoKufiArabic(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8
                                )),
                              ),
                              Expanded(
                                child: Text('${cubit.tailor.text}الخياط',style: GoogleFonts.notoKufiArabic(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8
                                )),
                              ),
                              // Expanded(child: customTextField(text: '${cubit.tailor.text}الخياط',readOnly: true)),

                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),

                          height: MediaQuery.of(context).size.height/1.56,
                          width: MediaQuery.of(context).size.width/1,
                          // color: MyConstant().greenColor,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // Container( width: MediaQuery.of(context).size.width/2.52, height: 40,child: Text( '${cubit.tailor.text} القماش')),
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/2.52, height: 40,child: MyText(text: ' القماش${cubit.tailor.text}:'),)),
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/2.52, height: 40,child: MyText(text: ' طول امام : ${cubit.frontHeight.text}'),)),
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/2.52, height: 40,child: MyText(text: '${cubit.backHeight.text} :طول خلف'),)),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/6, height: 40,child: MyText(text: ' عرض الكتف : ${cubit.shoulderWidth.text}'),)),
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/6, height: 40,child: MyText(text: ' ميل الكتف : ${cubit.shoulderSlope.text}'),)),
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/6, height: 40,child: MyText(text: '  طول الكم سادة : ${cubit.sleeveLengthPlain.text}'),)),
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/6, height: 40,child: MyText(text: ' طول الكم اعلي :  ${cubit.sleeveLengthIsHigher.text}'),)),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/6, height: 40,child: MyText(text: ' وسع المعصم : ${cubit.wideWrist.text}'),)),
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/6, height: 40,child: MyText(text: ' كفة المصم سادة : ${cubit.plainCuff.text}'),)),
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/6, height: 40,child: MyText(text: ' طول الكبك : ${cubit.cuffLength.text}'),)),
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/6, height: 40,child: MyText(text:  ' عرض الكبك : ${cubit.cuffShow.text}'),)),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/6, height: 40,child: MyText(text:  'وسع الوسط : ${cubit.wideMiddle.text}'),)),
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/6, height: 40,child: MyText(text: 'وسع الصدر امام : ${cubit.expandTheChestInFront.text}'),)),
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/6, height: 40,child: MyText(text:  ' وسع الصدر خلف : ${cubit.expandTheChestBehind.text}'),)),
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/6, height: 40,child: MyText(text:  ' كفتة اسفل : ${cubit.koftaBottom.text}'),)),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/6, height: 40,child: MyText(text:  ' وسع اسفل : ${cubit.expandDown.text}'),)),
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/6, height: 40,child: MyText(text: ' وسع الرقبة سادة : ${cubit.wideNeckPillow.text}'),)),
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/6, height: 40,child: MyText(text:  ' ارتفاع الرقبة : ${cubit.neckHeight.text}'),)),
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/6, height: 40,child: MyText(text:  ' ارتفاع الجبزور : ${cubit.gypsumHeight.text}'),)),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/6, height: 40,child: MyText(text:  ' عرض الجبزور : ${cubit.viewGypsum.text}'),)),
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/6, height: 40,child: MyText(text:  ' ط-جيب الصدر : ${cubit.lengthChestPocket.text}'),)),
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/6, height: 40,child: MyText(text:  ' ع-جيب الصدر : ${cubit.wideChestPocket.text}'),)),
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/6, height: 40,child: MyText(text:  ' ع-جيب الجوال : ${cubit.wideMobilePocket.text}'),)),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/6, height: 40,child: MyText(text: ' ع-جيب الجوال : ${cubit.wideMobilePocket2.text}'),)),
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/6, height: 40,child: MyText(text: ' ط-جيب المحفظة : ${cubit.lengthPocketWallet.text}'),)),
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/6, height: 40,child: MyText(text: ' ع-جيب المحفظة : ${cubit.widePocketWallet.text}'),)),
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/6, height: 40,child: MyText(text:  ' وسع الورك : ${cubit.hipWidth.text}'),)),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/6, height: 40,child: MyText(text:  ' رقم الزرار : ${cubit.buttonNumber.text}'),)),
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/6, height: 40,child: MyText(text:   'رقم التطريز : ${cubit.embroideryNumber.text}'),)),
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/6, height: 40,child: MyText(text: ' بين جيب الصدر والكتف : ${cubit.betweenTheChestPocketAndTheShoulder.text}'),)),
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/6, height: 40,child: MyText(text: 'جيب الجنب : ${cubit.sidePocket.text}'),)),

                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // const SizedBox(width: 0.7,),
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/6, height: 40,child: MyText(text: ' وسع الكم وسط : ${cubit.quantumCapacityMedium.text}'),)),
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/6, height: 40,child: MyText(text: ' تخاليص : ${cubit.Takhalis.text}'),)),
                                  Expanded(child: Container( width: MediaQuery.of(context).size.width/6, height: 40,child: MyText(text: 'القماش المتوقع بالمتر : ${cubit.expectedFabricInMeter.text}'),)),

                                  // const SizedBox(width: 125,)
                                ],
                              ),



                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/1,
                          // height: MediaQuery.of(context).size.height/1.5,
                          margin: const EdgeInsets.symmetric(horizontal: 10 , vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: MyConstant().purpleColor,width: 3),
                          ),
                          child: Column(
                            children: [
                              Container(
                                  height: MediaQuery.of(context).size.height/16,
                                  // height: 40,
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
                                              fontSize: 12
                                          )),
                                          Row(
                                            children: [
                                              Text('18:30:05',style: GoogleFonts.notoKufiArabic(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10
                                              )),
                                              const SizedBox(width: 5,),
                                              Text('25-9-2022',style: GoogleFonts.notoKufiArabic(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10
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
                                              fontSize: 12
                                          )),
                                          Row(
                                            children: [
                                              Text('18:30:05',style: GoogleFonts.notoKufiArabic(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10
                                              )),
                                              const SizedBox(width: 5,),
                                              Text('25-9-2022',style: GoogleFonts.notoKufiArabic(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10
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
                                              fontSize: 12
                                          )),
                                          Text('25489',style: GoogleFonts.notoKufiArabic(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10
                                          )),

                                        ],
                                      ),
                                    ],
                                  )
                              ),
                              Container(
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height/9,
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
                                          Text('العميل : ${cubit.customerName}',style: GoogleFonts.notoKufiArabic(
                                              color: MyConstant().purpleColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12
                                          )),
                                          const SizedBox(height: 10,),
                                        ],
                                      ),
                                    ),

                                    Expanded(
                                      // width: MediaQuery.of(context).size.width/2,
                                      // color: Colors.grey,
                                      child:
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('الموظف : ${cubit.employeeName}',style: GoogleFonts.notoKufiArabic(
                                              color: MyConstant().purpleColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12
                                          )),
                                          const SizedBox(height: 10,),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 25,
                                width: double.infinity,
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(right: 20),
                                color: MyConstant().purpleColor,
                                child: Text('الثياب',style: GoogleFonts.notoKufiArabic(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12
                                )),
                              ),
                              Container(
                                width: double.infinity,
                                height: MediaQuery.of(context).size.height/8,
                                // color: Colors.amber,
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width/6.2,
                                      // width: 100,
                                      padding: const EdgeInsets.only(right: 5),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('الصنف',style: GoogleFonts.notoKufiArabic(
                                              color: MyConstant().purpleColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12
                                          )),
                                          const SizedBox(height: 10,),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 5,),
                                    Container(
                                      width: MediaQuery.of(context).size.width/6.8,
                                      // width: 100,
                                      // padding: const EdgeInsets.only(right: 30),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('المقاس',style: GoogleFonts.notoKufiArabic(
                                              color: MyConstant().purpleColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12
                                          )),
                                          const SizedBox(height: 10,),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 10,),
                                    textField(
                                      readOnly: true,
                                      context: context ,text: 'الكمية' , borderSide: const BorderSide(color: Colors.green,width: 1) ,
                                      radius: const BorderRadius.only(topRight: Radius.circular(5) , bottomRight: Radius.circular(5)),),
                                    // const SizedBox(width: 5,),
                                    textField(
                                        readOnly: true,

                                        context:  context , text: 'سعر الوحدة',borderSide: const BorderSide(color: Colors.green,width: 1) ,
                                        radius: BorderRadius.zero),
                                    // const SizedBox(width: 5,),
                                    textField(
                                      readOnly: true,

                                      context: context , text:  'الاجمالي',borderSide: const BorderSide(color: Colors.green,width: 1) ,
                                      radius: const BorderRadius.only(topLeft: Radius.circular(5) , bottomLeft: Radius.circular(5)),),
                                    const SizedBox(width: 18,),


                                  ],
                                ),
                              ),
                              Container(
                                height: 25,
                                width: double.infinity,
                                alignment: Alignment.centerRight,
                                padding: const EdgeInsets.only(right: 20),
                                color: MyConstant().purpleColor,
                                child: Text('اسعار وتفاصيل',style: GoogleFonts.notoKufiArabic(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12
                                )),
                              ),

                              Container(
                                // height: 450,
                                //   height: MediaQuery.of(context).size.height/8,
                                  width: double.infinity,
                                  padding: const EdgeInsets.only(top: 0 ),
                                  // color: Colors.amber,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(width: MediaQuery.of(context).size.width/6,child: customTextField(text: 'الاجمالي')),
                                            Container(width: MediaQuery.of(context).size.width/6,child: customTextField(text: 'الخصم')),
                                            Container(width: MediaQuery.of(context).size.width/6,child: customTextField(text: 'الضريبة')),
                                            Container(width: MediaQuery.of(context).size.width/6,child: customTextField(text: 'الصافي')),
                                          ],
                                        ),
                                      ),
                                      // const SizedBox(height: 30,),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          // crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Container(width: MediaQuery.of(context).size.width/6,child: customTextField(text: 'المدفوع النقدي')),
                                            Container(width: MediaQuery.of(context).size.width/6,child: customTextField(text: 'المدفوع الشبكي')),
                                            Container(
                                                width: MediaQuery.of(context).size.width/6,
                                                margin: const EdgeInsets.only(top: 10),
                                                alignment: Alignment.center,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text('نوع الشبكة',style: GoogleFonts.notoKufiArabic(
                                                        color: MyConstant().purpleColor,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 10
                                                    )),
                                                    // const SizedBox(height: 5,),
                                                  ],
                                                )
                                            ),
                                            Container(width: MediaQuery.of(context).size.width/6),
                                          ],
                                        ),
                                      ),
                                      Container(width: MediaQuery.of(context).size.width/6,
                                          margin: const EdgeInsets.only(right: 20,top: 15),

                                          child: customTextField(text: 'المبلغ المتبقي')),
                                    ],
                                  )
                              ),
                            ],
                          ),
                        ),
                        Container(
                            width: 100,
                            height: 30,
                            margin: const EdgeInsets.only(left: 10,bottom: 5),
                            child: OutlinedButton(
                              style: ButtonStyle(
                                backgroundColor:MaterialStateProperty.all(MyConstant().purpleColor),
                              ),
                              onPressed: (){
                                Navigator.pop(context);
                              }, child: Text('طباعه',style: GoogleFonts.notoKufiArabic(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12
                            )),
                            )),

                      ],
                    ),
                    Column()
                  ],
                ),
              ),
            ));

  },
),
    );

  }
}
