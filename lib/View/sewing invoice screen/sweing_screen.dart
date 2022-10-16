import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' as p;
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Cubit/State.dart';
import 'package:omar/View/sewing%20invoice%20screen/add_new_customer_screen.dart';
import 'package:omar/View/sewing%20invoice%20screen/print_screen.dart';
import 'package:omar/constant/LoadingPage.dart';
import 'package:omar/constant/constant.dart';
import 'package:omar/models/Companies.dart';
import 'package:omar/models/PaymentType.dart';
import 'package:omar/models/Products.dart';
import 'package:omar/models/TrailorListsResponse.dart';
import 'package:omar/models/Units.dart';
import 'package:omar/models/pillRequest.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Size Screen.dart';
import 'Widgets.dart';

class SewingScreen extends StatefulWidget {
  const SewingScreen({Key? key}) : super(key: key);

  @override
  _SewingScreenState createState() => _SewingScreenState();
}

class _SewingScreenState extends State<SewingScreen> {
  final _formKey = GlobalKey<FormState>();

  var text="";
  List<String> items = [
    ' براتيتكس (عرضين)',
    'بدر',
    'تفصيل بدون قماش',
    'بنتلى (عرضين)',
  ];
  List<String> items2 = [
    '20',
    '40',
    '45',
    '50',
  ];
  String? valueItem;

