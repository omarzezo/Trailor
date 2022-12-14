import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Cubit/State.dart';
import 'package:omar/View/sewing%20invoice%20screen/pills_item_data.dart';
import 'package:omar/constant/appstrings.dart';
import 'package:omar/constant/constant.dart';
import 'package:flutter/services.dart' as p;


class CustomTableSweing extends StatefulWidget {
  const CustomTableSweing({Key? key}) : super(key: key);

  @override
  _CustomTableSweingState createState() => _CustomTableSweingState();
}

class _CustomTableSweingState extends State<CustomTableSweing> {

  bool isSelect1 = false;
  bool isSelect2 = false;
  // late List<Details>  details = [];
  // late List<Details>  details = listOfDetail;
  // late List<Details>  details = listOfDetail;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // setState(() {
    //   details=listOfDetail;
    // });
  }
  // final scrollControl = ScrollController();

  @override
  Widget build(BuildContext context) {
    var cubit=LoginCubit.get(context);
    return BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width /1,
              // margin: const EdgeInsets.all(20),
              height: 40,
              decoration:
              BoxDecoration(border: Border.all(color: Colors.purple)),
              child: Expanded(
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        // color: Colors.purple,
                        decoration: BoxDecoration(
                            color: MyConstant().greenColor.withOpacity(0.1),
                            border: Border(
                              right: BorderSide(color: Colors.green.withOpacity(0.3)),
                            )),
                        height: 40,
                        width: 40,
                        child: Text(AppStrings.paidUp.tr(),
                            style: GoogleFonts.notoKufiArabic(
                              color:  MyConstant().greenColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 9,
                            )),
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: MyConstant().greenColor.withOpacity(0.1) ,
                            border: Border(
                              right: BorderSide(color: Colors.green.withOpacity(0.3)),
                            )),
                        height: 40,
                        width: 40,
                        child: Text(AppStrings.Residual.tr(),
                            style: GoogleFonts.notoKufiArabic(
                              color: MyConstant().greenColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 9,
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
                          child: Text(AppStrings.Total.tr(),
                              style: GoogleFonts.notoKufiArabic(
                                color: MyConstant().greenColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 9,
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
                          child: Text(AppStrings.deliverydate.tr(),
                              style: GoogleFonts.notoKufiArabic(
                                color: MyConstant().greenColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 9,
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
                          child: Text(AppStrings.invoicdate.tr(),
                              style: GoogleFonts.notoKufiArabic(
                                color: MyConstant().greenColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 9,
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
                          child: Text(AppStrings.Client.tr(),
                              style: GoogleFonts.notoKufiArabic(
                                color: MyConstant().greenColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 9,
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
                                fontSize: 9,
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
                          child: Text(AppStrings.clientCode.tr(),
                              style: GoogleFonts.notoKufiArabic(
                                color: MyConstant().greenColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 9,
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
                          child: Text(AppStrings.reference.tr(),
                              style: GoogleFonts.notoKufiArabic(
                                color: MyConstant().greenColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 9,
                              )),
                        ),
                      ),
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
                              fontSize: 9,
                            )),
                      ),
                    ],
                  )),
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
              child: ListView.builder(
                shrinkWrap: true,
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
                  child: Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () async {
                          await     LoginCubit.get(context).getPillsDetailsForItem( index);
                          var result = await  Navigator.pushNamed(context, PillsItemData.routeName);
                          if(result==true){
                            setState(() {});
                          }
                          // cubit.itemIndex=index;
                        },
                        child: Row(

                          children: [
                            Container(
                              alignment: Alignment.center,
                              // color: MyConstant().purpleColor,
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                // color: MyConstant().greenColor.withOpacity(0.1),
                                  border: Border(
                                    right: BorderSide(color: Colors.green.withOpacity(0.3)),
                                  )),
                              child: const Text('25'),

                            ),
                            // Divider(color: MyConstant().greenColor,thickness: 1,),
                            Container(
                              alignment: Alignment.center,

                              // color: MyConstant().greenColor,
                              height: 40,
                              width: 40,
                              child: const Text('25'),
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
                                child: Text(cubit.pillsDetails!.data![index].saleStatus!,
                                    style: GoogleFonts.notoKufiArabic(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 8.5,
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
                                child: Text('${cubit.pillsDetails!.data![index].deliveryDate}',
                                    style: GoogleFonts.notoKufiArabic(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 8.5,
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
                                child: Text('${cubit.pillsDetails!.data![index].date}',
                                    style: GoogleFonts.notoKufiArabic(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 8.5,
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
                                child: Text(cubit.pillsDetails!.data![index].customer!,
                                    style: GoogleFonts.notoKufiArabic(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 8.5,
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
                                child: Text('${cubit.pillsDetails!.data![index].customerId}',
                                    style: GoogleFonts.notoKufiArabic(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 8.5,
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
                                child: Text('${cubit.pillsDetails!.data![index].customerId}',
                                    style: GoogleFonts.notoKufiArabic(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 8.5,
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
                                child: Text('${cubit.pillsDetails!.data![index].referenceNo}',
                                    style: GoogleFonts.notoKufiArabic(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 8.5,
                                    )),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              decoration:  BoxDecoration(
                                  border: Border(
                                    left: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                    right: BorderSide(color: Colors.green.withOpacity(0.3), ),
                                  )),
                              height: 80,
                              width: 40,
                              child: Text('${cubit.pillsDetails!.data![index].customerId}',
                                  style: GoogleFonts.notoKufiArabic(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 8.5,
                                  )),
                            ),
                          ],
                        ),
                      )),
                ),
                itemCount: cubit.pillsDetails!.data!.length,
              ),
              // ),
            ),
          ],
        ),
      ),
    );
  },
);
  }
}
