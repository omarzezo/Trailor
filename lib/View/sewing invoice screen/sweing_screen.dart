import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Cubit/State.dart';
import 'package:omar/View/sewing%20invoice%20screen/print_screen.dart';
import 'package:omar/constant/constant.dart';
import 'package:omar/models/Companies.dart';
import 'package:omar/models/PaymentType.dart';
import 'package:omar/models/Products.dart';
import 'package:omar/models/TrailorListsResponse.dart';
import 'package:omar/models/Units.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Size Screen.dart';
import 'Widgets.dart';

class SewingScreen extends StatefulWidget {
  const SewingScreen({Key? key}) : super(key: key);

  @override
  _SewingScreenState createState() => _SewingScreenState();
}

class _SewingScreenState extends State<SewingScreen> {
  List<String> items = [' براتيتكس (عرضين)' , 'بدر' ,'تفصيل بدون قماش' ,'بنتلى (عرضين)' ,];
  List<String> items2 = ['20' , '40' ,'45' ,'50' ,];
  String ? valueItem;
  Products ? productItem;
  Units ? valueItemSize;
  Companies ? userItem;
  Companies ? employeeItem;
  PaymentType ? paymentTypeItem;
  String ? valueItem2;
String? itemPrice;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((value) {
      final products = json.decode(value.getString("json")!);
      TrailorListsResponse trailorListsResponse = TrailorListsResponse.fromJson(products);
      print("Trillll>>"+trailorListsResponse.companies!.length.toString());
      // Companies item= trailorListsResponse.companies![0];
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit=LoginCubit.get(context);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Container(
                //   height: MediaQuery.of(context).size.height/11,
                //   // width: double.infinity,
                //   width: MediaQuery.of(context).size.width/1,
                //   padding: const EdgeInsets.symmetric(horizontal: 20),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     // crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //     iconAndText(iconData: Icons.add_to_photos_rounded, nameText: 'اضافة'),
                //     iconAndText(iconData: Icons.print , nameText: 'طباعة الفاتورة'),
                //     iconAndText(iconData: Icons.mode_edit_outlined, nameText: 'تعديل المقاسات'),
                //     iconAndText(iconData: Icons.tv_outlined, nameText: 'عرض'),
                //     iconAndText(iconData: Icons.clean_hands_sharp, nameText: 'دفعه نقدية'),
                //     iconAndText(iconData: Icons.subdirectory_arrow_left, nameText: 'مرتجع'),
                //   ],),
                // ),
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
                                  Text('العميل',style: GoogleFonts.notoKufiArabic(
                                      color: MyConstant().purpleColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12
                                  )),
                                  const SizedBox(height: 10,),
                                  Container(
                                    width: MediaQuery.of(context).size.width/3,
                                    padding: const EdgeInsets.only(right: 5),
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),

                                      border: Border.all(color: MyConstant().greenColor , width: 1.5)
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(

                                        // items: items.map(itemBuild).toList(),
                                        items: cubit.companiesCustomerName.map(UsersBuild).toList(),
                                        value: userItem,

                                        isExpanded: true,
                                        onChanged: ( val){
                                          setState(() {
                                            userItem = val as Companies   ;
                                            cubit.customerName=val.company!;
                                          });
                                        },
                                        iconEnabledColor: Colors.white,
                                        iconSize: 30,
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
                              child:
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('الموظف',style: GoogleFonts.notoKufiArabic(
                                      color: MyConstant().purpleColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12
                                  )),
                                  const SizedBox(height: 10,),
                                  Container(
                                    width: MediaQuery.of(context).size.width/3,
                                    padding: const EdgeInsets.only(right: 5),
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(color: MyConstant().greenColor , width: 1.5)
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        items: cubit.companiesEmployeeName.map(EmployeeBuild).toList(),
                                        value: employeeItem,
                                        isExpanded: true,
                                        onChanged: (val){
                                          setState(() {
                                            employeeItem = val as Companies   ;
                                            cubit.employeeName=val.company!;

                                          });
                                        },
                                        iconEnabledColor: Colors.white,
                                        iconSize: 30,
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
                                  Container(
                                    width: MediaQuery.of(context).size.width/6.2,
                                    // padding: const EdgeInsets.only(right: 10),
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),

                                        border: Border.all(color: MyConstant().greenColor , width: 1.5)
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        items: cubit.productsNameList.map(ProductsBuild).toList(),
                                        value: productItem,
                                        isExpanded: true,
                                        onChanged: (value){
                                          setState(() {
                                            productItem = value as Products  ;
                                            cubit.typeOfClothes = value.name!   ;
                                            cubit.itemPrice.text=value.price!;
                                            // cubit.tax.text= cubit.taxRatesNameList.where((element) => element.id==value.taxRate).toString();
                                             cubit.taxRatesNameList.forEach((element) {
                                               if(element.id==value.taxRate){
                                                 cubit.tax.text=element.rate!;
                                               }
                                             });

                                          });
                                        },
                                        iconEnabledColor: Colors.white,
                                        iconSize: 30,
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
                                  Container(
                                    width: MediaQuery.of(context).size.width/6.2,
                                    height: 30,
                                    padding: const EdgeInsets.only(right: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),

                                        border: Border.all(color: MyConstant().greenColor , width: 1.5)
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        items: cubit.unitsNameList.map(UnitsBuild).toList(),
                                        value: valueItemSize,
                                        isExpanded: true,
                                        onChanged: (value){
                                          setState(() {
                                            valueItemSize = value as Units  ;
                                            cubit.size = value.name!   ;

                                          });
                                        },
                                        iconEnabledColor: Colors.white,
                                        iconSize: 30,
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
                            const SizedBox(width: 10,),
                            textField(
                              onChanged: (value){
                                cubit.totalPrice.text=(double.parse(cubit.quantities.text)*double.parse(cubit.itemPrice.text)).toString();
                                cubit.calculateWhatYouPay();
                              },
                              controller: cubit.quantities,
                              context: context ,text: 'الكمية' , borderSide: const BorderSide(color: Colors.green,width: 1) ,
                              radius: const BorderRadius.only(topRight: Radius.circular(5) , bottomRight: Radius.circular(5)),),
                            // const SizedBox(width: 5,),
                            textField(
                                controller: cubit.itemPrice,
                                readOnly: true,

                                context:  context , text: 'سعر الوحدة',borderSide: const BorderSide(color: Colors.green,width: 1) ,
                                radius: BorderRadius.zero),
                            // const SizedBox(width: 5,),
                            textField(
                              controller: cubit.totalPrice,
                              onChanged: (value){
                                setState(() {
                                  cubit.totalPriceDetails.text=value;

                                });
                              },
                              readOnly: true,
                              context: context , text:  'الاجمالي',borderSide: const BorderSide(color: Colors.green,width: 1) ,
                              radius: const BorderRadius.only(topLeft: Radius.circular(5) , bottomLeft: Radius.circular(5)),),
                            const SizedBox(width: 18,),


                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 0.0),
                            child: Container(
                              height: 30,
                              width: 70,
                              child: ElevatedButton(
                                onPressed: (){
                                  Navigator.push(context,MaterialPageRoute(builder: (context) => const SizeScreen()));
                                },
                                child: Text('المقاسات',style: GoogleFonts.notoKufiArabic(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8
                                )),),
                            ),
                          ),
                          const SizedBox(width: 5,),
                          Padding(
                            padding: const EdgeInsets.only(top: 0.0),
                            child: Container(
                              height: 25,
                              alignment: Alignment.center,
                              width: 25,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: IconButton(onPressed: (){}, icon: const Icon(Icons.add,color: Colors.white,size: 11,),alignment: Alignment.center,),
                            ),
                          ),
                          const SizedBox(width: 5,),
                          Padding(
                            padding: const EdgeInsets.only(top: 0.0),
                            child: Container(
                              height: 25,
                              width: 25,
                              padding: const EdgeInsets.only(top: 3.0 ),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: IconButton(onPressed: (){}, icon: const Icon(Icons.maximize_outlined , color: Colors.white,size: 10,),alignment: Alignment.center,),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20,),
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
                                  Container(width: MediaQuery.of(context).size.width/6,child: customTextField(text: 'الاجمالي',controller:cubit.totalPrice ,readOnly: true)),
                                  Container(width: MediaQuery.of(context).size.width/6,child: customTextField(text: 'الخصم',controller:cubit.discount,onChange: (value){
                                   cubit.calculateDiscount(value);

                                  })),
                                  Container(width: MediaQuery.of(context).size.width/6,child: customTextField(text: 'الضريبة',controller:cubit.tax,readOnly: true)),
                                  Container(width: MediaQuery.of(context).size.width/6,child: customTextField(text: 'الصافي',controller:cubit.whatYouPay,readOnly: true)),
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
                                  Container(width: MediaQuery.of(context).size.width/6,child: customTextField(text: 'المدفوع النقدي',controller:cubit.cash,onChange: (value){
                                            cubit.calculateRecentMoney(value);
                                  })),
                                  Container(width: MediaQuery.of(context).size.width/6,child: customTextField(text: 'المدفوع الشبكي',controller:cubit.onlinePayment)),
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
                                        DropdownButton(
                                          focusColor: Colors.green,
                                            underline: Container( height: 1.5, color: Colors.green,),
                                            items: cubit.paymentCodeList.map(PaymentTypeBuild).toList(),
                                            value: paymentTypeItem,
                                            isExpanded: true,
                                            onChanged: (value){
                                              setState(() {
                                                paymentTypeItem   = value as PaymentType ;
                                                cubit.paymentType=value.code!;
                                              });
                                            },
                                            iconEnabledColor: Colors.green,
                                            iconSize: 25,
                                            icon: const Icon(Icons.keyboard_arrow_down_sharp)
                                        ),
                                      ],
                                    )
                                  ),
                                  Container(width: MediaQuery.of(context).size.width/6),
                                ],
                              ),
                            ),
                            Container(width: MediaQuery.of(context).size.width/6,
                                margin: const EdgeInsets.only(right: 20,top: 15),

                                child: customTextField(text: 'المبلغ المتبقي',controller: cubit.delayMoney)),
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
                      Navigator.pushNamed(context, PrintScreen.routeName);

                    }, child: Text('حفظ',style: GoogleFonts.notoKufiArabic(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12
                  )),
                )),
              ],
            ),
          ),
        );
  },
),
      ),
    );
  }


  DropdownMenuItem<Companies> UsersBuild(Companies item) =>
    DropdownMenuItem(value: item, child: Center(
      child: Text(item.company!,style: GoogleFonts.notoKufiArabic(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 12
      )),
    ),);
  DropdownMenuItem<Companies>EmployeeBuild(Companies item) =>
    DropdownMenuItem(value: item, child: Center(
      child: Text(item.company!,style: GoogleFonts.notoKufiArabic(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 12
      )),
    ),);
  DropdownMenuItem<Products>ProductsBuild(Products item) =>
    DropdownMenuItem(value: item, child: Center(
      child: Text(item.name!,style: GoogleFonts.notoKufiArabic(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 12
      )),
    ),);
  DropdownMenuItem<Units>UnitsBuild(Units item) =>
    DropdownMenuItem(value: item, child: Center(
      child: Text(item.name!,style: GoogleFonts.notoKufiArabic(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 12
      )),
    ),);
  DropdownMenuItem<PaymentType> PaymentTypeBuild(PaymentType item) =>
    DropdownMenuItem(value: item, child: Center(
      child: Text(item.code!,style: GoogleFonts.notoKufiArabic(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 12
      )),
    ),);
  // DropdownMenuItem<Users> UsersBuild(Users item) =>
  //   DropdownMenuItem(value: item, child: Text(item.company!,style: GoogleFonts.notoKufiArabic(
  //       color: MyConstant().purpleColor,
  //       fontWeight: FontWeight.bold,
  //       fontSize: 12
  //   )),);
   DropdownMenuItem<String> itemBuild(String item) =>
      DropdownMenuItem(value: item, child: Center(
        child: Text(item,style: GoogleFonts.notoKufiArabic(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 12
        )),
      ),);
//   Widget wrapWidget ({
//   required String string,
// })=> Wrap(
//     // direction: Axis.horizontal,
//     spacing: 50,
//     runSpacing: 10,
//     direction: Axis.horizontal,
//     children: [
//      Text(string)
//     ],
//   );
}
