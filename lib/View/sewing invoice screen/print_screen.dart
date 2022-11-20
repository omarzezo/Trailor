import 'package:easy_localization/easy_localization.dart' as localize;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Cubit/State.dart';
import 'package:omar/constant/appstrings.dart';
import 'package:omar/constant/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Widgets.dart';
import 'package:intl/intl.dart' as intl;
// import 'package:flutter/services.dart' as p;


class PrintScreen extends StatelessWidget {
  static const routeName = "PrintScreen";

  const PrintScreen({Key? key}) : super(key: key);

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
              backgroundColor: Colors.white,
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 10,
                          width: double.infinity,
                          padding: const EdgeInsets.only(left: 30,top: 20),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border:  Border(
                                bottom: BorderSide(color: MyConstant().greenColor.withOpacity(0.3),width: 0.2)),
                            boxShadow: [
                              BoxShadow(
                                  color: MyConstant().greenColor.withOpacity(0.3),
                                  spreadRadius: 0,
                                  blurRadius: 0,
                                  offset: const Offset(1, 1),
                                  blurStyle: BlurStyle.outer),
                            ],
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            textDirection: TextDirection.rtl,
                            children: [
                              SizedBox(height: 40,width:MediaQuery.of(context).size.width/5,
                                  child:Image.asset('image/logo app.png',width: 40,height: 40,)),

                              IconButton(onPressed: () {
                                cubit.clearControllers();
                                Navigator.pop(context);
                              }, icon: Icon(Icons.arrow_forward_ios_rounded,color: MyConstant().purpleColor,size: 30,))
                            ],
                          ),
                        ),
                      ],
                    ),
                    MediaQuery.of(context).orientation==Orientation.portrait?
                    SizedBox(
                      height: 400,
                      width: 400,
                      child:  (cubit.pngBytes != null)?
                      Image.memory(cubit.pngBytes!):Container(),
                    ):Container(),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
// height: MediaQuery.of(context).size.height/16,
                                height: 40,
                                width: MediaQuery.of(context).size.width / 1,
                                color: MyConstant().purpleColor,
                                child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Expanded(
                                      child: Text('المقاسات',
                                          style: GoogleFonts.notoKufiArabic(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12)),
                                    ),
                                    Expanded(
                                      child: Text(' الخياط : ${cubit.TaillorName} ',
                                          style: GoogleFonts.notoKufiArabic(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12)),
                                    ),
// Expanded(child: customTextField(text: '${cubit.tailor.text}الخياط',readOnly: true)),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
//1.56
//                                 height: MediaQuery.of(context).size.height / 1.46,
                                width: MediaQuery.of(context).size.width / 1,
