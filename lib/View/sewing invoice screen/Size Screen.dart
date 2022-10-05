import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Cubit/State.dart';
import 'package:omar/models/TypesModel.dart';
import 'package:omar/models/tRCollar.dart';
import 'package:omar/models/tRCuff.dart';
import 'package:omar/models/tRModel.dart';
import 'package:omar/tast.dart';
import '../../constant/List Of Image.dart';
import '../../constant/constant.dart';
import 'Widgets.dart';

class SizeScreen extends StatefulWidget {
  const SizeScreen({Key? key}) : super(key: key);
  @override
  _SizeScreenState createState() => _SizeScreenState();
}

class _SizeScreenState extends State<SizeScreen> {

  List<String> gebType = ['جيب باين' , 'جيب باين 2 خيط' ,'جيب باين واحد خيط' ,'جيب مخفى' ,];
  List<String> hashoaType = ['حشوا دبل' , 'حشوا وسط' ,'حشو جبزور' ,'بدون حشوا' ,];
  List<String> gabzourType = ['مخفى ' , 'باين' ,'مخفى باين ' ,'دبل خيط باين' ,];
  List<String> items1 = ['موسسة وعد الوان' , 'Tailor' ,'Softy Tex' ,'Sweing Borke' ,];
  var controllerList = ScrollController();
  bool isSelect2 = false;
  bool isSelect1 = false;
  String ? gebValueItem;
  String ? hashoaValueItem;
  String ? gabzourValueItem;
  String ? valueItem1;
tRModelModel? trModelValue;
tRCollarModel? tRCollarValue;
tRCuffModel? tRCuffValue;
  int currentIndex = 0;
  int currentImage = 0;
  int currentImage1 = 0;

  int? selectedType=0,relatedSelectedType;
  List<TypesModel> getRelatedList=[];
  List<TypesModel> selectedLists=[];

