import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/constant.dart';

Widget iconAndText({
  required IconData iconData,
  required String nameText,

}){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: IconButton(
          icon: Icon(iconData , color: Colors.grey, size: 60, ) ,
          onPressed: (){},
          alignment: Alignment.center,
        ),
      ),
      const SizedBox(height: 20,),
      Text(nameText , style: GoogleFonts.notoKufiArabic(
          color: MyConstant().greenColor,
          fontWeight: FontWeight.w500,
          fontSize: 20
      ),)
    ],
  );
}


// Widget dropDownWidget({
// required Color color,
//   required Function function,
//   required Object object,
// }){
//   DropdownButtonHideUnderline(
//     child: DropdownButton(
//       items: items.map(itemBuild).toList(),
//       value: object,
//       isExpanded: true,
//       onChanged: function(),
//       iconEnabledColor: Colors.white,
//       iconSize: 50,
//       icon: Container(
//         color: color,
//         child: const Icon(Icons.keyboard_arrow_down_sharp),
//       ),
//     ),
//   ),
// }