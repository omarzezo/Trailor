import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Cubit/State.dart';
import 'package:omar/View/Data%20Table/model.dart';
import 'package:omar/View/Data%20Table/widget%20table.dart';
import 'package:omar/View/sewing%20invoice%20screen/pills_item_data.dart';
import 'package:omar/constant/constant.dart';

class PresentAllTablesScreen extends StatefulWidget {
  const PresentAllTablesScreen({Key? key}) : super(key: key);

  @override
  PresentAllTablesScreenState createState() => PresentAllTablesScreenState();
}

class PresentAllTablesScreenState extends State<PresentAllTablesScreen> {

  bool isSelect1 = false;
  bool isSelect2 = false;
  List<PillsDetailsData> filteredList = [];
  List<PillsDetailsData>? pillsDetailsDataList=[];
  String textSearch = "";

  // late List<Details>  details = [];
  // late List<Details>  details = listOfDetail;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var cubit=LoginCubit.get(context);
    pillsDetailsDataList = List.from(cubit.pillsDetails!.data!);
    filteredList = List.from(cubit.pillsDetails!.data!);
    setState(() {});
  }
  // final scrollControl = ScrollController();

  @override
  Widget build(BuildContext context) {
    // var cubit=LoginCubit.get(context);
    // pillsDetailsDataList = List.from(cubit.pillsDetails!.data!);
    // filteredList = List.from(cubit.pillsDetails!.data!);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              searchField(),
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
                  itemBuilder: (context, index) {

                    PillsDetailsData item = textSearch.isNotEmpty ? filteredList[index] : pillsDetailsDataList![index];

                    return Container(
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
                        onTap: () {
                          LoginCubit.get(context).getPillsDetailsForItem( index);
                          Navigator.pushNamed(context, PillsItemData.routeName);
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
                                child: Text(item.saleStatus!,
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
                                child: Text(item.balance!,
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
                                child: Text('${item.deliveryDate!.split( " ").first}',
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
                                child: Text('${item.date!.split( " ").first}',
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
                                child: Text(item.customer!,
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
                                child: Text('${item.customerId}',
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
                                child: Text('${item.referenceNo}',
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
                    );
                  },

                  // itemCount: cubit.pillsDetails!.data!.length,
                  itemCount: textSearch.isNotEmpty ? filteredList.length : pillsDetailsDataList!.length,
                ),
                // ),
              ),
            ],
          );

        },
      ),
    );
  }

  Widget searchField() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        width: MediaQuery.of(context).size.width/3,
        child: CupertinoSearchTextField(
          decoration: BoxDecoration(
              border: Border.all(color:MyConstant().greenColor,width: 2),
              borderRadius: const BorderRadius.all(
                  Radius.circular(10.0)//                 <--- border radius here
              ),

          ),
          placeholder: "بحث",
          style: GoogleFonts.notoKufiArabic(
              color: Colors.black,
              fontSize: 14
          ),
          // backgroundColor: Colors.white,
          onChanged: (String value) {
            filteredList.clear();
            textSearch = value;
            List<PillsDetailsData> data = pillsDetailsDataList!.where((i) => i.saleStatus!.toLowerCase().contains(value.toLowerCase())).toList();
            filteredList=List.from(data);
            setState(() {});
          },
          onSubmitted: (String value) {},
        )
      ),
    );
  }

}