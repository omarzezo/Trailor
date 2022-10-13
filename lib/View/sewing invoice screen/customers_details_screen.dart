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
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("قائمة العملاء"),
              centerTitle: true,
            ),
            body:SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(columns: [


                DataColumn(label:  Expanded(
                  child: Text("اسم الشركة ",
                      style: GoogleFonts.notoKufiArabic(
                          color: MyConstant().purpleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),),
                DataColumn(label:  Expanded(
                  child: Text("البريد الالكترونى",
                      style: GoogleFonts.notoKufiArabic(
                          color: MyConstant().purpleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),),
                DataColumn(label: Expanded(
                  child: Text(
                      "رقم تعريف ضريبة  ", style: GoogleFonts.notoKufiArabic(
                      color: MyConstant().purpleColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
                ),),
                DataColumn(label: Expanded(
                  child: Text("عنوان الشركة",
                      style: GoogleFonts.notoKufiArabic(
                          color: MyConstant().purpleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),),
                DataColumn(label: Expanded(
                  child: Text("الرقم البريدى",
                      style: GoogleFonts.notoKufiArabic(
                          color: MyConstant().purpleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),),
                DataColumn(label: Expanded(
                  child: Text("تليفون الشركة",
                      style: GoogleFonts.notoKufiArabic(
                          color: MyConstant().purpleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),),
                DataColumn(label: Expanded(
                  child: Text("رقم قيد الشركة",
                      style: GoogleFonts.notoKufiArabic(
                          color: MyConstant().purpleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),),
              ], rows:
              List.generate(cubit.customerModel.length, (index) => DataRow(cells: [

                DataCell(Text(cubit.customerModel[index].company ?? "")),
                DataCell(Text(cubit.customerModel[index].email ?? "")),
                DataCell(Text(cubit.customerModel[index].vatNo ?? "")),
                DataCell(Text(cubit.customerModel[index].address ?? "")),
                DataCell(Text(cubit.customerModel[index].postalCode ?? "")),
                DataCell(Text(cubit.customerModel[index].phone ?? "")),
                DataCell(Text(cubit.customerModel[index].crNo ?? "")),
              ])),

              ),
            ),
            bottomSheet: Row(
              children: [
                MaterialButton(onPressed: (){
                  Navigator.pushReplacementNamed(context, NewUserScreen.routeName);
                },child: Text("اضافة عميل",style: GoogleFonts.notoKufiArabic(
              color: MyConstant().purpleColor,
              fontWeight: FontWeight.bold,
              fontSize: 14)) ,)
              ],
            ),
          );
        },
      ),
    );
  }
}
