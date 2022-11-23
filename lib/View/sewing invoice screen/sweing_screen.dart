import 'dart:convert';
import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart' as localize;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' as p;
import 'package:flutter/services.dart' as p1;

import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Cubit/State.dart';
import 'package:omar/View/sewing%20invoice%20screen/add_new_customer_screen.dart';
import 'package:omar/View/sewing%20invoice%20screen/print_screen.dart';
import 'package:omar/constant/LoadingPage.dart';
import 'package:omar/constant/appstrings.dart';
import 'package:omar/constant/constant.dart';
import 'package:omar/models/Companies.dart';
import 'package:omar/models/PaymentType.dart';
import 'package:omar/models/Products.dart';
import 'package:omar/models/TrailorListsResponse.dart';
import 'package:omar/models/Units.dart';
import 'package:omar/models/pillRequest.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Size Screen.dart';
import 'Widgets.dart';

class SewingScreen extends StatefulWidget {
  const SewingScreen({Key? key}) : super(key: key);

  @override
  _SewingScreenState createState() => _SewingScreenState();
}

class _SewingScreenState extends State<SewingScreen> {
  var text = "";
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
  // String? valueItem;
  //
  // String? valueItem2;
  String? itemPrice;
 int? customerId;
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
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double w = 1.1;
    MediaQuery.of(context).orientation == Orientation.landscape ? w = 1.1 : w = .6;
    var cubit = LoginCubit.get(context);
    final ids = <dynamic>{};
    cubit.companiesCustomerName.retainWhere((x) => ids.add(x.name));

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            return Column(

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  // width: 600,
                  width: MediaQuery.of(context).size.width / w,
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
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(AppStrings.invoicdate.tr(),
                                      style: GoogleFonts.notoKufiArabic(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12)),
                                  Row(
                                    children: [
                                      Text('18:30:05',
                                          style:
                                          GoogleFonts.notoKufiArabic(
                                              color: Colors.white,
                                              fontWeight:
                                              FontWeight.bold,
                                              fontSize: 12)),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text('25-9-2022',
                                          style:
                                          GoogleFonts.notoKufiArabic(
                                              color: Colors.white,
                                              fontWeight:
                                              FontWeight.bold,
                                              fontSize: 12)),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width /
                                    10,
                              ),
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(AppStrings.deliverydate.tr(),
                                      style: GoogleFonts.notoKufiArabic(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12)),
                                  Row(
                                    children: [
                                      Text('18:30:05',
                                          style:
                                          GoogleFonts.notoKufiArabic(
                                              color: Colors.white,
                                              fontWeight:
                                              FontWeight.bold,
                                              fontSize: 12)),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text('25-9-2022',
                                          style:
                                          GoogleFonts.notoKufiArabic(
                                              color: Colors.white,
                                              fontWeight:
                                              FontWeight.bold,
                                              fontSize: 12)),
                                    ],
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(AppStrings.reference.tr(),
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
                        padding:
                        const EdgeInsets.only(left: 30, right: 30),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width:
                              MediaQuery.of(context).size.width / 2,
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(AppStrings.Client.tr(),
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
                                        width: MediaQuery.of(context).size.width / 3,
                                        padding: const EdgeInsets.only(right: 0),
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(5),
                                          // border: Border.all(
                                          //     color: MyConstant().greenColor,
                                          //     width: 1.5)
                                        ),
                                        child:
                                        DropdownButtonHideUnderline(
                                          child: DropdownButton2(
                                            iconEnabledColor: Colors.white,
                                            iconDisabledColor: Colors.grey,
                                            buttonHeight: 100,
                                            buttonWidth: 160,
                                            // buttonElevation: 2,
                                            itemHeight: 50,
                                            itemPadding: const EdgeInsets.only(left: 14, right: 14),
                                            dropdownMaxHeight: 250,
                                            dropdownWidth: 250,
                                            dropdownPadding: null,
                                            buttonDecoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  5), border: Border.all(color: Colors.green,), color: Colors.white,),
                                            dropdownDecoration:
                                            BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  5),
                                              color: Colors.white,
                                            ),

                                            dropdownElevation: 8,
                                            scrollbarRadius:
                                            const Radius.circular(20),
                                            scrollbarThickness: 6,
                                            scrollbarAlwaysShow: true,
                                            // offset: const Offset(0, 0),
                                            // items: items.map(itemBuild).toList(),
                                            searchController: cubit.searchController,
                                            searchInnerWidget: Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                top: 8,
                                                bottom: 4,
                                                right: 8,
                                                left: 8,
                                              ),
                                              child: TextFormField(
                                                controller: cubit
                                                    .searchController,
                                                style: GoogleFonts
                                                    .notoKufiArabic(
                                                  color: Colors.black,
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  fontSize: 12,
                                                ),
                                                decoration:
                                                InputDecoration(
                                                  isDense: true,
                                                  contentPadding:
                                                  const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 10,
                                                    vertical: 8,
                                                  ),
                                                  hintText: AppStrings.Client.tr(),
                                                  hintStyle: const TextStyle(fontSize: 12),
                                                  alignLabelWithHint: true,
                                                  border:
                                                  OutlineInputBorder(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(8),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            searchMatchFn: (item, searchValue) {
                                              return (item.value
                                                  .toString()
                                                  .toLowerCase()
                                                  .startsWith(searchValue
                                                  .toLowerCase()));
                                            },
                                            onMenuStateChange: (isOpen) {
                                              if (!isOpen) {
                                                cubit.searchController
                                                    .clear();
                                              }
                                            },

                                            items: cubit.companiesCustomerName
                                                .map((item) =>
                                                DropdownMenuItem(
                                                  value: item.company,

                                                  child: Center(
                                                    child: Text(
                                                        item.company!,
                                                        style: GoogleFonts.notoKufiArabic(
                                                            color: Colors
                                                                .black,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold, fontSize: 12)),
                                                  ),
                                                )).toList(),
                                            value: cubit.userItemName,
                                            isExpanded: true,
                                            onChanged: (val) {
                                              try {
                                                print("val>>"+val.toString());
                                                cubit.userItemName = val.toString();
                                                cubit.customerName = val!.toString();
                                                for(int i=0;i<cubit.companiesCustomerName.length;i++){
                                                 if(cubit.userItemName!.toLowerCase()==cubit.companiesCustomerName[i].company!.toLowerCase()){
                                                   customerId=int.parse(cubit.companiesCustomerName[i].id!);
                                                   print("customerId>>"+customerId.toString());
                                                   break;
                                                 }
                                                }
                                                setState(() {});
                                              }catch(e){

                                              }
                                            },
                                            // iconEnabledColor: Colors.white,
                                            iconSize: 40,
                                            icon: Container(
                                              decoration:
                                              const BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                BorderRadius.only(bottomLeft: Radius.circular(5), topLeft: Radius.circular(5)),),
                                              child: const Icon(Icons
                                                  .keyboard_arrow_down_sharp),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 0.0),
                                        child: Container(height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                              BorderRadius.circular(
                                                  5),
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pushNamed(
                                                    context,
                                                    NewUserScreen
                                                        .routeName);
                                              },
                                              child: const Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            )),
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
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(AppStrings.employee.tr(),
                                      style: GoogleFonts.notoKufiArabic(
                                          color: MyConstant().purpleColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context)
                                        .size
                                        .width /
                                        3,
                                    padding:
                                    const EdgeInsets.only(right: 0),
                                    height: 40,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(5),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        iconEnabledColor: Colors.white,
                                        iconDisabledColor: Colors.grey,
                                        buttonHeight: 100,
                                        buttonWidth: 160,

                                        // buttonElevation: 2,
                                        itemHeight: 50,
                                        itemPadding:
                                        const EdgeInsets.only(
                                            left: 14, right: 14),
                                        dropdownMaxHeight: 250,
                                        dropdownWidth: 250,
                                        dropdownPadding: null,
                                        buttonDecoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(5),
                                          border: Border.all(
                                            color: Colors.green,
                                          ),
                                          color: Colors.white,
                                        ),
                                        dropdownDecoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(5),
                                          color: Colors.white,
                                        ),

                                        dropdownElevation: 8,
                                        scrollbarRadius:
                                        const Radius.circular(20),
                                        scrollbarThickness: 6,
                                        scrollbarAlwaysShow: true,
                                        items:cubit.companiesEmployeeName.map((item) => DropdownMenuItem(
            value: item.company,
            child: Center(child: Text(
            item.company!,
            style: GoogleFonts.notoKufiArabic(
            color: Colors
                .black,
            fontWeight:
            FontWeight
                .bold, fontSize: 12)
            ),),
            )).toList(),
                                        // items: cubit.companiesEmployeeName
                                        //     .map(EmployeeBuild)
                                        //     .toList(),
                                        value: cubit.employeeItemName,
                                        isExpanded: true,

                                        onChanged: (val) {
                                          setState(() {
                                            // cubit.employeeItem =
                                            // val as Companies;
                                            // cubit.employeeName =
                                            // val.company!;
                                            cubit.employeeItemName=val as String;
                                            cubit.employeeName=val;
                                          });
                                        },
                                        iconSize: 40,
                                        icon: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                            BorderRadius.only(
                                                bottomLeft: Radius
                                                    .circular(5),
                                                topLeft:
                                                Radius.circular(
                                                    5)),
                                          ),
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
                        height: 30,
                        width: double.infinity,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(right: 20),
                        color: MyConstant().purpleColor,
                        child: Text(AppStrings.cloth.tr(),
                            style: GoogleFonts.notoKufiArabic(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12)),
                      ),

                      ResponsiveVisibility(
                        replacement:Container(
                          height: MediaQuery.of(context).size.height / 8,
                          // color: Colors.amber,
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width:
                                MediaQuery.of(context).size.width / 5,
                                // width: 200,
                                padding: const EdgeInsets.only(right: 10),
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(AppStrings.item.tr(),
                                        style: GoogleFonts.notoKufiArabic(
                                            color: MyConstant().purpleColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14)),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width / 5,
                                      // padding: const EdgeInsets.only(right: 10),
                                      height: 44,
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(5),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton2(
                                          iconEnabledColor: Colors.white,
                                          iconDisabledColor: Colors.grey,
                                          buttonHeight: 100,
                                          buttonWidth: 160,
                                          // buttonElevation: 2,
                                          itemHeight: 50,
                                          itemPadding:
                                          const EdgeInsets.only(
                                              left: 14, right: 14),
                                          dropdownMaxHeight: 200,
                                          dropdownWidth: 200,

                                          buttonDecoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            border: Border.all(
                                              color: Colors.green,
                                            ),
                                            color: Colors.white,
                                          ),
                                          dropdownDecoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            color: Colors.white,
                                          ),

                                          dropdownElevation: 8,
                                          scrollbarRadius:
                                          const Radius.circular(20),
                                          scrollbarThickness: 6,
                                          scrollbarAlwaysShow: true,
                                          isExpanded: true,

                                          // items: cubit.productsNameList
                                          //     .map(ProductsBuild)
                                          //     .toList(),
                                          // value: cubit.productItem,
                                          // onChanged: (value) {
                                          //   setState(() {
                                          //     cubit.productItem =
                                          //     value as Products;
                                          //     cubit.typeOfClothes =
                                          //     value.name!;
                                          //     cubit.itemCode = value.code!;
                                          //     cubit.itemPrice.text=double.parse(value.price!).toStringAsFixed(2);
                                          //     cubit.calculateWhatYouPay();
                                          //     // cubit.itemPrice.text =
                                          //     //     value.price!;
                                          //     // cubit.tax.text= cubit.taxRatesNameList.where((element) => element.id==value.taxRate).toString();
                                          //     cubit.taxRatesNameList
                                          //         .forEach((element) {
                                          //       if (element.id ==
                                          //           value.taxRate) {
                                          //         cubit.tax.text =
                                          //             double.parse( element.rate!)
                                          //                 .toStringAsFixed(2);
                                          //         // element.rate!
                                          //       }
                                          //     });
                                          //   });
                                          // },
                                          items:cubit.productsNameList.map((item) => DropdownMenuItem(
                                            value: item.name,
                                            child: Center(child: Text(
                                                item.name!,
                                                style: GoogleFonts.notoKufiArabic(
                                                    color: Colors
                                                        .black,
                                                    fontWeight:
                                                    FontWeight
                                                        .bold, fontSize: 12)
                                            ),),)).toList(),
                                          value: cubit.productItemName,
                                          onChanged: (value) {
                                            setState(() {
                                              cubit.productsNameList.forEach((product) {
                                                if(product.name==value){
                                                  cubit.productItem=product;
                                                  cubit.itemCode = product.code! ;
                                                  cubit.itemPrice.text=double.parse(product.price!).toStringAsFixed(2);
                                                  cubit.calculateWhatYouPay();
                                                  cubit.taxRatesNameList
                                                      .forEach((element) {
                                                    if (element.id ==
                                                        product.taxRate) {
                                                      cubit.tax.text =
                                                          double.parse( element.rate!)
                                                              .toStringAsFixed(2);
                                                      // element.rate!
                                                    }
                                                  });
                                                }
                                              });
                                              cubit.productItemName=value as String;
                                              cubit.typeOfClothes =value;

                                            });
                                          },
                                          iconSize: 40,
                                          icon: Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                              BorderRadius.only(
                                                  bottomLeft: Radius
                                                      .circular(5),
                                                  topLeft:
                                                  Radius.circular(
                                                      5)),
                                            ),
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
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(AppStrings.size.tr(),
                                        style: GoogleFonts.notoKufiArabic(
                                            color: MyConstant().purpleColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14)),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width / 6.2,
                                      height: 40,
                                      padding: const EdgeInsets.only(right: 5),
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),),
                                      child: DropdownButtonHideUnderline(

                                        child: DropdownButton2(

                                          iconEnabledColor: Colors.white,
                                          iconDisabledColor: Colors.grey,
                                          buttonHeight: 100,
                                          buttonWidth: 160,

                                          // buttonElevation: 2,
                                          itemHeight: 50,
                                          itemPadding:
                                          const EdgeInsets.only(
                                              left: 14, right: 14),
                                          dropdownMaxHeight: 200,
                                          dropdownWidth: 200,
                                          dropdownPadding: null,
                                          buttonDecoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                            border: Border.all(
                                              color: Colors.green,
                                            ),
                                            color: Colors.white,
                                          ),
                                          dropdownDecoration: BoxDecoration(

                                            borderRadius:
                                            BorderRadius.circular(5),
                                            color: Colors.white,
                                          ),

                                          dropdownElevation: 8,
                                          scrollbarRadius:
                                          const Radius.circular(20),
                                          scrollbarThickness: 6,
                                          scrollbarAlwaysShow: true,
                                          // items: cubit.unitsNameList
                                          //     .map(UnitsBuild)
                                          //     .toList(),
                                          // value: cubit.valueItemSize,
                                          // isExpanded: true,
                                          //
                                          // onChanged: (value) {
                                          //   setState(() {
                                          //     cubit.valueItemSize =
                                          //     value as Units;
                                          //     cubit.size = value.name!;
                                          //   });
                                          // },
                                          items: cubit.unitsNameList.map((unit) => DropdownMenuItem(
                                            value: unit.name,
                                            child: Center(child: Text(
                                                unit.name!,
                                                style: GoogleFonts.notoKufiArabic(
                                                    color: Colors
                                                        .black,
                                                    fontWeight:
                                                    FontWeight
                                                        .bold, fontSize: 12)
                                            ),),)).toList(),

                                          // items: cubit.unitsNameList
                                          //   .map(UnitsBuild)
                                          //   .toList(),
                                          value: cubit.valueItemSizeName,
                                          isExpanded: true,
                                          onChanged: (value) {
                                            setState(() {
                                              // cubit.valueItemSize =
                                              // value as Units;
                                              // cubit.size = value.name!;
                                              cubit.valueItemSizeName =
                                              value as String;
                                              cubit.unitsNameList.forEach((unit) {
                                                if(unit.name==value){
                                                  cubit.size = unit.name!;

                                                }
                                              });
                                            });
                                          },
                                          iconSize: 40,
                                          icon: Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                              BorderRadius.only(
                                                  bottomLeft: Radius
                                                      .circular(5),
                                                  topLeft:
                                                  Radius.circular(
                                                      5)),
                                            ),
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
                                  // cubit.quantities.text=value;
                                  cubit.quantities1=value;
                                  // cubit.totalPrice.text =
                                  //     (double.parse(cubit.quantities.text) *
                                  //             double.parse(
                                  //                 cubit.itemPrice.text))
                                  //         .toString();
                                  cubit.calculateWhatYouPay();
                                },
                                controller: cubit.quantities,
                                // context: context,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'ادخل قيمة الكمية';
                                  }
                                  return null;
                                },
                                text: AppStrings.Quantity.tr(),
                                borderSide: const BorderSide(
                                    color: Colors.green, width: 1),
                                radius: const BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    bottomRight: Radius.circular(5)),
                              ),
                              // const SizedBox(width: 10,),
                              textField(
// context: context,
                                  controller: cubit.itemPrice,
                                  onChanged: (value) {
                                    // cubit.itemPrice.text=value;
                                    cubit.itemPrice1=value;
                                    // cubit.totalPrice.text =
                                    //     (double.parse(cubit.quantities.text) *
                                    //         double.parse(
                                    //             cubit.itemPrice.text))
                                    //         .toString();
                                    cubit.calculateWhatYouPay();
                                  },
                                  // context: context,
                                  text: AppStrings.unitprice.tr(),
                                  borderSide: const BorderSide(
                                      color: Colors.green, width: 1),
                                  radius: BorderRadius.zero),
                              // const SizedBox(width: 10,),
                              textField(

                                controller: cubit.totalPrice,
                                onChanged: (value) {
                                  // setState(() {
                                  //   cubit.totalPriceDetails.text = value;
                                  // });
                                },
                                readOnly: true,
                                // context: context,
                                text: AppStrings.Total.tr(),
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
                        hiddenWhen: [Condition.largerThan(name: MOBILE)],

                        child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width:
                                    MediaQuery.of(context).size.width *0.40,
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(AppStrings.item.tr(),
                                            style: GoogleFonts.notoKufiArabic(
                                                color: MyConstant().purpleColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14)),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.40,
                                          // padding: const EdgeInsets.only(right: 10),
                                          height: 44,
                                          padding: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(5),
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton2(
                                              iconEnabledColor: Colors.white,
                                              iconDisabledColor: Colors.grey,
                                              buttonHeight: 100,
                                              buttonWidth: 160,
                                              // buttonElevation: 2,
                                              itemHeight: 50,
                                              itemPadding:
                                              const EdgeInsets.only(
                                                  left: 14, right: 14),
                                              dropdownMaxHeight: 200,
                                              dropdownWidth: 200,

                                              buttonDecoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(5),
                                                border: Border.all(
                                                  color: Colors.green,
                                                ),
                                                color: Colors.white,
                                              ),
                                              dropdownDecoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(5),
                                                color: Colors.white,
                                              ),

                                              dropdownElevation: 8,
                                              scrollbarRadius:
                                              const Radius.circular(20),
                                              scrollbarThickness: 6,
                                              scrollbarAlwaysShow: true,
                                              items:cubit.productsNameList.map((item) => DropdownMenuItem(
                                                  value: item.name,
                                                  child: Center(child: Text(
                                                      item.name!,
                                                      style: GoogleFonts.notoKufiArabic(
                                                          color: Colors
                                                              .black,
                                                          fontWeight:
                                                          FontWeight
                                                              .bold, fontSize: 12)
                                                  ),),)).toList(),
                                              // items: cubit.productsNameList
                                              //     .map(ProductsBuild)
                                              //     .toList(),
                                              value: cubit.productItemName,
                                              isExpanded: true,
                                              onChanged: (value) {
                                                setState(() {
                                                cubit.productsNameList.forEach((product) {
                                                  if(product.name==value){
                                                    cubit.productItem=product;
                                                    cubit.itemCode = product.code! ;
                                                    cubit.itemPrice.text=double.parse(product.price!).toStringAsFixed(2);
                                                    cubit.calculateWhatYouPay();
                                                    // cubit.itemPrice.text =
                                                    //     value.price!;
                                                    // cubit.tax.text= cubit.taxRatesNameList.where((element) => element.id==value.taxRate).toString();
                                                    cubit.taxRatesNameList
                                                        .forEach((element) {
                                                      if (element.id ==
                                                          product.taxRate) {
                                                        cubit.tax.text =
                                                            double.parse( element.rate!)
                                                                .toStringAsFixed(2);
                                                        // element.rate!
                                                      }
                                                    });
                                                  }
                                                });
                                                cubit.productItemName=value as String;
                                                  cubit.typeOfClothes =value;

                                                  // cubit.productItem =
                                                  // value as Products;
                                                  // cubit.typeOfClothes =
                                                  // value.name!;
                                                  // cubit.itemCode = value.code!;
                                                  // cubit.itemPrice.text=double.parse(value.price!).toStringAsFixed(2);
                                                  // cubit.calculateWhatYouPay();
                                                  // // cubit.itemPrice.text =
                                                  // //     value.price!;
                                                  // // cubit.tax.text= cubit.taxRatesNameList.where((element) => element.id==value.taxRate).toString();
                                                  // cubit.taxRatesNameList
                                                  //     .forEach((element) {
                                                  //   if (element.id ==
                                                  //       value.taxRate) {
                                                  //     cubit.tax.text =
                                                  //         double.parse( element.rate!)
                                                  //             .toStringAsFixed(2);
                                                  //     // element.rate!
                                                  //   }
                                                  // });
                                                });
                                              },
                                              iconSize: 40,
                                              icon: Container(
                                                decoration: const BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                  BorderRadius.only(
                                                      bottomLeft: Radius
                                                          .circular(5),
                                                      topLeft:
                                                      Radius.circular(
                                                          5)),
                                                ),
                                                child: const Icon(Icons
                                                    .keyboard_arrow_down_sharp),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),

                                  Container(
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(AppStrings.size.tr(),
                                            style: GoogleFonts.notoKufiArabic(
                                                color: MyConstant().purpleColor,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14)),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width *0.40,
                                          height: 40,
                                          padding: const EdgeInsets.only(right: 5),
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton2(
                                              iconEnabledColor: Colors.white,
                                              iconDisabledColor: Colors.grey,
                                              buttonHeight: 100,
                                              buttonWidth: 160,

                                              // buttonElevation: 2,
                                              itemHeight: 50,
                                              itemPadding:
                                              const EdgeInsets.only(
                                                  left: 14, right: 14),
                                              dropdownMaxHeight: 200,
                                              dropdownWidth: 200,
                                              dropdownPadding: null,
                                              buttonDecoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(5),
                                                border: Border.all(
                                                  color: Colors.green,
                                                ),
                                                color: Colors.white,
                                              ),
                                              dropdownDecoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(5),
                                                color: Colors.white,
                                              ),

                                              dropdownElevation: 8,
                                              scrollbarRadius:
                                              const Radius.circular(20),
                                              scrollbarThickness: 6,
                                              scrollbarAlwaysShow: true,
                                                items: cubit.unitsNameList.map((unit) => DropdownMenuItem(
                                                    value: unit.name,
                                                    child: Center(child: Text(
                                                        unit.name!,
                                                        style: GoogleFonts.notoKufiArabic(
                                                            color: Colors
                                                                .black,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold, fontSize: 12)
                                                    ),),)).toList(),

                                                // items: cubit.unitsNameList
                                                //   .map(UnitsBuild)
                                                //   .toList(),
                                              value: cubit.valueItemSizeName,
                                              isExpanded: true,
                                              onChanged: (value) {
                                                setState(() {
                                                  // cubit.valueItemSize =
                                                  // value as Units;
                                                  // cubit.size = value.name!;
                                                  cubit.valueItemSizeName =
                                                  value as String;
                                                  cubit.unitsNameList.forEach((unit) {
                                                    if(unit.name==value){
                                                      cubit.size = unit.name!;

                                                    }
                                                  });
                                                });
                                              },
                                              iconSize: 40,
                                              icon: Container(
                                                decoration: const BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                  BorderRadius.only(
                                                      bottomLeft: Radius
                                                          .circular(5),
                                                      topLeft:
                                                      Radius.circular(
                                                          5)),
                                                ),
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
                                ],
                              ),
                              Row(
                                children: [
                                  textField(
                                    onChanged: (value) {
                                      cubit.quantities1=value;
                                      cubit.calculateWhatYouPay();
                                    },
                                    controller: cubit.quantities,
                                    // context: context,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'ادخل قيمة الكمية';
                                      }
                                      return null;
                                    },
                                    text: AppStrings.Quantity.tr(),
                                    borderSide: const BorderSide(
                                        color: Colors.green, width: 1),
                                    radius: const BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        bottomRight: Radius.circular(5)),
                                  ),
                                  // const SizedBox(width: 10,),
                                  textField(
// context: context,
                                      controller: cubit.itemPrice,
                                      onChanged: (value) {
                                        // cubit.itemPrice.text=value;
                                        cubit.itemPrice1=value;
                                        // cubit.totalPrice.text =
                                        //     (double.parse(cubit.quantities.text) *
                                        //         double.parse(
                                        //             cubit.itemPrice.text))
                                        //         .toString();
                                        cubit.calculateWhatYouPay();
                                      },
                                      // context: context,
                                      text: AppStrings.unitprice.tr(),
                                      borderSide: const BorderSide(
                                          color: Colors.green, width: 1),
                                      radius: BorderRadius.zero),
                                  // const SizedBox(width: 10,),
                                  textField(

                                    controller: cubit.totalPrice,
                                    onChanged: (value) {
                                      // setState(() {
                                      //   cubit.totalPriceDetails.text = value;
                                      // });
                                    },
                                    readOnly: true,
                                    // context: context,
                                    text: AppStrings.Total.tr(),
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
                              )
                            ],
                          ),
                        ),
                      ),

                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, right: 10),
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
                                child: Text(AppStrings.Sizes.tr(),
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
                        child: Text(AppStrings.Pricesanddetails.tr(),
                            style: GoogleFonts.notoKufiArabic(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                      ),

                      ResponsiveVisibility(
                        replacement:Container(
                            margin: EdgeInsets.only(top: 20),
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
                                  child: Container(
                                    width:
                                    MediaQuery.of(context).size.width / 1.2,
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
                                                text: AppStrings.Total.tr(),
                                                controller:
                                                cubit.totalPriceDetails,
                                                readOnly: true)),
                                        Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width /
                                                6,
                                            child: customTextField(
                                              text: AppStrings.Discount.tr(),
                                              controller: cubit.discount,
                                              textInputType: TextInputType.numberWithOptions(),

                                              onChange: (value) {
                                                if(value.isNotEmpty&&cubit.discount.text.isNotEmpty){
                                                  cubit.calculateDiscount(
                                                      value );}
                                              },
                                              // onChange: (value) {
                                              //    cubit.calculateDiscount(
                                              //       value);
                                              // }

                                            )),
                                        Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width /
                                                6,
                                            child: customTextField(
                                                text: AppStrings.Tax.tr(),
                                                controller: cubit.tax,
                                                readOnly: true)),
                                        Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width /
                                                6,
                                            child: customTextField(
                                                text: AppStrings.thenet.tr(),
                                                controller:
                                                cubit.whatYouPay,
                                                readOnly: true)),
                                      ],
                                    ),
                                  ),
                                ),
                                // const SizedBox(height: 30,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Container(
                                    width:
                                    MediaQuery.of(context).size.width /
                                        1.2,
                                    child: Row(
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceBetween,
                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width /
                                                6,
                                            margin: const EdgeInsets.only(
                                                top: 10),
                                            // alignment: Alignment.center,
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Text(AppStrings.payWith.tr(),
                                                    style: GoogleFonts
                                                        .notoKufiArabic(
                                                        color: MyConstant()
                                                            .purpleColor,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold,
                                                        fontSize: 14)),
                                                // const SizedBox(height: 5,),
                                                Container(
                                                  height: 40,
                                                  child:
                                                  DropdownButtonHideUnderline(
                                                    child: DropdownButton2(
                                                        iconEnabledColor: Colors
                                                            .white,
                                                        iconDisabledColor:
                                                        Colors.grey,
                                                        buttonHeight: 100,
                                                        buttonWidth: 160,
                                                        // buttonElevation: 2,
                                                        itemHeight: 50,
                                                        itemPadding:
                                                        const EdgeInsets
                                                            .only(
                                                            left: 14,
                                                            right: 14),
                                                        dropdownMaxHeight:
                                                        200,
                                                        dropdownWidth: 200,
                                                        buttonDecoration:
                                                        BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              5),
                                                          border:
                                                          Border.all(
                                                            color: Colors
                                                                .green,
                                                          ),
                                                          color:
                                                          Colors.white,
                                                        ),
                                                        dropdownDecoration:
                                                        BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              5),
                                                          color:
                                                          Colors.white,
                                                        ),
                                                        dropdownElevation:
                                                        8,
                                                        scrollbarRadius:
                                                        const Radius
                                                            .circular(
                                                            20),
                                                        scrollbarThickness:
                                                        6,
                                                        scrollbarAlwaysShow:
                                                        true,
                                                        items: cubit
                                                            .fixedPayment
                                                            .map(itemBuild)
                                                            .toList(),
                                                        value: cubit
                                                            .fixedPaymentType,
                                                        isExpanded: true,
                                                        onChanged: (value) {
                                                          setState(() {
                                                            cubit.fixedPaymentType =
                                                            value
                                                            as String;
                                                            // cubit.paymentType=value.code!;
                                                          });
                                                        },
                                                        iconSize: 40,
                                                        icon: Container(
                                                          decoration:
                                                          const BoxDecoration(
                                                            color: Colors
                                                                .green,
                                                            borderRadius: BorderRadius.only(
                                                                bottomLeft:
                                                                Radius.circular(
                                                                    5),
                                                                topLeft: Radius
                                                                    .circular(
                                                                    5)),
                                                          ),
                                                          child: const Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_sharp),
                                                        )),
                                                  ),
                                                ),
                                              ],
                                            )),
                                        (cubit.fixedPaymentType == AppStrings.monetary.tr() ||
                                            cubit.fixedPaymentType ==
                                                AppStrings.BankCheck.tr())
                                            ? Container(
                                            width: MediaQuery.of(context).size.width / 6,
                                            margin: EdgeInsets.only(top: 30),
                                            child: customTextField(
                                              text: AppStrings.Theamountpaid.tr(),
                                              controller: cubit.cash,
                                              onChange: (value) {
                                                cubit
                                                    .calculateRecentMoney(
                                                    value);
                                              },
                                              // onChange: (value) {
                                              //   cubit
                                              //       .calculateRecentMoney(
                                              //           value);
                                              // }
                                            ))
                                            : Container(),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        (cubit.fixedPaymentType ==
                                            AppStrings.BankCheck.tr())
                                            ? Container(
                                            width: MediaQuery.of(context).size.width / 6,
                                            margin: EdgeInsets.only(top: 30),
                                            child: customTextField(
                                                text: AppStrings.cheeckNumber.tr(),
                                                controller: cubit
                                                    .cheeckPayment))
                                            : Container(
                                          height: 0,
                                          width: 0,
                                        ),
                                        (cubit.fixedPaymentType ==
                                            AppStrings.CreditCard.tr())
                                            ? Container(
                                            margin: EdgeInsets.only(top: 30,left: 10,right: 10),
                                            width:
                                            MediaQuery.of(context)
                                                .size
                                                .width /
                                                6,
                                            child: customTextField(
                                                text: AppStrings.paidnetwork.tr(),
                                                controller: cubit
                                                    .onlinePayment))
                                            : Container(
                                          height: 0,
                                          width: 0,
                                        ),
                                        (cubit.fixedPaymentType ==
                                            AppStrings.CreditCard.tr())
                                            ? Container(
                                            width:
                                            MediaQuery.of(context)
                                                .size
                                                .width /
                                                6,
                                            margin:
                                            const EdgeInsets.only(
                                                top: 10),
                                            alignment: Alignment.center,
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(AppStrings.networktype.tr(),
                                                    style: GoogleFonts
                                                        .notoKufiArabic(
                                                        color: MyConstant()
                                                            .purpleColor,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold,
                                                        fontSize:
                                                        10)),
                                                // const SizedBox(height: 5,),
                                                Container(
                                                  height: 40,
                                                  child:
                                                  DropdownButtonHideUnderline(
                                                    child:
                                                    DropdownButton2(
                                                        iconEnabledColor: Colors
                                                            .white,
                                                        iconDisabledColor:
                                                        Colors
                                                            .grey,
                                                        buttonHeight:
                                                        100,
                                                        buttonWidth:
                                                        160,
                                                        // buttonElevation: 2,
                                                        itemHeight:
                                                        50,
                                                        itemPadding: const EdgeInsets.only(
                                                            left:
                                                            14,
                                                            right:
                                                            14),
                                                        dropdownMaxHeight:
                                                        200,
                                                        dropdownWidth:
                                                        200,
                                                        buttonDecoration:
                                                        BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                          border:
                                                          Border
                                                              .all(
                                                            color: Colors
                                                                .green,
                                                          ),
                                                          color: Colors
                                                              .white,
                                                        ),
                                                        dropdownDecoration:
                                                        BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                          color: Colors
                                                              .white,
                                                        ),
                                                        dropdownElevation:
                                                        8,
                                                        scrollbarRadius:
                                                        const Radius.circular(
                                                            20),
                                                        scrollbarThickness:
                                                        6,
                                                        scrollbarAlwaysShow:
                                                        true,
                                                        items: cubit
                                                            .paymentCodeList
                                                            .map(
                                                            PaymentTypeBuild)
                                                            .toList(),
                                                        value: cubit
                                                            .paymentTypeItem,
                                                        isExpanded:
                                                        true,
                                                        onChanged:
                                                            (value) {
                                                          setState(
                                                                  () {
                                                                cubit.paymentTypeItem =
                                                                value
                                                                as PaymentType;
                                                                cubit.paymentType =
                                                                value.code!;
                                                              });
                                                        },
                                                        iconSize:
                                                        40,
                                                        icon:
                                                        Container(
                                                          decoration:
                                                          const BoxDecoration(
                                                            color: Colors
                                                                .green,
                                                            borderRadius: BorderRadius.only(
                                                                bottomLeft:
                                                                Radius.circular(5),
                                                                topLeft: Radius.circular(5)),
                                                          ),
                                                          child: const Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_sharp),
                                                        )),
                                                  ),
                                                ),
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
                                ),
                                Container(
                                    width:
                                    MediaQuery.of(context).size.width /
                                        6,
                                    margin: const EdgeInsets.only(
                                        right: 20, top: 15, bottom: 12),
                                    child: customTextField(
                                        text: AppStrings.Remainingamount.tr(),
                                        readOnly: true,

                                        controller: cubit.delayMoney)),
                              ],
                            )),
                        hiddenWhen: [Condition.largerThan(name: MOBILE)],

                        child: Container(
                            margin: EdgeInsets.only(top: 20),
                            width: double.infinity,
                            padding: const EdgeInsets.only(top: 0),
                            // color: Colors.amber,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                                width: MediaQuery.of(context).size.width *0.40,
                                                child: customTextField(
                                                    text: AppStrings.Total.tr(),
                                                    controller:
                                                    cubit.totalPriceDetails,
                                                    readOnly: true)),
                                            const SizedBox(width: 10,height: 10,),
                                            Container(
                                                width: MediaQuery.of(context).size.width *0.40,
                                                child: customTextField(
                                                  text: AppStrings.Discount.tr(),
                                                  controller: cubit.discount,
                                                  textInputType: TextInputType.numberWithOptions(),

                                                  onChange: (value) {
                                                    if(value.isNotEmpty&&cubit.discount.text.isNotEmpty){
                                                      cubit.calculateDiscount(
                                                          value );}
                                                  },
                                                  // onChange: (value) {
                                                  //    cubit.calculateDiscount(
                                                  //       value);
                                                  // }

                                                )),
                                        ],),
                                        const SizedBox(width: 20,height: 20,),
                                        Row(
                                          children: [
                                            Container(
                                                width: MediaQuery.of(context).size.width *0.40,
                                                child: customTextField(
                                                    text: AppStrings.Tax.tr(),
                                                    controller: cubit.tax,
                                                    readOnly: true)),
                                            const SizedBox(width: 10,height: 10,),
                                            Container(
                                                width: MediaQuery.of(context).size.width *0.40,
                                                child: customTextField(
                                                    text: AppStrings.thenet.tr(),
                                                    controller:
                                                    cubit.whatYouPay,
                                                    readOnly: true)),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Container(
                                    width: MediaQuery.of(context).size.width*0.90,
                                    margin: const EdgeInsets.only(top: 10,left: 20,right: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(AppStrings.payWith.tr(),
                                            style: GoogleFonts
                                                .notoKufiArabic(
                                                color: MyConstant().purpleColor, fontWeight: FontWeight.bold, fontSize: 14)),
                                        // const SizedBox(height: 5,),
                                        Container(
                                          height: 40,
                                          width: MediaQuery.of(context).size.width*0.90,
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton2(
                                                iconEnabledColor: Colors
                                                    .white,
                                                iconDisabledColor:
                                                Colors.grey,
                                                buttonHeight: 100,
                                                buttonWidth: 160,
                                                // buttonElevation: 2,
                                                itemHeight: 50,
                                                itemPadding:
                                                const EdgeInsets
                                                    .only(
                                                    left: 14,
                                                    right: 14),
                                                dropdownMaxHeight:
                                                200,
                                                dropdownWidth: 200,
                                                buttonDecoration:
                                                BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                      5),
                                                  border:
                                                  Border.all(
                                                    color: Colors
                                                        .green,
                                                  ),
                                                  color:
                                                  Colors.white,
                                                ),
                                                dropdownDecoration:
                                                BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(
                                                      5),
                                                  color:
                                                  Colors.white,
                                                ),
                                                dropdownElevation:
                                                8,
                                                scrollbarRadius:
                                                const Radius
                                                    .circular(
                                                    20),
                                                scrollbarThickness:
                                                6,
                                                scrollbarAlwaysShow:
                                                true,
                                                items: cubit
                                                    .fixedPayment
                                                    .map(itemBuild)
                                                    .toList(),
                                                value: cubit
                                                    .fixedPaymentType,
                                                isExpanded: true,
                                                onChanged: (value) {
                                                  setState(() {
                                                    cubit.fixedPaymentType =
                                                    value
                                                    as String;
                                                    // cubit.paymentType=value.code!;
                                                  });
                                                },
                                                iconSize: 40,
                                                icon: Container(
                                                  decoration:
                                                  const BoxDecoration(
                                                    color: Colors
                                                        .green,
                                                    borderRadius: BorderRadius.only(
                                                        bottomLeft:
                                                        Radius.circular(
                                                            5),
                                                        topLeft: Radius
                                                            .circular(
                                                            5)),
                                                  ),
                                                  child: const Icon(
                                                      Icons
                                                          .keyboard_arrow_down_sharp),
                                                )),
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Container(
                                    child: Row(
                                      children: [

                                        (cubit.fixedPaymentType ==  AppStrings.monetary.tr() ||
                                            cubit.fixedPaymentType ==
                                                AppStrings.BankCheck.tr())
                                            ? Container(
                                            width: MediaQuery.of(context).size.width *0.30,
                                            margin: EdgeInsets.only(top: 30),
                                            child: customTextField(
                                              text: AppStrings.Theamountpaid.tr(),
                                              controller: cubit.cash,
                                              onChange: (value) {
                                                cubit
                                                    .calculateRecentMoney(
                                                    value);
                                              },
                                            ))
                                            : Container(),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        (cubit.fixedPaymentType ==
                                            AppStrings.BankCheck.tr())
                                            ? Container(
                                            width: MediaQuery.of(context).size.width *0.30,
                                            margin: EdgeInsets.only(top: 30),
                                            child: customTextField(
                                                text: AppStrings.cheeckNumber.tr(),
                                                controller: cubit
                                                    .cheeckPayment))
                                            : Container(
                                          height: 0,
                                          width: 0,
                                        ),
                                        (cubit.fixedPaymentType ==
                                            AppStrings.CreditCard.tr())
                                            ? Container(
                                            margin: EdgeInsets.only(top: 30,left: 10,right: 10),
                                            width:
                                            MediaQuery.of(context).size.width *0.30,
                                            child: customTextField(
                                                text: AppStrings.paidnetwork.tr(),
                                                controller: cubit
                                                    .onlinePayment))
                                            : Container(
                                          height: 0,
                                          width: 0,
                                        ),
                                        (cubit.fixedPaymentType ==
                                            AppStrings.CreditCard.tr())
                                            ? Container(
                                            width:
                                            MediaQuery.of(context).size.width *0.30,
                                            margin:
                                            const EdgeInsets.only(
                                                top: 10),
                                            alignment: Alignment.center,
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: [
                                                Text(AppStrings.networktype.tr(),
                                                    style: GoogleFonts
                                                        .notoKufiArabic(
                                                        color: MyConstant()
                                                            .purpleColor,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold,
                                                        fontSize:
                                                        10)),
                                                // const SizedBox(height: 5,),
                                                Container(
                                                  height: 40,
                                                  child:
                                                  DropdownButtonHideUnderline(
                                                    child:
                                                    DropdownButton2(
                                                        iconEnabledColor: Colors
                                                            .white,
                                                        iconDisabledColor:
                                                        Colors
                                                            .grey,
                                                        buttonHeight:
                                                        100,
                                                        buttonWidth:
                                                        160,
                                                        // buttonElevation: 2,
                                                        itemHeight:
                                                        50,
                                                        itemPadding: const EdgeInsets.only(
                                                            left:
                                                            14,
                                                            right:
                                                            14),
                                                        dropdownMaxHeight:
                                                        200,
                                                        dropdownWidth:
                                                        200,
                                                        buttonDecoration:
                                                        BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                          border:
                                                          Border
                                                              .all(
                                                            color: Colors
                                                                .green,
                                                          ),
                                                          color: Colors
                                                              .white,
                                                        ),
                                                        dropdownDecoration:
                                                        BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                          color: Colors
                                                              .white,
                                                        ),
                                                        dropdownElevation:
                                                        8,
                                                        scrollbarRadius:
                                                        const Radius.circular(
                                                            20),
                                                        scrollbarThickness:
                                                        6,
                                                        scrollbarAlwaysShow:
                                                        true,
                                                        items: cubit
                                                            .paymentCodeList
                                                            .map(
                                                            PaymentTypeBuild)
                                                            .toList(),
                                                        value: cubit
                                                            .paymentTypeItem,
                                                        isExpanded:
                                                        true,
                                                        onChanged:
                                                            (value) {
                                                          setState(
                                                                  () {
                                                                cubit.paymentTypeItem =
                                                                value
                                                                as PaymentType;
                                                                cubit.paymentType =
                                                                value.code!;
                                                              });
                                                        },
                                                        iconSize:
                                                        40,
                                                        icon:
                                                        Container(
                                                          decoration:
                                                          const BoxDecoration(
                                                            color: Colors
                                                                .green,
                                                            borderRadius: BorderRadius.only(
                                                                bottomLeft:
                                                                Radius.circular(5),
                                                                topLeft: Radius.circular(5)),
                                                          ),
                                                          child: const Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_sharp),
                                                        )),
                                                  ),
                                                ),
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
                                ),
                                Container(
                                    width:
                                    MediaQuery.of(context).size.width *0.30,
                                    margin: const EdgeInsets.only(
                                        right: 20, top: 15, bottom: 12),
                                    child: customTextField(
                                        text:AppStrings.Remainingamount.tr(),
                                        readOnly: true,

                                        controller: cubit.delayMoney)),
                              ],
                            )),
                      ),


                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      width: 100,
                      height: 40,
                      margin: const EdgeInsets.only(left: 20, right: 20,bottom: 5),
                      child: OutlinedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              MyConstant().purpleColor),
                        ),
                        onPressed: () async {
                          try {
                            LoadingPage(context).show();
                            List<ProductModel> productList = [
                              ProductModel(
                                  id: int.parse(cubit.productItem!.id!),
                                  code: cubit.productItem!.code,
                                  name: cubit.productItem!.slug,
                                  category_id: int.parse(cubit.productItem!.categoryId!),
                                  unit: int.parse(cubit.productItem!.unit!),
                                  price: double.parse(cubit.productItem!.price!),
                                  tax_rate: int.parse(cubit.productItem!.taxRate!),
                                  tax_method: cubit.productItem!.taxMethod == "0" ? false : true,
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
                                // customerId: int.parse(cubit.users[0].id!),
                                // customerId: int.parse(cubit.companiesEmployeeName[0].id!),
                                customerId: customerId,
                                dueDate: "2022-08-16T00:00:00",
                                hash: "51280eb9564fe8aaa0abca09a2921438e7b0ae05d1714c0badb64238144eef8c",
                                // customer: cubit.companiesEmployeeName[0].company,
                                // customer: cubit.companiesEmployeeName[0].company,
                                customer: cubit.userItemName,
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
                                    commercialDiscount: 10.0000,
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
                                    itemName: cubit.typeOfClothes,
                                    itemCode: cubit.itemCode,
                                    frontLength: double.parse(
                                        cubit.frontHeight.text.isEmpty?"0":cubit.frontHeight.text),
                                    backLength:
                                    double.parse(cubit.backHeight.text.isEmpty?"0":cubit.backHeight.text),
                                    shoulderWidth: double.parse(
                                        cubit.shoulderWidth.text.isEmpty?"0":cubit.shoulderWidth.text),
                                    shoulderSlope: double.parse(
                                        cubit.shoulderSlope.text.isEmpty?"0":cubit.shoulderSlope.text),
                                    sleeve: double.parse(
                                        cubit.sleeveLengthPlain.text.isEmpty?"0":cubit.sleeveLengthPlain.text),
                                    sleeveTop: double.parse(
                                        cubit.sleeveLengthIsHigher.text.isEmpty?"0":cubit.sleeveLengthIsHigher.text),
                                    wrist:
                                    double.parse(cubit.wideWrist.text.isEmpty?"0":cubit.wideWrist.text),
                                    plainCuffLength:
                                    double.parse(cubit.plainCuff.text.isEmpty?"0":cubit.plainCuff.text),
                                    cuffLength:
                                    double.parse(cubit.cuffLength.text.isEmpty?"0":cubit.cuffLength.text),
                                    cuffWidth:
                                    double.parse(cubit.cuffShow.text.isEmpty?"0":cubit.cuffShow.text),
                                    middleWidth:
                                    double.parse(cubit.wideMiddle.text.isEmpty?"0":cubit.wideMiddle.text),
                                    chestFront: double.parse(
                                        cubit.expandTheChestInFront.text.isEmpty?"0":cubit.expandTheChestInFront.text),
                                    chestBack: double.parse(
                                        cubit.expandTheChestBehind.text.isEmpty?"0":cubit.expandTheChestBehind.text),
                                    bottomHeight: double.parse(
                                        cubit.koftaBottom.text.isEmpty?"0":cubit.koftaBottom.text),
                                    bottomWidth:
                                    double.parse(cubit.expandDown.text.isEmpty?"0":cubit.expandDown.text),
                                    collarWidth: double.parse(
                                        cubit.wideNeckPillow.text.isEmpty?"0":cubit.wideNeckPillow.text),
                                    collarHeight:
                                    double.parse(cubit.neckHeight.text.isEmpty?"0":cubit.neckHeight.text),
                                    zipperHeight: double.parse(
                                        cubit.gypsumHeight.text.isEmpty?"0":cubit.gypsumHeight.text),
                                    zipperWidth:
                                    double.parse(cubit.viewGypsum.text.isEmpty?"0":cubit.viewGypsum.text),
                                    chestPocketHeight: double.parse(
                                        cubit.lengthChestPocket.text.isEmpty?"0":cubit.lengthChestPocket.text),
                                    chestPocketWidth: double.parse(
                                        cubit.wideChestPocket.text.isEmpty?"0":cubit.wideChestPocket.text),
                                    mobilePocketHeight: double.parse(
                                        cubit.wideMobilePocket.text.isEmpty?"0":cubit.wideMobilePocket.text),
                                    walletPocketHeight: double.parse(
                                        cubit.lengthPocketWallet.text.isEmpty?"0":cubit.lengthPocketWallet.text),
                                    walletPocketWidth: double.parse(
                                        cubit.widePocketWallet.text.isEmpty?"0":cubit.widePocketWallet.text),
                                    haunchWidth:
                                    double.parse(cubit.hipWidth.text.isEmpty?"0":cubit.hipWidth.text),
                                    buttonNo:
                                    int.parse(cubit.buttonNumber.text.isEmpty?"0":cubit.buttonNumber.text),
                                    embroideryNo: int.parse(
                                        cubit.embroideryNumber.text.isEmpty?"0":cubit.embroideryNumber.text),
                                    estimatedLength: double.parse(
                                        cubit.expectedFabricInMeter.text.isEmpty?"0":cubit.expectedFabricInMeter.text),
                                    tailorId: 1,
                                    sample: cubit.sample?1:0,
                                    urgent: cubit.harryUp?1:0,
                                    shoulderChestLength: double.parse(cubit
                                        .betweenTheChestPocketAndTheShoulder
                                        .text.isEmpty?"0":cubit.betweenTheChestPocketAndTheShoulder.text),
                                    sleeveMiddle: double.parse(
                                        cubit.quantumCapacityMedium.text.isEmpty?"0":cubit.quantumCapacityMedium.text),
                                    sidePocketLength:
                                    double.parse(cubit.sidePocket.text.isEmpty?"0":cubit.sidePocket.text),
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
                            await cubit.pillResponse(
                                pillRequestModel: pillRequestModel);
                            // await cubit.getAllInvoiceInformation();
                            log("requestIs>>"+jsonEncode(pillRequestModel));
                            LoadingPage(context).close();

                            Navigator.pushNamed(
                                context, PrintScreen.routeName);
                          } catch (error) {
                            print(error.toString());
                          }
                        },
                        child: Text(AppStrings.Save.tr(),
                            style: GoogleFonts.notoKufiArabic(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                      )),
                ),
              ],
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
                  color: Colors.white,
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
