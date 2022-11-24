import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/View/sewing%20invoice%20screen/Widgets.dart';
import 'package:omar/constant/appstrings.dart';
import 'package:omar/constant/constant.dart';

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
                  child: Text(AppStrings.BillNumber.tr(),
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

                  child: Text(AppStrings.BillNumberReturned.tr(),
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

                  child: Text(AppStrings.Amountavailableforopening.tr(),
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

                  child: Text(AppStrings.CashierOpeningDate.tr(),
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
                  color: MyConstant().purpleColor,
                  padding: EdgeInsets.symmetric(horizontal: 20),

                  child: Text(AppStrings.CashierClosingDate.tr(),
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

                  child: Text(AppStrings.TotalSales.tr(),
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
height: 30,
                  child: Text(" "),

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

                  child: Text(AppStrings.TotalNetworkSales.tr(),
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

                  child: Text(AppStrings.TotalTermSales.tr(),
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

                  child: Text(AppStrings.TotalReturns.tr(),
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

                  child: Text(AppStrings.TotalCashinHand.tr(),
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
                  onPressed: () {
                    Navigator.of(context).pop();

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
class OpenCashier extends StatelessWidget {
  const OpenCashier({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(AppStrings.Amountavailableforopening.tr(),
            style: GoogleFonts.notoKufiArabic(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
        textField(

            text: " ", radius: BorderRadius.circular(5), borderSide: BorderSide(color: Colors.grey)),
        Row(children: [
          Expanded(child: TextButton(child: Text(AppStrings.add .tr(),),onPressed: () {
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