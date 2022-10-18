import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Cubit/State.dart';
import 'package:omar/constant/constant.dart';

class PillsItemData extends StatelessWidget {
  static const routeName="PillsItemData";
  const PillsItemData({Key? key}) : super(key: key);

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
              title: Text("تفاصيل ",style: GoogleFonts.notoKufiArabic(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16)),
              centerTitle: true,
            ),

            body: DataTable(

              columns: [


                DataColumn(
                  label:  Text("الحالة  ",
                      style: GoogleFonts.notoKufiArabic(
                          color: MyConstant().purpleColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),),
                DataColumn(label:  Text("تاريخ التسليم",
                    style: GoogleFonts.notoKufiArabic(
                        color: MyConstant().purpleColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),),
                DataColumn(label: Text(
                    "تاريخ الفاتورة", style: GoogleFonts.notoKufiArabic(
                    color: MyConstant().purpleColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),),
                DataColumn(label: Text("العميل",
                    style: GoogleFonts.notoKufiArabic(
                        color: MyConstant().purpleColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),),
                DataColumn(label: Text("الحوال",
                    style: GoogleFonts.notoKufiArabic(
                        color: MyConstant().purpleColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),),
                DataColumn(label: Text("كود العميل",
                    style: GoogleFonts.notoKufiArabic(
                        color: MyConstant().purpleColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),),
                DataColumn(label: Text("المرجع",
                    style: GoogleFonts.notoKufiArabic(
                        color: MyConstant().purpleColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),),

              ], rows:
            [ DataRow(cells: [

              DataCell(Text(cubit.pillsDetailsItem!.saleStatus ?? "",style: GoogleFonts.notoKufiArabic(
                  color:  Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14))),
              DataCell(Text(cubit.pillsDetailsItem!.date ?? "",style: GoogleFonts.notoKufiArabic(
                  color:  Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16))),
              DataCell(Text(cubit.pillsDetailsItem!.date ?? "",style: GoogleFonts.notoKufiArabic(
                  color:  Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16))),
              DataCell(Text(cubit.pillsDetailsItem!.customer ?? "",style: GoogleFonts.notoKufiArabic(
                  color:  Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16))),
              DataCell(Text("+96658465984",style: GoogleFonts.notoKufiArabic(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16))),
              DataCell(Text(cubit.pillsDetailsItem!.customerId ?? "",style: GoogleFonts.notoKufiArabic(
                  color:  Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16))),
              DataCell(Text(cubit.pillsDetailsItem!.referenceNo ?? "",style: GoogleFonts.notoKufiArabic(
                  color:  Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16))),
            ])],

            ),
          );
        },
      ),
    );
  }
}
