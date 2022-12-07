import 'dart:convert';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Cubit/State.dart';
import 'package:omar/View/Data%20Table/model.dart';
import 'package:omar/View/Data%20Table/widget%20table.dart';
import 'package:omar/View/sewing%20invoice%20screen/pills_item_data.dart';
import 'package:omar/View/sewing%20invoice%20screen/return_item_screen.dart';
import 'package:omar/constant/appstrings.dart';
import 'package:omar/constant/constant.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter/services.dart' as p;

class ReturnItemsScreen extends StatefulWidget {
  const ReturnItemsScreen({Key? key}) : super(key: key);

  @override
  ReturnItemsScreenState createState() => ReturnItemsScreenState();
}

class ReturnItemsScreenState extends State<ReturnItemsScreen> {

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
    pillsDetailsDataList = List.from(cubit.pillsDetails!.data!);
    filteredList = List.from(cubit.pillsDetails!.data!);

    log("dataisNew>>"+jsonEncode(cubit.pillsDetails!.data!));

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
        return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  searchField(),
                  ListView.separated(itemBuilder: (context, index) {

                    PillsDetailsData item = textSearch.isNotEmpty ? filteredList[index] : pillsDetailsDataList![index];

                    return InkWell(
                      onTap: () async {
                        LoginCubit.get(context).salesIdSearch=item.id;


                        await LoginCubit.get(context).getReturnItemInformation(LoginCubit.get(context).salesIdSearch.toString());
                        Navigator.pushNamed(context, ReturnItemScreen.routeName);

                      },
                      child: Container(
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: MyConstant().greenColor)

                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(child:    RichText(text: TextSpan(
                                    text: "${AppStrings.customer.tr()} : ",
                                    style: GoogleFonts.notoKufiArabic(
                                        color: MyConstant().greenColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    children:[
                                      TextSpan(
                                        text: "  ${pillsDetailsDataList![index].customer}  ",
                                        style: GoogleFonts.notoKufiArabic(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      )
                                    ]
                                ))
                                ),
                                Expanded(child:
                                RichText(
                                    text: TextSpan(
                                    text: "${AppStrings.statue.tr()} : ",
                                    style: GoogleFonts.notoKufiArabic(
                                        color: MyConstant().greenColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    children:[
                                      TextSpan(
                                        text: "  ${pillsDetailsDataList![index].saleStatus}  ",
                                        style: GoogleFonts.notoKufiArabic(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      )
                                    ]
                                ))
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(child:    RichText(text: TextSpan(
                                    text: "${AppStrings.deliverydate.tr()} : ",
                                    style: GoogleFonts.notoKufiArabic(
                                        color: MyConstant().greenColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                    children:[
                                      TextSpan(
                                        text: "  ${pillsDetailsDataList![index].deliveryDate}  ",
                                        style: GoogleFonts.notoKufiArabic(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      )
                                    ]
                                ))
                                ),
                                Expanded(child:
                                RichText(
                                    text: TextSpan(
                                        text: "${AppStrings.Residual.tr()} : ",
                                        style: GoogleFonts.notoKufiArabic(
                                            color: MyConstant().greenColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                        children:[
                                          TextSpan(
                                            text: "  ${pillsDetailsDataList![index].balance}  ",
                                            style: GoogleFonts.notoKufiArabic(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          )
                                        ]
                                    ))
                                ),

                              ],
                            )
                          ],
                        ),

                      ),
                    );
                  }, separatorBuilder: (context, index) => SizedBox(height: 10,), itemCount: pillsDetailsDataList!.length,
                  shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                  ),

                ],
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
