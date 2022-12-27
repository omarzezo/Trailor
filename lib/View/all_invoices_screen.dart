import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Cubit/State.dart';
import 'package:omar/SharedPreferencesHelper.dart';
import 'package:omar/View/Data%20Table/model.dart';
import 'package:omar/View/Data%20Table/widget%20table.dart';
import 'package:omar/View/sewing%20invoice%20screen/pills_item_data.dart';
import 'package:omar/View/sewing%20invoice%20screen/return_item_screen.dart';
import 'package:omar/constant/appstrings.dart';
import 'package:omar/constant/constant.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter/services.dart' as p;

class AllInvoicesScreen extends StatefulWidget {
  const AllInvoicesScreen({Key? key}) : super(key: key);
  static const routeName = "AllInvoicesScreen";

  @override
  AllInvoicesScreenState createState() => AllInvoicesScreenState();
}

class AllInvoicesScreenState extends State<AllInvoicesScreen> {

  bool isSelect1 = false;
  bool isSelect2 = false;
  List<PillsDetailsData> filteredList = [];
  List<PillsDetailsData>? pillsDetailsDataList=[];
  String textSearch = "";

  // late List<Details>  details = [];
  // late List<Details>  details = listOfDetail;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var cubit=LoginCubit.get(context);
    // pillsDetailsDataList = cubit.pillsDetails!=null?List.from(cubit.pillsDetails!.data!):[];
    filteredList = cubit.pillsDetails!=null?List.from(cubit.pillsDetails!.data!):[];

    // log("dataisNew>>"+jsonEncode(cubit.pillsDetails!.data!));

