import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constant/constant.dart';

Widget iconAndText({
  required IconData iconData,
  required String nameText,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      IconButton(
        icon: Icon(
          iconData,
          color: Colors.grey,
          size: 25,
        ),
        onPressed: () {},
        alignment: Alignment.center,
      ),
      // const SizedBox(
      //   height: 5,
      // ),
      Text(
        nameText,
        style: GoogleFonts.notoKufiArabic(
            color: MyConstant().greenColor,
            fontWeight: FontWeight.bold,
            fontSize: 8),
      )
    ],
  );
}

Widget textField({
  context,
  required String text,
  required BorderRadius radius,
  required BorderSide borderSide,
   TextEditingController? controller,
   bool? readOnly=false,
}) {
  return Container(
      // width: MediaQuery.of(context).size.width * 0.07,
      width: MediaQuery.of(context).size.width * 0.1,
      // height: 20,
      padding: const EdgeInsets.only(top: 8),
      decoration: const BoxDecoration(
          // borderRadius: BorderRadius.only(topRight: Radius.circular(8) , bottomRight:  Radius.circular(8) , ),
          // border: Border(top: BorderSide(color: Colors.green), right: BorderSide(color: Colors.green) , bottom: BorderSide(color: Colors.green)),
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text,
              overflow: TextOverflow.ellipsis,
              // maxLines: 1,
              style: GoogleFonts.notoKufiArabic(
                  color: MyConstant().purpleColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 8)),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 30,
            child: TextFormField(
              controller: controller,
              readOnly: readOnly!,
              textAlign: TextAlign.center,
              validator: (val) {},
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: radius,
                  borderSide: borderSide,
                ),
                // label: Text(text,style: GoogleFonts.notoKufiArabic(
                //     color: MyConstant().purpleColor,
                //     fontWeight: FontWeight.bold,
                //     fontSize: 19
                // ))
              ),
            ),
          ),
        ],
      ));
}

Widget customTextField({
  required String text,
  // required BorderRadius  radius,
  // required BorderSide borderSide,
  TextEditingController? controller,
  bool? readOnly=false,
}) {
  return TextFormField(

    readOnly: readOnly!,
    textAlign: TextAlign.center,
    controller: controller,
    validator: (val) {
      return null;
    },
    decoration: InputDecoration(
      label: Text(text,
          style: GoogleFonts.notoKufiArabic(
              color: MyConstant().purpleColor,
              fontWeight: FontWeight.bold,
              fontSize: 10)),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.green,
        ),
      ),
    ),
  );
}

// Widget dropDownWidget({
//   // required Color color,
//   required Function function,
//   required dynamic object,
//   required List<DropdownMenuItem<dynamic>> list,
//   context,
//   required String title ,
// }){
//  return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     crossAxisAlignment: CrossAxisAlignment.start,
//     children: [
//       Text(title,style: GoogleFonts.notoKufiArabic(
//           color: MyConstant().purpleColor,
//           fontWeight: FontWeight.bold,
//           fontSize: 19
//       )),
//       const SizedBox(height: 10,),
//       Container(
//         width: MediaQuery.of(context).size.width/3,
//         padding: const EdgeInsets.only(right: 5),
//         decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(5),
//             border: Border.all(color: MyConstant().greenColor , width: 1.5)
//         ),
//         child:DropdownButtonHideUnderline(
//           child: DropdownButton(
//             items: list,
//             // items: items.map(itemBuild).toList(),
//             value: object,
//             isExpanded: true,
//             onChanged: function(dynamic),
//             iconEnabledColor: Colors.white,
//             iconSize: 50,
//             icon: Container(
//               color: Colors.white,
//               child: const Icon(Icons.keyboard_arrow_down_sharp),
//             ),
//           ),
//         ),
//       )
//     ],
//   );
//
// }

Widget dropButton({
  required Function function,
  required List<DropdownMenuItem<String>> list,
  required dynamic value,
}) {
  return DropdownButton(
    items: list,
    value: value,
    isExpanded: true,
    onChanged: function(),
    iconEnabledColor: Colors.white,
    iconSize: 45,
    icon: Container(
      color: Colors.green,
      child: const Icon(Icons.keyboard_arrow_down_sharp),
    ),
  );
}
Widget MyText ({required String text}){
  return Text(text,
      style: GoogleFonts.notoKufiArabic(
          color: MyConstant().purpleColor,
          fontWeight: FontWeight.bold,
          fontSize: 10));

}