import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/View/Data%20Table/model.dart';
import 'package:omar/View/Data%20Table/widget%20table.dart';
import 'package:omar/constant/constant.dart';

class CustomTable extends StatefulWidget {
  const CustomTable({Key? key}) : super(key: key);

  @override
  _CustomTableState createState() => _CustomTableState();
}

class _CustomTableState extends State<CustomTable> {

  bool isSelect1 = false;
  bool isSelect2 = false;
  // late List<Details>  details = [];
  late List<Details>  details = listOfDetail;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // setState(() {
    //   details=listOfDetail;
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
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
                            color: MyConstant().purpleColor,
                            border: Border.all(color: MyConstant().purpleColor)),
                        height: 40,
                        width: 30,
                        child: Text('م',
                            style: GoogleFonts.notoKufiArabic(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            )),
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: MyConstant().greenColor ,
                            border: Border.all( color: MyConstant().greenColor)),
                        height: 40,
                        width: 30,
                        child: Text('ع',
                            style: GoogleFonts.notoKufiArabic(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
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
                          child: Text('الحالة',
                              style: GoogleFonts.notoKufiArabic(
                                color: MyConstant().greenColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 8,
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
                                fontSize: 8,
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
                                fontSize: 8,
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
                                fontSize: 8,
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
                                fontSize: 8,
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
                                fontSize: 8,
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
                                fontSize: 8,
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
                              fontSize: 8,
                            )),
                      ),
                    ],
                  )),
            ),
            //todo list view
            SizedBox(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
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
                        child: Row(
                          children: [
                            Container(
                                alignment: Alignment.center,
                                color: MyConstant().purpleColor,
                                height: 40,
                                width: 30,
                                child: Checkbox(
                                  value: isSelect1,
                                  onChanged: (val) {
                                    setState(() {
                                      isSelect1 = val !;
                                    });
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),

                                  ),
                                  checkColor: Colors.purple,
                                  activeColor: Colors.white,
                                  // fillColor: MaterialStateProperty.all(Colors.white),
                                  materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                                  splashRadius: 0,
                                  side: const BorderSide(color: Colors.white),
                                )),
                            Container(
                                alignment: Alignment.center,
                                color: MyConstant().greenColor,
                                height: 40,
                                width: 30,
                                child: Checkbox(
                                  value: isSelect2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  onChanged: (val) {
                                    setState(() {
                                      isSelect2 = val !;
                                    });
                                  },
                                  checkColor: Colors.green,
                                  activeColor: Colors.white,
                                  splashRadius: 0,
                                  side: const BorderSide(color: Colors.white),
                                )),
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
                                child: Text(details[index].status,
                                    style: GoogleFonts.notoKufiArabic(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 8,
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
                                child: Text('${details[index].dateOfDelivery}',
                                    style: GoogleFonts.notoKufiArabic(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 8,
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
                                child: Text('${details[index].dateOfInvoice}',
                                    style: GoogleFonts.notoKufiArabic(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 8,
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
                                child: Text(details[index].client,
                                    style: GoogleFonts.notoKufiArabic(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 8,
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
                                child: Text('${details[index].phone}',
                                    style: GoogleFonts.notoKufiArabic(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 8,
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
                                child: Text('${details[index].code}',
                                    style: GoogleFonts.notoKufiArabic(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 8,
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
                                child: Text('${details[index].ref}',
                                    style: GoogleFonts.notoKufiArabic(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 8,
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
                              child: Text('${details[index].num}',
                                  style: GoogleFonts.notoKufiArabic(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 8,
                                  )),
                            ),
                          ],
                        )),
                  ),
                  itemCount: details.length,
                ))
          ],
        ),
      ),
    );
  }
}
