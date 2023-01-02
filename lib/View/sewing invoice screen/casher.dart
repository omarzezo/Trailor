import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/End%20Point.dart';
import 'package:omar/Controller/local/shared_pref.dart';
import 'package:omar/View/sewing%20invoice%20screen/Widgets.dart';
import 'package:omar/View/sewing%20invoice%20screen/cashier_report.dart';
import 'package:omar/constant/appstrings.dart';
import 'package:omar/constant/constant.dart';
import 'package:omar/models/cashierclose.dart';
import 'package:omar/models/cashierstart.dart';

class CashierScreen extends StatelessWidget {
  const CashierScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(children: [
          Row(
            children: [
              Expanded(child: Container(
                color: MyConstant().purpleColor,
                child: Center(
                  child: Text(AppStrings.Closethecashier.tr(),style: GoogleFonts.notoKufiArabic(
        color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
                ),
              )),
            ],
          ),
          SizedBox(height: 10,),

          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  color: MyConstant().purpleColor,
                  child: Text(AppStrings.userCode.tr(),
                      style: GoogleFonts.notoKufiArabic(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),

                ),
              ),
              Expanded(child: Center(
                child: Text(userId.isNotEmpty?userId:CacheHelper.getData(key: "userId"),
                    style: GoogleFonts.notoKufiArabic(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ))
            ],
          ),
          SizedBox(height: 10,),

          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),

                  color: MyConstant().purpleColor,

                  child: Text(AppStrings.totalCash.tr(),
                      style: GoogleFonts.notoKufiArabic(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),

                ),
              ),
              Expanded(child: Center(
                child: Text(LoginCubit.get(context).totalCash,
                    style: GoogleFonts.notoKufiArabic(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ))

            ],
          ),
          SizedBox(height: 10,),

          // Row(
          //   children: [
          //     Expanded(
          //       child: Container(
          //         padding: EdgeInsets.symmetric(horizontal: 20),
          //
          //         color: MyConstant().purpleColor,
          //
          //         child: Text(AppStrings.CashierOpeningDate.tr(),
          //             style: GoogleFonts.notoKufiArabic(
          //                 color: Colors.white,
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: 18)),
          //
          //       ),
          //     ),
          //     Expanded(child: Center(
          //       child: Text(DateFormat("yyyy-MM-dd HH:mm").format(DateTime.now()).toString(),
          //           style: GoogleFonts.notoKufiArabic(
          //               color: Colors.black,
          //               fontWeight: FontWeight.bold,
          //               fontSize: 18)),
          //     ))
          //
          //   ],
          // ),
          // SizedBox(height: 10,),

          Row(
            children: [

              Expanded(
                child: Container(
                  color: MyConstant().purpleColor,
                  padding: EdgeInsets.symmetric(horizontal: 20),

                  child: Text(AppStrings.closingDate.tr(),
                      style: GoogleFonts.notoKufiArabic(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),

                ),
              ),


              Expanded(child: Center(
                child: Text(DateFormat("yyyy-MM-dd HH:mm").format(DateTime.now()).toString(),
                    style: GoogleFonts.notoKufiArabic(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ))
            ],
          ),
          SizedBox(height: 10,),

          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),

                  color: MyConstant().purpleColor,

                  child: Text( AppStrings.totalCheckMoney.tr(),
                      style: GoogleFonts.notoKufiArabic(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),

                ),
              ),
              Expanded(child: Center(
                child: Text("0",
                    style: GoogleFonts.notoKufiArabic(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ))

            ],
          ),
          SizedBox(height: 10,),

          Row(
            children: [

              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  color: MyConstant().purpleColor,
height: 30,
                  child: Text(AppStrings.totalCardsMoney.tr(),
                      style: GoogleFonts.notoKufiArabic(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),

                ),
              ),
              Expanded(child: Center(
                child: Text("0",
                    style: GoogleFonts.notoKufiArabic(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ))

            ],
          ),
          SizedBox(height: 10,),

          Row(
            children: [
              Expanded(
                child: Container(

                  color: MyConstant().purpleColor,
                  padding: EdgeInsets.symmetric(horizontal: 20),

                  child: Text(AppStrings.invoiceNumber.tr(),
                      style: GoogleFonts.notoKufiArabic(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),

                ),
              ),
              Expanded(child: Center(
                child: Text(LoginCubit.get(context).invoiceNumbers.toString(),
                    style: GoogleFonts.notoKufiArabic(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ))

            ],
          ),
          SizedBox(height: 10,),

          Row(
            children: [

              Expanded(
                child: Container(
                  color: MyConstant().purpleColor,
                  padding: EdgeInsets.symmetric(horizontal: 20),

                  child: Text(AppStrings.closedBy.tr(),
                      style: GoogleFonts.notoKufiArabic(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),

                ),
              ),
              Expanded(child: Center(
                child: Text(userId.isNotEmpty?userId:CacheHelper.getData(key: "userId"),
                    style: GoogleFonts.notoKufiArabic(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ))

            ],
          ),
          SizedBox(height: 10,),

          Row(
            children: [
              Expanded(
                child: Container(

                  color: MyConstant().purpleColor,
                  padding: EdgeInsets.symmetric(horizontal: 20),

                  child: Text(AppStrings.note.tr(),
                      style: GoogleFonts.notoKufiArabic(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),

                ),
              ),
              Expanded(child: Center(
                child: Text("0",
                    style: GoogleFonts.notoKufiArabic(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
              ))

            ],
          ),
          SizedBox(height: 10,),


          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  color: MyConstant().purpleColor,
                  onPressed: ()async {
                    if(LoginCubit.get(context).cashierIsOpened==true){
                      LoginCubit.get(context).endDate=DateFormat("yyyy-MM-dd HH:mm:ss","en").format(DateTime.now()).toString();

                      CashierCloseRequest cashierCloseRequest=CashierCloseRequest(userId:userId.isNotEmpty?userId:CacheHelper.getData(key: "userId") ,closedAt: DateFormat("yyyy-MM-dd HH:mm:ss","en").format(DateTime.now()).toString(),closedBy:userId.isNotEmpty?userId:CacheHelper.getData(key: "userId") ,invoiceCount:LoginCubit.get(context).invoiceNumbers.toString() ,note:" " ,totalCash:LoginCubit.get(context).totalCash??"0" ,totalCc:"0" ,totalCheques: "0");
                      await LoginCubit.get(context).closeCashier(cashierCloseRequest).then((value) async{
                        if(value.status==true){
                          LoginCubit.get(context).changeCashierState();

                          await    Navigator.pushNamed(context, CashierPillScreen.routeName);

                          LoginCubit.get(context).invoiceNumbers=0;
                          LoginCubit.get(context).totalCash="0";
                          LoginCubit.get(context).cashInHandController.text="0";

                        }


                      });
                    }else{
                      Navigator.of(context).pop();

                    }


                  },child: Text(AppStrings.close.tr(),
                    style: GoogleFonts.notoKufiArabic(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),),
              ),
              Expanded(
                child: MaterialButton(onPressed: () {
                  Navigator.of(context).pop();
                },child: Text(AppStrings.Cancel.tr(),
                    style: GoogleFonts.notoKufiArabic(
                        color: MyConstant().purpleColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),),
              ),
            ],
          ),
        ],),
      ),
    );
  }
}
class OpenCashier extends StatefulWidget {
  const OpenCashier({Key? key}) : super(key: key);

  @override
  State<OpenCashier> createState() => _OpenCashierState();
}

class _OpenCashierState extends State<OpenCashier> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
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
            Text(CacheHelper.getData(key: "email")??"",  style: GoogleFonts.notoKufiArabic(
                color: MyConstant().purpleColor,
                fontWeight: FontWeight.bold,
                fontSize: 16))

            // Container(
            //   width: MediaQuery.of(context)
            //       .size
            //       .width /
            //       3,
            //   padding:
            //   const EdgeInsets.only(right: 0),
            //   height: 40,
            //   decoration: BoxDecoration(
            //     borderRadius:
            //     BorderRadius.circular(5),
            //   ),
            //
            //   child: (LoginCubit.get(context).usersList !=null)?DropdownButtonHideUnderline(
            //     child: DropdownButton2(
            //       iconEnabledColor: Colors.white,
            //       iconDisabledColor: Colors.grey,
            //       buttonHeight: 100,
            //       buttonWidth: 160,
            //
            //       // buttonElevation: 2,
            //       itemHeight: 50,
            //       itemPadding:
            //       const EdgeInsets.only(
            //           left: 14, right: 14),
            //       dropdownMaxHeight: 250,
            //       dropdownWidth: 250,
            //       dropdownPadding: null,
            //       buttonDecoration: BoxDecoration(
            //         borderRadius:
            //         BorderRadius.circular(5),
            //         border: Border.all(
            //           color: Colors.green,
            //         ),
            //         color: Colors.white,
            //       ),
            //       dropdownDecoration: BoxDecoration(
            //         borderRadius:
            //         BorderRadius.circular(5),
            //         color: Colors.white,
            //       ),
            //
            //       dropdownElevation: 8,
            //       scrollbarRadius:
            //       const Radius.circular(20),
            //       scrollbarThickness: 6,
            //       scrollbarAlwaysShow: true,
            //       items:LoginCubit.get(context).usersList!.map((item) => DropdownMenuItem(
            //         value: item.username,
            //         child: Center(child: Text(
            //             item.username!,
            //             style: GoogleFonts.notoKufiArabic(
            //                 color: Colors
            //                     .black,
            //                 fontWeight:
            //                 FontWeight
            //                     .bold, fontSize: 12)
            //         ),),
            //       )).toList(),
            //       // items: cubit.companiesEmployeeName
            //       //     .map(EmployeeBuild)
            //       //     .toList(),
            //       value: LoginCubit.get(context).userName,
            //       isExpanded: true,
            //
            //       onChanged: (val) {
            //
            //         setState(() {
            //           LoginCubit.get(context).userName=val as String;
            //           LoginCubit.get(context).userNamevar=val;
            //
            //           // LoginCubit.get(context).userName=val;
            //           LoginCubit.get(context).usersList!.forEach((user) {
            //             if(val ==user.username){
            //               LoginCubit.get(context).userId=user.id;
            //             }
            //
            //           });
            //         });
            //       },
            //       iconSize: 40,
            //       icon: Container(
            //         decoration: const BoxDecoration(
            //           color: Colors.green,
            //           borderRadius:
            //           BorderRadius.only(
            //               bottomLeft: Radius
            //                   .circular(5),
            //               topLeft:
            //               Radius.circular(
            //                   5)),
            //         ),
            //         child: const Icon(Icons
            //             .keyboard_arrow_down_sharp),
            //       ),
            //     ),
            //   ):Container(),
            // )
          ],
        ),
        Text(AppStrings.Amountavailableforopening.tr(),
            style: GoogleFonts.notoKufiArabic(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
        textField(
          textInputType: TextInputType.number,
          controller: LoginCubit.get(context).cashInHandController,
            onChanged: (value) {
              LoginCubit.get(context).cashInHand=double.parse(value);
            },


            text: " ", radius: BorderRadius.circular(5), borderSide: BorderSide(color: Colors.grey)),
        Row(children: [
          Expanded(child: TextButton(child: Text(AppStrings.add .tr(),),onPressed: ()async {
            LoginCubit.get(context).startDate=DateFormat("yyyy-MM-dd HH:mm:ss","en").format(DateTime.now()).toString();
            // LoginCubit.get(context).cashInHand=LoginCubit.get(context).cashInHandController.text.isEmpty?"0":LoginCubit.get(context).cashInHandController.text;
            CashierStartRequest cashierStartRequest=CashierStartRequest(userId:userId.isNotEmpty?userId:CacheHelper.getData(key: "userId") ,cashInHand:LoginCubit.get(context).cashInHand.toStringAsFixed(2) ,date: DateFormat("yyyy-MM-dd HH:mm:ss","en").format(DateTime.now()).toString());
await LoginCubit.get(context).openCashier(cashierStartRequest).then((value) {
  if(value.status==true){
    LoginCubit.get(context).totalCash=(LoginCubit.get(context).cashInHand+double.parse(LoginCubit.get(context).totalCash)).toString();
    LoginCubit.get(context).changeCashierState();

  }
});
            Navigator.of(context).pop();
          },)),
          Expanded(child: TextButton(child: Text(AppStrings.Cancel.tr(),),onPressed: () {
            Navigator.of(context).pop();
          },))
        ],)


      ],
    );
  }
}