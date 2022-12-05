import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Cubit/State.dart';
import 'package:omar/constant/appstrings.dart';

class ReturnItemScreen extends StatelessWidget {
  static const routeName = "ReturnItemScreen";

  const ReturnItemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit=LoginCubit.get(context);
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
           appBar: AppBar(
          // toolbarHeight: 100,
          backgroundColor: Colors.purple,
          title: Text(AppStrings.returned.tr(),
              style: GoogleFonts.notoKufiArabic(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18)),
          centerTitle: true,
        ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text("${AppStrings.customerorcompany.tr()} : ${cubit.returnInvoice!.sizesData![0].customer}",
                        style: GoogleFonts.notoKufiArabic(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                    Text("referenceNo : ${cubit.returnInvoice!.sizesData![0].referenceNo}",style: GoogleFonts.notoKufiArabic(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18))
                  ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text("${AppStrings.type.tr()} : ${cubit.returnInvoice!.sizesData![0].items![0].productName}",
                        style: GoogleFonts.notoKufiArabic(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                    Text("${AppStrings.size.tr()} ${cubit.returnInvoice!.sizesData![0].items![0].productUnitCode}",
                        style: GoogleFonts.notoKufiArabic(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18))
                  ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text("${AppStrings.quantity.tr()} :  ${double.parse(cubit.returnInvoice!.sizesData![0].items![0].quantity??"0").toStringAsFixed(2)}",
                        style: GoogleFonts.notoKufiArabic(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18) ),
                    Text("${AppStrings.unitprice.tr()} : ${double.parse(cubit.returnInvoice!.sizesData![0].items![0].unitPrice??"0").toStringAsFixed(2)}",
                        style: GoogleFonts.notoKufiArabic(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                    Text("${AppStrings.Total.tr()} : ${double.parse(cubit.returnInvoice!.sizesData![0].items![0].subtotal??"0").toStringAsFixed(2)}",
                        style: GoogleFonts.notoKufiArabic(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),


                  ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text("${AppStrings.Tax.tr()} : ${double.parse(cubit.returnInvoice!.sizesData![0].items![0].itemTax??"0").toStringAsFixed(2)}",
                        style: GoogleFonts.notoKufiArabic(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),

                    Text("${AppStrings.Discount.tr()} : ${double.parse(cubit.returnInvoice!.sizesData![0].items![0].discount??"0").toStringAsFixed(2)}",
                        style: GoogleFonts.notoKufiArabic(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),
                    Text("${AppStrings.Total.tr()} : ${double.parse(cubit.returnInvoice!.sizesData![0].payments![0].posPaid??"0").toStringAsFixed(2)}",
                        style: GoogleFonts.notoKufiArabic(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18)),



                  ],),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      MaterialButton(onPressed: () {

                      }, child: Text("returnitem",
                          style: GoogleFonts.notoKufiArabic(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)))
                    ],
                  )

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
