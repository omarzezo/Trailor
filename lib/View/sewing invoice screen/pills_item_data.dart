import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Cubit/State.dart';
import 'package:omar/SharedPreferencesHelper.dart';
import 'package:omar/View/invoice_Screen.dart';
import 'package:omar/constant/appstrings.dart';
import 'package:omar/constant/constant.dart';
import 'package:omar/models/updatePillsStatus.dart';
import 'package:flutter/services.dart' as p;

import '../../constant/LoadingPage.dart';

class PillsItemData extends StatefulWidget {
  static const routeName = "PillsItemData";

   PillsItemData({Key? key}) : super(key: key);

  @override
  State<PillsItemData> createState() => _PillsItemDataState();
}

class _PillsItemDataState extends State<PillsItemData> {
  TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is UpdatedPillsResponseSuccessState) {
          LoadingPage(context).close();
          Navigator.pop(context, true);
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              leading: InkWell(
                onTap: () {
                  cubit.stausName=null;
                  Navigator.pop(context);

                },
                child: Icon(
                    Icons.arrow_back_ios

                ),),
              title: Text(AppStrings.details.tr(),
                  style: GoogleFonts.notoKufiArabic(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              actions: [
                IconButton(onPressed: ()async{
                  await LoginCubit.get(context).getInvoiceInformation(cubit.pillsDetailsItem!.id!);

                  int? pageSize=await  SharedPreferencesHelper.getPageSize();
                  int? printerType=await  SharedPreferencesHelper.getPrinterType();
                  print(pageSize);
                  print(printerType);
                  if(pageSize==null){
                    pageSize=0;
                  }
                  if(pageSize==null||printerType==null){
                    Fluttertoast.showToast(
                        msg: AppStrings.printertoast.tr(),
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );
                  }else{
                    Navigator.pushNamed(context, PrintPillScreen.routeName,arguments: PrintPillScreen(pageSize: pageSize,printerType: printerType,));
                  }

                }, icon: Icon(Icons.print),)
              ],
              centerTitle: true,

            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(AppStrings.statue.tr(),
                            style: GoogleFonts.notoKufiArabic(
                                color: MyConstant().purpleColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        Spacer(),
                        if(cubit.statusNameList!=null&&cubit.statusNameList.isNotEmpty)  Container(
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
                              items:  cubit.statusNameList.map((item) => DropdownMenuItem(
                                value: item,
                                child: Center(child: Text(
                                    item,
                                    style: GoogleFonts.notoKufiArabic(
                                        color: Colors
                                            .black,
                                        fontWeight:
                                        FontWeight
                                            .bold, fontSize: 12)
                                ),),)).toList(),
                              value: cubit.stausName,
                              isExpanded: true,
                              onChanged: (value) {
                                setState(() {
                                  cubit.stausName=value as String;
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
                        ),

                        // Container(
                        //   // padding: const EdgeInsets.only(left: 10),
                        //
                        //   width: 125,
                        //   child: TextField(
                        //     style: GoogleFonts.notoKufiArabic(
                        //       color: Colors.black,
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 18),
                        //    controller: controller,
                        //     onChanged: (value) {
                        //       if(value.isNotEmpty){
                        //         cubit.status=value;
                        //       }
                        //     },
                        //
                        //
                        //     decoration: InputDecoration(
                        //       hintStyle:  GoogleFonts.notoKufiArabic(
                        //           color: Colors.black,
                        //           fontWeight: FontWeight.bold,
                        //           fontSize: 18),
                        //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                        //       hintText: cubit.status ,
                        //
                        //     ),
                        //   ),
                        // ),

                        // Text(cubit.pillsDetailsItem!.saleStatus ?? "",
                        //     style: GoogleFonts.notoKufiArabic(
                        //         color: Colors.black,
                        //         fontWeight: FontWeight.bold,
                        //         fontSize: 18)),
                        Spacer(),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Text(AppStrings.deliverydate.tr(),
                            style: GoogleFonts.notoKufiArabic(
                                color: MyConstant().purpleColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Container(
                            // padding: const EdgeInsets.only(left: 10),
                            width: 125,
                            child: TextField(
                              onTap: ()async{
                                await cubit.getDateFromUser(context);
                                DatePickerDialog(

                                    initialDate: DateTime.now(), firstDate:  DateTime.now(), lastDate:  DateTime.now());
                              },
                              readOnly: true,
                              decoration: InputDecoration(
                                hintStyle:  GoogleFonts.notoKufiArabic(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                                hintText:  cubit.selectedDate!.split(" ").first ?? "",

                              ),
                            ),
                          ),
                        ),
                        // InkWell(
                        //   onTap: ()async{
                        //  await cubit.getDateFromUser(context);
                        //
                        //     DatePickerDialog(initialDate: DateTime.now(), firstDate:  DateTime.now(), lastDate:  DateTime.now());
                        //   },
                        //   child: Padding(
                        //     padding: const EdgeInsets.only(left: 50),
                        //     child: Text(
                        //         cubit.pillsDetailsItem!.deliveryDate!
                        //                 .split(" ")
                        //                 .first ??
                        //             "",
                        //         style: GoogleFonts.notoKufiArabic(
                        //             color: Colors.black,
                        //             fontWeight: FontWeight.bold,
                        //             fontSize: 18)),
                        //   ),
                        // ),
                        Spacer(),

                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Text(AppStrings.invoicdate.tr(),
                            style: GoogleFonts.notoKufiArabic(
                                color: MyConstant().purpleColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        Spacer(),

                        Padding(
                          padding: const EdgeInsets.only(left: 50),
                          child: Text(cubit.pillsDetailsItem!.date!.split(" ").first ?? "",
                              style: GoogleFonts.notoKufiArabic(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                        ),

                        Spacer(),


                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Text(AppStrings.Client.tr(),
                            style: GoogleFonts.notoKufiArabic(
                                color: MyConstant().purpleColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        Spacer(),

                        Text(cubit.pillsDetailsItem!.customer ?? "",
                            style: GoogleFonts.notoKufiArabic(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        Spacer(),

                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Text(AppStrings.phoneNumber.tr(),
                            style: GoogleFonts.notoKufiArabic(
                                color: MyConstant().purpleColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        Spacer(),

                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text("+96658465984",
                              style: GoogleFonts.notoKufiArabic(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                        ),
                        Spacer(),

                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Text(AppStrings.clientCode.tr(),
                            style: GoogleFonts.notoKufiArabic(
                                color: MyConstant().purpleColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        Spacer(),

                        Padding(

                          padding: const EdgeInsets.only(left: 50),
                          child: Text(cubit.pillsDetailsItem!.customerId ?? "",
                              style: GoogleFonts.notoKufiArabic(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                        ),
                        Spacer(),

                      ],
                    ),
                    SizedBox(height: 10,),
                    Divider(),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Text(AppStrings.reference.tr(),
                            style: GoogleFonts.notoKufiArabic(
                                color: MyConstant().purpleColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        Spacer(),

                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(cubit.pillsDetailsItem!.referenceNo ?? "",
                              style: GoogleFonts.notoKufiArabic(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                        ),
                        Spacer(),

                      ],
                    ),
                    SizedBox(height: 50,),
                    Container(
                        width: MediaQuery.of(context).size.width/2,
                        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: OutlinedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                MyConstant().purpleColor),
                          ),
                          onPressed: () async {
                            try{
                              LoadingPage(context).show();

                              UpdatedPillsStatusModel model=UpdatedPillsStatusModel(saleId: cubit.pillsDetailsItem!.id, deliveryDate: cubit.selectedDate, saleStatus: cubit.stausName, note: "");
                              cubit.updatePills(model);
                              cubit.stausName=null;
                              await cubit.getPillsDetails();

                              LoadingPage(context).close();
                              Navigator.pop(context);

                            }catch(error){
                              print(error.toString());
                            }

                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 10,bottom: 10),
                            child: Text(AppStrings.edit.tr(),
                                style: GoogleFonts.notoKufiArabic(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                          ),
                        )),

                  ],
                ),
              ),
            ));
      },
    );
  }
}
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
