import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  // context,
  required String text,
  required BorderRadius radius,
  required BorderSide borderSide,
   TextEditingController? controller,
   Function(String)? onChanged,
   Function(String)? onFieldSubmitted,
  String? Function(String?)? validator,
   bool? readOnly=false,
}) {
  return Container(
      // width: MediaQuery.of(context).size.width * 0.07,
      // width: MediaQuery.of(context).size.width * 0.2,
    width: 100,
      // height: 20,
      padding: const EdgeInsets.only(top: 4),
      decoration: const BoxDecoration(
          // borderRadius: BorderRadius.only(topRight: Radius.circular(8) , bottomRight:  Radius.circular(8) , ),
          // border: Border(top: BorderSide(color: Colors.green), right: BorderSide(color: Colors.green) , bottom: BorderSide(color: Colors.green)),
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text,
              // overflow: TextOverflow.visible,
              // maxLines: 1,
              style: GoogleFonts.notoKufiArabic(
                  color: MyConstant().purpleColor,
                  fontWeight: FontWeight.bold,
                  fontSize:14)),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            child: TextFormField(
              controller: controller,
              onChanged: onChanged,
              onFieldSubmitted:onFieldSubmitted ,
              readOnly: readOnly!,
              textAlign: TextAlign.center,
              validator:validator ,
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
  Function(String)? onChange,
  Function(String)? onFieldSubmitted,
  Function(String?)? onSaved,
  String? Function(String?)? validator,
  TextInputAction? textInputAction,
  bool? readOnly=false,
  TextInputType? textInputType,
  String? hintText,
}) {
  return TextFormField(
    keyboardType: textInputType,
    onFieldSubmitted:onFieldSubmitted,
    onChanged: onChange,
    textAlign: TextAlign.right,
    decoration:
    InputDecoration(
      contentPadding: const EdgeInsets.only(left: 10,right: 10),
      fillColor: Colors.white,
      hintStyle:GoogleFonts.notoKufiArabic(
          color: Colors.black45,
          fontSize: 14,
          fontWeight: FontWeight.w500
      ),
      label: Text(text,style:GoogleFonts.notoKufiArabic(
          color: Colors.black45,
          fontSize: 16,
          fontWeight: FontWeight.w500
      ) ,),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: BorderSide(
          color: MyConstant().purpleColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0.0),
        borderSide: BorderSide(
          color: MyConstant().greenColor,
          width: 1.2,
        ),
      ),
    ),
    // InputDecoration(
    //     border: OutlineInputBorder(),
    //     label: Text(text,style:GoogleFonts.notoKufiArabic(
    //         color: Colors.black45,
    //         fontSize: 14,
    //         fontWeight: FontWeight.w500
    //     ) ,),
    // ),

    controller: controller,
  );


    TextFormField(
    keyboardType: textInputType,
    textInputAction: textInputAction,
    onFieldSubmitted:onFieldSubmitted,
onChanged: onChange,
    textAlign: TextAlign.center,
    controller: controller,
    validator: validator,
    decoration: InputDecoration(
      hintText: hintText,
      label: Container(
        margin: EdgeInsets.only(top: 10,bottom: 10),
        child: Text(text,
            style: GoogleFonts.notoKufiArabic(
                color: MyConstant().purpleColor,
                fontWeight: FontWeight.bold,
                fontSize: 12)),
      ),

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
          fontSize: 12));

}

// DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now()).split( " ").first