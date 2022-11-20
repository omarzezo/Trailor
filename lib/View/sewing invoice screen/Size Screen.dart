import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Cubit/State.dart';
import 'package:omar/constant/appstrings.dart';
import 'package:omar/models/TypesModel.dart';
import 'package:omar/models/tRCollar.dart';
import 'package:omar/models/tRCuff.dart';
import 'package:omar/models/tRModel.dart';
import 'package:omar/models/tRPocket.dart';
import 'package:omar/models/tRTailor.dart';
import 'package:omar/models/tRZipper.dart';
import 'package:omar/tast.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../constant/List Of Image.dart';
import '../../constant/constant.dart';
import '../../models/trFilling.dart';
import 'Widgets.dart';
import 'package:flutter/services.dart' as p;


class SizeScreen extends StatefulWidget {
  const SizeScreen({Key? key}) : super(key: key);

  @override
  _SizeScreenState createState() => _SizeScreenState();
}

class _SizeScreenState extends State<SizeScreen> {
  var text="";

  List<String> gebType = [
    'جيب باين',
    'جيب باين 2 خيط',
    'جيب باين واحد خيط',
    'جيب مخفى',
  ];
  List<String> hashoaType = [
    'حشوا دبل',
    'حشوا وسط',
    'حشو جبزور',
    'بدون حشوا',
  ];
  List<String> gabzourType = [
    'مخفى ',
    'باين',
    'مخفى باين ',
    'دبل خيط باين',
  ];
  List<String> items1 = [
    'موسسة وعد الوان',
    'Tailor',
    'Softy Tex',
    'Sweing Borke',
  ];
  var controllerList = ScrollController();
  bool isSelect2 = false;
  bool isSelect1 = false;
  // tRPocketModel? tRPocketValue;
  // tRFillingModel? trFillingValue;
  // tRZipperModel? tRZipperValue;
  // tRTailorModel?  tRTailorValue;
  // tRModelModel? trModelValue;
  // tRCollarModel? tRCollarValue;
  // tRCuffModel? tRCuffValue;
  int currentIndex = 0;
  int currentImage = 0;
  int currentImage1 = 0;

  int? selectedType = 0, relatedSelectedType;
  List<TypesModel> getRelatedList = [];
  List<TypesModel> selectedLists = [];

