import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Cubit/State.dart';
import 'package:omar/SharedPreferencesHelper.dart';
import 'package:omar/View/invoice_Screen.dart';
import 'package:omar/constant/constant.dart';
import 'package:omar/models/updatePillsStatus.dart';

import '../../constant/LoadingPage.dart';

class PillsItemData extends StatelessWidget {
  static const routeName = "PillsItemData";
  TextEditingController controller=TextEditingController();
   PillsItemData({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is UpdatedPillsResponseSuccessState) {
            LoadingPage(context).close();
            Navigator.pop(context, true);
          }  
        },
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                title: Text("تفاصيل ",
                    style: GoogleFonts.notoKufiArabic(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18)),
                actions: [
                  IconButton(onPressed: ()async{
                    int? pageSize=await  SharedPreferencesHelper.getPageSize();
                    int? printerType=await  SharedPreferencesHelper.getPrinterType();
                    print(pageSize);
                    print(printerType);
                    if(pageSize==null){
                      pageSize=0;
                    }
                    if(pageSize==null||printerType==null){
                      Fluttertoast.showToast(
                          msg: "من فضلك اختر نوع الطابعة وحجم الصفحة",
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }else{
                      Navigator.pushNamed(context, PrintPillScreen.routeName,arguments: PrintPillScreen(pageSize: pageSize,printerType: printerType,));
                    }

                  }, icon: Icon(Icons.print),)
                ],
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("الحالة  ",
                              style: GoogleFonts.notoKufiArabic(
                                  color: MyConstant().purpleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                          Spacer(),
                          Container(
                            // padding: const EdgeInsets.only(left: 10),

                            width: 125,
                            child: TextField(
                              style: GoogleFonts.notoKufiArabic(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                             controller: controller,
                              onChanged: (value) {
                                if(value.isNotEmpty){
                                  cubit.status=value;
                                }
                              },


                              decoration: InputDecoration(
                                hintStyle:  GoogleFonts.notoKufiArabic(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                                hintText: cubit.status ,

                              ),
                            ),
                          ),

                          // Text(cubit.pillsDetailsItem!.saleStatus ?? "",
                          //     style: GoogleFonts.notoKufiArabic(
                          //         color: Colors.black,
                          //         fontWeight: FontWeight.bold,
                          //         fontSize: 18)),
                          Spacer(),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Divider(),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          Text("تاريخ التسليم",
                              style: GoogleFonts.notoKufiArabic(
                                  color: MyConstant().purpleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                          Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(left: 50),
                              child: Container(
                                    // padding: const EdgeInsets.only(left: 10),
                              width: 125,
                                child: TextField(
                                  onTap: ()async{
                                    await cubit.getDateFromUser(context);
                                    DatePickerDialog(initialDate: DateTime.now(), firstDate:  DateTime.now(), lastDate:  DateTime.now());
                                  },
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    hintStyle:  GoogleFonts.notoKufiArabic(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                                    hintText:  cubit.selectedDate!.split(" ").first ?? "",

                                  ),
                                ),
                              ),
                            ),
                          // InkWell(
                          //   onTap: ()async{
                          //  await cubit.getDateFromUser(context);
                          //
                          //     DatePickerDialog(initialDate: DateTime.now(), firstDate:  DateTime.now(), lastDate:  DateTime.now());
                          //   },
                          //   child: Padding(
                          //     padding: const EdgeInsets.only(left: 50),
                          //     child: Text(
                          //         cubit.pillsDetailsItem!.deliveryDate!
                          //                 .split(" ")
                          //                 .first ??
                          //             "",
                          //         style: GoogleFonts.notoKufiArabic(
                          //             color: Colors.black,
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 18)),
                          //   ),
                          // ),
                          Spacer(),

                        ],
                      ),
                      SizedBox(height: 10,),
                      Divider(),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          Text("تاريخ الفاتورة",
                              style: GoogleFonts.notoKufiArabic(
                                  color: MyConstant().purpleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                          Spacer(),

                          Padding(
                            padding: const EdgeInsets.only(left: 50),
                            child: Text(cubit.pillsDetailsItem!.date!.split(" ").first ?? "",
                                style: GoogleFonts.notoKufiArabic(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                          ),

                          Spacer(),


                        ],
                      ),
                      SizedBox(height: 10,),
                      Divider(),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          Text("العميل",
                              style: GoogleFonts.notoKufiArabic(
                                  color: MyConstant().purpleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                          Spacer(),

                          Text(cubit.pillsDetailsItem!.customer ?? "",
                              style: GoogleFonts.notoKufiArabic(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                          Spacer(),

                        ],
                      ),
                      SizedBox(height: 10,),
                      Divider(),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          Text("الجوال",
                              style: GoogleFonts.notoKufiArabic(
                                  color: MyConstant().purpleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                          Spacer(),

                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("+96658465984",
                                style: GoogleFonts.notoKufiArabic(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                          ),
                          Spacer(),

                        ],
                      ),
                      SizedBox(height: 10,),
                      Divider(),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          Text("كود العميل",
                              style: GoogleFonts.notoKufiArabic(
                                  color: MyConstant().purpleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                          Spacer(),

                          Padding(

                            padding: const EdgeInsets.only(left: 50),
                            child: Text(cubit.pillsDetailsItem!.customerId ?? "",
                                style: GoogleFonts.notoKufiArabic(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                          ),
                          Spacer(),

                        ],
                      ),
                      SizedBox(height: 10,),
                      Divider(),


                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          Text("المرجع",
                              style: GoogleFonts.notoKufiArabic(
                                  color: MyConstant().purpleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18)),
                          Spacer(),

                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(cubit.pillsDetailsItem!.referenceNo ?? "",
                                style: GoogleFonts.notoKufiArabic(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                          ),
                          Spacer(),

                        ],
                      ),
                      SizedBox(height: 50,),
                      Container(
                          width: MediaQuery.of(context).size.width/2,
                          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: OutlinedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  MyConstant().purpleColor),
                            ),
                            onPressed: () async {
                              try{
                                LoadingPage(context).show();
                                UpdatedPillsStatusModel model=UpdatedPillsStatusModel(saleId: cubit.pillsDetailsItem!.id, deliveryDate: cubit.selectedDate, saleStatus: cubit.status, note: "");
                                cubit.updatePills(model);
                              }catch(error){
                                print(error.toString());
                              }

                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 10,bottom: 10),
                              child: Text('تعديل',
                                  style: GoogleFonts.notoKufiArabic(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ),
                          )),

                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