    setState(() {});
  }
  // final scrollControl = ScrollController();

  @override
  Widget build(BuildContext context) {
    // var cubit=LoginCubit.get(context);
    // pillsDetailsDataList = List.from(cubit.pillsDetails!.data!);
    // filteredList = List.from(cubit.pillsDetails!.data!);

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return  Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: Text(AppStrings.invoices.tr(), style: GoogleFonts.notoKufiArabic(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)), centerTitle: true,),

          body: ResponsiveVisibility(
              replacement: Container(
                padding: EdgeInsets.all(20),
                height:MediaQuery.of(context).size.width,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    searchField(),
                    Container(
                      width: MediaQuery.of(context).size.width /1,
                      // margin: const EdgeInsets.all(20),
                      height: 40,
                      decoration:
                      BoxDecoration(border: Border.all(color: Colors.purple)),
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: MyConstant().greenColor.withOpacity(0.1),
                              border: Border(
                                left: BorderSide(color: Colors.green.withOpacity(0.3)),
                                right: BorderSide(color: Colors.green.withOpacity(0.3)),
                              ),
                            ),
                            height: 80,
                            width: 40,
                            child: Text('N',
                                style: GoogleFonts.notoKufiArabic(
                                  color: MyConstant().greenColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                )),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: MyConstant().greenColor.withOpacity(0.1),
                                border: Border(
                                  left: BorderSide(color: Colors.green.withOpacity(0.3)),
                                  right: BorderSide(color: Colors.green.withOpacity(0.3)),
                                ),
                              ),
                              height: 80,
                              width: 100,
                              child: Text(AppStrings.Client.tr(),
                                  style: GoogleFonts.notoKufiArabic(
                                    color: MyConstant().greenColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  )),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: MyConstant().greenColor.withOpacity(0.1),
                                border: Border(
                                  left: BorderSide(color: Colors.green.withOpacity(0.3)),
                                  right: BorderSide(color: Colors.green.withOpacity(0.3)),
                                ),
                              ),
                              height: 80,
                              width: 100,
                              child: Text(AppStrings.phoneNumber.tr(),
                                  style: GoogleFonts.notoKufiArabic(
                                    color: MyConstant().greenColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  )),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: MyConstant().greenColor.withOpacity(0.1),
                                border: Border(
                                  left: BorderSide(color: Colors.green.withOpacity(0.3)),
                                  right: BorderSide(color: Colors.green.withOpacity(0.3)),
                                ),
                              ),
                              height: 80,
                              width: 100,
                              child: Text(AppStrings.statue.tr(),
                                  style: GoogleFonts.notoKufiArabic(
                                    color: MyConstant().greenColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  )),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: MyConstant().greenColor.withOpacity(0.1),
                                border: Border(
                                  left: BorderSide(color: Colors.green.withOpacity(0.3)),
                                  right: BorderSide(color: Colors.green.withOpacity(0.3)),
                                ),
                              ),
                              height: 80,
                              width: 100,
                              child: Text(AppStrings.Residual.tr(),
                                  style: GoogleFonts.notoKufiArabic(
                                    color: MyConstant().greenColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  )),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: MyConstant().greenColor.withOpacity(0.1),
                                border: Border(
                                  left: BorderSide(color: Colors.green.withOpacity(0.3)),
                                  right: BorderSide(color: Colors.green.withOpacity(0.3)),
                                ),
                              ),
                              height: 80,
                              width: 100,
                              child: Text(AppStrings.deliverydate.tr(),
                                  style: GoogleFonts.notoKufiArabic(
                                    color: MyConstant().greenColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  )),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: MyConstant().greenColor.withOpacity(0.1),
                                border: Border(
                                  left: BorderSide(color: Colors.green.withOpacity(0.3)),
                                  right: BorderSide(color: Colors.green.withOpacity(0.3)),
                                ),
                              ),
                              height: 80,
                              width: 100,
                              child: Text(AppStrings.invoicdate.tr(),
                                  style: GoogleFonts.notoKufiArabic(
                                    color: MyConstant().greenColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  )),
                            ),
                          ),

                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: MyConstant().greenColor.withOpacity(0.1),
                                border: Border(
                                  left: BorderSide(color: Colors.green.withOpacity(0.3)),
                                  right: BorderSide(color: Colors.green.withOpacity(0.3)),
                                ),
                              ),
                              height: 80,
                              width: 100,
                              child: Text(AppStrings.phoneNumber.tr(),
                                  style: GoogleFonts.notoKufiArabic(
                                    color: MyConstant().greenColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  )),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: MyConstant().greenColor.withOpacity(0.1),
                                border: Border(
                                  left: BorderSide(color: Colors.green.withOpacity(0.3)),
                                  right: BorderSide(color: Colors.green.withOpacity(0.3)),
                                ),
                              ),
                              height: 80,
                              width: 100,
                              child: Text(AppStrings.clientCode.tr(),
                                  style: GoogleFonts.notoKufiArabic(
                                    color: MyConstant().greenColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  )),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: MyConstant().greenColor.withOpacity(0.1),
                                border: Border(
                                  left: BorderSide(color: Colors.green.withOpacity(0.3)),
                                  right: BorderSide(color: Colors.green.withOpacity(0.3)),
                                ),
                              ),
                              height: 80,
                              width: 100,
                              child: Text(AppStrings.reference.tr(),
                                  style: GoogleFonts.notoKufiArabic(
                                    color: MyConstant().greenColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  )),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Expanded(
                      // child: Scrollbar(
                      //   thickness: 15,
                      //   controller: scrollControl,
                      //   radius: const Radius.circular(0),
                      //   trackVisibility: true,
                      //   interactive: true,
                      //   isAlwaysShown: true,
                      //   showTrackOnHover: true,
                      //   hoverThickness: 12,
                      child:pillsDetailsDataList!=null&&pillsDetailsDataList!.isNotEmpty? ListView.builder(
                        // physics: NeverScrollableScrollPhysics(),

                        scrollDirection: Axis.vertical,

                        itemBuilder: (context, index) {

                          PillsDetailsData item = textSearch.isNotEmpty ? filteredList[index] : pillsDetailsDataList![index];

                          return Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            // margin: const EdgeInsets.all(20),
                            height: 40,
                            decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(color: Colors.purple, ),
                                  right: BorderSide(color: Colors.purple, ),
                                  top: BorderSide(color: Colors.grey, width: 0.5),
                                  bottom: BorderSide(color: Colors.grey, width: 0.5),
                                )),
                            child: InkWell(
                              onTap: () async{
                                // String salesID=pillsDetails.data![index].id!;
                                String salesID=textSearch.isNotEmpty ? filteredList[index].id! : pillsDetailsDataList![index].id!;
                                await  LoginCubit.get(context).getPillsDetailsForItemFilterd( int.parse(salesID));
                                Navigator.pushNamed(context, PillsItemData.routeName);

                                // LoginCubit.get(context).salesIdSearch=pillsDetails.data![index].id;

                                // LoginCubit.get(context).getPillsDetailsForItem( index);
                                // LoginCubit.get(context).getPillsDetailsForItemFilterd( index);
                                // LoginCubit.get(context).salesIdSearch=item.id;
                                //
                                // await LoginCubit.get(context).getReturnItemInformation(LoginCubit.get(context).salesIdSearch.toString());
                                // Navigator.pushNamed(context, ReturnItemScreen.routeName);

                              },
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    decoration:  BoxDecoration(
                                        border: Border(
                                          left: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                          right: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                        )),
                                    height: 80,
                                    width: 40,
                                    child: Text((index+1).toString(),
                                        style: GoogleFonts.notoKufiArabic(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                        )),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration:  BoxDecoration(
                                          border: Border(
                                            left: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                            right: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                          )),
                                      height: 80,
                                      width: 100,
                                      child: Text(item.customer!=null?item.customer??"":"",
                                          style: GoogleFonts.notoKufiArabic(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          )),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration:  BoxDecoration(
                                          border: Border(
                                            left: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                            right: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                          )),
                                      height: 80,
                                      width: 100,
                                      child: Text(item.phone??"",
                                          style: GoogleFonts.notoKufiArabic(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          )),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration:  BoxDecoration(
                                          color: item.saleStatus!=null?item.saleStatus!.startsWith("p")||item.saleStatus!.startsWith("مر")?Color(0xffefae50):item.saleStatus!.startsWith("c")||item.saleStatus!.startsWith("مك")?Colors.green:Colors.red:Colors.red,

                                          border: Border(
                                            left: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                            right: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                            // top: BorderSide(color: Colors.grey, width: 0.5),
                                            // bottom: BorderSide(color: Colors.grey, width: 0.5),
                                          )),
                                      height: 80,
                                      width: 100,
                                      child: Text(item.saleStatus??"",
                                          style: GoogleFonts.notoKufiArabic(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          )),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration:  BoxDecoration(
                                          border: Border(
                                            left: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                            right: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                            // top: BorderSide(color: Colors.grey, width: 0.5),
                                            // bottom: BorderSide(color: Colors.grey, width: 0.5),
                                          )),
                                      height: 80,
                                      width: 100,
                                      child: Text(item.balance??"",
                                          style: GoogleFonts.notoKufiArabic(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          )),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration:  BoxDecoration(
                                          border: Border(
                                            left: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                            right: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                          )),
                                      height: 80,
                                      width: 100,
                                      child: Text('${item.deliveryDate!=null?item.deliveryDate!.split( " ").first:""}',
                                          style: GoogleFonts.notoKufiArabic(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          )),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration:  BoxDecoration(
                                          border: Border(
                                            left: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                            right: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                          )),
                                      height: 80,
                                      width: 100,
                                      child: Text('${item.date!=null?item.date!.split( " ").first:""}',
                                          style: GoogleFonts.notoKufiArabic(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          )),
                                    ),
                                  ),

                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration:  BoxDecoration(
                                          border: Border(
                                            left: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                            right: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                          )),
                                      height: 80,
                                      width: 100,
                                      child: Text(
                                          // '+966 011 256 7846',
                                         item.phone??"",
                                          style: GoogleFonts.notoKufiArabic(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          )),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration:  BoxDecoration(
                                          border: Border(
                                            left: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                            right: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                          )),
                                      height: 80,
                                      width: 100,
                                      child: Text('${item.customerId??""}',
                                          style: GoogleFonts.notoKufiArabic(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          )),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration:  BoxDecoration(
                                          border: Border(
                                            left: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                            right: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                          )),
                                      height: 80,
                                      width: 100,
                                      child: Text('${item.referenceNo??""}',
                                          style: GoogleFonts.notoKufiArabic(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          )),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          );
                        },

                        // itemCount: cubit.pillsDetails!.data!.length,
                        itemCount: textSearch.isNotEmpty ? filteredList.length : pillsDetailsDataList!.length,
                      ):Center(child: Text(
                        AppStrings.NoInvoices.tr(),style: getStyle(color: Colors.black, fontSize: 18),)),
                      // ),
                    ),
                  ],
                ),
              ) ,
              hiddenWhen: [Condition.largerThan(name: MOBILE)],

              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: EdgeInsets.all(20),

                  height: 1000,
                  width: 1000,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      searchField(),
                      Container(
                        width: 1000,
                        // margin: const EdgeInsets.all(20),
                        height: 40,
                        decoration:
                        BoxDecoration(border: Border.all(color: Colors.purple)),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: MyConstant().greenColor.withOpacity(0.1),
                                border: Border(
                                  left: BorderSide(color: Colors.green.withOpacity(0.3)),
                                  right: BorderSide(color: Colors.green.withOpacity(0.3)),
                                ),
                              ),
                              height: 80,
                              width: 40,
                              child: Text('N',
                                  style: GoogleFonts.notoKufiArabic(
                                    color: MyConstant().greenColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  )),
                            ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   // color: Colors.purple,
                            //   decoration: BoxDecoration(
                            //       color: MyConstant().purpleColor,
                            //       border: Border.all(color: MyConstant().purpleColor)),
                            //   height: 40,
                            //   width: 30,
                            //   child: Text('م',
                            //       style: GoogleFonts.notoKufiArabic(
                            //         color: Colors.white,
                            //         fontWeight: FontWeight.w600,
                            //         fontSize: 12,
                            //       )),
                            // ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   decoration: BoxDecoration(
                            //       color: MyConstant().greenColor ,
                            //       border: Border.all( color: MyConstant().greenColor)),
                            //   height: 40,
                            //   width: 30,
                            //   child: Text('ع',
                            //       style: GoogleFonts.notoKufiArabic(
                            //         color: Colors.white,
                            //         fontWeight: FontWeight.w600,
                            //         fontSize: 12,
                            //       )),
                            // ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: MyConstant().greenColor.withOpacity(0.1),
                                  border: Border(
                                    left: BorderSide(color: Colors.green.withOpacity(0.3)),
                                    right: BorderSide(color: Colors.green.withOpacity(0.3)),
                                  ),
                                ),
                                height: 80,
                                width: 100,
                                child: Text(AppStrings.Client.tr(),
                                    style: GoogleFonts.notoKufiArabic(
                                      color: MyConstant().greenColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    )),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: MyConstant().greenColor.withOpacity(0.1),
                                  border: Border(
                                    left: BorderSide(color: Colors.green.withOpacity(0.3)),
                                    right: BorderSide(color: Colors.green.withOpacity(0.3)),
                                  ),
                                ),
                                height: 80,
                                width: 100,
                                child: Text(AppStrings.phoneNumber.tr(),
                                    style: GoogleFonts.notoKufiArabic(
                                      color: MyConstant().greenColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    )),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: MyConstant().greenColor.withOpacity(0.1),
                                  border: Border(
                                    left: BorderSide(color: Colors.green.withOpacity(0.3)),
                                    right: BorderSide(color: Colors.green.withOpacity(0.3)),
                                  ),
                                ),
                                height: 80,
                                width: 100,
                                child: Text(AppStrings.statue.tr(),
                                    style: GoogleFonts.notoKufiArabic(
                                      color: MyConstant().greenColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    )),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: MyConstant().greenColor.withOpacity(0.1),
                                  border: Border(
                                    left: BorderSide(color: Colors.green.withOpacity(0.3)),
                                    right: BorderSide(color: Colors.green.withOpacity(0.3)),
                                  ),
                                ),
                                height: 80,
                                width: 100,
                                child: Text(AppStrings.Residual.tr(),
                                    style: GoogleFonts.notoKufiArabic(
                                      color: MyConstant().greenColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    )),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: MyConstant().greenColor.withOpacity(0.1),
                                  border: Border(
                                    left: BorderSide(color: Colors.green.withOpacity(0.3)),
                                    right: BorderSide(color: Colors.green.withOpacity(0.3)),
                                  ),
                                ),
                                height: 80,
                                width: 100,
                                child: Text(AppStrings.deliverydate.tr(),
                                    style: GoogleFonts.notoKufiArabic(
                                      color: MyConstant().greenColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    )),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: MyConstant().greenColor.withOpacity(0.1),
                                  border: Border(
                                    left: BorderSide(color: Colors.green.withOpacity(0.3)),
                                    right: BorderSide(color: Colors.green.withOpacity(0.3)),
                                  ),
                                ),
                                height: 80,
                                width: 100,
                                child: Text(AppStrings.invoicdate.tr(),
                                    style: GoogleFonts.notoKufiArabic(
                                      color: MyConstant().greenColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    )),
                              ),
                            ),

                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: MyConstant().greenColor.withOpacity(0.1),
                                  border: Border(
                                    left: BorderSide(color: Colors.green.withOpacity(0.3)),
                                    right: BorderSide(color: Colors.green.withOpacity(0.3)),
                                  ),
                                ),
                                height: 80,
                                width: 100,
                                child: Text(AppStrings.phoneNumber.tr(),
                                    style: GoogleFonts.notoKufiArabic(
                                      color: MyConstant().greenColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    )),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: MyConstant().greenColor.withOpacity(0.1),
                                  border: Border(
                                    left: BorderSide(color: Colors.green.withOpacity(0.3)),
                                    right: BorderSide(color: Colors.green.withOpacity(0.3)),
                                  ),
                                ),
                                height: 80,
                                width: 100,
                                child: Text(AppStrings.clientCode.tr(),
                                    style: GoogleFonts.notoKufiArabic(
                                      color: MyConstant().greenColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    )),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: MyConstant().greenColor.withOpacity(0.1),
                                  border: Border(
                                    left: BorderSide(color: Colors.green.withOpacity(0.3)),
                                    right: BorderSide(color: Colors.green.withOpacity(0.3)),
                                  ),
                                ),
                                height: 80,
                                width: 100,
                                child: Text(AppStrings.reference.tr(),
                                    style: GoogleFonts.notoKufiArabic(
                                      color: MyConstant().greenColor,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    )),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Expanded(
                        // child: Scrollbar(
                        //   thickness: 15,
                        //   controller: scrollControl,
                        //   radius: const Radius.circular(0),
                        //   trackVisibility: true,
                        //   interactive: true,
                        //   isAlwaysShown: true,
                        //   showTrackOnHover: true,
                        //   hoverThickness: 12,
                        child:pillsDetailsDataList!=null&&pillsDetailsDataList!.isNotEmpty? ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {

                            PillsDetailsData item = textSearch.isNotEmpty ? filteredList[index] : pillsDetailsDataList![index];

                            return Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              // margin: const EdgeInsets.all(20),
                              height: 40,
                              decoration: const BoxDecoration(
                                  border: Border(
                                    left: BorderSide(color: Colors.purple, ),
                                    right: BorderSide(color: Colors.purple, ),
                                    top: BorderSide(color: Colors.grey, width: 0.5),
                                    bottom: BorderSide(color: Colors.grey, width: 0.5),
                                  )),
                              child: InkWell(
                                onTap: ()async {
                                  String salesID=textSearch.isNotEmpty ? filteredList[index].id! : pillsDetailsDataList![index].id!;
                                  await  LoginCubit.get(context).getPillsDetailsForItemFilterd( int.parse(salesID));
                                  Navigator.pushNamed(context, PillsItemData.routeName);

                                  // LoginCubit.get(context).salesIdSearch=item.id;
                                  //
                                  // // await    LoginCubit.get(context).getReturnId( index);
                                  // // Navigator.pushNamed(context, PillsItemData.routeName);
                                  // // var saleint=  textSearch.isNotEmpty ? filteredList[index].id : pillsDetailsDataList![index].id;
                                  //
                                  // // await LoginCubit.get(context).getSizeInformation(LoginCubit.get(context).salesIdSearch.toString());
                                  // await LoginCubit.get(context).getReturnItemInformation(LoginCubit.get(context).salesIdSearch.toString());
                                  // Navigator.pushNamed(context, ReturnItemScreen.routeName);
                                  //
                                  //  await LoginCubit.get(context).getReturnId( index);
                                  //  // Navigator.pushNamed(context, PillsItemData.routeName);
                                  //  // var saleint=  textSearch.isNotEmpty ? filteredList[index].referenceNo : pillsDetailsDataList![index].id;
                                  // await LoginCubit.get(context).getSizeInformation(LoginCubit.get(context).returnid.toString());
                                  //
                                  //  Navigator.pushNamed(context, ReturnItemScreen.routeName);
                                },
                                child: Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      decoration:  BoxDecoration(
                                          border: Border(
                                            left: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                            right: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                          )),
                                      height: 80,
                                      width: 40,
                                      child: Text((index+1).toString(),
                                          style: GoogleFonts.notoKufiArabic(
                                            color: Colors.green,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                          )),
                                    ),

                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration:  BoxDecoration(
                                            border: Border(
                                              left: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                              right: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                            )),
                                        height: 80,
                                        width: 100,
                                        child: Text(item.customer!,
                                            style: GoogleFonts.notoKufiArabic(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                            )),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration:  BoxDecoration(
                                            border: Border(
                                              left: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                              right: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                            )),
                                        height: 80,
                                        width: 100,
                                        child: Text(item.phone!,
                                            style: GoogleFonts.notoKufiArabic(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                            )),
                                      ),
                                    ),Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration:  BoxDecoration(
                                            color: item.saleStatus!.startsWith("p")||item.saleStatus!.startsWith("مر")?Color(0xffefae50):item.saleStatus!.startsWith("c")||item.saleStatus!.startsWith("مك")?Colors.green:Colors.red,

                                            border: Border(
                                              left: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                              right: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                              // top: BorderSide(color: Colors.grey, width: 0.5),
                                              // bottom: BorderSide(color: Colors.grey, width: 0.5),
                                            )),
                                        height: 80,
                                        width: 100,
                                        child: Text(item.saleStatus!,
                                            style: GoogleFonts.notoKufiArabic(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                            )),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration:  BoxDecoration(
                                            border: Border(
                                              left: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                              right: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                              // top: BorderSide(color: Colors.grey, width: 0.5),
                                              // bottom: BorderSide(color: Colors.grey, width: 0.5),
                                            )),
                                        height: 80,
                                        width: 100,
                                        child: Text(item.balance!,
                                            style: GoogleFonts.notoKufiArabic(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                            )),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration:  BoxDecoration(
                                            border: Border(
                                              left: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                              right: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                            )),
                                        height: 80,
                                        width: 100,
                                        child: Text('${item.deliveryDate!=null?item.deliveryDate!.split( " ").first:""}',
                                            style: GoogleFonts.notoKufiArabic(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                            )),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration:  BoxDecoration(
                                            border: Border(
                                              left: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                              right: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                            )),
                                        height: 80,
                                        width: 100,
                                        child: Text('${item.date!=null?item.date!.split( " ").first:""}',
                                            style: GoogleFonts.notoKufiArabic(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                            )),
                                      ),
                                    ),

                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration:  BoxDecoration(
                                            border: Border(
                                              left: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                              right: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                            )),
                                        height: 80,
                                        width: 100,
                                        child: Text(
                                            // '+966 011 256 7846',
                                            item.phone??"",
                                            style: GoogleFonts.notoKufiArabic(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                            )),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration:  BoxDecoration(
                                            border: Border(
                                              left: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                              right: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                            )),
                                        height: 80,
                                        width: 100,
                                        child: Text('${item.customerId??""}',
                                            style: GoogleFonts.notoKufiArabic(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                            )),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        alignment: Alignment.center,
                                        decoration:  BoxDecoration(
                                            border: Border(
                                              left: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                              right: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                            )),
                                        height: 80,
                                        width: 100,
                                        child: Text('${item.referenceNo??""}',
                                            style: GoogleFonts.notoKufiArabic(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                            )),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            );
                          },

                          // itemCount: cubit.pillsDetails!.data!.length,
                          itemCount: textSearch.isNotEmpty ? filteredList.length : pillsDetailsDataList!.length,
                        ):Center(child: Text(
                      AppStrings.NoInvoices.tr(),style: getStyle(color: Colors.black, fontSize: 18),)),
                        // ),
                      ),
                    ],
                  ),
                ),
              )
          ),
        );

      },
    );
  }

  Widget searchField() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
          width: MediaQuery.of(context).size.width*0.60,
          child: CupertinoSearchTextField(
            decoration: BoxDecoration(
              border: Border.all(color:MyConstant().greenColor,width: 2),
              borderRadius: const BorderRadius.all(
                  Radius.circular(10.0)//                 <--- border radius here
              ),

            ),
            placeholder: "بحث",
            style: GoogleFonts.notoKufiArabic(
                color: Colors.black,
                fontSize: 14
            ),
            // backgroundColor: Colors.white,
            onChanged: (String value) {
              print("value>>"+value.toLowerCase().toString());
              filteredList.clear();
              textSearch = value;
              List<PillsDetailsData> data = pillsDetailsDataList!.where((i) => i.customer!.toLowerCase().contains(value.toLowerCase())).toList();
              filteredList=List.from(data);
              print("filteredListSize>>"+filteredList.length.toString());
              setState(() {});
            },
            onSubmitted: (String value) {},
          )
      ),
    );
  }

}
