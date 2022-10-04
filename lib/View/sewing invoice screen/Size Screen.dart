import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/models/TypesModel.dart';
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

  List<String> items = ['item1' , 'item2' ,'item3' ,'item4' ,];
  List<String> items1 = ['موسسة وعد الوان' , 'Tailor' ,'Softy Tex' ,'Sweing Borke' ,];
  var controllerList = ScrollController();
  bool isSelect2 = false;
  bool isSelect1 = false;
  String ? valueItem;
  String ? valueItem1;

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRelatedList=getRelatedListAnyType(0);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
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
                            fontSize: 8
                        )),
                        const SizedBox(width: 10,),
                        Text('الخياط',style: GoogleFonts.notoKufiArabic(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 8
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
                              onPressed: (){}, child: Text('حفظ',style: GoogleFonts.notoKufiArabic(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 8
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
                            Container( width: MediaQuery.of(context).size.width/2.52, height: 40,child: customTextField(text: 'القماش')),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'طول امام')),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'طول خلف')),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container( width: MediaQuery.of(context).size.width/6,  height: 40,child: customTextField(text: 'عرض الكتف')),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'ميل الكتف')),
                            Container(width: MediaQuery.of(context).size.width/6 , height: 40,child: customTextField(text: 'طول الكم سادة')),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'طول الكم اعلي')),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container( width: MediaQuery.of(context).size.width/6,  height: 40,child: customTextField(text: 'وسع المعصم')),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'كفة المصم سادة')),
                            Container(width: MediaQuery.of(context).size.width/6 , height: 40,child: customTextField(text: 'طول الكبك')),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'عرض الكبك')),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container( width: MediaQuery.of(context).size.width/6,  height: 40,child: customTextField(text: 'وسع الوسط')),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'وسع الصدر امام')),
                            Container(width: MediaQuery.of(context).size.width/6 , height: 40,child: customTextField(text: 'وسع الصدر خلف')),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'كفتة اسفل')),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container( width: MediaQuery.of(context).size.width/6,  height: 40,child: customTextField(text: 'وسع اسفل')),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'وسع الرقبة سادة')),
                            Container(width: MediaQuery.of(context).size.width/6 , height: 40,child: customTextField(text: 'ارتفاع الرقبة')),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'ارتفاع الجبزور')),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container( width: MediaQuery.of(context).size.width/6,  height: 40,child: customTextField(text: 'عرض الجبزور')),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'ط-جيب الصدر')),
                            Container(width: MediaQuery.of(context).size.width/6 , height: 40,child: customTextField(text: 'ع-جيب الصدر')),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'ع-جيب الجوال')),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container( width: MediaQuery.of(context).size.width/6,  height: 40,child: customTextField(text: 'ع-جيب الجوال')),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'ط-جيب المحفظة')),
                            Container(width: MediaQuery.of(context).size.width/6 , height: 40,child: customTextField(text: 'ع-جيب المحفظة')),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'وسع الورك')),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container( width: MediaQuery.of(context).size.width/6,  height: 40,child: customTextField(text: 'رقم الزرار')),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'رقم التطريز')),
                            Container(width: MediaQuery.of(context).size.width/6 , height: 40,child: customTextField(text: 'بين جيب الصدر والكتف')),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'جيب الجنب')),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // const SizedBox(width: 0.7,),
                            Container( width: MediaQuery.of(context).size.width/6,  height: 40,child: customTextField(text: 'وسع الكم وسط')),
                            // const SizedBox(width: 1,),
                            Container(width: MediaQuery.of(context).size.width/6, height: 40,child: customTextField(text: 'تخاليص')),
                            // const SizedBox(width: 1,),
                            Container(width: MediaQuery.of(context).size.width/6 , height: 40,child: customTextField(text: 'القماش المتوقع بالمتر')),
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
                                  fontSize: 8
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
                                  fontSize: 8
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
                                      fontSize: 8
                                  )),
                                  const SizedBox(height: 10,),
                                  Container(
                                    width: MediaQuery.of(context).size.width/4,
                                    padding: const EdgeInsets.only(right: 5),
                                    height: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),

                                        border: Border.all(color: MyConstant().greenColor , width: 1.5)
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        items: items.map(itemBuild).toList(),
                                        value: valueItem,
                                        isExpanded: true,
                                        onChanged: (value){
                                          setState(() {
                                            valueItem = value as String?  ;
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
                                      fontSize: 8
                                  )),
                                  const SizedBox(height: 10,),
                                  Container(
                                    width: MediaQuery.of(context).size.width/4,
                                    padding: const EdgeInsets.only(right: 5),
                                    height: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),

                                        border: Border.all(color: MyConstant().greenColor , width: 1.5)
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        items: items.map(itemBuild).toList(),
                                        value: valueItem,
                                        isExpanded: true,
                                        onChanged: (value){
                                          setState(() {
                                            valueItem = value as String?  ;
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
                                      fontSize: 8
                                  )),
                                  const SizedBox(height: 10,),
                                  Container(
                                    width: MediaQuery.of(context).size.width/4,
                                    padding: const EdgeInsets.only(right: 5),
                                    height: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),

                                        border: Border.all(color: MyConstant().greenColor , width: 1.5)
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        items: items.map(itemBuild).toList(),
                                        value: valueItem,
                                        isExpanded: true,
                                        onChanged: (value){
                                          setState(() {
                                            valueItem = value as String?  ;
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
                                      fontSize: 8
                                  )),
                                  const SizedBox(height: 10,),
                                  Container(
                                    width: MediaQuery.of(context).size.width/4,
                                    padding: const EdgeInsets.only(right: 5),
                                    height: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),

                                        border: Border.all(color: MyConstant().greenColor , width: 1.5)
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        items: items.map(itemBuild).toList(),
                                        value: valueItem,
                                        isExpanded: true,
                                        onChanged: (value){
                                          setState(() {
                                            valueItem = value as String?  ;
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
                                      fontSize: 8
                                  )),
                                  const SizedBox(height: 10,),
                                  Container(
                                    width: MediaQuery.of(context).size.width/4,
                                    padding: const EdgeInsets.only(right: 5),
                                    height: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),

                                        border: Border.all(color: MyConstant().greenColor , width: 1.5)
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        items: items.map(itemBuild).toList(),
                                        value: valueItem,
                                        isExpanded: true,
                                        onChanged: (value){
                                          setState(() {
                                            valueItem = value as String?  ;
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
                                      fontSize: 8
                                  )),
                                  const SizedBox(height: 10,),
                                  Container(
                                    width: MediaQuery.of(context).size.width/4,
                                    padding: const EdgeInsets.only(right: 5),
                                    height: 20,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),

                                        border: Border.all(color: MyConstant().greenColor , width: 1.5)
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        items: items.map(itemBuild).toList(),
                                        value: valueItem,
                                        isExpanded: true,
                                        onChanged: (value){
                                          setState(() {
                                            valueItem = value as String?  ;
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
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SizedBox(
                      // height: MediaQuery.of(context).size.height*.40,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width*0.34,
                              margin: const EdgeInsets.all(2.5),
                              child:Column(
                                children: [
                                  Container(
                                    // width: MediaQuery.of(context).size.width*0.34,
                                    height: 20,
                                    color: MyConstant().purpleColor,
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Text('الانواع' , style: GoogleFonts.notoKufiArabic(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12
                                    ),),
                                  ),


                                  Container(
                                    padding: const EdgeInsets.only(top: 20),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: MyConstant().greenColor)
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: (MediaQuery.of(context).size.width*0.17)/2,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                              ),
                                              borderRadius: const BorderRadius.all(Radius.circular(10))
                                          ),
                                          child: SizedBox(
                                            // height: MediaQuery.of(context).size.height*.40,
                                            child: ListView.builder(
                                              padding: EdgeInsets.zero,
                                              shrinkWrap: true,
                                              // physics: const NeverScrollableScrollPhysics(),
                                              itemCount: getTypesList().length,
                                              itemBuilder: (context, index) {
                                                TypesModel item =getTypesList()[index];
                                                return InkWell(
                                                  onTap: () {
                                                    selectedType=index;
                                                    getRelatedList=getRelatedListAnyType(index);
                                                    setState(() {});
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Container(
                                                      padding: const EdgeInsets.all(2),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: selectedType==index?MyConstant().purpleColor:Colors.grey,
                                                            width: 2
                                                        ),
                                                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                      ),
                                                      // height: 70,
                                                      // width: 50,
                                                      child: Column(
                                                        // mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Text(item.name! , style: TextStyle(
                                                            color: MyConstant().purpleColor,
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: 10,
                                                          ),),
                                                          const SizedBox(height: 0,),
                                                          Image.asset(item.image!,width: 40,height: 40,fit: BoxFit.fill,)
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20,),


                                        Container(
                                          width: (MediaQuery.of(context).size.width*0.17)/2,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey,
                                              ),
                                              borderRadius: const BorderRadius.all(Radius.circular(10))
                                          ),
                                          child: SizedBox(
                                            child: ListView.builder(
                                              padding: EdgeInsets.zero,
                                              physics: const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: getRelatedList.length,
                                              itemBuilder: (context, index) {
                                                TypesModel item =getRelatedList[index];
                                                return InkWell(
                                                  onTap: () {
                                                    relatedSelectedType=index;
                                                    if(selectedType==0){
                                                      frontImage=item.frontImage;
                                                      backImage=item.backImage;
                                                    }else if(selectedType==1){
                                                      selectedCollar=item;
                                                    }else if(selectedType==2){
                                                      selectedKabak=item;
                                                    }else if(selectedType==3){
                                                      selectedPocket=item;
                                                    }else if(selectedType==4){
                                                      selectedGabzor=item;
                                                    }
                                                    setState(() {});
                                                  },
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Container(
                                                      padding: const EdgeInsets.all(2),
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: relatedSelectedType==index?MyConstant().purpleColor:Colors.grey,
                                                            width: 2
                                                        ),
                                                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                                                      ),
                                                      // height: 70,
                                                      // width: 50,
                                                      child: Center(
                                                        child: Column(
                                                          // mainAxisAlignment: MainAxisAlignment.start,
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Text(item.name! , style: TextStyle(
                                                              color: MyConstant().purpleColor,
                                                              fontWeight: FontWeight.bold,
                                                              fontSize: 10,
                                                            ),),
                                                            const SizedBox(height: 0,),
                                                            Image.asset(item.image!,width: 40,height: 40,fit: BoxFit.fill,)
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                          ),

                          Container(
                            width: MediaQuery.of(context).size.width*0.50,
                            margin: const EdgeInsets.all(2.5),
                            child: SingleChildScrollView(
                              physics: const NeverScrollableScrollPhysics(),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width*0.50,
                                    height: 20,
                                    color: MyConstant().purpleColor,
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    child: Text('الثوب' , style: GoogleFonts.notoKufiArabic(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12
                                    ),),
                                  ),
                                  const SizedBox(height: 5,),
                                  Container(
                                    width: MediaQuery.of(context).size.width*0.50,
                                    // height: MediaQuery.of(context).size.height/4.5,
                                    decoration: BoxDecoration(
                                      // color: Colors.amber,
                                        border: Border(
                                          left: BorderSide(color: MyConstant().greenColor),
                                          right: BorderSide(color: MyConstant().greenColor),
                                        )
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        frontImage !=null?
                                        Container(
                                            width: (MediaQuery.of(context).size.width*0.45)/2,
                                            height:(MediaQuery.of(context).size.width*0.60)/2 ,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(frontImage!),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            child:selectedGabzor.image!=null?
                                            Align(
                                                alignment: Alignment.topCenter,
                                                child: Image.asset(selectedGabzor.image!)):null
                                        )


                                        //   Container(
                                        //     width: (MediaQuery.of(context).size.width*0.45)/2,
                                        //     height:(MediaQuery.of(context).size.width*0.60)/2 ,
                                        //     child: Stack(
                                        //       children: [
                                        //         Icon(Icons.add_a_photo, size: 30,),
                                        // Image.asset(frontImage!,
                                        // width: (MediaQuery.of(context).size.width*0.45)/2,
                                        // height:(MediaQuery.of(context).size.width*0.60)/2 ,fit: BoxFit.fill, ),
                                        //
                                        //       ],
                                        //     ),
                                        //   )

                                            :const SizedBox(),

                                        backImage !=null?  Image.asset(backImage!,
                                          width: (MediaQuery.of(context).size.width*0.45)/2,
                                          height:(MediaQuery.of(context).size.width*0.60)/2 ,fit: BoxFit.fill, ):const SizedBox(),
                                        // Stack(
                                        //   children: [
                                        //
                                        //
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: SizedBox(
                                      height: 60,
                                      child: ListView(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        children: [
                                          if(selectedCollar.image!=null) Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Container(
                                              padding: const EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: MyConstant().greenColor,
                                                    width: 2
                                                ),
                                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                              ),
                                              child: Center(
                                                  child: Image.asset(selectedCollar.image!,width: 40,height: 40,fit: BoxFit.fill,)
                                              ),
                                            ),
                                          ),
                                          if(selectedKabak.image!=null) Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Container(
                                              padding: const EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: MyConstant().greenColor,
                                                    width: 2
                                                ),
                                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                              ),
                                              child: Center(
                                                  child: Image.asset(selectedKabak.image!,width: 40,height: 40,fit: BoxFit.fill,)
                                              ),
                                            ),
                                          ),

                                          if(selectedPocket.image!=null)  Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Container(
                                              padding: const EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: MyConstant().greenColor,
                                                    width: 2
                                                ),
                                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                              ),
                                              child: Center(
                                                  child: Image.asset(selectedPocket.image!,width: 40,height: 40,fit: BoxFit.fill,)
                                              ),
                                            ),
                                          ),

                                          if(selectedGabzor.image!=null)  Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Container(
                                              padding: const EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: MyConstant().greenColor,
                                                    width: 2
                                                ),
                                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                              ),
                                              child: Center(
                                                  child: Image.asset(selectedGabzor.image!,width: 40,height: 40,fit: BoxFit.fill,)
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),


                  const SizedBox(height: 20,),
                ],
              ),
            ),
          )
      ),
    );
  }
  DropdownMenuItem<String> itemBuild(String item) =>
      DropdownMenuItem(value: item, child: Text(item,style: GoogleFonts.notoKufiArabic(
          color: MyConstant().purpleColor,
          fontWeight: FontWeight.bold,
          fontSize: 12
      )),);
}
