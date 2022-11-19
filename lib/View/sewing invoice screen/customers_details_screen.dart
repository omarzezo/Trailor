import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Cubit/State.dart';
import 'package:omar/constant/constant.dart';

import 'add_new_customer_screen.dart';

class CustomerDetailsScreen extends StatelessWidget {
  const CustomerDetailsScreen({Key? key}) : super(key: key);
  static const routeName = "CustomerDetailsScreen";

  @override
  Widget build(BuildContext context) {

    var cubit = LoginCubit.get(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("قائمة العملاء",style: GoogleFonts.notoKufiArabic(
                  color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
              centerTitle: true,
            ),
            body:Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(

                    columns: [


                    DataColumn(
                      label:  Text("اسم العميل ",
                          style: GoogleFonts.notoKufiArabic(
                              color: MyConstant().purpleColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),),
                    DataColumn(label:  Text("البريد الالكترونى",
                        style: GoogleFonts.notoKufiArabic(
                            color: MyConstant().purpleColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),),
                    DataColumn(label: Text(
                        "الرقم الضريبي", style: GoogleFonts.notoKufiArabic(
                        color: MyConstant().purpleColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),),
                    DataColumn(label: Text("العنوان",
                        style: GoogleFonts.notoKufiArabic(
                            color: MyConstant().purpleColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),),
                    DataColumn(label: Text("الرقم البريدى",
                        style: GoogleFonts.notoKufiArabic(
                            color: MyConstant().purpleColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),),
                    DataColumn(label: Text("الجوال",
                        style: GoogleFonts.notoKufiArabic(
                            color: MyConstant().purpleColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),),

                  ], rows:
                  List.generate(cubit.companiesCustomerName.length, (index) => DataRow(cells: [

                    DataCell(Text(cubit.companiesCustomerName[index].company ?? "",style: GoogleFonts.notoKufiArabic(
                      color:  Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14))),
                    DataCell(Text(cubit.companiesCustomerName[index].email ?? "",style: GoogleFonts.notoKufiArabic(
                        color:  Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16))),
                    DataCell(Text(cubit.companiesCustomerName[index].vatNo ?? "",style: GoogleFonts.notoKufiArabic(
          color:  Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16))),
                    DataCell(Text(cubit.companiesCustomerName[index].address ?? "",style: GoogleFonts.notoKufiArabic(
          color:  Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16))),
                    DataCell(Text(cubit.companiesCustomerName[index].postalCode ?? "",style: GoogleFonts.notoKufiArabic(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16))),
                    DataCell(Text(cubit.companiesCustomerName[index].phone ?? "",style: GoogleFonts.notoKufiArabic(
                        color:  Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16))),
                  ])),

                  ),
                ),
              ),
            ),
            bottomNavigationBar:Row(
              children: [
                MaterialButton(onPressed: (){
                  Navigator.pushReplacementNamed(context, NewUserScreen.routeName);
                },child: Text("اضافة عميل",style: GoogleFonts.notoKufiArabic(
                    color: MyConstant().purpleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 14)) ,)
              ],
            ) ,
          );
        },
      ),
    );
  }
}
