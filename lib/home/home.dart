import 'package:flutter/material.dart';
import 'package:omar/mobile/mobil%20home.dart';
import 'package:omar/responsive.dart';
import 'package:omar/tablet-home.dart';
import 'package:omar/tablet.dart';

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
