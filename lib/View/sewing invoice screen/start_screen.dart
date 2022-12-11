// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:omar/View/AllCustomersHomeScreen.dart';
// import 'package:omar/View/home/home.dart';
// import 'package:omar/View/present_all_tables_screen.dart';
// import 'package:omar/View/sewing%20invoice%20screen/TabBar%20Screen.dart';
// import 'package:omar/View/sewing%20invoice%20screen/settings_screen.dart';
// import 'package:omar/constant/constant.dart';
//
// class StartScreen extends StatelessWidget {
//   static const routeName = "StartScreen";
//
//   const StartScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         child: Column(
//           children: [
//
//             Expanded(
//               child: Container(
//                 height: 100,
//                 width: 300,
//                 color: Colors.blueAccent,
//
//                 child: IconButton(onPressed: () {
// Navigator.pushNamed(context, HomeScreen.routeName);
//                 }, icon: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Text("main " ,style: GoogleFonts.notoKufiArabic(
//                     color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 30,
//                 )),
//                     Icon(Icons.home_filled,size: 45,)
//                   ],
//                 )),
//
//               ),
//             ),
//             SizedBox(height: 20,),
//             Expanded(
//               child: Container(
//                 height: 100,
//                 width: 300,
//                 color: Colors.teal,
//                 child:  IconButton(onPressed: () {
//                   TabBarScreen.initialIndex=0;
//                   Navigator.pushNamed(context, TabBarScreen.routeName);
//
//                 }, icon: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//
//                   children: [
//                     Text("clients", style: GoogleFonts.notoKufiArabic(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 30,
//                     )),
//                     Icon(Icons.people,size: 45)
//                   ],
//                 )),
//               ),
//             ),
//             SizedBox(height: 20,),
//
//             Expanded(
//               child: Container(
//                 height: 100,
//                 width: 300,
//                 color:MyConstant().purpleColor,
//                 child:  IconButton(onPressed: () {
//                   TabBarScreen.initialIndex=4;
//                   Navigator.pushNamed(context, TabBarScreen.routeName);
//
//
//                 }, icon: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//
//                   children: [
//                     Text("invoices", style: GoogleFonts.notoKufiArabic(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 30,
//                     )),
//                     Icon(Icons.inventory_outlined,size: 45,)
//                   ],
//                 )),
//
//               ),
//             ),
//             SizedBox(height: 20,),
//
//             Expanded(
//               child: Container(
//                 height: 100,
//                 width: 300,
//                 color: MyConstant().greenColor,
//                 child: IconButton(onPressed: () {
//                   Navigator.pushNamed(context, SettingScreen.routeName);
//
//                 }, icon: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//
//                   children: [
//                     Text("setting", style: GoogleFonts.notoKufiArabic(
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 30,
//                     )),
//                     Icon(Icons.settings,size: 45,)
//                   ],
//                 )),
//
//               ),
//             ),
//             SizedBox(height: 20,),
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
