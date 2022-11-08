import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Cubit/State.dart';
import 'package:omar/View/Data%20Table/model.dart';
import 'package:omar/View/Data%20Table/widget%20table.dart';
import 'package:omar/View/sewing%20invoice%20screen/edit_size_screen.dart';
import 'package:omar/View/sewing%20invoice%20screen/pills_item_data.dart';
import 'package:omar/constant/constant.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ChangeSizeScreen extends StatefulWidget {
  const ChangeSizeScreen({Key? key}) : super(key: key);

  @override
  _ChangeSizeScreenState createState() => _ChangeSizeScreenState();
}

class _ChangeSizeScreenState extends State<ChangeSizeScreen> {

  bool isSelect1 = false;
  bool isSelect2 = false;
  // late List<Details>  details = [];
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
    PillsDetails? pillsDetails=PillsDetails();
    pillsDetails.data=[];
    pillsDetails.data = cubit.pillsDetails!.data!.where((i) => i.saleStatus!.contains('completed')?false:true).toList();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return  ResponsiveVisibility(
            replacement:Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                      // Container(
                      //   alignment: Alignment.center,
                      //   // color: Colors.purple,
                      //   decoration: BoxDecoration(
                      //       color: MyConstant().purpleColor,
                      //       border: Border.all(color: MyConstant().purpleColor)),
                      //   height: 40,
                      //   width: 30,
                      //   child: Text('م',
                      //       style: GoogleFonts.notoKufiArabic(
                      //         color: Colors.white,
                      //         fontWeight: FontWeight.w600,
                      //         fontSize: 12,
                      //       )),
                      // ),
                      // Container(
                      //   alignment: Alignment.center,
                      //   decoration: BoxDecoration(
                      //       color: MyConstant().greenColor ,
                      //       border: Border.all( color: MyConstant().greenColor)),
                      //   height: 40,
                      //   width: 30,
                      //   child: Text('ع',
                      //       style: GoogleFonts.notoKufiArabic(
                      //         color: Colors.white,
                      //         fontWeight: FontWeight.w600,
                      //         fontSize: 12,
                      //       )),
                      // ),
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
                          child: Text('الحالة',
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
                          child: Text('المتبقى',
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
                          child: Text('تاريخ التسليم',
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
                          child: Text('تاريح الفاتورة',
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
                          child: Text('العميل',
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
                          child: Text('الجوال',
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
                          child: Text('كود العميل',
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
                          child: Text('المرجع',
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
                  child: ListView.builder(
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
                          // int salesId=0;
                          LoginCubit.get(context).getPillsDetailsForItem( index);
                          await cubit.getSizeInformation(cubit.salesId!);
                          if(cubit.sizeInformationModel!.sizesData![0].measurement!.isNotEmpty){
                            Navigator.pushNamed(context, EditSizeScreen.routeName,arguments: EditSizeScreen(salesId: cubit.salesId,));

                          }
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
                            // Container(
                            //     alignment: Alignment.center,
                            //     color: MyConstant().purpleColor,
                            //     height: 40,
                            //     width: 30,
                            //     child: Checkbox(
                            //       value: isSelect1,
                            //       onChanged: (val) {
                            //         setState(() {
                            //           isSelect1 = val !;
                            //         });
                            //       },
                            //       shape: RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(3),
                            //
                            //       ),
                            //       checkColor: Colors.purple,
                            //       activeColor: Colors.white,
                            //       // fillColor: MaterialStateProperty.all(Colors.white),
                            //       materialTapTargetSize:
                            //       MaterialTapTargetSize.shrinkWrap,
                            //       splashRadius: 0,
                            //       side: const BorderSide(color: Colors.white),
                            //     )),
                            // Container(
                            //     alignment: Alignment.center,
                            //     color: MyConstant().greenColor,
                            //     height: 40,
                            //     width: 30,
                            //     child: Checkbox(
                            //       value: isSelect2,
                            //       shape: RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(3),
                            //       ),
                            //       onChanged: (val) {
                            //         setState(() {
                            //           isSelect2 = val !;
                            //         });
                            //       },
                            //       checkColor: Colors.green,
                            //       activeColor: Colors.white,
                            //       splashRadius: 0,
                            //       side: const BorderSide(color: Colors.white),
                            //     )),
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
                                child: Text(pillsDetails!.data![index].saleStatus!,
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
                                child: Text(pillsDetails!.data![index].balance!,
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
                                child: Text('${pillsDetails!.data![index].deliveryDate!.split( " ").first}',
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
                                child: Text('${pillsDetails!.data![index].date!.split( " ").first}',
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
                                child: Text(pillsDetails!.data![index].customer!,
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
                                child: Text('+966 011 256 7846',
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
                                child: Text('${pillsDetails!.data![index].customerId}',
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
                                child: Text('${pillsDetails!.data![index].referenceNo}',
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
                    itemCount: pillsDetails!.data!.length,
                  ),
                  // ),
                ),
              ],
            ),
            hiddenWhen: [Condition.largerThan(name: MOBILE)],

            child: SingleChildScrollView(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: 1000,
                  height: 1000,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                            // Container(
                            //   alignment: Alignment.center,
                            //   // color: Colors.purple,
                            //   decoration: BoxDecoration(
                            //       color: MyConstant().purpleColor,
                            //       border: Border.all(color: MyConstant().purpleColor)),
                            //   height: 40,
                            //   width: 30,
                            //   child: Text('م',
                            //       style: GoogleFonts.notoKufiArabic(
                            //         color: Colors.white,
                            //         fontWeight: FontWeight.w600,
                            //         fontSize: 12,
                            //       )),
                            // ),
                            // Container(
                            //   alignment: Alignment.center,
                            //   decoration: BoxDecoration(
                            //       color: MyConstant().greenColor ,
                            //       border: Border.all( color: MyConstant().greenColor)),
                            //   height: 40,
                            //   width: 30,
                            //   child: Text('ع',
                            //       style: GoogleFonts.notoKufiArabic(
                            //         color: Colors.white,
                            //         fontWeight: FontWeight.w600,
                            //         fontSize: 12,
                            //       )),
                            // ),
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
                                child: Text('الحالة',
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
                                child: Text('المتبقى',
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
                                child: Text('تاريخ التسليم',
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
                                child: Text('تاريح الفاتورة',
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
                                child: Text('العميل',
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
                                child: Text('الجوال',
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
                                child: Text('كود العميل',
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
                                child: Text('المرجع',
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
                        child: ListView.builder(
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
                                // int salesId=0;
                                LoginCubit.get(context).getPillsDetailsForItem( index);
                                await cubit.getSizeInformation(cubit.salesId!);
                                if(cubit.sizeInformationModel!.sizesData![0].measurement!.isNotEmpty){
                                  Navigator.pushNamed(context, EditSizeScreen.routeName,arguments: EditSizeScreen(salesId: cubit.salesId,));

                                }
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
                                  // Container(
                                  //     alignment: Alignment.center,
                                  //     color: MyConstant().purpleColor,
                                  //     height: 40,
                                  //     width: 30,
                                  //     child: Checkbox(
                                  //       value: isSelect1,
                                  //       onChanged: (val) {
                                  //         setState(() {
                                  //           isSelect1 = val !;
                                  //         });
                                  //       },
                                  //       shape: RoundedRectangleBorder(
                                  //         borderRadius: BorderRadius.circular(3),
                                  //
                                  //       ),
                                  //       checkColor: Colors.purple,
                                  //       activeColor: Colors.white,
                                  //       // fillColor: MaterialStateProperty.all(Colors.white),
                                  //       materialTapTargetSize:
                                  //       MaterialTapTargetSize.shrinkWrap,
                                  //       splashRadius: 0,
                                  //       side: const BorderSide(color: Colors.white),
                                  //     )),
                                  // Container(
                                  //     alignment: Alignment.center,
                                  //     color: MyConstant().greenColor,
                                  //     height: 40,
                                  //     width: 30,
                                  //     child: Checkbox(
                                  //       value: isSelect2,
                                  //       shape: RoundedRectangleBorder(
                                  //         borderRadius: BorderRadius.circular(3),
                                  //       ),
                                  //       onChanged: (val) {
                                  //         setState(() {
                                  //           isSelect2 = val !;
                                  //         });
                                  //       },
                                  //       checkColor: Colors.green,
                                  //       activeColor: Colors.white,
                                  //       splashRadius: 0,
                                  //       side: const BorderSide(color: Colors.white),
                                  //     )),
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
                                      child: Text(pillsDetails!.data![index].saleStatus!,
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
                                      child: Text(pillsDetails!.data![index].balance!,
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
                                      child: Text('${pillsDetails!.data![index].deliveryDate!.split( " ").first}',
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
                                      child: Text('${pillsDetails!.data![index].date!.split( " ").first}',
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
                                      child: Text(pillsDetails!.data![index].customer!,
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
                                      child: Text('+966 011 256 7846',
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
                                      child: Text('${pillsDetails!.data![index].customerId}',
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
                                      child: Text('${pillsDetails!.data![index].referenceNo}',
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
                          itemCount: pillsDetails!.data!.length,
                        ),
                        // ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );

        },
      ),
    );
  }
}
