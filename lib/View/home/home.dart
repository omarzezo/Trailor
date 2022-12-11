import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/View/mobile/mobil%20home.dart';
import 'package:omar/View/responsive.dart';
import 'package:omar/View/Tablet/tablet-home.dart';
import 'package:omar/View/Tablet/tablet.dart';
import 'package:omar/constant/appstrings.dart';
import 'package:omar/constant/constant.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "HomeScreen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

        body: Responsive(
          mobilWidget: const MobileHome(),
          tabletWidget: const TabletHome(),
        ),

    );
  }
}