  TypesModel selectedCollar = TypesModel();
  TypesModel selectedKabak = TypesModel();
  TypesModel selectedPocket = TypesModel();
  TypesModel selectedGabzor = TypesModel();
  String? frontImage, backImage;
  double Size = 12;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getRelatedList = getRelatedListAnyType(0);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);
    return Directionality(
      textDirection: p.TextDirection.rtl,
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: ResponsiveVisibility(
                replacement: Container(
                  // margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: MyConstant().purpleColor, width: 3),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 150,
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                height: MediaQuery.of(context).size.height / 10,
                                width: double.infinity,
                                padding: const EdgeInsets.only(left: 30,top: 10),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: MyConstant()
                                              .greenColor
                                              .withOpacity(0.3),
                                          width: 0.2)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: MyConstant()
                                            .greenColor
                                            .withOpacity(0.3),
                                        spreadRadius: 0,
                                        blurRadius: 0,
                                        offset: const Offset(1, 1),
                                        blurStyle: BlurStyle.outer),
                                  ],
                                  color: Colors.white,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  textDirection: p.TextDirection.rtl,
                                  children: [
                                    Container(
                                        height: 40,
                                        width:
                                        MediaQuery.of(context).size.width / 5,
                                        child: Image.asset(
                                          'image/logo app.png',
                                          width: 40,
                                          height: 40,
                                        )),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: MyConstant().purpleColor,
                                          size: 30,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              // height: MediaQuery.of(context).size.height/16,
                              height:60,
                              width: MediaQuery.of(context).size.width / 1,
                              color: MyConstant().purpleColor,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text('المقاسات',
                                      style: GoogleFonts.notoKufiArabic(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: Size)),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text('الخياط',
                                      style: GoogleFonts.notoKufiArabic(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: Size)),
                                  Container(
                                      width: MediaQuery.of(context).size.width / 3,
                                      // height: MediaQuery.of(context).size.height/1,
                                      // color: Colors.amber,
                                      margin: const EdgeInsets.only(
                                          top: 10, bottom: 10, left: 10),
                                      child: Container(
                                        height: 60,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.white,
                                        ),
                                        padding: const EdgeInsets.only(right: 10),
                                        child: DropdownButtonHideUnderline(
                                          child:  DropdownButton2(
                                            iconEnabledColor:
                                            Colors.white,
                                            iconDisabledColor:
                                            Colors.grey,
                                            buttonHeight: 100,
                                            buttonWidth: 160,
                                            // buttonElevation: 2,
                                            itemHeight: 50,
                                            itemPadding:
                                            const EdgeInsets.only(
                                                left: 14,
                                                right: 14),
                                            dropdownMaxHeight: 200,
                                            dropdownWidth: 200,


                                            dropdownDecoration:
                                            BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(
                                                  5),
                                              color: Colors.white,
                                            ),

                                            dropdownElevation: 8,
                                            scrollbarRadius:
                                            const Radius.circular(
                                                20),
                                            scrollbarThickness: 6,
                                            scrollbarAlwaysShow: true,
                                            items: cubit.tRTailorList.map(tRTailorItemBuild).toList(),
                                            value:  cubit.tRTailorValue,
                                            isExpanded: true,
                                            onChanged: (value) {
                                              setState(() {
                                                cubit.tRTailorValue = value as tRTailorModel;
                                                cubit.TaillorName = value.TailorName!;
                                              });
                                            },
                                            iconSize: 40,
                                            icon: Container(
                                              decoration: const BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                BorderRadius.only(
                                                    bottomLeft: Radius
                                                        .circular(
                                                        5),
                                                    topLeft: Radius
                                                        .circular(
                                                        5)),
                                              ),                                          child: const Icon(
                                                Icons.keyboard_arrow_down_sharp),
                                            ),
                                          ),
                                        ),
                                      )),
                                  Container(
                                      width: 70,
                                      height: 40,
                                      // margin: const EdgeInsets.only(left: 40),
                                      child: OutlinedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                          MaterialStateProperty.all(
                                              MyConstant().greenColor),
                                        ),
                                        onPressed:

                                            () async {
                                          await cubit.getWidgetImage();
                                          Navigator.pop(context);
                                        },
                                        child: Text('حفظ',
                                            style: GoogleFonts.notoKufiArabic(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: Size)),
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),

                      Expanded(
                        // flex: 8,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Container(
                                // height: MediaQuery.of(context).size.height/1.56,
                                width: MediaQuery.of(context).size.width / 1,
                                // color: MyConstant().greenColor,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                            width: MediaQuery.of(context).size.width / 2.52,
                                            margin:EdgeInsets.only(top: 14,bottom: 14),
                                            child: customTextField(
                                              text: 'القماش',
                                              controller: cubit.type,
                                              //
                                              textInputType: TextInputType.text,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                        Container(
                                            width: MediaQuery.of(context).size.width / 6,
                                            margin:EdgeInsets.only(top: 10,bottom: 10),
                                            // height: 40,
                                            child: customTextField(
                                              text: AppStrings.frontlength.tr(),
                                              controller: cubit.frontHeight,
                                              //
                                              textInputType: TextInputType.number,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 6,
                                            // height: 40,
                                            margin:EdgeInsets.only(top: 14,bottom: 14),
                                            child: customTextField(
                                              text: AppStrings.lengthbehind.tr(),
                                              controller: cubit.backHeight,
                                              //
                                              textInputType: TextInputType.number,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                      ],
                                    ),
                                    Container(
                                      // height: MediaQuery.of(context).size.height/16,
                                        height: 60,
                                        width: MediaQuery.of(context).size.width ,
                                        color: MyConstant().purpleColor,
                                        child: Center(
                                            child: Text("الكتف والكم" ,style: GoogleFonts.notoKufiArabic(
                                            color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20)),
                                        )),

                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 6,
                                            margin:EdgeInsets.only(top: 8,bottom: 8),
                                            child: customTextField(
                                              text: AppStrings.shoulderwidth.tr(),
                                              controller: cubit.shoulderWidth,
                                              //
                                              textInputType: TextInputType.number,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 6,
                                            margin:EdgeInsets.only(top: 8,bottom: 8),
                                            child: customTextField(
                                              text: AppStrings.shouldertilt.tr(),
                                              controller: cubit.shoulderSlope,
                                              //
                                              textInputType: TextInputType.number,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 6,
                                            margin:EdgeInsets.only(top: 8,bottom: 8),
                                            child: customTextField(
                                              text: AppStrings.sleevelengthplain.tr(),
                                              controller: cubit.sleeveLengthPlain,
                                              //
                                              textInputType: TextInputType.number,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 6,
                                            margin:EdgeInsets.only(top: 8,bottom: 8),
                                            child: customTextField(
                                              text: 'طول الكم اعلي',
                                              controller:
                                              cubit.sleeveLengthIsHigher,
                                              //
                                              textInputType: TextInputType.number,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 6,
                                            margin:EdgeInsets.only(top: 8,bottom: 8),
                                            child: customTextField(
                                              text: AppStrings.widthofthewrist.tr(),
                                              controller: cubit.wideWrist,
                                              //
                                              textInputType: TextInputType.number,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 6,
                                            margin:EdgeInsets.only(top: 8,bottom: 8),
                                            child: customTextField(
                                              text: AppStrings.quantumcuffplain.tr(),
                                              controller: cubit.plainCuff,
                                              //
                                              textInputType: TextInputType.number,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 6,
                                            margin:EdgeInsets.only(top: 8,bottom: 8),
                                            child: customTextField(
                                              text:  AppStrings.cufflength.tr(),
                                              controller: cubit.cuffLength,
                                              //
                                              textInputType: TextInputType.number,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 6,
                                            margin:EdgeInsets.only(top: 8,bottom: 8),
                                            child: customTextField(
                                              text:  AppStrings.CupcakeShow.tr(),
                                              controller: cubit.cuffShow,
                                              //
                                              textInputType: TextInputType.number,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 6,
                                            margin:EdgeInsets.only(top: 8,bottom: 8),
                                            child: customTextField(
                                              text: AppStrings.widenthemiddle.tr(),
                                              controller: cubit.wideMiddle,
                                              //
                                              textInputType: TextInputType.number,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 6,
                                            margin:EdgeInsets.only(top: 8,bottom: 8),
                                            child: customTextField(
                                              text:AppStrings.Expandthechestinfrontof.tr(),
                                              controller:
                                              cubit.expandTheChestInFront,
                                              //
                                              textInputType: TextInputType.number,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 6,
                                            margin:EdgeInsets.only(top: 8,bottom: 8),
                                            child: customTextField(
                                              text:AppStrings.Expandthechestbehind.tr(),
                                              controller:
                                              cubit.expandTheChestBehind,
                                              //
                                              textInputType: TextInputType.number,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 6,
                                            margin:EdgeInsets.only(top: 8,bottom: 8),
                                            child: customTextField(
                                              text: AppStrings.cuffdown.tr(),
                                              controller: cubit.koftaBottom,
                                              //
                                              textInputType: TextInputType.number,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 6,
                                            margin:EdgeInsets.only(top: 8,bottom: 8),
                                            child: customTextField(
                                              text:AppStrings.expanddown.tr(),
                                              controller: cubit.expandDown,
                                              //
                                              textInputType: TextInputType.number,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 6,
                                            margin:EdgeInsets.only(top: 8,bottom: 8),
                                            child: customTextField(
                                              text: AppStrings.NeckPlain.tr(),
                                              controller: cubit.wideNeckPillow,
                                              //
                                              textInputType: TextInputType.number,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 6,
                                            margin:EdgeInsets.only(top: 8,bottom: 8),
                                            child: customTextField(
                                              text:AppStrings.highneck.tr(),
                                              controller: cubit.neckHeight,
                                              //
                                              textInputType: TextInputType.number,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 6,
                                            margin:EdgeInsets.only(top: 8,bottom: 8),
                                            child: customTextField(
                                              text: AppStrings.JabzourHeight.tr(),
                                              controller: cubit.gypsumHeight,
                                              //
                                              textInputType: TextInputType.number,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                      ],
                                    ),
                                    Container(
                                      // height: MediaQuery.of(context).size.height/16,
                                        height: 60,
                                        width: MediaQuery.of(context).size.width ,
                                        color: MyConstant().purpleColor,
                                        child: Center(
                                          child: Text("الجيب" ,style: GoogleFonts.notoKufiArabic(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                        )),

                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 6,
                                            margin:EdgeInsets.only(top: 8,bottom: 8),
                                            child: customTextField(
                                              text:AppStrings.JabzourShow.tr(),
                                              controller: cubit.viewGypsum,
                                              //
                                              textInputType: TextInputType.number,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 6,
                                            margin:EdgeInsets.only(top: 8,bottom: 8),
                                            child: customTextField(
                                              text: AppStrings.ichestpocket.tr(),
                                              controller: cubit.lengthChestPocket,
                                              //
                                              textInputType: TextInputType.number,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 6,
                                            margin:EdgeInsets.only(top: 8,bottom: 8),
                                            child: customTextField(
                                              text: AppStrings.pchestpocket.tr(),
                                              controller: cubit.wideChestPocket,
                                              //
                                              textInputType: TextInputType.number,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 6,
                                            margin:EdgeInsets.only(top: 8,bottom: 8),
                                            child: customTextField(
                                              text: AppStrings.Imobilepocket.tr(),
                                              controller: cubit.wideMobilePocket,
                                              // textInputAction: TextInputAction.next,
                                              textInputType: TextInputType.number,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 6,
                                            margin:EdgeInsets.only(top: 8,bottom: 8),
                                            child: customTextField(
                                              text: AppStrings.pmobilepocket.tr(),
                                              controller: cubit.wideMobilePocket2,
                                              // textInputAction: TextInputAction.next,
                                              textInputType: TextInputType.number,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 6,
                                            margin:EdgeInsets.only(top: 8,bottom: 8),
                                            child: customTextField(
                                              text: AppStrings.iwalletpocket.tr(),
                                              controller: cubit.lengthPocketWallet,
                                              // textInputAction: TextInputAction.next,
                                              textInputType: TextInputType.number,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                        //delete down container
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 6,
                                            margin:EdgeInsets.only(top: 8,bottom: 8),
                                            child: customTextField(
                                              text: AppStrings.pwalletpocket.tr(),
                                              controller: cubit.widePocketWallet,
                                              // textInputAction: TextInputAction.next,
                                              textInputType: TextInputType.number,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 6,
                                            margin:EdgeInsets.only(top: 8,bottom: 8),
                                            child: customTextField(
                                              text: AppStrings.hipextension.tr(),
                                              controller: cubit.hipWidth,
                                              // textInputAction: TextInputAction.next,
                                              textInputType: TextInputType.number,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 6,
                                            margin:EdgeInsets.only(top: 8,bottom: 8),
                                            child: customTextField(
                                              text: AppStrings.buttonnumber.tr(),
                                              controller: cubit.buttonNumber,
                                              // textInputAction: TextInputAction.next,
                                              textInputType: TextInputType.number,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 6,
                                            margin:EdgeInsets.only(top: 8,bottom: 8),
                                            child: customTextField(
                                              text: AppStrings.embroiderynumber.tr(),
                                              controller: cubit.embroideryNumber,
                                              // textInputAction: TextInputAction.next,
                                              textInputType: TextInputType.number,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 5,
                                            margin:EdgeInsets.only(top: 8,bottom: 8),
                                            child: customTextField(
                                              text: AppStrings.betweenchestpocketandshoulder.tr(),
                                              controller: cubit.betweenTheChestPocketAndTheShoulder,
                                              // textInputAction: TextInputAction.next,
                                              textInputType: TextInputType.number,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 6,
                                            margin:EdgeInsets.only(top: 8,bottom: 8),
                                            child: customTextField(
                                              text: AppStrings.sidepocket.tr(),
                                              controller: cubit.sidePocket,
                                              // textInputAction: TextInputAction.next,
                                              textInputType: TextInputType.number,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      // crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        // const SizedBox(width: 0.7,),
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 6,
                                            margin:EdgeInsets.only(top: 8,bottom: 8),
                                            child: customTextField(
                                              text: AppStrings.sleevewidthmedium.tr(),
                                              controller:
                                              cubit.quantumCapacityMedium,
                                              // textInputAction: TextInputAction.next,
                                              textInputType: TextInputType.number,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                        // const SizedBox(width: 1,),
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 6,
                                            margin:EdgeInsets.only(top: 8,bottom: 8),
                                            child: customTextField(
                                              text: 'تخاليص',
                                              controller: cubit.Takhalis,
                                              // textInputAction: TextInputAction.next,
                                              textInputType: TextInputType.text,

                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                        // const SizedBox(width: 1,),
                                        Container(
                                            width:
                                            MediaQuery.of(context).size.width / 5,
                                            margin:EdgeInsets.only(top: 8,bottom: 8),
                                            child: customTextField(
                                              text: 'القماش المتوقع بالمتر',
                                              controller:
                                              cubit.expectedFabricInMeter,
                                              // textInputAction: TextInputAction.done,
                                              // onFieldSubmitted: (value) {
                                              //   FocusScope.of(context).nextFocus();
                                              // }
                                            )),
                                        // const SizedBox(width: 125,)
                                      ],
                                    ),
                                    Container(
                                      // width: MediaQuery.of(context).size.width/6,
                                      // color: Colors.amber,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(AppStrings.asample.tr(),
                                              style: GoogleFonts.notoKufiArabic(
                                                  color: MyConstant().purpleColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: 10,
                                            child: Checkbox(
                                              value: isSelect2,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(3),
                                                side: const BorderSide(
                                                    color: Colors.grey),
                                              ),
                                              onChanged: (val) {
                                                setState(() {
                                                  isSelect2 = val!;
                                                  cubit.sample = val;
                                                });
                                              },
                                              checkColor: Colors.green,
                                              activeColor: Colors.white,
                                              splashRadius: 0,
                                              side: const BorderSide(
                                                  color: Colors.grey),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Text(AppStrings.urgent.tr(),
                                              style: GoogleFonts.notoKufiArabic(
                                                  color: MyConstant().purpleColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16)),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Container(
                                            width: 10,
                                            child: Checkbox(
                                              value: isSelect1,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(3),
                                                side: const BorderSide(
                                                    color: Colors.grey),
                                              ),
                                              onChanged: (val) {
                                                setState(() {
                                                  isSelect1 = val!;
                                                  cubit.harryUp = val;
                                                });
                                              },
                                              checkColor: Colors.green,
                                              activeColor: Colors.white,
                                              splashRadius: 0,
                                              side: const BorderSide(
                                                  color: Colors.grey),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          width:
                                          MediaQuery.of(context).size.width / 4,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 3),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(AppStrings.ModelType.tr(),
                                                  style: GoogleFonts.notoKufiArabic(
                                                      color: MyConstant().purpleColor,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: Size)),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                    4,
                                                padding:
                                                const EdgeInsets.only(right: 5),
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(5),
                                                ),
                                                child: DropdownButtonHideUnderline(

                                                  child:DropdownButton2(
                                                    iconEnabledColor:
                                                    Colors.white,
                                                    iconDisabledColor:
                                                    Colors.grey,
                                                    buttonHeight: 100,
                                                    buttonWidth: 160,
                                                    // buttonElevation: 2,
                                                    itemHeight: 50,
                                                    itemPadding:
                                                    const EdgeInsets.only(
                                                        left: 14,
                                                        right: 14),
                                                    dropdownMaxHeight: 200,
                                                    dropdownWidth: 200,

                                                    buttonDecoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5),
                                                      border: Border.all(
                                                        color: Colors.green,
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                    dropdownDecoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5),
                                                      color: Colors.white,
                                                    ),

                                                    dropdownElevation: 8,
                                                    scrollbarRadius:
                                                    const Radius.circular(
                                                        20),
                                                    scrollbarThickness: 6,
                                                    scrollbarAlwaysShow: true,

                                                    items: cubit.tRModelList
                                                        .map(trModelItemBuild)
                                                        .toList(),
                                                    value:  cubit.trModelValue,
                                                    isExpanded: true,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        cubit.trModelValue =
                                                        value as tRModelModel;
                                                        cubit.ModelName =
                                                        value.modelName!;
                                                        cubit.ModelTypeID = int.parse(
                                                            value.modelTypeID!);
                                                      });
                                                    },
                                                    iconSize: 40,
                                                    icon: Container(
                                                      decoration: const BoxDecoration(
                                                        color: Colors.green,
                                                        borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft: Radius
                                                                .circular(
                                                                5),
                                                            topLeft: Radius
                                                                .circular(
                                                                5)),
                                                      ),                                                child: const Icon(Icons
                                                        .keyboard_arrow_down_sharp),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width:
                                          MediaQuery.of(context).size.width / 4,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(AppStrings.collartype.tr(),
                                                  style: GoogleFonts.notoKufiArabic(
                                                      color: MyConstant().purpleColor,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: Size)),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                    4,
                                                padding:
                                                const EdgeInsets.only(right: 5),
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(5),
                                                ),
                                                child: DropdownButtonHideUnderline(
                                                  child:  DropdownButton2(
                                                    iconEnabledColor:
                                                    Colors.white,
                                                    iconDisabledColor:
                                                    Colors.grey,
                                                    buttonHeight: 100,
                                                    buttonWidth: 160,
                                                    // buttonElevation: 2,
                                                    itemHeight: 50,
                                                    itemPadding:
                                                    const EdgeInsets.only(
                                                        left: 14,
                                                        right: 14),
                                                    dropdownMaxHeight: 200,
                                                    dropdownWidth: 200,

                                                    buttonDecoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5),
                                                      border: Border.all(
                                                        color: Colors.green,
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                    dropdownDecoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5),
                                                      color: Colors.white,
                                                    ),

                                                    dropdownElevation: 8,
                                                    scrollbarRadius:
                                                    const Radius.circular(
                                                        20),
                                                    scrollbarThickness: 6,
                                                    scrollbarAlwaysShow: true,
                                                    items: cubit.tRCollarList
                                                        .map(trCollerItemBuild)
                                                        .toList(),
                                                    value:  cubit.tRCollarValue,
                                                    isExpanded: true,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        cubit.tRCollarValue =
                                                        value as tRCollarModel;
                                                        cubit.CollerName =
                                                        value.CollarName!;
                                                        cubit.CollerTypeID =
                                                            int.parse(
                                                                value.CollarTypeId!);
                                                      });
                                                    },
                                                    iconSize: 40,
                                                    icon: Container(
                                                      decoration: const BoxDecoration(
                                                        color: Colors.green,
                                                        borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft: Radius
                                                                .circular(
                                                                5),
                                                            topLeft: Radius
                                                                .circular(
                                                                5)),
                                                      ),                                                child: const Icon(Icons
                                                        .keyboard_arrow_down_sharp),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width:
                                          MediaQuery.of(context).size.width / 4,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(AppStrings.cufftype.tr(),
                                                  style: GoogleFonts.notoKufiArabic(
                                                      color: MyConstant().purpleColor,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: Size)),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                    4,
                                                padding:
                                                const EdgeInsets.only(right: 5),
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(5),
                                                ),
                                                child: DropdownButtonHideUnderline(
                                                  child:  DropdownButton2(
                                                    iconEnabledColor:
                                                    Colors.white,
                                                    iconDisabledColor:
                                                    Colors.grey,
                                                    buttonHeight: 100,
                                                    buttonWidth: 160,
                                                    // buttonElevation: 2,
                                                    itemHeight: 50,
                                                    itemPadding:
                                                    const EdgeInsets.only(
                                                        left: 14,
                                                        right: 14),
                                                    dropdownMaxHeight: 200,
                                                    dropdownWidth: 200,

                                                    buttonDecoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5),
                                                      border: Border.all(
                                                        color: Colors.green,
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                    dropdownDecoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5),
                                                      color: Colors.white,
                                                    ),

                                                    dropdownElevation: 8,
                                                    scrollbarRadius:
                                                    const Radius.circular(
                                                        20),
                                                    scrollbarThickness: 6,
                                                    scrollbarAlwaysShow: true,
                                                    items: cubit.tRCuffList
                                                        .map(trCuffItemBuild)
                                                        .toList(),
                                                    value:  cubit.tRCuffValue,
                                                    isExpanded: true,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        cubit.tRCuffValue =
                                                        value as tRCuffModel;
                                                        cubit.CuffName =
                                                        value.CuffName!;
                                                        cubit.CuffTypeID = int.parse(
                                                            value.CuffTypeId!);
                                                      });
                                                    },

                                                    iconSize: 40,
                                                    icon: Container(
                                                      decoration: const BoxDecoration(
                                                        color: Colors.green,
                                                        borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft: Radius
                                                                .circular(
                                                                5),
                                                            topLeft: Radius
                                                                .circular(
                                                                5)),
                                                      ),                                                child: const Icon(Icons
                                                        .keyboard_arrow_down_sharp),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          width:
                                          MediaQuery.of(context).size.width / 4,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 3),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(AppStrings.pocketitchingtype.tr(),
                                                  style: GoogleFonts.notoKufiArabic(
                                                      color: MyConstant().purpleColor,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: Size)),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                    4,
                                                padding:
                                                const EdgeInsets.only(right: 5),
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(5),
                                                ),
                                                child: DropdownButtonHideUnderline(
                                                  child:  DropdownButton2(
                                                    iconEnabledColor:
                                                    Colors.white,
                                                    iconDisabledColor:
                                                    Colors.grey,
                                                    buttonHeight: 100,
                                                    buttonWidth: 160,
                                                    // buttonElevation: 2,
                                                    itemHeight: 50,
                                                    itemPadding:
                                                    const EdgeInsets.only(
                                                        left: 14,
                                                        right: 14),
                                                    dropdownMaxHeight: 200,
                                                    dropdownWidth: 200,

                                                    buttonDecoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5),
                                                      border: Border.all(
                                                        color: Colors.green,
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                    dropdownDecoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5),
                                                      color: Colors.white,
                                                    ),

                                                    dropdownElevation: 8,
                                                    scrollbarRadius:
                                                    const Radius.circular(
                                                        20),
                                                    scrollbarThickness: 6,
                                                    scrollbarAlwaysShow: true,
                                                    items: cubit.tRPocketList
                                                        .map(tRPocketItemBuild)
                                                        .toList(),
                                                    value:  cubit.tRPocketValue,
                                                    isExpanded: true,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        cubit.tRPocketValue =
                                                        value as tRPocketModel?;
                                                        cubit.PocketName =
                                                        value!.PocketName!;
                                                        cubit.PocketTypeID =
                                                            int.parse(
                                                                value.PocketTypeId!);
                                                      });
                                                    },

                                                    iconSize: 40,
                                                    icon: Container(
                                                      decoration: const BoxDecoration(
                                                        color: Colors.green,
                                                        borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft: Radius
                                                                .circular(
                                                                5),
                                                            topLeft: Radius
                                                                .circular(
                                                                5)),
                                                      ),                                                child: const Icon(Icons
                                                        .keyboard_arrow_down_sharp),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width:
                                          MediaQuery.of(context).size.width / 4,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(AppStrings.FillingType.tr(),
                                                  style: GoogleFonts.notoKufiArabic(
                                                      color: MyConstant().purpleColor,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: Size)),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                    4,
                                                padding:
                                                const EdgeInsets.only(right: 5),
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(5),
                                                ),
                                                child: DropdownButtonHideUnderline(
                                                  child:  DropdownButton2(
                                                    iconEnabledColor:
                                                    Colors.white,
                                                    iconDisabledColor:
                                                    Colors.grey,
                                                    buttonHeight: 100,
                                                    buttonWidth: 160,
                                                    // buttonElevation: 2,
                                                    itemHeight: 50,
                                                    itemPadding:
                                                    const EdgeInsets.only(
                                                        left: 14,
                                                        right: 14),
                                                    dropdownMaxHeight: 200,
                                                    dropdownWidth: 200,

                                                    buttonDecoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5),
                                                      border: Border.all(
                                                        color: Colors.green,
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                    dropdownDecoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5),
                                                      color: Colors.white,
                                                    ),

                                                    dropdownElevation: 8,
                                                    scrollbarRadius:
                                                    const Radius.circular(
                                                        20),
                                                    scrollbarThickness: 6,
                                                    scrollbarAlwaysShow: true,
                                                    items: cubit.tRFillingList
                                                        .map(tRFillingItemBuild)
                                                        .toList(),
                                                    value:  cubit.trFillingValue,
                                                    isExpanded: true,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        cubit.trFillingValue =
                                                        value as tRFillingModel;
                                                        cubit.FillingName =
                                                        value.FillingName!;
                                                        cubit.FillingTypeID =
                                                            int.parse(
                                                                value.FillingTypeId!);
                                                      });
                                                    },

                                                    iconSize: 40,
                                                    icon: Container(
                                                      decoration: const BoxDecoration(
                                                        color: Colors.green,
                                                        borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft: Radius
                                                                .circular(
                                                                5),
                                                            topLeft: Radius
                                                                .circular(
                                                                5)),
                                                      ),                                                child: const Icon(Icons
                                                        .keyboard_arrow_down_sharp),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width:
                                          MediaQuery.of(context).size.width / 4,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(AppStrings.typeofgypsum.tr(),
                                                  style: GoogleFonts.notoKufiArabic(
                                                      color: MyConstant().purpleColor,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: Size)),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                    4,
                                                padding:
                                                const EdgeInsets.only(right: 5),
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(5),
                                                ),
                                                child: DropdownButtonHideUnderline(
                                                  child:  DropdownButton2(
                                                    iconEnabledColor:
                                                    Colors.white,
                                                    iconDisabledColor:
                                                    Colors.grey,
                                                    buttonHeight: 100,
                                                    buttonWidth: 160,
                                                    // buttonElevation: 2,
                                                    itemHeight: 50,
                                                    itemPadding:
                                                    const EdgeInsets.only(
                                                        left: 14,
                                                        right: 14),
                                                    dropdownMaxHeight: 200,
                                                    dropdownWidth: 200,

                                                    buttonDecoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5),
                                                      border: Border.all(
                                                        color: Colors.green,
                                                      ),
                                                      color: Colors.white,
                                                    ),
                                                    dropdownDecoration:
                                                    BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          5),
                                                      color: Colors.white,
                                                    ),

                                                    dropdownElevation: 8,
                                                    scrollbarRadius:
                                                    const Radius.circular(
                                                        20),
                                                    scrollbarThickness: 6,
                                                    scrollbarAlwaysShow: true,
                                                    items: cubit.tRZipperList
                                                        .map(tRZipperItemBuild)
                                                        .toList(),
                                                    value:  cubit.tRZipperValue,
                                                    isExpanded: true,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        cubit.tRZipperValue =
                                                        value as tRZipperModel;
                                                        cubit.ZipperName =
                                                        value.ZipperName!;
                                                        cubit.ZipperTypeID =
                                                            int.parse(
                                                                value.ZipperTypeId!);
                                                      });
                                                    },

                                                    iconSize: 40,
                                                    icon: Container(
                                                      decoration: const BoxDecoration(
                                                        color: Colors.green,
                                                        borderRadius:
                                                        BorderRadius.only(
                                                            bottomLeft: Radius
                                                                .circular(
                                                                5),
                                                            topLeft: Radius
                                                                .circular(
                                                                5)),
                                                      ),                                                child: const Icon(Icons
                                                        .keyboard_arrow_down_sharp),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              TestingScreen(),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      )

                    ],
                  ),
                ),
                hiddenWhen: const [Condition.largerThan(name: MOBILE)],
                child: Container(
                  // margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: MyConstant().purpleColor, width: 3),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50,bottom: 20,left: 10,right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            textDirection: p.TextDirection.rtl,
                            children: [
                              Container(
                                  height: 40,
                                  width:
                                  MediaQuery.of(context).size.width / 5,
                                  child: Image.asset(
                                    'image/logo app.png',
                                    width: 40,
                                    height: 40,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: MyConstant().purpleColor,
                                    size: 30,
                                  ))
                            ],
                          ),
                        ),
                        Container(
                          // height: MediaQuery.of(context).size.height/16,
                          height: 60,
                          width: MediaQuery.of(context).size.width / 1,
                          color: MyConstant().purpleColor,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('المقاسات',
                                  style: GoogleFonts.notoKufiArabic(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Size)),
                              const SizedBox(
                                width: 10,
                              ),
                              Text('الخياط',
                                  style: GoogleFonts.notoKufiArabic(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Size)),
                              Container(
                                  width: MediaQuery.of(context).size.width / 3,
                                  // height: MediaQuery.of(context).size.height/1,
                                  // color: Colors.amber,
                                  margin: const EdgeInsets.only(
                                      top: 10, bottom: 10, left: 10),
                                  child: Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white,
                                        ),
                                    padding: const EdgeInsets.only(right: 10),
                                    child: DropdownButtonHideUnderline(
                                      child:  DropdownButton2(
                                        iconEnabledColor:
                                        Colors.white,
                                        iconDisabledColor:
                                        Colors.grey,
                                        buttonHeight: 100,
                                        buttonWidth: 160,
                                        // buttonElevation: 2,
                                        itemHeight: 50,
                                        itemPadding:
                                        const EdgeInsets.only(
                                            left: 14,
                                            right: 14),
                                        dropdownMaxHeight: 200,
                                        dropdownWidth: 200,


                                        dropdownDecoration:
                                        BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(
                                              5),
                                          color: Colors.purple,
                                        ),

                                        dropdownElevation: 8,
                                        scrollbarRadius:
                                        const Radius.circular(
                                            20),
                                        scrollbarThickness: 6,
                                        scrollbarAlwaysShow: true,
                                        items: cubit.tRTailorList.map(tRTailorItemBuild).toList(),
                                        value:  cubit.tRTailorValue,
                                        isExpanded: true,
                                        onChanged: (value) {
                                          setState(() {
                                            cubit.tRTailorValue = value as tRTailorModel;
                                            cubit.TaillorName = value.TailorName!;
                                          });
                                        },
                                        iconSize: 40,
                                        icon: Container(
                                          decoration: const BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                            BorderRadius.only(
                                                bottomLeft: Radius
                                                    .circular(
                                                    5),
                                                topLeft: Radius
                                                    .circular(
                                                    5)),
                                          ),                                          child: const Icon(
                                              Icons.keyboard_arrow_down_sharp),
                                        ),
                                      ),
                                    ),
                                  )),
                              Container(
                                  width: 70,
                                  height: 40,
                                  // margin: const EdgeInsets.only(left: 40),
                                  child: OutlinedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              MyConstant().greenColor),
                                    ),
                                    onPressed:

                                        () async {
                                      try{
                                        await cubit.getWidgetImage();
                                        Navigator.pop(context);
                                      }catch(e){}

                                    },
                                    child: Text('حفظ',
                                        style: GoogleFonts.notoKufiArabic(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: Size)),
                                  )),
                            ],
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Container(
                            // height: MediaQuery.of(context).size.height/1.56,
                            // width: MediaQuery.of(context).size.width ,
                            // color: MyConstant().greenColor,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                SizedBox(height: 10,),
                                Row(

                                  children: [
                                    Container(
                                        width: MediaQuery.of(context).size.width /
                                            2.52,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text: 'القماش',
                                            controller: cubit.type,

                                            textInputType: TextInputType.text,

                                            )),
                                    SizedBox(width: 60,),
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width / 3,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text: AppStrings.frontlength.tr(),
                                            controller: cubit.frontHeight,

                                            textInputType: TextInputType.number,

                                            )),
                                  ],
                                ),
                                SizedBox(height: 10,),
                                Container(
                                  // height: MediaQuery.of(context).size.height/16,
                                    height: 60,
                                    width: MediaQuery.of(context).size.width ,
                                    color: MyConstant().purpleColor,
                                    child: Center(
                                      child: Text("الكتف والكم" ,style: GoogleFonts.notoKufiArabic(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                    )),

                                Row(
                                  children: [

                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width / 3,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text: AppStrings.lengthbehind.tr(),
                                            controller: cubit.backHeight,

                                            textInputType: TextInputType.number,

                                            )),
                                    SizedBox(width: 60,),

                                    Container(
                                        width:
                                        MediaQuery.of(context).size.width / 3,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text: AppStrings.shoulderwidth.tr(),
                                            controller: cubit.shoulderWidth,

                                            textInputType: TextInputType.number,

                                            )),
                                    SizedBox(width: 60,),

                                    Container(
                                        width:
                                        MediaQuery.of(context).size.width / 3,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text: AppStrings.shouldertilt.tr(),
                                            controller: cubit.shoulderSlope,

                                            textInputType: TextInputType.number,

                                            )),
                                  ],
                                ),
                                SizedBox(height: 10,),

                                Row(

                                  children: [

                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width / 3,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text: AppStrings.sleevelengthplain.tr(),
                                            controller: cubit.sleeveLengthPlain,

                                            textInputType: TextInputType.number,

                                            )),
                                    SizedBox(width: 60,),

                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width / 3,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text: 'طول الكم اعلي',
                                            controller:
                                                cubit.sleeveLengthIsHigher,

                                            textInputType: TextInputType.number,

                                            )),
                                    SizedBox(width: 60,),

                                    Container(
                                        width:
                                        MediaQuery.of(context).size.width / 3,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text:AppStrings.widthofthewrist.tr(),
                                            controller: cubit.wideWrist,

                                            textInputType: TextInputType.number,

                                            )),

                                  ],
                                ),
                                SizedBox(height: 10,),

                                Row(

                                  children: [
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width / 3,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text:AppStrings.quantumcuffplain.tr(),
                                            controller: cubit.plainCuff,

                                            textInputType: TextInputType.number,

                                            )),
                                    SizedBox(width: 60,),

                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width / 3,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text: AppStrings.cufflength.tr(),
                                            controller: cubit.cuffLength,
                                            //
                                            textInputType: TextInputType.number,

                                            )),
                                    SizedBox(width: 60,),

                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width / 3,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text:  AppStrings.CupcakeShow.tr(),
                                            controller: cubit.cuffShow,
                                            //
                                            textInputType: TextInputType.number,

                                            // onFieldSubmitted: (value) {
                                            //   FocusScope.of(context).nextFocus();
                                            // }
                                            )),
                                  ],
                                ),
                                SizedBox(height: 10,),

                                Row(

                                  children: [
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width / 3,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text: AppStrings.widenthemiddle.tr(),
                                            controller: cubit.wideMiddle,
                                            //
                                            textInputType: TextInputType.number,

                                            // onFieldSubmitted: (value) {
                                            //   FocusScope.of(context).nextFocus();
                                            // }
                                            )),
                                    SizedBox(width: 60,),

                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width / 3,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text: AppStrings.Expandthechestinfrontof.tr(),
                                            controller:
                                                cubit.expandTheChestInFront,
                                            //
                                            textInputType: TextInputType.number,

                                            // onFieldSubmitted: (value) {
                                            //   FocusScope.of(context).nextFocus();
                                            // }
                                            )),
                                    SizedBox(width: 60,),

                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width / 3,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text: AppStrings.Expandthechestbehind.tr(),
                                            controller:
                                                cubit.expandTheChestBehind,
                                            //
                                            textInputType: TextInputType.number,

                                            // onFieldSubmitted: (value) {
                                            //   FocusScope.of(context).nextFocus();
                                            // }
                                            )),
                                  ],
                                ),
                                SizedBox(height: 10,),

                                Row(


                                  children: [
                                    Container(
                                        width:
                                        MediaQuery.of(context).size.width / 3,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text:AppStrings.cuffdown.tr(),
                                            controller: cubit.koftaBottom,
                                            //
                                            textInputType: TextInputType.number,

                                            // onFieldSubmitted: (value) {
                                            //   FocusScope.of(context).nextFocus();
                                            // }
                                            )),
                                    SizedBox(width: 60,),


                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width /3,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text: AppStrings.expanddown.tr(),
                                            controller: cubit.expandDown,
                                            //
                                            textInputType: TextInputType.number,

                                            // onFieldSubmitted: (value) {
                                            //   FocusScope.of(context).nextFocus();
                                            // }
                                            )),
                                    SizedBox(width: 60,),

                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width / 3,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text:AppStrings.NeckPlain.tr(),
                                            controller: cubit.wideNeckPillow,
                                            //
                                            textInputType: TextInputType.number,

                                            // onFieldSubmitted: (value) {
                                            //   FocusScope.of(context).nextFocus();
                                            // }
                                            )),

                                  ],
                                ),
                                SizedBox(height: 10,),

                                Row(

                                  children: [
                                    Container(
                                        width:
                                        MediaQuery.of(context).size.width / 3,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text: AppStrings.highneck.tr(),
                                            controller: cubit.neckHeight,
                                            //
                                            textInputType: TextInputType.number,

                                            // onFieldSubmitted: (value) {
                                            //   FocusScope.of(context).nextFocus();
                                            // }
                                            )),
                                    SizedBox(width: 60,),

                                    Container(
                                        width:
                                        MediaQuery.of(context).size.width / 3,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text: AppStrings.JabzourHeight.tr(),
                                            controller: cubit.gypsumHeight,
                                            //
                                            textInputType: TextInputType.number,

                                            // onFieldSubmitted: (value) {
                                            //   FocusScope.of(context).nextFocus();
                                            // }
                                            )),
                                    SizedBox(width: 60,),

                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width / 3,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text: AppStrings.JabzourShow.tr(),
                                            controller: cubit.viewGypsum,
                                            //
                                            textInputType: TextInputType.number,

                                            // onFieldSubmitted: (value) {
                                            //   FocusScope.of(context).nextFocus();
                                            // }
                                            )),

                                  ],
                                ),
                                Container(
                                  // height: MediaQuery.of(context).size.height/16,
                                    height: 60,
                                    width: MediaQuery.of(context).size.width ,
                                    color: MyConstant().purpleColor,
                                    child: Center(
                                      child: Text("الجيب" ,style: GoogleFonts.notoKufiArabic(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                    )),

                                SizedBox(height: 10,),

                                Row(

                                  children: [
                                    Container(
                                        width:
                                        MediaQuery.of(context).size.width / 3,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text:AppStrings.ichestpocket.tr(),
                                            controller: cubit.lengthChestPocket,
                                            //
                                            textInputType: TextInputType.number,

                                            // onFieldSubmitted: (value) {
                                            //   FocusScope.of(context).nextFocus();
                                            // }
                                            )),
                                    SizedBox(width: 60,),

                                    Container(
                                        width:
                                        MediaQuery.of(context).size.width / 3,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text: AppStrings.pchestpocket.tr(),
                                            controller: cubit.wideChestPocket,
                                            //
                                            textInputType: TextInputType.number,

                                            // onFieldSubmitted: (value) {
                                            //   FocusScope.of(context).nextFocus();
                                            // }
                                            )),
                                    SizedBox(width: 60,),

                                    Container(
                                        width:
                                        MediaQuery.of(context).size.width / 3,
                                        // margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text: AppStrings.Imobilepocket.tr(),
                                            controller: cubit.wideMobilePocket,
                                            //
                                            textInputType: TextInputType.number,

                                            // onFieldSubmitted: (value) {
                                            //   FocusScope.of(context).nextFocus();
                                            // }
                                            )),

                                  ],
                                ),
                                SizedBox(height: 10,),

                                Row(

                                  children: [
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width / 3,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text: AppStrings.pmobilepocket.tr(),
                                            controller: cubit.wideMobilePocket2,
                                            //
                                            textInputType: TextInputType.number,

                                            )),
                                    SizedBox(width: 60,),

                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width / 3,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text: AppStrings.iwalletpocket.tr(),
                                            controller: cubit.lengthPocketWallet,
                                            //
                                            textInputType: TextInputType.number,

                                           )),
                                    SizedBox(width: 60,),

                                    // delete down container
                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width / 3,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text: AppStrings.pwalletpocket.tr(),
                                            controller: cubit.widePocketWallet,
                                            //
                                            textInputType: TextInputType.number,

                                            )),
                                  ],
                                ),
                                SizedBox(height: 10,),

                                Row(

                                  children: [
                                    Container(
                                        width:
                                        MediaQuery.of(context).size.width / 3,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text: AppStrings.hipextension.tr(),
                                            controller: cubit.hipWidth,
                                            //
                                            textInputType: TextInputType.number,

                                            )),
                                    SizedBox(width: 60,),

                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width / 3,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text: AppStrings.buttonnumber.tr(),
                                            controller: cubit.buttonNumber,
                                            //
                                            textInputType: TextInputType.number,

                                        )),
                                    SizedBox(width: 60,),

                                    Container(
                                        width:
                                            MediaQuery.of(context).size.width / 3,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text: AppStrings.embroiderynumber.tr(),
                                            controller: cubit.embroideryNumber,
                                            //
                                            textInputType: TextInputType.number,

                                        )),

                                  ],
                                ),
                                SizedBox(height: 10,),

                                Row(

                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [


                                    Container(
                                        width:
                                        MediaQuery.of(context).size.width / 3,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text:AppStrings.betweenchestpocketandshoulder.tr(),

                                            controller: cubit
                                                .betweenTheChestPocketAndTheShoulder,
                                            //
                                            textInputType: TextInputType.number,

                                            )),
                                    SizedBox(width: 60,),

                                    Container(
                                        width:
                                        MediaQuery.of(context).size.width / 3,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text: AppStrings.sidepocket.tr(),
                                            controller: cubit.sidePocket,
                                            //
                                            textInputType: TextInputType.number,

                                            // onFieldSubmitted: (value) {
                                            //   FocusScope.of(context).nextFocus();
                                            // }
                                            )),
                                    SizedBox(width: 60,),

                                    // const SizedBox(width: 0.7,),
                                    Container(
                                        width: MediaQuery.of(context).size.width / 4,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text: AppStrings.sleevewidthmedium.tr(),
                                            controller:
                                                cubit.quantumCapacityMedium,
                                            //
                                            textInputType: TextInputType.number,

                                            // onFieldSubmitted: (value) {
                                            //   FocusScope.of(context).nextFocus();
                                            // }
                                            )),

                                  ],
                                ),
                                SizedBox(height: 10,),

                                Row(

                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // const SizedBox(width: 1,),
                                    Container(
                                        width:
                                        MediaQuery.of(context).size.width / 3,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text: 'تخاليص',
                                            controller: cubit.Takhalis,
                                            //
                                            textInputType: TextInputType.text,

                                            // onFieldSubmitted: (value) {
                                            //   FocusScope.of(context).nextFocus();
                                            // }
                                            )),
                                    // const SizedBox(width: 1,),
                                    SizedBox(width: 60,),

                                    Container(
                                        width:
                                        MediaQuery.of(context).size.width / 3,
                                        margin:EdgeInsets.only(top: 14,bottom: 14),
                                        child: customTextField(
                                            text: 'القماش المتوقع بالمتر',
                                            controller:
                                            cubit.expectedFabricInMeter,
                                            // textInputAction: TextInputAction.done,
                                            // onFieldSubmitted: (value) {
                                            //   FocusScope.of(context).nextFocus();
                                            // }
                                            )),
                                    // const SizedBox(width: 125,)
                                  ],
                                ),
                                SizedBox(height: 10,),

                                Container(
                                  // width: MediaQuery.of(context).size.width/6,
                                  // color: Colors.amber,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(AppStrings.asample.tr(),
                                          style: GoogleFonts.notoKufiArabic(
                                              color: MyConstant().purpleColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: Size)),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        width: 10,
                                        child: Checkbox(
                                          value: isSelect2,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            side: const BorderSide(
                                                color: Colors.grey),
                                          ),
                                          onChanged: (val) {
                                            setState(() {
                                              isSelect2 = val!;
                                              cubit.sample = val;
                                            });
                                          },
                                          checkColor: Colors.green,
                                          activeColor: Colors.white,
                                          splashRadius: 0,
                                          side: const BorderSide(
                                              color: Colors.grey),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(AppStrings.urgent.tr(),
                                          style: GoogleFonts.notoKufiArabic(
                                              color: MyConstant().purpleColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: Size)),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        width: 10,
                                        child: Checkbox(
                                          value: isSelect1,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            side: const BorderSide(
                                                color: Colors.grey),
                                          ),
                                          onChanged: (val) {
                                            setState(() {
                                              isSelect1 = val!;
                                              cubit.harryUp = val;
                                            });
                                          },
                                          checkColor: Colors.green,
                                          activeColor: Colors.white,
                                          splashRadius: 0,
                                          side: const BorderSide(
                                              color: Colors.grey),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 3),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(AppStrings.ModelType.tr(),
                                              style: GoogleFonts.notoKufiArabic(
                                                  color: MyConstant().purpleColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: Size)),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                               ),
                                            child: DropdownButtonHideUnderline(

                                              child:DropdownButton2(
                                                iconEnabledColor:
                                                Colors.white,
                                                iconDisabledColor:
                                                Colors.grey,
                                                buttonHeight: 100,
                                                buttonWidth: 160,
                                                // buttonElevation: 2,
                                                itemHeight: 50,
                                                itemPadding:
                                                const EdgeInsets.only(
                                                    left: 14,
                                                    right: 14),
                                                dropdownMaxHeight: 200,
                                                dropdownWidth: 200,

                                                buttonDecoration:
                                                BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      5),
                                                  border: Border.all(
                                                    color: Colors.green,
                                                  ),
                                                  color: Colors.white,
                                                ),
                                                dropdownDecoration:
                                                BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      5),
                                                  color: Colors.white,
                                                ),

                                                dropdownElevation: 8,
                                                scrollbarRadius:
                                                const Radius.circular(
                                                    20),
                                                scrollbarThickness: 6,
                                                scrollbarAlwaysShow: true,

                                                items: cubit.tRModelList
                                                    .map(trModelItemBuild)
                                                    .toList(),
                                                value:  cubit.trModelValue,
                                                isExpanded: true,
                                                onChanged: (value) {
                                                  setState(() {
                                                    cubit.trModelValue =
                                                        value as tRModelModel;
                                                    cubit.ModelName =
                                                        value.modelName!;
                                                    cubit.ModelTypeID = int.parse(
                                                        value.modelTypeID!);
                                                  });
                                                },
                                                iconSize: 40,
                                                icon: Container(
                                                  decoration: const BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                    BorderRadius.only(
                                                        bottomLeft: Radius
                                                            .circular(
                                                            5),
                                                        topLeft: Radius
                                                            .circular(
                                                            5)),
                                                  ),                                                child: const Icon(Icons
                                                      .keyboard_arrow_down_sharp),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(AppStrings.collartype.tr(),
                                              style: GoogleFonts.notoKufiArabic(
                                                  color: MyConstant().purpleColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: Size)),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                               ),
                                            child: DropdownButtonHideUnderline(
                                              child:  DropdownButton2(
                                                iconEnabledColor:
                                                Colors.white,
                                                iconDisabledColor:
                                                Colors.grey,
                                                buttonHeight: 100,
                                                buttonWidth: 160,
                                                // buttonElevation: 2,
                                                itemHeight: 50,
                                                itemPadding:
                                                const EdgeInsets.only(
                                                    left: 14,
                                                    right: 14),
                                                dropdownMaxHeight: 200,
                                                dropdownWidth: 200,

                                                buttonDecoration:
                                                BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      5),
                                                  border: Border.all(
                                                    color: Colors.green,
                                                  ),
                                                  color: Colors.white,
                                                ),
                                                dropdownDecoration:
                                                BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      5),
                                                  color: Colors.white,
                                                ),

                                                dropdownElevation: 8,
                                                scrollbarRadius:
                                                const Radius.circular(
                                                    20),
                                                scrollbarThickness: 6,
                                                scrollbarAlwaysShow: true,
                                                items: cubit.tRCollarList
                                                    .map(trCollerItemBuild)
                                                    .toList(),
                                                value:  cubit.tRCollarValue,
                                                isExpanded: true,
                                                onChanged: (value) {
                                                  setState(() {
                                                    cubit. tRCollarValue =
                                                        value as tRCollarModel;
                                                    cubit.CollerName =
                                                        value.CollarName!;
                                                    cubit.CollerTypeID =
                                                        int.parse(
                                                            value.CollarTypeId!);
                                                  });
                                                },
                                                iconSize: 40,
                                                icon: Container(
                                                  decoration: const BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                    BorderRadius.only(
                                                        bottomLeft: Radius
                                                            .circular(
                                                            5),
                                                        topLeft: Radius
                                                            .circular(
                                                            5)),
                                                  ),                                                child: const Icon(Icons
                                                      .keyboard_arrow_down_sharp),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(AppStrings.cufftype.tr(),
                                              style: GoogleFonts.notoKufiArabic(
                                                  color: MyConstant().purpleColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: Size)),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                ),
                                            child: DropdownButtonHideUnderline(
                                              child:  DropdownButton2(
                                                iconEnabledColor:
                                                Colors.white,
                                                iconDisabledColor:
                                                Colors.grey,
                                                buttonHeight: 100,
                                                buttonWidth: 160,
                                                // buttonElevation: 2,
                                                itemHeight: 50,
                                                itemPadding:
                                                const EdgeInsets.only(
                                                    left: 14,
                                                    right: 14),
                                                dropdownMaxHeight: 200,
                                                dropdownWidth: 200,

                                                buttonDecoration:
                                                BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      5),
                                                  border: Border.all(
                                                    color: Colors.green,
                                                  ),
                                                  color: Colors.white,
                                                ),
                                                dropdownDecoration:
                                                BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      5),
                                                  color: Colors.white,
                                                ),

                                                dropdownElevation: 8,
                                                scrollbarRadius:
                                                const Radius.circular(
                                                    20),
                                                scrollbarThickness: 6,
                                                scrollbarAlwaysShow: true,
                                                items: cubit.tRCuffList
                                                    .map(trCuffItemBuild)
                                                    .toList(),
                                                value:  cubit.tRCuffValue,
                                                isExpanded: true,
                                                onChanged: (value) {
                                                  setState(() {
                                                    cubit.tRCuffValue =
                                                        value as tRCuffModel;
                                                    cubit.CuffName =
                                                        value.CuffName!;
                                                    cubit.CuffTypeID = int.parse(
                                                        value.CuffTypeId!);
                                                  });
                                                },

                                                iconSize: 40,
                                                icon: Container(
                                                  decoration: const BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                    BorderRadius.only(
                                                        bottomLeft: Radius
                                                            .circular(
                                                            5),
                                                        topLeft: Radius
                                                            .circular(
                                                            5)),
                                                  ),                                                child: const Icon(Icons
                                                      .keyboard_arrow_down_sharp),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 3),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(AppStrings.pocketitchingtype.tr(),
                                              style: GoogleFonts.notoKufiArabic(
                                                  color: MyConstant().purpleColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: Size)),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                               ),
                                            child: DropdownButtonHideUnderline(
                                              child:  DropdownButton2(
                                                iconEnabledColor:
                                                Colors.white,
                                                iconDisabledColor:
                                                Colors.grey,
                                                buttonHeight: 100,
                                                buttonWidth: 160,
                                                // buttonElevation: 2,
                                                itemHeight: 50,
                                                itemPadding:
                                                const EdgeInsets.only(
                                                    left: 14,
                                                    right: 14),
                                                dropdownMaxHeight: 200,
                                                dropdownWidth: 200,

                                                buttonDecoration:
                                                BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      5),
                                                  border: Border.all(
                                                    color: Colors.green,
                                                  ),
                                                  color: Colors.white,
                                                ),
                                                dropdownDecoration:
                                                BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      5),
                                                  color: Colors.white,
                                                ),

                                                dropdownElevation: 8,
                                                scrollbarRadius:
                                                const Radius.circular(
                                                    20),
                                                scrollbarThickness: 6,
                                                scrollbarAlwaysShow: true,
                                                items: cubit.tRPocketList
                                                    .map(tRPocketItemBuild)
                                                    .toList(),
                                                value:  cubit.tRPocketValue,
                                                isExpanded: true,
                                                onChanged: (value) {
                                                  setState(() {
                                                    cubit.tRPocketValue =
                                                        value as tRPocketModel?;
                                                    cubit.PocketName =
                                                        value!.PocketName!;
                                                    cubit.PocketTypeID =
                                                        int.parse(
                                                            value.PocketTypeId!);
                                                  });
                                                },

                                                iconSize: 40,
                                                icon: Container(
                                                  decoration: const BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                    BorderRadius.only(
                                                        bottomLeft: Radius
                                                            .circular(
                                                            5),
                                                        topLeft: Radius
                                                            .circular(
                                                            5)),
                                                  ),                                                child: const Icon(Icons
                                                      .keyboard_arrow_down_sharp),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(AppStrings.FillingType.tr(),
                                              style: GoogleFonts.notoKufiArabic(
                                                  color: MyConstant().purpleColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: Size)),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                               ),
                                            child: DropdownButtonHideUnderline(
                                              child:  DropdownButton2(
                                                iconEnabledColor:
                                                Colors.white,
                                                iconDisabledColor:
                                                Colors.grey,
                                                buttonHeight: 100,
                                                buttonWidth: 160,
                                                // buttonElevation: 2,
                                                itemHeight: 50,
                                                itemPadding:
                                                const EdgeInsets.only(
                                                    left: 14,
                                                    right: 14),
                                                dropdownMaxHeight: 200,
                                                dropdownWidth: 200,

                                                buttonDecoration:
                                                BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      5),
                                                  border: Border.all(
                                                    color: Colors.green,
                                                  ),
                                                  color: Colors.white,
                                                ),
                                                dropdownDecoration:
                                                BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      5),
                                                  color: Colors.white,
                                                ),

                                                dropdownElevation: 8,
                                                scrollbarRadius:
                                                const Radius.circular(
                                                    20),
                                                scrollbarThickness: 6,
                                                scrollbarAlwaysShow: true,
                                                items: cubit.tRFillingList
                                                    .map(tRFillingItemBuild)
                                                    .toList(),
                                                value:  cubit.trFillingValue,
                                                isExpanded: true,
                                                onChanged: (value) {
                                                  setState(() {
                                                    cubit.trFillingValue =
                                                        value as tRFillingModel;
                                                    cubit.FillingName =
                                                        value.FillingName!;
                                                    cubit.FillingTypeID =
                                                        int.parse(
                                                            value.FillingTypeId!);
                                                  });
                                                },

                                                iconSize: 40,
                                                icon: Container(
                                                  decoration: const BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                    BorderRadius.only(
                                                        bottomLeft: Radius
                                                            .circular(
                                                            5),
                                                        topLeft: Radius
                                                            .circular(
                                                            5)),
                                                  ),                                                child: const Icon(Icons
                                                      .keyboard_arrow_down_sharp),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width / 3,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(AppStrings.typeofgypsum.tr(),
                                              style: GoogleFonts.notoKufiArabic(
                                                  color: MyConstant().purpleColor,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: Size)),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                4,
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            height: 40,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                               ),
                                            child: DropdownButtonHideUnderline(
                                              child:  DropdownButton2(
                                                iconEnabledColor:
                                                Colors.white,
                                                iconDisabledColor:
                                                Colors.grey,
                                                buttonHeight: 100,
                                                buttonWidth: 160,
                                                // buttonElevation: 2,
                                                itemHeight: 50,
                                                itemPadding:
                                                const EdgeInsets.only(
                                                    left: 14,
                                                    right: 14),
                                                dropdownMaxHeight: 200,
                                                dropdownWidth: 200,

                                                buttonDecoration:
                                                BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      5),
                                                  border: Border.all(
                                                    color: Colors.green,
                                                  ),
                                                  color: Colors.white,
                                                ),
                                                dropdownDecoration:
                                                BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      5),
                                                  color: Colors.white,
                                                ),

                                                dropdownElevation: 8,
                                                scrollbarRadius:
                                                const Radius.circular(
                                                    20),
                                                scrollbarThickness: 6,
                                                scrollbarAlwaysShow: true,
                                                items: cubit.tRZipperList
                                                    .map(tRZipperItemBuild)
                                                    .toList(),
                                                value:  cubit.tRZipperValue,
                                                isExpanded: true,
                                                onChanged: (value) {
                                                  setState(() {
                                                    cubit.tRZipperValue =
                                                        value as tRZipperModel;
                                                    cubit.ZipperName =
                                                        value.ZipperName!;
                                                    cubit.ZipperTypeID =
                                                        int.parse(
                                                            value.ZipperTypeId!);
                                                  });
                                                },

                                                iconSize: 40,
                                                icon: Container(
                                                  decoration: const BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                    BorderRadius.only(
                                                        bottomLeft: Radius
                                                            .circular(
                                                            5),
                                                        topLeft: Radius
                                                            .circular(
                                                            5)),
                                                  ),                                                child: const Icon(Icons
                                                      .keyboard_arrow_down_sharp),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        TestingScreen(),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }

  DropdownMenuItem<String> itemBuild(String item) => DropdownMenuItem(
        value: item,
        child: Center(
          child: Text(item,
              style: GoogleFonts.notoKufiArabic(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: Size)),
        ),
      );

  DropdownMenuItem<tRCollarModel> trCollerItemBuild(tRCollarModel item) =>
      DropdownMenuItem(
        value: item,
        child: Center(
          child: Text(item.CollarName!,
              style: GoogleFonts.notoKufiArabic(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: Size)),
        ),
      );

  DropdownMenuItem<tRModelModel> trModelItemBuild(tRModelModel item) =>
      DropdownMenuItem(
        value: item,
        child: Center(
          child: Text(item.modelName!,
              style: GoogleFonts.notoKufiArabic(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: Size)),
        ),
      );

  DropdownMenuItem<tRCuffModel> trCuffItemBuild(tRCuffModel item) =>
      DropdownMenuItem(
        value: item,
        child: Center(
          child: Text(item.CuffName!,
              style: GoogleFonts.notoKufiArabic(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: Size)),
        ),
      );

  DropdownMenuItem<tRFillingModel> tRFillingItemBuild(tRFillingModel item) =>
      DropdownMenuItem(
        value: item,
        child: Center(
          child: Text(item.FillingName!,
              style: GoogleFonts.notoKufiArabic(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: Size)),
        ),
      );

  DropdownMenuItem<tRPocketModel> tRPocketItemBuild(tRPocketModel item) =>
      DropdownMenuItem(
        value: item,
        child: Center(
          child: Text(item.PocketName!,
              style: GoogleFonts.notoKufiArabic(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: Size)),
        ),
      );

  DropdownMenuItem<tRZipperModel> tRZipperItemBuild(tRZipperModel item) =>
      DropdownMenuItem(
        value: item,
        child: Center(
          child: Text(item.ZipperName!,
              style: GoogleFonts.notoKufiArabic(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: Size)),
        ),
      );
  DropdownMenuItem<tRTailorModel> tRTailorItemBuild(tRTailorModel item) =>
      DropdownMenuItem(
        value: item,
        child: Center(
          child: Text(item.TailorName!,
              style: GoogleFonts.notoKufiArabic(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: Size)),
        ),
      );
}