// color: MyConstant().greenColor,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
// Container( width: MediaQuery.of(context).size.width/2.52, height: 40,child: Text( '${cubit.tailor.text} القماش')),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  ' القماش : ${cubit.type.text}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  ' ${AppStrings.frontlength.tr()} : ${cubit.frontHeight.text}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  ' ${AppStrings.lengthbehind.tr()} : ${cubit.backHeight.text}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(text: ''),
                                        )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  '${AppStrings.shoulderwidth.tr()} : ${cubit.shoulderWidth.text}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  ' ${AppStrings.shouldertilt.tr()} : ${cubit.shoulderSlope.text}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  ' ${AppStrings.sleevelengthplain.tr()} : ${cubit.sleeveLengthPlain.text}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  ' ${AppStrings.HigherQuantumExpansion.tr()} :  ${cubit.sleeveLengthIsHigher.text}'),
                                        )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  ' ${AppStrings.widthofthewrist.tr()} : ${cubit.wideWrist.text}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  ' ${AppStrings.quantumcuffplain.tr()}ة : ${cubit.plainCuff.text}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  ' ${AppStrings.cufflength.tr()} : ${cubit.cuffLength.text}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  ' ${AppStrings.CupcakeShow.tr()} : ${cubit.cuffShow.text}'),
                                        )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  '${AppStrings.widenthemiddle.tr()} : ${cubit.wideMiddle.text}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  '${AppStrings.Expandthechestinfrontof.tr()} : ${cubit.expandTheChestInFront.text}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  '${AppStrings.Expandthechestbehind.tr()} : ${cubit.expandTheChestBehind.text}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  '${AppStrings.cuffdown.tr()} : ${cubit.koftaBottom.text}'),
                                        )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  ' ${AppStrings.expanddown.tr()} : ${cubit.expandDown.text}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  ' ${AppStrings.NeckPlain.tr()} : ${cubit.wideNeckPillow.text}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  ' ${AppStrings.highneck.tr()} : ${cubit.neckHeight.text}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  '${AppStrings.JabzourHeight.tr()} : ${cubit.gypsumHeight.text}'),
                                        )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  ' ${AppStrings.JabzourShow.tr()} : ${cubit.viewGypsum.text}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  ' ${AppStrings.ichestpocket.tr()} : ${cubit.lengthChestPocket.text}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  ' ${AppStrings.pchestpocket.tr()} : ${cubit.wideChestPocket.text}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  '${AppStrings.pmobilepocket.tr()} : ${cubit.wideMobilePocket.text}'),
                                        )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  ' ${AppStrings.pmobilepocket.tr()} : ${cubit.wideMobilePocket2.text}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  ' ${AppStrings.iwalletpocket.tr()} : ${cubit.lengthPocketWallet.text}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  ' ${AppStrings.pwalletpocket.tr()} : ${cubit.widePocketWallet.text}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  ' ${AppStrings.hipextension.tr()} : ${cubit.hipWidth.text}'),
                                        )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  '${AppStrings.buttonnumber.tr()} : ${cubit.buttonNumber.text}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  '${AppStrings.embroiderynumber.tr()} : ${cubit.embroideryNumber.text}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  ' ${AppStrings.betweenchestpocketandshoulder.tr()} : ${cubit.betweenTheChestPocketAndTheShoulder.text}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  '${AppStrings.sidepocket.tr()} : ${cubit.sidePocket.text}'),
                                        )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
// crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
// const SizedBox(width: 0.7,),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  '${AppStrings.sleevewidthmedium.tr()} : ${cubit.quantumCapacityMedium.text}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  ' ${AppStrings.clearance.tr()} : ${cubit.Takhalis.text}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  '${AppStrings.Fabricexpectedbythemeter.tr()} : ${cubit.expectedFabricInMeter.text}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(text: ''),
                                        )),

// const SizedBox(width: 125,)
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
// crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
// const SizedBox(width: 0.7,),
                                        if (cubit.sample == true)
                                          Expanded(
                                              child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                6,
                                            height: 40,
                                            child: MyText(text: ' ${AppStrings.asample.tr()}  '),
                                          )),
                                        if (cubit.harryUp == true)
                                          Expanded(
                                              child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                6,
                                            height: 40,
                                            child: MyText(text: "${AppStrings.urgent.tr()}"),
                                          )),
                                        if (cubit.sample == true &&
                                            cubit.harryUp == true)
                                          Expanded(
                                              child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                6,
                                            height: 40,
                                            child: MyText(text: ''),
                                          )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(text: ' '),
                                        )),

// const SizedBox(width: 125,)
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
// crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
// const SizedBox(width: 0.7,),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  '${AppStrings.ModelType.tr()} : ${cubit.ModelName}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  ' ${AppStrings.collartype.tr()} : ${cubit.CollerName}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  '${AppStrings.cufftype.tr()} : ${cubit.CuffName}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(text: ' '),
                                        )),

// const SizedBox(width: 125,)
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
// crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
// const SizedBox(width: 0.7,),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  '${AppStrings.pocketitchingtype.tr()} : ${cubit.PocketName}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  ' ${AppStrings.FillingType.tr()} : ${cubit.FillingName}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(
                                              text:
                                                  '${AppStrings.Gabzortype.tr()} : ${cubit.ZipperName}'),
                                        )),
                                        Expanded(
                                            child: SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  6,
                                          height: 40,
                                          child: MyText(text: ' '),
                                        )),

// const SizedBox(width: 125,)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 1,
// height: MediaQuery.of(context).size.height/1.5,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 10),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: MyConstant().purpleColor, width: 3),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                        // height:
                                        //     MediaQuery.of(context).size.height /
                                        //         16,
