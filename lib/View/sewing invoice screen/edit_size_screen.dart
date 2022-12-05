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
import 'package:omar/models/updatedSizes.dart';
import 'package:omar/tast.dart';
import '../../constant/List Of Image.dart';
import '../../constant/constant.dart';
import '../../models/trFilling.dart';
import 'Widgets.dart';
import 'package:flutter/services.dart' as p;


class EditSizeScreen extends StatefulWidget {
  const EditSizeScreen({
    this.salesId});

  static const routeName = "EditSizeScreen";
  final String? salesId;

  @override
  _EditSizeScreenState createState() => _EditSizeScreenState();
}

class _EditSizeScreenState extends State<EditSizeScreen> {

  var text = "";

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

  tRPocketModel? tRPocketValue;
  tRFillingModel? trFillingValue;
  tRZipperModel? tRZipperValue;
  tRTailorModel? tRTailorValue;
  tRModelModel? trModelValue;

  tRCollarModel? tRCollarValue;
  tRCuffModel? tRCuffValue;
  int currentIndex = 0;
  int currentImage = 0;
  int currentImage1 = 0;

  int? selectedType = 0,
      relatedSelectedType;
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
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: Container(
                // margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: MyConstant().purpleColor, width: 3),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: MediaQuery
                                .of(context)
                                .size
                                .height / 10,
                            width: double.infinity,
                            padding: const EdgeInsets.only(left: 30, top: 10),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              textDirection: p.TextDirection.rtl,
                              children: [
                                Container(
                                    height: 40,
                                    width:
                                    MediaQuery
                                        .of(context)
                                        .size
                                        .width / 5,
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
                        ],
                      ),
                      Container(
                        // height: MediaQuery.of(context).size.height/16,
                        height: 40,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 1,
                        color: MyConstant().purpleColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(AppStrings.Sizes.tr(),
                                style: GoogleFonts.notoKufiArabic(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Size)),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(AppStrings.thetailor.tr(),
                                style: GoogleFonts.notoKufiArabic(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Size)),
                            Container(
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width / 3,
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
                                    child: DropdownButton2(

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
                                      hint: Text(cubit.tRTailorValue!.TailorName??""),
                                      items: cubit.tRTailorList.map(
                                          tRTailorItemBuild).toList(),
                                      value: tRTailorValue,
                                      isExpanded: true,
                                      onChanged: (value) {
                                        setState(() {
                                          tRTailorValue =
                                          value as tRTailorModel;
                                          cubit.tRTailorValue =value;

                                          cubit.TaillorName = value.TailorName??"";
                                          cubit.tailorId = value.TailorId??"";
                                        });
                                      },
                                      iconSize: 25,
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
                                        ), child: const Icon(
                                          Icons.keyboard_arrow_down_sharp),
                                      ),
                                    ),
                                  ),
                                )),
                            Container(
                                width: 70,
                                height: 20,
                                // margin: const EdgeInsets.only(left: 40),
                                child: OutlinedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.all(
                                        MyConstant().greenColor),
                                  ),
                                  onPressed:

                                      () async {
                                    // await cubit.getWidgetImage();
                                    Measurement measurement = Measurement(
                                      itemName: cubit.type.text,
                                      itemCode: cubit.tailCode,
                                      frontLength: double.parse(cubit.frontHeight.text),
                                      backLength: double.parse(cubit.backHeight.text),
                                      shoulderWidth: double.parse(cubit.shoulderWidth.text),
                                      shoulderSlope: double.parse(cubit.shoulderSlope.text),
                                      sleeve: double.parse(cubit.sleeveLengthPlain.text),
                                      sleeveTop: double.parse(cubit.sleeveLengthIsHigher.text),
                                      wrist: double.parse(cubit.wideWrist.text),
                                      plainCuffLength: double.parse(cubit.plainCuff.text),
                                      cuffLength: double.parse(cubit.cuffLength.text),
                                      cuffWidth: double.parse(cubit.cuffShow.text),
                                      middleWidth: double.parse(cubit.wideMiddle.text),
                                      chestFront: double.parse(cubit.expandTheChestInFront.text),
                                      chestBack:double.parse(cubit.expandTheChestBehind.text),
                                      bottomHeight: double.parse(cubit.koftaBottom.text),
                                      bottomWidth: double.parse(cubit.expandDown.text),
                                      collarWidth: double.parse(cubit.wideNeckPillow.text),
                                      collarHeight: double.parse(cubit.neckHeight.text),
                                      zipperHeight: double.parse(cubit.gypsumHeight.text),
                                      zipperWidth: double.parse(cubit.viewGypsum.text),
                                      chestPocketHeight: double.parse(cubit.lengthChestPocket.text),
                                      chestPocketWidth: double.parse(cubit.wideChestPocket.text),
                                      mobilePocketHeight: double.parse(cubit.wideMobilePocket.text),
                                      walletPocketHeight: double.parse(cubit.lengthPocketWallet.text),
                                      walletPocketWidth: double.parse(cubit.widePocketWallet.text),
                                      haunchWidth: double.parse(cubit.hipWidth.text),
                                      buttonNo: int.parse(cubit.buttonNumber.text),
                                      embroideryNo: int.parse(cubit.embroideryNumber.text),
                                      estimatedLength: double.parse(cubit.cuffLength.text),
                                      tailorId: int.parse(cubit.tRTailorValue!.TailorId??""),
                                      sample: cubit.sample?1:0,
                                      urgent: cubit.harryUp?1:0,
                                      shoulderChestLength: double.parse(cubit.betweenTheChestPocketAndTheShoulder.text),
                                      sleeveMiddle: double.parse(cubit.quantumCapacityMedium.text),
                                      sidePocketLength: double.parse(cubit.sidePocket.text),
                                      takhalees: cubit.Takhalis.text,
                                      collarTypeID: int.parse(cubit.tRCollarValue!.CollarTypeId??""),
                                      cuffTypeID:int.parse(cubit.tRCuffValue!.CuffTypeId??""),
                                      modelTypeID: int.parse(cubit.trModelValue!.modelTypeID??""),
                                      pocketTypeID: int.parse(cubit.tRPocketValue!.PocketTypeId??""),
                                      fillingTypeID: int.parse(cubit.trFillingValue!.FillingTypeId??""),
                                      zipperTypeID:int.parse(cubit.tRZipperValue!.ZipperTypeId??""),
                                      note: "",);
                                    Sales sales = Sales(id:int.parse(cubit.salesId??""), measurement:[measurement]);
                                    InvoiceNewSizesModel invoiceNewSizesModel = InvoiceNewSizesModel(
                                        sales:[sales]);
                                    cubit.updateSize(invoiceNewSizesModel);
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
                      ),
                      Container(
                        // height: MediaQuery.of(context).size.height/1.56,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 1,
                        // color: MyConstant().greenColor,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 14,bottom: 14),
                                  child: Container(
                                      width: MediaQuery.of(context).size.width / 2.52,
                                      height: 40,
                                      child: customTextField(
                                          hintText: cubit.sizes[0].itemName,
                                          text: AppStrings.cloth.tr(),
                                          controller: cubit.type,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.text,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 14,bottom: 14),
                                  child: Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 6,
                                      height: 40,
                                      child: customTextField(
                                          hintText: cubit.sizes[0].frontLength,
                                          text: AppStrings.frontlength.tr(),
                                          controller: cubit.frontHeight,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.number,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 14,bottom: 14),
                                  child: Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 6,
                                      height: 40,
                                      child: customTextField(
                                          hintText: cubit.sizes[0].backLength,
                                          text: AppStrings.lengthbehind.tr(),
                                          controller: cubit.backHeight,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.number,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 14,bottom: 14),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 6,
                                      height: 40,
                                      child: customTextField(
                                          hintText: cubit.sizes[0].shoulderWidth,
                                          text: AppStrings.shoulderwidth.tr(),
                                          controller: cubit.shoulderWidth,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.number,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                  Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 6,
                                      height: 40,
                                      child: customTextField(
                                          hintText: cubit.sizes[0].shoulderSlope,

                                          text: AppStrings.shouldertilt.tr(),
                                          controller: cubit.shoulderSlope,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.number,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                  Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 6,
                                      height: 40,
                                      child: customTextField(
                                          text: AppStrings.sleevelengthplain.tr(),
                                          hintText: cubit.sizes[0].sleeve,

                                          controller: cubit.sleeveLengthPlain,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.number,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                  Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 6,
                                      height: 40,
                                      child: customTextField(
                                          text: AppStrings.Thesleevelengthhigher.tr(),
                                          hintText: cubit.sizes[0].sleeveTop,

                                          controller:
                                          cubit.sleeveLengthIsHigher,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.number,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 14,bottom: 14),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 6,
                                      height: 40,
                                      child: customTextField(
                                          hintText: cubit.sizes[0].wrist,

                                          text: AppStrings.widthofthewrist.tr(),
                                          controller: cubit.wideWrist,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.number,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                  Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 6,
                                      height: 40,
                                      child: customTextField(
                                          text: AppStrings.quantumcuffplain.tr(),
                                          hintText: cubit.sizes[0]
                                              .plainCuffLength,

                                          controller: cubit.plainCuff,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.number,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                  Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 6,
                                      height: 40,
                                      child: customTextField(
                                          hintText: cubit.sizes[0].cuffLength,

                                          text: AppStrings.cufflength.tr(),
                                          controller: cubit.cuffLength,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.number,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                  Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 6,
                                      height: 40,
                                      child: customTextField(
                                          text:  AppStrings.CupcakeShow.tr(),
                                          hintText: cubit.sizes[0].cuffWidth,

                                          controller: cubit.cuffShow,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.number,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 14,bottom: 14),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 6,
                                      height: 40,
                                      child: customTextField(
                                          text:  AppStrings.widenthemiddle.tr(),
                                          hintText: cubit.sizes[0].middleWidth,

                                          controller: cubit.wideMiddle,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.number,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                  Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 6,
                                      height: 40,
                                      child: customTextField(
                                          text:  AppStrings.Expandthechestinfrontof.tr(),
                                          hintText: cubit.sizes[0].chestFront,

                                          controller:
                                          cubit.expandTheChestInFront,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.number,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                  Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 6,
                                      height: 40,
                                      child: customTextField(
                                          text: AppStrings.Expandthechestbehind.tr(),
                                          hintText: cubit.sizes[0].chestBack,

                                          controller:
                                          cubit.expandTheChestBehind,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.number,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                  Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 6,
                                      height: 40,
                                      child: customTextField(
                                          hintText: cubit.sizes[0].bottomHeight,

                                          text: AppStrings.cuffdown.tr(),
                                          controller: cubit.koftaBottom,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.number,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 14,bottom: 14),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 6,
                                      height: 40,
                                      child: customTextField(
                                          hintText: cubit.sizes[0].bottomWidth,

                                          text:  AppStrings.expanddown.tr(),
                                          controller: cubit.expandDown,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.number,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                  Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 6,
                                      height: 40,
                                      child: customTextField(
                                          text: AppStrings.NeckPlain.tr(),
                                          hintText: cubit.sizes[0].collarWidth,

                                          controller: cubit.wideNeckPillow,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.number,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                  Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 6,
                                      height: 40,
                                      child: customTextField(
                                          hintText: cubit.sizes[0].collarHeight,

                                          text: AppStrings.highneck.tr(),
                                          controller: cubit.neckHeight,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.number,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                  Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 6,
                                      height: 40,
                                      child: customTextField(
                                          hintText: cubit.sizes[0].zipperHeight,

                                          text:  AppStrings.JabzourHeight.tr(),
                                          controller: cubit.gypsumHeight,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.number,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 14,bottom: 14),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 6,
                                      height: 40,
                                      child: customTextField(
                                          hintText: cubit.sizes[0].zipperWidth,

                                          text: AppStrings.JabzourShow.tr(),
                                          controller: cubit.viewGypsum,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.number,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                  Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 6,
                                      height: 40,
                                      child: customTextField(
                                          hintText: cubit.sizes[0]
                                              .chestPocketHeight,

                                          text: AppStrings.ichestpocket.tr(),
                                          controller: cubit.lengthChestPocket,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.number,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                  Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 6,
                                      height: 40,
                                      child: customTextField(
                                          hintText: cubit.sizes[0]
                                              .chestPocketWidth,
                                          text: AppStrings.pchestpocket.tr(),
                                          controller: cubit.wideChestPocket,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.number,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                  Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 6,
                                      height: 40,
                                      child: customTextField(
                                          hintText: cubit.sizes[0]
                                              .mobilePocketHeight,
                                          text: AppStrings.Imobilepocket.tr(),
                                          controller: cubit.wideMobilePocket,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.number,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 14,bottom: 14),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 6,
                                      height: 40,
                                      child: customTextField(
                                          text:AppStrings.pmobilepocket.tr(),
                                          controller: cubit.wideMobilePocket2,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.number,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                  Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 6,
                                      height: 40,
                                      child: customTextField(
                                          hintText: cubit.sizes[0]
                                              .walletPocketHeight,
                                          text: AppStrings.iwalletpocket.tr(),
                                          controller: cubit.lengthPocketWallet,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.number,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                  //delete down container
                                  Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 6,
                                      height: 40,
                                      child: customTextField(
                                          hintText: cubit.sizes[0]
                                              .walletPocketWidth,
                                          text:  AppStrings.pwalletpocket.tr(),
                                          controller: cubit.widePocketWallet,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.number,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                  Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 6,
                                      height: 40,
                                      child: customTextField(
                                          hintText: cubit.sizes[0].haunchWidth,
                                          text:  AppStrings.hipextension.tr(),
                                          controller: cubit.hipWidth,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.number,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 14,bottom: 14),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 6,
                                      height: 40,
                                      child: customTextField(
                                          hintText: cubit.sizes[0].buttonNo,
                                          text: AppStrings.buttonnumber.tr(),
                                          controller: cubit.buttonNumber,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.number,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                  Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 6,
                                      height: 40,
                                      child: customTextField(
                                          hintText: cubit.sizes[0].embroideryNo,
                                          text:  AppStrings.embroiderynumber.tr(),
                                          controller: cubit.embroideryNumber,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.number,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                  Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 5,
                                      height: 40,
                                      child: customTextField(
                                          hintText: cubit.sizes[0]
                                              .shoulderChestLength,
                                          text:  AppStrings.betweenchestpocketandshoulder.tr(),
                                          controller: cubit
                                              .betweenTheChestPocketAndTheShoulder,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.number,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                  Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 6,
                                      height: 40,
                                      child: customTextField(
                                          text:  AppStrings.sidepocket.tr(),
                                          hintText: cubit.sizes[0]
                                              .sidePocketLength,
                                          controller: cubit.sidePocket,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.number,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 14,bottom: 14),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // const SizedBox(width: 0.7,),
                                  Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 6,
                                      height: 40,
                                      child: customTextField(
                                          text:  AppStrings.sleevewidthmedium.tr(),
                                          hintText: cubit.sizes[0].sleeveMiddle,
                                          controller:
                                          cubit.quantumCapacityMedium,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.number,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                  // const SizedBox(width: 1,),
                                  Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 6,
                                      height: 40,
                                      child: customTextField(
                                          hintText: cubit.sizes[0].takhalees,
                                          text: AppStrings.clearance.tr(),
                                          controller: cubit.Takhalis,
                                          textInputAction: TextInputAction.next,
                                          textInputType: TextInputType.text,

                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                  // const SizedBox(width: 1,),
                                  Container(
                                      width:
                                      MediaQuery
                                          .of(context)
                                          .size
                                          .width / 5,
                                      height: 40,
                                      child: customTextField(
                                          hintText: cubit.sizes[0]
                                              .estimatedLength,
                                          text:  AppStrings.Fabricexpectedbythemeter.tr(),
                                          controller:
                                          cubit.expectedFabricInMeter,
                                          textInputAction: TextInputAction.done,
                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context).nextFocus();
                                          })),
                                  // const SizedBox(width: 125,)
                                ],
                              ),
                            ),
                            Container(
                              // width: MediaQuery.of(context).size.width/6,
                              // color: Colors.amber,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text( AppStrings.asample.tr(),
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

                                      value: cubit.isSelect2,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(3),
                                        side: const BorderSide(
                                            color: Colors.grey),
                                      ),
                                      onChanged: (val) {
                                        setState(() {
                                          cubit.isSelect2 = val!;
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
                                  Text( AppStrings.urgent.tr(),
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
                                      value: cubit.isSelect1,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(3),
                                        side: const BorderSide(
                                            color: Colors.grey),
                                      ),
                                      onChanged: (val) {
                                        setState(() {
                                          cubit.isSelect1 = val!;
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
                                  width: MediaQuery.of(context).size.width / 4,
                                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text( AppStrings.ModelType.tr(),
                                          style: GoogleFonts.notoKufiArabic(
                                              color: MyConstant().purpleColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: Size)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: MediaQuery
                                            .of(context)
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

                                          child: DropdownButton2(
                                            hint: Text(cubit.trModelValue!.modelName??""),
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
                                            value: trModelValue,
                                            isExpanded: true,
                                            onChanged: (value) {
                                              setState(() {
                                                trModelValue =
                                                value as tRModelModel;

                                                cubit.trModelValue =value;
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
                                              ), child: const Icon(Icons
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
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .width / 4,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text( AppStrings.collartype.tr(),
                                          style: GoogleFonts.notoKufiArabic(
                                              color: MyConstant().purpleColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: Size)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: MediaQuery
                                            .of(context)
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
                                          child: DropdownButton2(
                                            hint: Text(cubit.tRCollarValue!.CollarName??""),
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
                                            value: tRCollarValue,
                                            isExpanded: true,
                                            onChanged: (value) {
                                              setState(() {

                                                tRCollarValue =
                                                value as tRCollarModel;
                                                cubit.tRCollarValue =value;

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
                                              ), child: const Icon(Icons
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
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .width / 4,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text( AppStrings.cufftype.tr(),
                                          style: GoogleFonts.notoKufiArabic(
                                              color: MyConstant().purpleColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: Size)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: MediaQuery
                                            .of(context)
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
                                          child: DropdownButton2(
                                            hint: Text(cubit.tRCuffValue!.CuffName??""),
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
                                            value: tRCuffValue,
                                            isExpanded: true,
                                            onChanged: (value) {
                                              setState(() {
                                                tRCuffValue =
                                                value as tRCuffModel;
                                                cubit.tRCuffValue =value;

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
                                              ), child: const Icon(Icons
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
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .width / 4,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 3),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text( AppStrings.pocketitchingtype.tr(),
                                          style: GoogleFonts.notoKufiArabic(
                                              color: MyConstant().purpleColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: Size)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: MediaQuery
                                            .of(context)
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
                                          child: DropdownButton2(
                                            hint: Text(cubit.tRPocketValue!.PocketName??""),
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
                                            value: tRPocketValue,
                                            isExpanded: true,
                                            onChanged: (value) {
                                              setState(() {
                                                tRPocketValue =
                                                value as tRPocketModel?;
                                                cubit.tRPocketValue =value;

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
                                              ), child: const Icon(Icons
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
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .width / 4,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text( AppStrings.FillingType.tr(),
                                          style: GoogleFonts.notoKufiArabic(
                                              color: MyConstant().purpleColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: Size)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: MediaQuery
                                            .of(context)
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
                                          child: DropdownButton2(
                                            hint: Text(
                                                cubit.trFillingValue!.FillingName ?? ""),
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
                                            value: trFillingValue=cubit.trFillingValue,
                                            isExpanded: true,
                                            onChanged: (value) {
                                              setState(() {
                                                trFillingValue =
                                                value as tRFillingModel;
                                                cubit.trFillingValue =value;

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
                                              ), child: const Icon(Icons
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
                                  MediaQuery
                                      .of(context)
                                      .size
                                      .width / 4,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5),
                                  child: Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text( AppStrings.typeofgypsum.tr(),
                                          style: GoogleFonts.notoKufiArabic(
                                              color: MyConstant().purpleColor,
                                              fontWeight: FontWeight.bold,
                                              fontSize: Size)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width: MediaQuery
                                            .of(context)
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
                                          child: DropdownButton2(
                                            hint: Text(cubit.tRZipperValue!.ZipperName??""),
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
                                            value: tRZipperValue,
                                            isExpanded: true,
                                            onChanged: (value) {
                                              setState(() {
                                                tRZipperValue =
                                                value as tRZipperModel;

                                                cubit.tRZipperValue =value;
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
                                              ), child: const Icon(Icons
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
                      // TestingScreen(),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }

  DropdownMenuItem<String> itemBuild(String item) =>
      DropdownMenuItem(
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
