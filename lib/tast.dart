import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Cubit/State.dart';
import 'dart:ui' as ui;
import 'constant/List Of Image.dart';
import 'constant/constant.dart';
import 'models/TypesModel.dart';
GlobalKey _containerKey = GlobalKey();

class TestingScreen extends StatefulWidget {
  const TestingScreen({Key? key}) : super(key: key);
  @override
  _TestingScreenState createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  int? selectedType = 0,
      relatedSelectedType;
  List<TypesModel> getRelatedList = [];
  List<TypesModel> selectedLists = [];

  TypesModel selectedCollar = TypesModel();
  TypesModel selectedKabak = TypesModel();
  TypesModel selectedPocket = TypesModel();
  TypesModel selectedGabzor = TypesModel();
  String? frontImage, backImage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRelatedList = getRelatedListAnyType(0);
    setState(() {});
  }

  // Container(
  // height: 20,
  // color: MyConstant().purpleColor,
  // padding: const EdgeInsets.symmetric(horizontal: 10),
  // child: Text('الانواع' , style: GoogleFonts.notoKufiArabic(
  // color: Colors.white,
  // fontWeight: FontWeight.bold,
  // fontSize: 12
  // ),),
  // ),

  // Container(
  // width: MediaQuery.of(context).size.width*0.50,
  // height: 20,
  // color: MyConstant().purpleColor,
  // padding: const EdgeInsets.symmetric(horizontal: 10),
  // child: Text('الثوب' , style: GoogleFonts.notoKufiArabic(
  // color: Colors.white,
  // fontWeight: FontWeight.bold,
  // fontSize: 12
  // ),),
  // ),

  Widget widgetStack() {
    if (MediaQuery
        .of(context)
        .size
        .width > 700) {
      return Stack(
        children: [
          selectedPocket.image != null ? Container(
            margin: const EdgeInsets.only(right: 120, top: 70, left: 0),
            child: Align(
                alignment: Alignment.topRight,
                child: Image.asset(selectedPocket.image!, fit: BoxFit.fill,
                  width: 26, height: 26,)),
          ) : const SizedBox(),
          selectedKabak.image != null ? Container(
            margin: const EdgeInsets.only(right: 10, top: 94, left: 55),
            child: Align(
                alignment: Alignment.topLeft,
                child: Image.asset(selectedKabak.image!, fit: BoxFit.fill,
                  width: 40, height: 40,)),
          ) : const SizedBox(),
          selectedCollar.image != null ? Container(
            margin: const EdgeInsets.only(right: 38, top: 0),
            child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(selectedCollar.image!, fit: BoxFit.fill,
                  width: 50, height: 50,)),
          ) : const SizedBox(),
          selectedGabzor.image != null ? Container(
            margin: const EdgeInsets.only(right: 40, top: 33),
            child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(selectedGabzor.image!, fit: BoxFit.fill,
                  width: 44, height: 60,)),
          ) : const SizedBox(),
        ],
      );
    } else {
      return Stack(
        children: [

          selectedPocket.image != null ? Container(
            margin: EdgeInsets.only(right: 35, top: 20, left: 0),
            child: Align(
                alignment: Alignment.topRight,
                child: Image.asset(selectedPocket.image!, fit: BoxFit.fill,
                  width: 10, height: 10,)),
          ) : const SizedBox(),
          selectedKabak.image != null ? Container(
            margin: EdgeInsets.only(right: 10, top: 28, left: 18),
            child: Align(
                alignment: Alignment.topLeft,
                child: Image.asset(selectedKabak.image!, fit: BoxFit.fill,
                  width: 15, height: 15,)),
          ) : const SizedBox(),
          selectedCollar.image != null ? Container(
            margin: EdgeInsets.only(right: 10, top: 0),
            child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(selectedCollar.image!, fit: BoxFit.fill,
                  width: 20, height: 20,)),
          ) : const SizedBox(),
          selectedGabzor.image != null ? Container(
            margin: EdgeInsets.only(right: 10, top: 9),
            child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(selectedGabzor.image!, fit: BoxFit.fill,
                  width: 24, height: 30,)),
          ) : const SizedBox(),
        ],
      );
    }
  }



  @override
  Widget build(BuildContext context) {
    var cubit=LoginCubit.get(context);
    return BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, top: 20),
      decoration: BoxDecoration(
          border: Border.all(color: MyConstant().greenColor)
      ),
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(10))
                        ),
                        child: SizedBox(
                          // height: MediaQuery.of(context).size.height*.40,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            // physics: const NeverScrollableScrollPhysics(),
                            itemCount: getTypesList().length,
                            itemBuilder: (context, index) {
                              TypesModel item = getTypesList()[index];
                              return InkWell(
                                onTap: () {
                                  relatedSelectedType = null;
                                  selectedType = index;
                                  getRelatedList = getRelatedListAnyType(index);
                                  setState(() {});
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: selectedType == index
                                              ? MyConstant().purpleColor
                                              : Colors.grey,
                                          width: 2
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    // height: 70,
                                    // width: 50,
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,
                                      children: [
                                        Text(item.name!, style: TextStyle(
                                          color: MyConstant().purpleColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                        ),),
                                        const SizedBox(height: 0,),
                                        Image.asset(item.image!, width: 40,
                                          height: 40,
                                          fit: BoxFit.fill,)
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20,),


                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(10))
                        ),
                        child: SizedBox(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            itemCount: getRelatedList.length,
                            itemBuilder: (context, index) {
                              TypesModel item = getRelatedList[index];
                              return InkWell(
                                onTap: () {
                                  relatedSelectedType = index;
                                  if (selectedType == 0) {
                                    frontImage = item.frontImage;
                                    backImage = item.backImage;
                                  } else if (selectedType == 1) {
                                    selectedCollar = item;
                                  } else if (selectedType == 2) {
                                    selectedKabak = item;
                                  } else if (selectedType == 3) {
                                    selectedPocket = item;
                                  } else if (selectedType == 4) {
                                    selectedGabzor = item;
                                  }
                                  setState(() {});
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: relatedSelectedType == index
                                              ? MyConstant().purpleColor
                                              : Colors.grey,
                                          width: 2
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    // height: 70,
                                    // width: 50,
                                    child: Center(
                                      child: Column(
                                        // mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        children: [
                                          Text(item.name!, style: TextStyle(
                                            color: MyConstant().purpleColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10,
                                          ),),
                                          const SizedBox(height: 0,),
                                          Image.asset(item.image!, width: 40,
                                            height: 40,
                                            fit: BoxFit.fill,)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
          ),

          Expanded(
              flex: 6,
              child: Container(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  margin: const EdgeInsets.all(2.5),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            frontImage != null ?
                           RepaintBoundary(

                              child:  Container(

                                  width: (MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.45) / 2,
                                  height: (MediaQuery
                                      .of(context)
                                      .size
                                      .width * 0.60) / 2,
                                  decoration: BoxDecoration(

                                    image: DecorationImage(
                                      image: AssetImage(frontImage!),
                                      fit: BoxFit.fill,
                                    ),
                                  ),

                                  child:
                                  widgetStack()

                              ),
                             key: cubit.repaintKey,
                            )

                                : const SizedBox(),

                            backImage != null
                                ? Image.asset(backImage!,
                              width: (MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.45) / 2,
                              height: (MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.60) / 2, fit: BoxFit.fill,)
                                : const SizedBox(),
                            // Stack(
                            //   children: [
                            //
                            //
                            //   ],
                            // ),
                          ],
                        ),
                        Center(
                          child: SizedBox(
                            height: 50,
                            child: ListView(
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              children: [
                                if(selectedCollar.image != null) Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: MyConstant().greenColor,
                                          width: 2
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    child: Center(
                                        child: Image.asset(
                                          selectedCollar.image!, width: 40,
                                          height: 40,
                                          fit: BoxFit.fill,)
                                    ),
                                  ),
                                ),
                                if(selectedKabak.image != null) Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: MyConstant().greenColor,
                                          width: 2
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    child: Center(
                                        child: Image.asset(
                                          selectedKabak.image!, width: 40,
                                          height: 40,
                                          fit: BoxFit.fill,)
                                    ),
                                  ),
                                ),

                                if(selectedPocket.image != null) Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: MyConstant().greenColor,
                                          width: 2
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    child: Center(
                                        child: Image.asset(
                                          selectedPocket.image!, width: 40,
                                          height: 40,
                                          fit: BoxFit.fill,)
                                    ),
                                  ),
                                ),

                                if(selectedGabzor.image != null) Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: MyConstant().greenColor,
                                          width: 2
                                      ),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                    ),
                                    child: Center(
                                        child: Image.asset(
                                          selectedGabzor.image!, width: 40,
                                          height: 40,
                                          fit: BoxFit.fill,)
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
              )
          ),

        ],
      ),
    );
  },
);
  }

//   Future<Uint8List> captureBoundary() async {
//     Uint8List? pngBytes;
//     try {
//       final RenderRepaintBoundary repaintBoundary = RenderRepaintBoundary();
//
//       // RenderRepaintBoundary boundary =
//       _repaintKey.currentContext!.findRenderObject();
//       ui.Image savedImage = await repaintBoundary.toImage(pixelRatio: 3.0);
//       ByteData? byteData =
//       await savedImage.toByteData(format: ui.ImageByteFormat.png);
//       pngBytes = byteData!.buffer.asUint8List();
//       // saveFile(widget.pickedImage.uri.path, pngBytes);
//       return pngBytes;
//     } catch (e) {
//       print(e);
//     }
//     return pngBytes!;
// }
}