// height: 40,
// width: double.infinity,
                                        color: MyConstant().purpleColor,
                                        padding: const EdgeInsets.only(
                                            left: 30, right: 20),
                                        child: Row(
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('${AppStrings.invoicdate.tr()}',
                                                    style: GoogleFonts
                                                        .notoKufiArabic(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12)),
                                                Row(
                                                  children: [
                                                    Text('18:30:05',
                                                        style: GoogleFonts
                                                            .notoKufiArabic(
                                                                color:
                                                                    Colors.white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 12)),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text('25-9-2022',
                                                        style: GoogleFonts
                                                            .notoKufiArabic(
                                                                color:
                                                                    Colors.white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 12)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  10,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('${AppStrings.deliverydate.tr()}',
                                                    style: GoogleFonts
                                                        .notoKufiArabic(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12)),
                                                Row(
                                                  children: [
                                                    Text('18:30:05',
                                                        style: GoogleFonts
                                                            .notoKufiArabic(
                                                                color:
                                                                    Colors.white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 12)),
                                                    const SizedBox(
                                                      width: 5,
                                                    ),
                                                    Text('25-9-2022',
                                                        style: GoogleFonts
                                                            .notoKufiArabic(
                                                                color:
                                                                    Colors.white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 12)),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('${AppStrings.reference.tr()}',
                                                    style: GoogleFonts
                                                        .notoKufiArabic(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12)),
                                                Text('25489',
                                                    style: GoogleFonts
                                                        .notoKufiArabic(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12)),
                                              ],
                                            ),
                                          ],
                                        )),
                                    Container(
// width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height / 9,
// color: Colors.amber,
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 10),
                                      child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                2,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    '${AppStrings.Client.tr()} : ${cubit.customerName}',
                                                    style: GoogleFonts
                                                        .notoKufiArabic(
                                                            color: MyConstant()
                                                                .purpleColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12)),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
// width: MediaQuery.of(context).size.width/2,
// color: Colors.grey,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    '${AppStrings.employee.tr()} : ${cubit.employeeName}',
                                                    style: GoogleFonts
                                                        .notoKufiArabic(
                                                            color: MyConstant()
                                                                .purpleColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12)),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 25,
// width: double.infinity,
                                      alignment: Alignment.centerRight,
                                      padding: const EdgeInsets.only(right: 20),
                                      color: MyConstant().purpleColor,
                                      child: Text('${AppStrings.cloth.tr()}',
                                          style: GoogleFonts.notoKufiArabic(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12)),
                                    ),
                                    Container(
// width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height / 8,
                                      padding:
                                          const EdgeInsets.symmetric(horizontal: 10),
// color: Colors.amber,
                                      child: Row(
// mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                6.2,
// width: 100,
                                            padding:
                                                const EdgeInsets.only(right: 5),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('${AppStrings.item.tr()} : ${cubit.typeOfClothes}',
                                                    style: GoogleFonts
                                                        .notoKufiArabic(
                                                            color: MyConstant()
                                                                .purpleColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12)),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                6.8,
// width: 100,
// padding: const EdgeInsets.only(right: 30),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('${AppStrings.size.tr()} : ${cubit.size}',
                                                    style: GoogleFonts
                                                        .notoKufiArabic(
                                                            color: MyConstant()
                                                                .purpleColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12)),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),

                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  '${AppStrings.Quantity.tr()} :${cubit.quantities.text}',
                                                  style: GoogleFonts
                                                      .notoKufiArabic(
                                                          color: MyConstant()
                                                              .purpleColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12)),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),

                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                  '${AppStrings.unitprice.tr()} :${cubit.itemPrice.text}',
                                                  style: GoogleFonts
                                                      .notoKufiArabic(
                                                          color: MyConstant()
                                                              .purpleColor,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 12)),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),

                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                6.8,
// width: 100,
// padding: const EdgeInsets.only(right: 30),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    '${AppStrings.Total.tr()} :${cubit.totalPrice.text} ',
                                                    style: GoogleFonts
                                                        .notoKufiArabic(
                                                            color: MyConstant()
                                                                .purpleColor,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 12)),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),

