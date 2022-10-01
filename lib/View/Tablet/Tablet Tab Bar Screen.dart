import 'package:flutter/material.dart';
import 'package:omar/View/sewing%20invoice%20screen/TabBar%20Screen.dart';

import '../../constant/widgets.dart';

class TabletTabBarScreen extends StatefulWidget {
  const TabletTabBarScreen({Key? key}) : super(key: key);

  @override
  _TabletTabBarScreenState createState() => _TabletTabBarScreenState();
}

class _TabletTabBarScreenState extends State<TabletTabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
                tabs: [
                  CustomContainer(
                      color: Colors.purple,
                      title: 'فاتورة خياطة',
                      titleImage: 'image/invoices.png'),
                  const SizedBox(width: 20,),
                  CustomContainer(
                    color: Colors.purple,
                    title: 'طباعة المقاسات',
                    titleImage: 'image/measurement.png',
                  ),
                  const SizedBox(width: 20,),
                  CustomContainer(
                      titleImage: 'image/cutting.png',
                      color: Colors.purple,
                      title: 'تاكيد القص'),
                  const SizedBox(width: 20,),
                  CustomContainer(
                      titleImage: 'image/task.png',
                      color: Colors.purple,
                      title: 'استلام المعمل'),
                  const SizedBox(width: 20,),
                  CustomContainer(
                      titleImage: 'image/clothes (1).png',
                      color: Colors.purple,
                      title: 'تسليم الثياب'),
                ]
            ),
            Expanded(
              child: TabBarView(
                  children: [
                const TabBarScreen(),
                Container(color: Colors.red,),
                Container(color: Colors.amber,),
                Container(color: Colors.grey,),
                Container(color: Colors.green,),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
