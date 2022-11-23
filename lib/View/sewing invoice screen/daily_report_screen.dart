import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart' as p;
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Cubit/State.dart';
import 'package:omar/View/Data%20Table/model.dart';
import 'package:omar/constant/appstrings.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:flutter/services.dart' as p1;

class DailyReportScreen extends StatelessWidget {
  static const routeName = "DailyReportScreen";

  const DailyReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);
    PillsDetails? pillsDetails = PillsDetails();
    pillsDetails.data = [];
    // p.DateFormat('yyyy-MM-dd HH:mm')
    //     .parse(DateTime.now().toString())
    //     .toString().split(" ").first
    // pillsDetails.data = cubit.pillsDetails!.data!
    //     .where((i) => i.date!.contains("10") ? false : true)
    //     .toList();
        pillsDetails.data = cubit.pillsDetails!.data!
        .where((i) {
          return (i.date!.split(" ").first.contains( p.DateFormat('yyyy-MM-dd HH:mm')
              .parse(DateTime.now().toString())
              .toString().split(" ").first))?true:false;

        })
        .toList();
    return Directionality(
        textDirection: p1.TextDirection.rtl,
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                // toolbarHeight: 100,
                backgroundColor: Colors.purple,
                title: Text(AppStrings.dailyReports.tr(),
                    style: GoogleFonts.notoKufiArabic(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                centerTitle: true,
              ),
              body: SafeArea(
                child: ResponsiveVisibility(

                  replacement: SingleChildScrollView(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),

                      child: Column(
                        children: [
                          if(pillsDetails.data!.isNotEmpty)
                            ListView.separated(
                              shrinkWrap: true,
                              // scrollDirection: Axis.horizontal,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => ReportItem( dateNow:p.DateFormat('yyyy-MM-dd HH:mm')
                                  .parse(DateTime.now().toString())
                                  .toString().split(" ").first ,date: pillsDetails.data![index].date??"", deleverDate: pillsDetails.data![index].deliveryDate??"", customerName: pillsDetails.data![index].customer??"", refrenceiD: pillsDetails.data![index].referenceNo??""),
                              separatorBuilder: (context, index) => SizedBox(
                                    height: 20,
                                  ),
                              itemCount: pillsDetails.data!.length),
                          if(pillsDetails.data==null||pillsDetails.data!.isEmpty)
                          Center(child: Text(AppStrings.Therearenoneworderstoday.tr(),style: GoogleFonts.notoKufiArabic(
                          color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 40)))
                        ],
                      ),
                    ),
                  ),
                  hiddenWhen: [Condition.largerThan(name: MOBILE)],
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                    child: Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),

                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: 1500,
                        child: Column(
                          children: [
                            if(pillsDetails.data!.isNotEmpty)
                              ListView.separated(
                                  shrinkWrap: true,
                                  // scrollDirection: Axis.horizontal,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) => ReportItem( dateNow:p.DateFormat('yyyy-MM-dd HH:mm')
                                      .parse(DateTime.now().toString())
                                      .toString().split(" ").first ,date: pillsDetails.data![index].date??"", deleverDate: pillsDetails.data![index].deliveryDate??"", customerName: pillsDetails.data![index].customer??"", refrenceiD: pillsDetails.data![index].referenceNo??""),
                                  separatorBuilder: (context, index) => SizedBox(
                                    height: 20,
                                  ),
                                  itemCount: pillsDetails.data!.length),
                            if(pillsDetails.data==null||pillsDetails.data!.isEmpty)
                              Center(child: Text(AppStrings.Therearenoneworderstoday.tr(),style: GoogleFonts.notoKufiArabic(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40)))
                          ],
                        ),
                      ),
                    ),
                ),
                  ),

                ),
              ),
            );
          },
        ));
  }
}

class ReportItem extends StatelessWidget {
  String dateNow;
  String date;
  String deleverDate;
  String customerName;
  String refrenceiD;

  ReportItem({
    required this.date,
    required this.dateNow,
    required this.deleverDate,
    required this.customerName,
    required this.refrenceiD,

    });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("${AppStrings.Anorderwascreatedon.tr()} : ${dateNow} ",
            style: GoogleFonts.notoKufiArabic(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        Text("${AppStrings.invoicdate.tr()} : ${date.split(" ").first}",
            style: GoogleFonts.notoKufiArabic(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        Text("${AppStrings.deliverydate.tr()} : ${deleverDate.split(" ").first}",
            style: GoogleFonts.notoKufiArabic(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        Text("${AppStrings.clientName.tr()} : ${customerName}",
            style: GoogleFonts.notoKufiArabic(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
        Text("${AppStrings.reference.tr()} : ${refrenceiD}",
            style: GoogleFonts.notoKufiArabic(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16)),
      ],
    );
  }
}
