import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/View/AllCustomersHomeScreen.dart';
import 'package:omar/View/add_invoice.dart';
import 'package:omar/View/all_invoices_screen.dart';
import 'package:omar/View/all_customers_screen.dart';
import 'package:omar/View/home/home.dart';
import 'package:omar/View/present_all_tables_screen.dart';
import 'package:omar/View/sewing%20invoice%20screen/TabBar%20Screen.dart';
import 'package:omar/View/sewing%20invoice%20screen/settings_screen.dart';
import 'package:omar/constant/appstrings.dart';
import 'package:omar/constant/constant.dart';

class StartScreen extends StatelessWidget {
  static const routeName = "StartScreen";

  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title:  Text(AppStrings.closeMg.tr(),
                  style: GoogleFonts.notoKufiArabic(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18)),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: [
                TextButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(MyConstant().purpleColor)),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child:  Text(AppStrings.Yes.tr(),
                      style: GoogleFonts.notoKufiArabic(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                ),
                TextButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(MyConstant().purpleColor)),

                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child:  Text(AppStrings.NO.tr(),
                      style: GoogleFonts.notoKufiArabic(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18)),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Scaffold(

        body: Container(
          padding: EdgeInsets.all(20),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(height: 20,),

              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height/5,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.blueAccent,
                  child: IconButton(onPressed: () {
                    Navigator.pushNamed(context, HomeScreen.routeName);
                  }, icon: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(AppStrings.Main.tr() ,style: GoogleFonts.notoKufiArabic(
                      color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  )),
                      const Icon(Icons.home_filled,size: 45,color: Colors.white,)
                    ],
                  )),

                ),
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height/5,
                      color: Colors.teal,
                      child:  IconButton(onPressed: () {
                        Navigator.pushNamed(context, AllCustomerScreen.routeName);
                      }, icon: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                        children: [
                          Text(AppStrings.customers.tr(), style: GoogleFonts.notoKufiArabic(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          )),
                          Icon(Icons.people,size: 45,color: Colors.white,)
                        ],
                      )),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      height: MediaQuery.of(context).size.height/5,
                      color: Colors.teal,
                      child:  IconButton(onPressed: () {
                        // TabBarScreen.initialIndex=0;
                        Navigator.pushNamed(context, AddInvoiceScreen.routeName);

                      }, icon: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                        children: [
                          Text(AppStrings.addinvoice.tr(), style: GoogleFonts.notoKufiArabic(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          )),
                          const Icon(Icons.add_shopping_cart,size: 45,color: Colors.white,)
                        ],
                      )),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),



              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height/5,
                  width: MediaQuery.of(context).size.width,
                  color:MyConstant().purpleColor,
                  child:  IconButton(onPressed: () {
                    // TabBarScreen.initialIndex=4;
                    Navigator.pushNamed(context, AllInvoicesScreen.routeName);


                  }, icon: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [
                      Text(AppStrings.invoices.tr(), style: GoogleFonts.notoKufiArabic(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      )),
                      const Icon(Icons.inventory_outlined,size: 45,color: Colors.white,)
                    ],
                  )),

                ),
              ),
              SizedBox(height: 20,),

              Expanded(
                child: Container(
                  height: MediaQuery.of(context).size.height/5,
                  width: MediaQuery.of(context).size.width,
                  color: MyConstant().greenColor,
                  child: IconButton(onPressed: () {
                    Navigator.pushNamed(context, SettingScreen.routeName);

                  }, icon: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [
                      Text(AppStrings.settings.tr(), style: GoogleFonts.notoKufiArabic(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      )),
                      const Icon(Icons.settings,size: 45,color: Colors.white,)
                    ],
                  )),

                ),
              ),
              SizedBox(height: 20,),


            ],
          ),
        ),
      ),
    );
  }
}