  TypesModel selectedCollar =TypesModel();
  TypesModel selectedKabak =TypesModel();
  TypesModel selectedPocket =TypesModel();
  TypesModel selectedGabzor =TypesModel();
  String? frontImage,backImage;
  double Size=10;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getRelatedList=getRelatedListAnyType(0);
setState(() {

});

  }

  @override
  Widget build(BuildContext context) {
    var cubit=LoginCubit.get(context);
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: MyConstant().purpleColor,width: 3),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    // height: MediaQuery.of(context).size.height/16,
                    height: 40,
                    width: MediaQuery.of(context).size.width/1,
                    color: MyConstant().purpleColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('المقاسات',style: GoogleFonts.notoKufiArabic(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: Size
                        )),
                        const SizedBox(width: 10,),
                        Text('الخياط',style: GoogleFonts.notoKufiArabic(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: Size
                        )),
                        Container(
                            width: MediaQuery.of(context).size.width/3,
                            // height: MediaQuery.of(context).size.height/1,
                            // color: Colors.amber,
                            margin: const EdgeInsets.only(top: 10 , bottom: 10 , left: 10),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  border: Border.all(color: MyConstant().greenColor , width: 1.5)
                              ),
                              padding: const EdgeInsets.only(right: 10),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  items: items1.map(itemBuild).toList(),
                                  value: valueItem1,
                                  isExpanded: true,
                                  onChanged: (value){
                                    setState(() {
                                      valueItem1 = value as String  ;
                                    });
                                  },
                                  iconEnabledColor: Colors.white,
                                  iconSize: 20,
                                  icon: Container(
                                    color: Colors.green,
                                    child: const Icon(Icons.keyboard_arrow_down_sharp),
                                  ),

                                ),
                              ),
                            )
                        ),
                        Container(
                            width: 70,
                            height: 20,
                            // margin: const EdgeInsets.only(left: 40),
                            child: OutlinedButton(
                              style: ButtonStyle(
                                backgroundColor:MaterialStateProperty.all(MyConstant().greenColor),
                              ),
                              onPressed: ()async{
                               await cubit.getWidgetImage();

                              }, child: Text('حفظ',style: GoogleFonts.notoKufiArabic(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: Size
                            )),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    // height: MediaQuery.of(context).size.height/1.56,
                    width: MediaQuery.of(context).size.width/1,
                    // color: MyConstant().greenColor,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container( width: MediaQuery.of(context).size.width/2.52, height: 40,child: customTextField(text: 'القماش',controller: cubit.type)),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'طول امام',controller: cubit.frontHeight)),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'طول خلف',controller: cubit.backHeight)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container( width: MediaQuery.of(context).size.width/6,  height: 40,child: customTextField(text: 'عرض الكتف',controller: cubit.shoulderWidth)),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'ميل الكتف',controller: cubit.shoulderSlope)),
                            Container(width: MediaQuery.of(context).size.width/6 , height: 40,child: customTextField(text: 'طول الكم سادة',controller: cubit.sleeveLengthPlain)),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'طول الكم اعلي',controller: cubit.sleeveLengthIsHigher)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container( width: MediaQuery.of(context).size.width/6,  height: 40,child: customTextField(text: 'وسع المعصم',controller: cubit.wideWrist)),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'كفة المصم سادة',controller: cubit.plainCuff)),
                            Container(width: MediaQuery.of(context).size.width/6 , height: 40,child: customTextField(text: 'طول الكبك',controller: cubit.cuffLength)),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'عرض الكبك',controller: cubit.cuffShow)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container( width: MediaQuery.of(context).size.width/6,  height: 40,child: customTextField(text: 'وسع الوسط',controller: cubit.wideMiddle)),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'وسع الصدر امام',controller: cubit.expandTheChestInFront)),
                            Container(width: MediaQuery.of(context).size.width/6 , height: 40,child: customTextField(text: 'وسع الصدر خلف',controller: cubit.expandTheChestBehind)),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'كفتة اسفل',controller: cubit.koftaBottom)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container( width: MediaQuery.of(context).size.width/6,  height: 40,child: customTextField(text: 'وسع اسفل',controller: cubit.expandDown)),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'وسع الرقبة سادة',controller: cubit.wideNeckPillow)),
                            Container(width: MediaQuery.of(context).size.width/6 , height: 40,child: customTextField(text: 'ارتفاع الرقبة',controller: cubit.neckHeight)),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'ارتفاع الجبزور',controller: cubit.gypsumHeight)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container( width: MediaQuery.of(context).size.width/6,  height: 40,child: customTextField(text: 'عرض الجبزور',controller: cubit.viewGypsum)),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'ط-جيب الصدر',controller: cubit.lengthChestPocket)),
                            Container(width: MediaQuery.of(context).size.width/6 , height: 40,child: customTextField(text: 'ع-جيب الصدر',controller: cubit.wideChestPocket)),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'ع-جيب الجوال',controller: cubit.wideMobilePocket)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container( width: MediaQuery.of(context).size.width/6,  height: 40,child: customTextField(text: 'ع-جيب الجوال',controller: cubit.wideMobilePocket2)),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'ط-جيب المحفظة',controller: cubit.lengthPocketWallet)),
                            Container(width: MediaQuery.of(context).size.width/6 , height: 40,child: customTextField(text: 'ع-جيب المحفظة',controller: cubit.widePocketWallet)),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'وسع الورك',controller: cubit.hipWidth)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container( width: MediaQuery.of(context).size.width/6,  height: 40,child: customTextField(text: 'رقم الزرار',controller: cubit.buttonNumber)),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'رقم التطريز',controller: cubit.embroideryNumber)),
                            Container(width: MediaQuery.of(context).size.width/6 , height: 40,child: customTextField(text: 'بين جيب الصدر والكتف',controller: cubit.betweenTheChestPocketAndTheShoulder)),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'جيب الجنب',controller: cubit.sidePocket)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // const SizedBox(width: 0.7,),
                            Container( width: MediaQuery.of(context).size.width/6,  height: 40,child: customTextField(text: 'وسع الكم وسط',controller: cubit.quantumCapacityMedium)),
                            // const SizedBox(width: 1,),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'تخاليص',controller: cubit.Takhalis)),
                            // const SizedBox(width: 1,),
                            Container(width: MediaQuery.of(context).size.width/6 , height: 40,child: customTextField(text: 'القماش المتوقع بالمتر',controller: cubit.expectedFabricInMeter)),
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
                              Text('عينة',style: GoogleFonts.notoKufiArabic(
                                  color: MyConstant().purpleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize:Size
                              )),
                              const SizedBox(width: 5,),
                              Container(
                                width: 10,
                                child: Checkbox(
                                  value: isSelect2,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                    side: const BorderSide(color: Colors.grey),
                                  ),
                                  onChanged: (val) {
                                    setState(() {
                                      isSelect2 = val !;
                                      cubit.sample=val;
                                    });
                                  },
                                  checkColor: Colors.green,
                                  activeColor: Colors.white,
                                  splashRadius: 0,
                                  side: const BorderSide(color: Colors.grey),
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Text('مستعجل',style: GoogleFonts.notoKufiArabic(
                                  color: MyConstant().purpleColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Size
                              )),
                              const SizedBox(width: 5,),
                              Container(
                                width: 10,
                                child: Checkbox(
                                  value: isSelect1,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(3),
                                    side: const BorderSide(color: Colors.grey),
                                  ),
                                  onChanged: (val) {
                                    setState(() {
                                      isSelect1 = val !;
                                      cubit.harryUp=val;
                                    });
                                  },
                                  checkColor: Colors.green,
                                  activeColor: Colors.white,
                                  splashRadius: 0,
                                  side: const BorderSide(color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width/4,
                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('نوع الموديل',style: GoogleFonts.notoKufiArabic(
                                      color: MyConstant().purpleColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Size
                                  )),
                                  const SizedBox(height: 10,),
                                  Container(
                                    width: MediaQuery.of(context).size.width/4,
                                    padding: const EdgeInsets.only(right: 5),
                                    height: 25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),

                                        border: Border.all(color: MyConstant().greenColor , width: 1.5)
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        items: cubit.tRModelList.map(trModelItemBuild).toList(),
                                        value: trModelValue,
                                        isExpanded: true,
                                        onChanged: (value){
                                          setState(() {
                                            trModelValue = value as tRModelModel  ;
                                            cubit.ModelName=value.modelName!;
                                          });
                                        },
                                        iconEnabledColor: Colors.white,
                                        iconSize: 20,
                                        icon: Container(
                                          color: Colors.green,
                                          child: const Icon(Icons.keyboard_arrow_down_sharp),
                                        ),

                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width/4,
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('نوع الياقة',style: GoogleFonts.notoKufiArabic(
                                      color: MyConstant().purpleColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Size
                                  )),
                                  const SizedBox(height: 10,),
                                  Container(
                                    width: MediaQuery.of(context).size.width/4,
                                    padding: const EdgeInsets.only(right: 5),
                                    height: 25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),

                                        border: Border.all(color: MyConstant().greenColor , width: 1.5)
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        items: cubit.tRCollarList.map(trCollerItemBuild).toList(),
                                        value: tRCollarValue,
                                        isExpanded: true,
                                        onChanged: (value){
                                          setState(() {
                                            tRCollarValue = value as tRCollarModel  ;
                                            cubit.CollerName=value.CollarName!;
                                          });
                                        },
                                        iconEnabledColor: Colors.white,
                                        iconSize: 20,
                                        icon: Container(
                                          color: Colors.green,
                                          child: const Icon(Icons.keyboard_arrow_down_sharp),
                                        ),

                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width/4,
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('نوع الكبك',style: GoogleFonts.notoKufiArabic(
                                      color: MyConstant().purpleColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Size
                                  )),
                                  const SizedBox(height: 10,),
                                  Container(
                                    width: MediaQuery.of(context).size.width/4,
                                    padding: const EdgeInsets.only(right: 5),
                                    height: 25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),

                                        border: Border.all(color: MyConstant().greenColor , width: 1.5)
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        items: cubit.tRCuffList.map(trCuffItemBuild).toList(),
                                        value: tRCuffValue,
                                        isExpanded: true,
                                        onChanged: (value){
                                          setState(() {
                                            tRCuffValue = value as tRCuffModel  ;
                                            cubit.CuffName=value.CuffName!;
                                          });
                                        },
                                        iconEnabledColor: Colors.white,
                                        iconSize: 20,
                                        icon: Container(
                                          color: Colors.green,
                                          child: const Icon(Icons.keyboard_arrow_down_sharp),
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
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width/4,
                              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('نوع خياط الجيب',style: GoogleFonts.notoKufiArabic(
                                      color: MyConstant().purpleColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Size
                                  )),
                                  const SizedBox(height: 10,),
                                  Container(
                                    width: MediaQuery.of(context).size.width/4,
                                    padding: const EdgeInsets.only(right: 5),
                                    height: 25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),

                                        border: Border.all(color: MyConstant().greenColor , width: 1.5)
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        items: gebType.map(itemBuild).toList(),
                                        value: gebValueItem,
                                        isExpanded: true,
                                        onChanged: (value){
                                          setState(() {
                                            gebValueItem = value as String?  ;
                                            cubit.TailOfGebName = value!  ;
                                          });
                                        },
                                        iconEnabledColor: Colors.white,
                                        iconSize: 20,
                                        icon: Container(
                                          color: Colors.green,
                                          child: const Icon(Icons.keyboard_arrow_down_sharp),
                                        ),

                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width/4,
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('نوع الحشوة',style: GoogleFonts.notoKufiArabic(
                                      color: MyConstant().purpleColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Size
                                  )),
                                  const SizedBox(height: 10,),
                                  Container(
                                    width: MediaQuery.of(context).size.width/4,
                                    padding: const EdgeInsets.only(right: 5),
                                    height: 25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),

                                        border: Border.all(color: MyConstant().greenColor , width: 1.5)
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        items: hashoaType.map(itemBuild).toList(),
                                        value: hashoaValueItem,
                                        isExpanded: true,
                                        onChanged: (value){
                                          setState(() {
                                            hashoaValueItem = value as String?  ;
                                            cubit.hashoaName = value!  ;
                                          });
                                        },
                                        iconEnabledColor: Colors.white,
                                        iconSize: 20,
                                        icon: Container(
                                          color: Colors.green,
                                          child: const Icon(Icons.keyboard_arrow_down_sharp),
                                        ),

                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width/4,
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('نوع الجبزور',style: GoogleFonts.notoKufiArabic(
                                      color: MyConstant().purpleColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: Size
                                  )),
                                  const SizedBox(height: 10,),
                                  Container(
                                    width: MediaQuery.of(context).size.width/4,
                                    padding: const EdgeInsets.only(right: 5),
                                    height: 25,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),

                                        border: Border.all(color: MyConstant().greenColor , width: 1.5)
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        items: gabzourType.map(itemBuild).toList(),
                                        value: gabzourValueItem,
                                        isExpanded: true,
                                        onChanged: (value){
                                          setState(() {
                                            gabzourValueItem = value as String?  ;
                                            cubit.GabzourName = value!  ;

                                          });
                                        },
                                        iconEnabledColor: Colors.white,
                                        iconSize: 20,
                                        icon: Container(
                                          color: Colors.green,
                                          child: const Icon(Icons.keyboard_arrow_down_sharp),
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


                  const SizedBox(height: 20,),
                ],
              ),
            ),
          )
      );
  },
),
    );
  }
  DropdownMenuItem<String> itemBuild(String item) =>
      DropdownMenuItem(value: item, child: Text(item,style: GoogleFonts.notoKufiArabic(
          color: MyConstant().purpleColor,
          fontWeight: FontWeight.bold,
          fontSize: Size
      )),);
  DropdownMenuItem<tRCollarModel> trCollerItemBuild(tRCollarModel item) =>
      DropdownMenuItem(value: item, child: Text(item.CollarName!,style: GoogleFonts.notoKufiArabic(
          color: MyConstant().purpleColor,
          fontWeight: FontWeight.bold,
          fontSize: Size
      )),);
  DropdownMenuItem<tRModelModel> trModelItemBuild(tRModelModel item) =>
      DropdownMenuItem(value: item, child: Text(item.modelName!,style: GoogleFonts.notoKufiArabic(
          color: MyConstant().purpleColor,
          fontWeight: FontWeight.bold,
          fontSize: Size
      )),);
  DropdownMenuItem<tRCuffModel> trCuffItemBuild(tRCuffModel item) =>
      DropdownMenuItem(value: item, child: Text(item.CuffName!,style: GoogleFonts.notoKufiArabic(
          color: MyConstant().purpleColor,
          fontWeight: FontWeight.bold,
          fontSize: Size
      )),);
}
