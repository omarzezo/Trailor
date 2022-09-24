import 'package:flutter/material.dart';
import 'package:omar/View/mobile/mobil%20home.dart';
import 'package:omar/View/responsive.dart';
import 'package:omar/View/Tablet/tablet-home.dart';
import 'package:omar/View/Tablet/tablet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Responsive(
        mobilWidget: const MobileHome(),
        tabletWidget: const TebletHome(),
      ),
    );
  }
}
