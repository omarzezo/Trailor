import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/Controller/local/shared_pref.dart';
import 'package:omar/constant/constant.dart';

Widget CustomContainer({
  required Color color,
  required String title ,
  required String titleImage ,
}){
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(titleImage,width: 25,height: 25,),
        const SizedBox(height: 5,),
        Text(title , style: GoogleFonts.notoKufiArabic(
            color: color,
            fontSize: 14,
            fontWeight: FontWeight.w500
        ),)
      ],
    ),
  );
}

Widget CustomRow({
  required IconData icon,
  required Color color,
  required String title ,
}){
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon , color: color,),
        const SizedBox(height: 5,),
        Text(title , style: TextStyle(color: color),)
      ],
    ),
  );
}

Widget RowName()
{
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children:  [
      Text(CacheHelper.getData(key: 'email')??"",
          style: GoogleFonts.notoKufiArabic(
              color: Colors.purple,
              fontSize: 12,
              fontWeight: FontWeight.bold
          )),
      CircleAvatar(backgroundColor: Colors.purple.withOpacity(0.7),),
      const Icon(Icons.arrow_forward_ios , color: Colors.purple),
    ],
  );
}

Widget RowNameDetail({
  required String title ,
   String? titleImage ,
  IconData? iconData,
}){
  return Container(
    height: 35,
    padding: const EdgeInsets.only(right: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children:  [
        if(titleImage!=null) Image.asset(titleImage , width: 30, height: 30,),
        if(iconData!=null)Icon(iconData,color: MyConstant().greenColor,size: 30,),
        const SizedBox(width: 20,),
        Text(title,
            style: GoogleFonts.notoKufiArabic(
                color: Colors.purple,
                fontSize: 12,
                fontWeight: FontWeight.bold
            )),
      ],
    ),
  );
}