  String? valueItem2;
  String? itemPrice;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) {
      final products = json.decode(value.getString("json")!);
      TrailorListsResponse trailorListsResponse =
          TrailorListsResponse.fromJson(products);
      print("Trillll>>" + trailorListsResponse.companies!.length.toString());
      // Companies item= trailorListsResponse.companies![0];
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);
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
              body: Form(
                key: _formKey,
                child: SingleChildScrollView(
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
                        width: MediaQuery.of(context).size.width / 1,
                        // height: MediaQuery.of(context).size.height/1.5,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: MyConstant().purpleColor, width: 3),
                        ),
                        child: Column(
                          children: [
                            Container(
                                height: MediaQuery.of(context).size.height / 16,
                                // height: 40,
                                width: double.infinity,
                                color: MyConstant().purpleColor,
                                padding:
                                    const EdgeInsets.only(left: 30, right: 20),
                                child: Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('تاريخ الفاتورة',
                                            style: GoogleFonts.notoKufiArabic(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12)),
                                        Row(
                                          children: [
                                            Text('18:30:05',
                                                style: GoogleFonts.notoKufiArabic(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12)),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text('25-9-2022',
                                                style: GoogleFonts.notoKufiArabic(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12)),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 10,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('تاريخ التسليم',
                                            style: GoogleFonts.notoKufiArabic(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12)),
                                        Row(
                                          children: [
                                            Text('18:30:05',
                                                style: GoogleFonts.notoKufiArabic(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12)),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text('25-9-2022',
                                                style: GoogleFonts.notoKufiArabic(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12)),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('المرجع',
                                            style: GoogleFonts.notoKufiArabic(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12)),
                                        Text('25489',
                                            style: GoogleFonts.notoKufiArabic(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12)),
                                      ],
                                    ),
                                  ],
                                )),
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height / 9,
                              // color: Colors.amber,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(left: 30, right: 30),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width / 2,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('العميل',
                                            style: GoogleFonts.notoKufiArabic(
                                                color: MyConstant().purpleColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12)),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width:
                                                  MediaQuery.of(context).size.width /
                                                      3,
                                              padding:
                                                  const EdgeInsets.only(right: 5),
                                              height: 30,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      color: MyConstant().greenColor,
                                                      width: 1.5)),
                                              child: DropdownButtonHideUnderline(

                                                child: DropdownButton(

                                                  // items: items.map(itemBuild).toList(),
                                                  items: cubit.companiesCustomerName
                                                      .map(UsersBuild)
                                                      .toList(),
                                                  value: cubit.userItem,

                                                  isExpanded: true,

                                                  onChanged: (val) {
                                                    setState(() {
                                                      cubit.userItem = val as Companies;
                                                      cubit.customerName =
                                                          val.company!;
                                                    });
                                                  },
                                                  iconEnabledColor: Colors.white,
                                                  iconSize: 30,
                                                  icon: Container(
                                                    color: Colors.green,
                                                    child: const Icon(Icons
                                                        .keyboard_arrow_down_sharp),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 20,),
                                            Padding(
                                              padding: const EdgeInsets.only(top: 0.0),
                                              child: Container(
                                                height: 30,
                                                alignment: Alignment.center,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius: BorderRadius.circular(5),
                                                ),
                                                child: IconButton(
                                                  onPressed: () {
                                                    Navigator.pushNamed(context, NewUserScreen.routeName);
                                                  },
                                                  icon: const Icon(
                                                    Icons.add,
                                                    color: Colors.white,
                                                    size: 15,
                                                  ),
                                                  alignment: Alignment.center,
                                                ),
                                              ),
                                            ),

                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    // width: MediaQuery.of(context).size.width/2,
                                    // color: Colors.grey,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('الموظف',
                                            style: GoogleFonts.notoKufiArabic(
                                                color: MyConstant().purpleColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12)),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  3,
                                          padding:
                                              const EdgeInsets.only(right: 5),
                                          height: 30,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: MyConstant().greenColor,
                                                  width: 1.5)),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                              items: cubit.companiesEmployeeName
                                                  .map(EmployeeBuild)
                                                  .toList(),
                                              value:  cubit.employeeItem,
                                              isExpanded: true,
                                              onChanged: (val) {
                                                setState(() {
                                                  cubit.employeeItem = val as Companies;
                                                  cubit.employeeName =
                                                      val.company!;
                                                });
                                              },
                                              iconEnabledColor: Colors.white,
                                              iconSize: 30,
                                              icon: Container(
                                                color: Colors.green,
                                                child: const Icon(Icons
                                                    .keyboard_arrow_down_sharp),
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
                              child: Text('الثياب',
                                  style: GoogleFonts.notoKufiArabic(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                            ),
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height / 8,
                              // color: Colors.amber,
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // width:
                                        // MediaQuery.of(context).size.width / 6.2,
                                    // width: 100,
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('الصنف',
                                            style: GoogleFonts.notoKufiArabic(
                                                color: MyConstant().purpleColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14)),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6.2,
                                          // padding: const EdgeInsets.only(right: 10),
                                          height: 30,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: MyConstant().greenColor,
                                                  width: 1.5)),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                              items: cubit.productsNameList
                                                  .map(ProductsBuild)
                                                  .toList(),
                                              value: cubit. productItem,
                                              isExpanded: true,
                                              onChanged: (value) {
                                                setState(() {
                                                  cubit.productItem = value as Products;
                                                  cubit.typeOfClothes =
                                                      value.name!;
                                                  cubit.itemCode =
                                                      value.code!;
                                                  cubit.itemPrice.text =
                                                      value.price!;
                                                  // cubit.tax.text= cubit.taxRatesNameList.where((element) => element.id==value.taxRate).toString();
                                                  cubit.taxRatesNameList
                                                      .forEach((element) {
                                                    if (element.id ==
                                                        value.taxRate) {
                                                      cubit.tax.text =
                                                          element.rate!;
                                                    }
                                                  });
                                                });
                                              },
                                              iconEnabledColor: Colors.white,
                                              iconSize: 30,
                                              icon: Container(
                                                color: Colors.green,
                                                child: const Icon(Icons
                                                    .keyboard_arrow_down_sharp),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    // width:
                                       // 100,
                                    // width: 100,
                                    // padding: const EdgeInsets.only(right: 30),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('المقاس',
                                            style: GoogleFonts.notoKufiArabic(
                                                color: MyConstant().purpleColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14)),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          // width:
                                          //     MediaQuery.of(context).size.width /
                                          //         6.2,
                                          width: 120,
                                          height: 30,
                                          padding:
                                              const EdgeInsets.only(right: 5),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: MyConstant().greenColor,
                                                  width: 1.5)),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                              items: cubit.unitsNameList
                                                  .map(UnitsBuild)
                                                  .toList(),
                                              value:  cubit.valueItemSize,
                                              isExpanded: true,
                                              onChanged: (value) {
                                                setState(() {
                                                  cubit.   valueItemSize = value as Units;
                                                  cubit.size = value.name!;
                                                });
                                              },
                                              iconEnabledColor: Colors.white,
                                              iconSize: 30,
                                              icon: Container(
                                                color: Colors.green,
                                                child: const Icon(Icons
                                                    .keyboard_arrow_down_sharp),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  textField(

                                    onChanged: (value) {
                                      cubit.totalPrice.text = (double.parse(
                                                  cubit.quantities.text) *
                                              double.parse(cubit.itemPrice.text))
                                          .toString();
                                      cubit.calculateWhatYouPay();
                                    },
                                    controller: cubit.quantities,
                                    context: context,
                                    validator:  (value) {
            if (value == null ||
            value.isEmpty) {
            return 'ادخل قيمة الكمية';
            }
            return null;
            },
                                    text: 'الكمية',
                                    borderSide: const BorderSide(
                                        color: Colors.green, width: 1),
                                    radius: const BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        bottomRight: Radius.circular(5)),
                                  ),
                                  const SizedBox(width: 10,),
                                  textField(
                                      controller: cubit.itemPrice,
                                      readOnly: true,
                                      context: context,
                                      text: 'سعر الوحدة',
                                      borderSide: const BorderSide(
                                          color: Colors.green, width: 1),
                                      radius: BorderRadius.zero),
                                  const SizedBox(width: 10,),
                                  textField(
                                    controller: cubit.totalPrice,
                                    onChanged: (value) {
                                      setState(() {
                                        cubit.totalPriceDetails.text = value;
                                      });
                                    },
                                    readOnly: true,
                                    context: context,
                                    text: 'الاجمالي',
                                    borderSide: const BorderSide(
                                        color: Colors.green, width: 1),
                                    radius: const BorderRadius.only(
                                        topLeft: Radius.circular(5),
                                        bottomLeft: Radius.circular(5)),
                                  ),
                                  const SizedBox(
                                    width: 18,
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 0.0,right: 10),
                                  child: Container(
                                    height: 35,
                                    width: 100,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const SizeScreen()));
                                      },
                                      child: Text('المقاسات',
                                          style: GoogleFonts.notoKufiArabic(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12)),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 0.0),
                                  child: Container(
                                    height: 35,
                                    alignment: Alignment.center,
                                    width: 35,
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                        size: 15,
                                      ),
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 35,
                                  width: 35,
                                  // padding: const EdgeInsets.only(top: 3.0),
                                  // alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(5),
                                  ),


                                  child: IconButton(

                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.minimize_sharp,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    // alignment: Alignment.center,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 25,
                              width: double.infinity,
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 20),
                              color: MyConstant().purpleColor,
                              child: Text('اسعار وتفاصيل',
                                  style: GoogleFonts.notoKufiArabic(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)),
                            ),
                            Container(
                                // height: 450,
                                //   height: MediaQuery.of(context).size.height/8,
                                width: double.infinity,
                                padding: const EdgeInsets.only(top: 0),
                                // color: Colors.amber,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  6,
                                              child: customTextField(
                                                  text: 'الاجمالي',
                                                  controller: cubit.totalPrice,
                                                  readOnly: true)),
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  6,
                                              child: customTextField(
                                                  text: 'الخصم',
                                                  controller: cubit.discount,
                                                  onChange: (value) {
                                                    cubit
                                                        .calculateDiscount(value);
                                                  })),
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  6,
                                              child: customTextField(
                                                  text: 'الضريبة',
                                                  controller: cubit.tax,
                                                  readOnly: true)),
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  6,
                                              child: customTextField(
                                                  text: 'الصافي',
                                                  controller: cubit.whatYouPay,
                                                  readOnly: true)),
                                        ],
                                      ),
                                    ),
                                    // const SizedBox(height: 30,),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        // crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  6,
                                              margin:
                                                  const EdgeInsets.only(top: 10),
                                              alignment: Alignment.center,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('الدفع بواسطة',
                                                      style: GoogleFonts
                                                          .notoKufiArabic(
                                                              color: MyConstant()
                                                                  .purpleColor,
                                                              fontWeight:
                                                                  FontWeight.bold,
                                                              fontSize: 12)),
                                                  // const SizedBox(height: 5,),
                                                  DropdownButton(
                                                      focusColor: Colors.green,
                                                      underline: Container(
                                                        height: 1.5,
                                                        color: Colors.green,
                                                      ),
                                                      items: cubit.fixedPayment
                                                          .map(itemBuild)
                                                          .toList(),
                                                      value:
                                                          cubit.fixedPaymentType,
                                                      isExpanded: true,
                                                      onChanged: (value) {
                                                        setState(() {
                                                          cubit.fixedPaymentType =
                                                              value as String;
                                                          // cubit.paymentType=value.code!;
                                                        });
                                                      },
                                                      iconEnabledColor:
                                                          Colors.green,
                                                      iconSize: 25,
                                                      icon: const Icon(Icons
                                                          .keyboard_arrow_down_sharp)),
                                                ],
                                              )),
                                          (cubit.fixedPaymentType == "نقدى")
                                              ? Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      6,
                                                  child: customTextField(
                                                      text: 'المدفوع النقدي',
                                                      controller: cubit.cash,
                                                      onChange: (value) {
                                                        cubit
                                                            .calculateRecentMoney(
                                                                value);
                                                      }))
                                              : Container(),
                                          (cubit.fixedPaymentType == "شيك بنكى")
                                              ? Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      6,
                                                  child: customTextField(
                                                      text: 'رقم الشيك',
                                                      controller:
                                                          cubit.cheeckPayment))
                                              : Container(
                                                  height: 0,
                                                  width: 0,
                                                ),
                                          (cubit.fixedPaymentType ==
                                                  "بطاقة إئتمان")
                                              ? Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      6,
                                                  child: customTextField(
                                                      text: 'المدفوع الشبكي',
                                                      controller:
                                                          cubit.onlinePayment))
                                              : Container(
                                                  height: 0,
                                                  width: 0,
                                                ),
                                          (cubit.fixedPaymentType ==
                                                  "بطاقة إئتمان")
                                              ? Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      6,
                                                  margin: const EdgeInsets.only(
                                                      top: 10),
                                                  alignment: Alignment.center,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Text('نوع الشبكة',
                                                          style: GoogleFonts
                                                              .notoKufiArabic(
                                                                  color: MyConstant()
                                                                      .purpleColor,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 10)),
                                                      // const SizedBox(height: 5,),
                                                      DropdownButton(
                                                          focusColor:
                                                              Colors.green,
                                                          underline: Container(
                                                            height: 1.5,
                                                            color: Colors.green,
                                                          ),
                                                          items: cubit
                                                              .paymentCodeList
                                                              .map(
                                                                  PaymentTypeBuild)
                                                              .toList(),
                                                          value:  cubit.paymentTypeItem,
                                                          isExpanded: true,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              cubit. paymentTypeItem = value
                                                                  as PaymentType;
                                                              cubit.paymentType =
                                                                  value.code!;
                                                            });
                                                          },
                                                          iconEnabledColor:
                                                              Colors.green,
                                                          iconSize: 25,
                                                          icon: const Icon(Icons
                                                              .keyboard_arrow_down_sharp)),
                                                    ],
                                                  ))
                                              : Container(
                                                  height: 0,
                                                  width: 0,
                                                ),
                                          Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  6),
                                        ],
                                      ),
                                    ),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width / 6,
                                        margin: const EdgeInsets.only(
                                            right: 20, top: 15),
                                        child: customTextField(
                                            text: 'المبلغ المتبقي',
                                            controller: cubit.delayMoney)),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      Container(
                          width: 100,
                          height: 30,
                          margin: const EdgeInsets.only(left: 10, bottom: 5),
                          child: OutlinedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  MyConstant().purpleColor),
                            ),
                            onPressed: ( cubit.userItem==null||cubit.employeeItem==null||cubit. productItem==null||cubit.valueItemSize==null)?
                            (){
                              if(cubit.userItem==null){
                                 text="يرجى اختيار عميل ";
                              } if(cubit.employeeItem==null){
                                text="يرجى اختيار موظف ";

                              }if(cubit.productItem==null){
                                text="يرجى اختيار الصنف ";

                              }if(cubit.valueItemSize==null){
                                text="يرجى اختيار المقاس ";

                              }
                              Fluttertoast.showToast(

                                  msg: text,


                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            }:

                          () async{
            if (_formKey.currentState!.validate()) {

            LoadingPage(context).show();

                              List<ProductModel> productList = [
                                ProductModel(
                                    id:  int.parse(cubit.productItem!.id!),
                                    code: cubit.productItem!.code,
                                    name: cubit.productItem!.slug,
                                    category_id: int.parse(cubit.productItem!.categoryId!),
                                    unit: int.parse(cubit.productItem!.unit!),
                                    price: double.parse(cubit.productItem!.price!),
                                    tax_rate: int.parse(cubit.productItem!.taxRate!),
                                    tax_method: cubit.productItem!.taxMethod=="0"?false:true,
                                    warehouse: 1),
                              ];
                              List<dynamic> customerList = [];
                              List<dynamic> categoryList = [];
                              List<dynamic> posRegisterList = [];
                              List<dynamic> expensesList = [];
                              List<dynamic> payment = [];
                              List<salesModel> salesList = [
                                salesModel(
                                  // date: "2022-10-10 20:22:00",
                                  date: p.DateFormat('yyyy-MM-dd HH:mm').parse(DateTime.now().toString()).toString(),
                                  referenceNo: "SALE2022/10/0001",
                                  customerId: int.parse(cubit.users[0].id!),
                                  dueDate: "2022-08-16T00:00:00",
                                  hash:
                                  "51280eb9564fe8aaa0abca09a2921438e7b0ae05d1714c0badb64238144eef8c",
                                  customer: cubit.companiesEmployeeName[0].company,
                                  biller: cubit.users[0].username,
                                  billerId: int.parse(cubit.companiesEmployeeName[0].id!),
                                  total: 8.6957,
                                  discountAllowance: 0.0000,
                                  returnSaleRef: null,
                                  returnId: null,
                                  saleStatus: "completed",
                                  saleId: null,
                                  paymentStatus: "paid",
                                  warehouseCode: "w_1",
                                  warehouseId: 1,
                                  grandTotal: 10.0000,
                                  pos: true,
                                  surcharge: 0.0000,
                                  returnSaleTotal: 0.0000,
                                  paid: 10.0000,
                                  totalTax: 1.3043,
                                  note: null,
                                  staffNote: null,
                                  productDiscount: null,
                                  orderDiscountId: null,
                                  orderDiscount: 0.0000,
                                  totalDiscount: 0.0000,
                                  productTax: null,
                                  orderTaxId: null,
                                  orderTax: 1.3043,
                                  shipping: 0.0000,
                                  totalItems: 1,
                                  paymentTerm: null,
                                  rounding: null,
                                  createdBy: 1,
                                  orderType: 1,
                                  tableNo: 0,
                                  dept: 1,
                                  empId: null,
                                  empType: null,
                                  plateNo: null,
                                  exitDate: "0001-01-01T00:00:00",
                                  payment: [
                                    Payment(
                                      id: 1,
                                      date: "2022-08-16T00:59:44+03:00",
                                      amount: 10.0000,
                                      paidBy: "cash",
                                      commercialDiscount: 0.0000,
                                      commercialDiscountId: null,
                                      chequeNo: null,
                                      glPaymentMethodId: 0,
                                      ccNo: null,
                                      ccHolder: null,
                                      ccMonth: null,
                                      ccYear: null,
                                      ccType: null,
                                      createdBy: 1,
                                      type: "received",
                                      note: null,
                                      posPaid: 10.0000,
                                      posBalance: 0.0000,
                                    ),
                                  ],
                                  items: [
                                    Items(
                                      productId: 1,
                                      productName: cubit.typeOfClothes,
                                      productCode: cubit.itemCode,
                                      productType: "standard",
                                      optionId: null,
                                      netUnitPrice: 8.6957,
                                      unitPrice: 8.6957,
                                      unitQuantity: 1.0000,
                                      realUnitPrice: 10.0000,
                                      productUnitId: 1,
                                      productUnitCode: "حبة",
                                      quantity: 1.0000,
                                      subtotal: 10.0000,
                                      warehouseId: 1,
                                      warehouseCode: "w_1",
                                      itemTax: 1.3043,
                                      taxRateId: 3,
                                      tax: "ضريبة النسبة الأساسية 15%",
                                      discount: null,
                                      serialNo: null,
                                      itemDiscount: 0.0000,
                                      promoFree: false,
                                    ),
                                  ],
                                  measurement: [
                                    Measurement(
                                      itemName:  cubit.typeOfClothes,
                                      itemCode: cubit.itemCode,
                                      frontLength: double.parse(cubit.frontHeight.text),
                                      backLength:  double.parse(cubit.backHeight.text),
                                      shoulderWidth: double.parse(cubit.shoulderWidth.text),
                                      shoulderSlope:  double.parse(cubit.shoulderSlope.text),
                                      sleeve:  double.parse(cubit.sleeveLengthPlain.text),
                                      sleeveTop:  double.parse(cubit.sleeveLengthIsHigher.text),
                                      wrist:  double.parse(cubit.wideWrist.text),
                                      plainCuffLength:  double.parse(cubit.plainCuff.text),
                                      cuffLength:  double.parse(cubit.cuffLength.text),
                                      cuffWidth:  double.parse(cubit.cuffShow.text),
                                      middleWidth:  double.parse(cubit.wideMiddle.text),
                                      chestFront:  double.parse(cubit.expandTheChestInFront.text),
                                      chestBack:  double.parse(cubit.expandTheChestBehind.text),
                                      bottomHeight:  double.parse(cubit.koftaBottom.text),
                                      bottomWidth:  double.parse(cubit.expandDown.text),
                                      collarWidth:  double.parse(cubit.wideNeckPillow.text),
                                      collarHeight:  double.parse(cubit.neckHeight.text),
                                      zipperHeight: double.parse(cubit.gypsumHeight.text),
                                      zipperWidth:  double.parse(cubit.viewGypsum.text),
                                      chestPocketHeight:  double.parse(cubit.lengthChestPocket.text),
                                      chestPocketWidth:  double.parse(cubit.wideChestPocket.text),
                                      mobilePocketHeight:  double.parse(cubit.wideMobilePocket.text),
                                      walletPocketHeight:  double.parse(cubit.lengthPocketWallet.text),
                                      walletPocketWidth:  double.parse(cubit.widePocketWallet.text),
                                      haunchWidth:  double.parse(cubit.hipWidth.text),
                                      buttonNo:  int.parse(cubit.buttonNumber.text),
                                      embroideryNo:  int.parse(cubit.embroideryNumber.text),
                                      estimatedLength:  double.parse(cubit.expectedFabricInMeter.text),
                                      tailorId: 1,
                                      sample: 1,
                                      urgent: 1,
                                      shoulderChestLength: double.parse(cubit.betweenTheChestPocketAndTheShoulder.text),
                                      sleeveMiddle: double.parse(cubit.quantumCapacityMedium.text),
                                      sidePocketLength: double.parse(cubit.sidePocket.text),
                                      takhalees: cubit.Takhalis.text,
                                      collarTypeID: cubit.CollerTypeID,
                                      cuffTypeID: cubit.CuffTypeID,
                                      modelTypeID: cubit.ModelTypeID,
                                      pocketTypeID: cubit.PocketTypeID,
                                      fillingTypeID: cubit.FillingTypeID,
                                      zipperTypeID: cubit.ZipperTypeID,
                                      note: "",
                                    ),
                                  ],
                                ),

                              ];
                              PillRequestModel pillRequestModel =
                                  PillRequestModel(
                                      productList: productList,
                                      customerList: customerList,
                                      categoryList: categoryList,
                                      posRegisterList: posRegisterList,
                                      salesList: salesList,
                                      payment: payment,
                                      expensesList: expensesList);
                           await   cubit.pillResponse(
                                  pillRequestModel: pillRequestModel);
                              LoadingPage(context).close();

                              Navigator.pushNamed(context, PrintScreen.routeName);}
                            },
                            child: Text('حفظ',
                                style: GoogleFonts.notoKufiArabic(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14)),
                          )),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  DropdownMenuItem<Companies> UsersBuild(Companies item) => DropdownMenuItem(
        value: item,
        child: Center(
          child: Text(item.company!,
              style: GoogleFonts.notoKufiArabic(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12)),
        ),
      );

  DropdownMenuItem<Companies> EmployeeBuild(Companies item) => DropdownMenuItem(
        value: item,
        child: Center(
          child: Text(item.company!,
              style: GoogleFonts.notoKufiArabic(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12)),
        ),
      );

  DropdownMenuItem<Products> ProductsBuild(Products item) => DropdownMenuItem(
        value: item,
        child: Center(
          child: Text(item.name!,
              style: GoogleFonts.notoKufiArabic(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12)),
        ),
      );

  DropdownMenuItem<Units> UnitsBuild(Units item) => DropdownMenuItem(
        value: item,
        child: Center(
          child: Text(item.name!,
              style: GoogleFonts.notoKufiArabic(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12)),
        ),
      );

  DropdownMenuItem<PaymentType> PaymentTypeBuild(PaymentType item) =>
      DropdownMenuItem(
        value: item,
        child: Center(
          child: Text(item.code!,
              style: GoogleFonts.notoKufiArabic(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12)),
        ),
      );

  // DropdownMenuItem<Users> UsersBuild(Users item) =>
  //   DropdownMenuItem(value: item, child: Text(item.company!,style: GoogleFonts.notoKufiArabic(
  //       color: MyConstant().purpleColor,
  //       fontWeight: FontWeight.bold,
  //       fontSize: 12
  //   )),);
  DropdownMenuItem<String> itemBuild(String item) => DropdownMenuItem(
        value: item,
        child: Center(
          child: Text(item,
              style: GoogleFonts.notoKufiArabic(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12)),
        ),
      );
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