// const SizedBox(width: 5,),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 25,
// width: double.infinity,
                                      alignment: Alignment.centerRight,
                                      padding: const EdgeInsets.only(right: 20),
                                      color: MyConstant().purpleColor,
                                      child: Text('${AppStrings.Pricesanddetails.tr()}',
                                          style: GoogleFonts.notoKufiArabic(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12)),
                                    ),
                                    Container(
// height: 450,
//   height: MediaQuery.of(context).size.height/8,
//   width: double.infinity,
                                        padding: const EdgeInsets.only(top: 0),
// color: Colors.amber,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 20.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                      child: SizedBox(
                                                    width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        6,
                                                    child: MyText(
                                                        text:
                                                            '${AppStrings.Total.tr()}  : ${cubit.totalPrice.text}'),
                                                  )),
                                                  Expanded(
                                                      child: SizedBox(
                                                    width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        6,
                                                    child: MyText(
                                                        text:
                                                            ' ${AppStrings.Discount.tr()} : ${cubit.discount.text}'),
                                                  )),
                                                  Expanded(
                                                      child: SizedBox(
                                                    width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        6,
                                                    child: MyText(
                                                        text:
                                                            ' ${AppStrings.Tax.tr()} : ${cubit.tax.text}'),
                                                  )),
                                                  Expanded(
                                                      child: SizedBox(
                                                    width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        6,
                                                    child: MyText(
                                                        text:
                                                            ' ${AppStrings.thenet.tr()} : ${cubit.whatYouPay.text}'),
                                                  )),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 20.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
// crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  (cubit.fixedPaymentType=="نقدى"||cubit.fixedPaymentType=="شيك بنكى")?  Expanded(
                                                      child: SizedBox(
                                                    width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        6,
                                                    child: MyText(
                                                        text:
                                                            ' ${AppStrings.Theamountpaid.tr()} : ${cubit.cash.text}'),
                                                  )): Container(),
                                                  (cubit.fixedPaymentType=="شيك بنكى")?  Expanded(
                                                      child: SizedBox(
                                                    width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        6,
                                                    child: MyText(
                                                        text:
                                                            '  رقم الشيك : ${cubit.cheeckPayment.text}'),
                                                  )):  Container(),
                                                  (cubit.fixedPaymentType=="بطاقة إئتمان")?  Expanded(
                                                      child: SizedBox(
                                                    width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        6,
                                                    child: MyText(
                                                        text:
                                                            ' المدفوع الشبكي : ${cubit.onlinePayment.text}'),
                                                  )): Container(),
                                                  (cubit.fixedPaymentType=="بطاقة إئتمان")?     Expanded(
                                                      child: SizedBox(
                                                    width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        6,
                                                    child: MyText(
                                                        text:
                                                            ' نوع الشبكة : ${cubit.paymentType}'),
                                                  )): Container(),
                                                  Expanded(
                                                      child: SizedBox(
                                                    width: MediaQuery.of(context)
                                                            .size
                                                            .width /
                                                        6,
                                                    child: MyText(
                                                        text:
                                                            '${AppStrings.Remainingamount.tr()} : ${cubit.delayMoney.text}'),
                                                  )),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            )
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                              // Container(
                              //     width: 100,
                              //     height: 30,
                              //     margin:
                              //         const EdgeInsets.only(left: 10, bottom: 5),
                              //     child: OutlinedButton(
                              //       style: ButtonStyle(
                              //         backgroundColor: MaterialStateProperty.all(
                              //             MyConstant().purpleColor),
                              //       ),
                              //       onPressed: () {
                              //         Navigator.pop(context);
                              //       },
                              //       child: Text('طباعه',
                              //           style: GoogleFonts.notoKufiArabic(
                              //               color: Colors.white,
                              //               fontWeight: FontWeight.bold,
                              //               fontSize: 12)),
                              //     )),
                            ],
                          ),
                        ),

                        MediaQuery.of(context).orientation==Orientation.landscape?

                        Expanded(  flex: 1,
                          child:  (cubit.pngBytes != null)?
                            Image.memory(cubit.pngBytes!):Container()):Container(),
                      ],

                    ),

                  ],
                ),
              ));
        },
      ),
    );
  }
}
