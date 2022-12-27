import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Cubit/State.dart';
import 'package:omar/View/sewing%20invoice%20screen/edit_customer_info.dart';
import 'package:omar/View/sewing%20invoice%20screen/pills_item_data.dart';
import 'package:omar/constant/appstrings.dart';
import 'package:omar/constant/constant.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter/services.dart' as p;

import '../SharedPreferencesHelper.dart';

class AllCustomerScreen extends StatefulWidget {
  static const routeName = "AllCustomerScreen";

  const AllCustomerScreen({Key? key}) : super(key: key);

  @override
  AllCustomerScreenState createState() => AllCustomerScreenState();
}

class AllCustomerScreenState extends State<AllCustomerScreen> {

  bool isSelect1 = false;
  bool isSelect2 = false;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  // final scrollControl = ScrollController();

  @override
  Widget build(BuildContext context) {
    var cubit=LoginCubit.get(context);
    // print(LoginCubit.get(context).allCustomerResponse!.data!.length.toString());
    return  BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return  Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: Text(AppStrings.customersList.tr(), style: GoogleFonts.notoKufiArabic(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)), centerTitle: true,),
          body: ResponsiveVisibility(
            replacement: Container(
              padding: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
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
                            child: Text( AppStrings.clientName.tr(),
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
                            child: Text(AppStrings.Email.tr(),
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
                            child: Text(AppStrings.vatNumber.tr(),
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
                            child: Text(AppStrings.address.tr(),
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
                            child: Text(AppStrings.zipCode.tr(),
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


                      ],
                    ),
                  ),
                  //todo list view
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
                    child:cubit.allCustomerResponse!=null&&cubit.allCustomerResponse!.data!=null&&cubit.allCustomerResponse!.data!.isNotEmpty? ListView.builder(
                      scrollDirection: Axis.vertical,
                      // controller: scrollControl,
                      // physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => Container(
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
                            int id= int.parse(LoginCubit.get(context).allCustomerResponse!.data![index].id!);
                            await LoginCubit.get(context).getCustomerDetails(context,id);
                            // LoginCubit.get(context).getPillsDetailsForItem( index);
                            Navigator.pushNamed(context, EditCustomerScreen.routeName);
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
                                        // top: BorderSide(color: Colors.grey, width: 0.5),
                                        // bottom: BorderSide(color: Colors.grey, width: 0.5),
                                      )),
                                  height: 80,
                                  width: 100,
                                  child: Text(cubit.allCustomerResponse!.data![index].company ?? "",
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
                                  child: Text(cubit.allCustomerResponse!.data![index].email ?? "",
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
                                  child: Text(cubit.allCustomerResponse!.data![index].vatNo ?? "",
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
                                  child: Text(cubit.allCustomerResponse!.data![index].address ?? "",
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
                                  child: Text(cubit.allCustomerResponse!.data![index].postalCode ?? "",
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
                                  child: Text(cubit.allCustomerResponse!.data![index].phone ?? "",
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
                      ),
                      itemCount: cubit.allCustomerResponse!.data!.length,
                    ):Center(child: Text(
                      AppStrings.NoClients.tr(),style: getStyle(color: Colors.black, fontSize: 18),)),
                    // ),
                  ),
                ],
              ),
            ),
            hiddenWhen: [Condition.largerThan(name: MOBILE)],
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: EdgeInsets.all(20),
                // height: 700,
                width: 1000,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
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
                              child: Text(AppStrings.clientName.tr(),
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
                              child: Text(AppStrings.Email.tr(),
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
                              child: Text(AppStrings.vatNumber.tr(),
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
                              child: Text(AppStrings.address.tr(),
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
                              child: Text(AppStrings.zipCode.tr(),
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


                        ],
                      ),
                    ),

                    Expanded(
                      child: cubit.allCustomerResponse!=null&&cubit.allCustomerResponse!.data!=null&&cubit.allCustomerResponse!.data!.isNotEmpty?ListView.builder(
                        scrollDirection: Axis.vertical,
                        // controller: scrollControl,
                        // physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Container(
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
                              int id= int.parse(LoginCubit.get(context).allCustomerResponse!.data![index].id!);
                              await LoginCubit.get(context).getCustomerDetails(context,id);
                              // LoginCubit.get(context).getPillsDetailsForItem( index);
                              Navigator.pushNamed(context, EditCustomerScreen.routeName);
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
                                          // top: BorderSide(color: Colors.grey, width: 0.5),
                                          // bottom: BorderSide(color: Colors.grey, width: 0.5),
                                        )),
                                    height: 80,
                                    width: 100,
                                    child: Text(cubit.allCustomerResponse!.data![index].company!,
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
                                    child: Text(cubit.allCustomerResponse!.data![index].email!,
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
                                    child: Text(cubit.allCustomerResponse!.data![index].vatNo! ??"",
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
                                    child: Text(cubit.allCustomerResponse!.data![index].address ?? "",
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
                                    child: Text(cubit.allCustomerResponse!.data![index].postalCode ?? "",
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
                                    child: Text(cubit.allCustomerResponse!.data![index].phone ?? "",
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
                        ),
                        itemCount:cubit.allCustomerResponse!.data!.length,
                      ):Center(child: Text(
                        AppStrings.NoClients.tr(),style: getStyle(color: Colors.black, fontSize: 18),)),
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
}
