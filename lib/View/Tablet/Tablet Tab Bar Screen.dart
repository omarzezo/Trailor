import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:omar/View/sewing%20invoice%20screen/TabBar%20Screen.dart';
import 'package:omar/View/sewing%20invoice%20screen/casher.dart';
import 'package:omar/constant/appstrings.dart';

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
                      title: AppStrings.sewingbill.tr(),
                      titleImage: 'image/invoices.png'),
                  const SizedBox(width: 20,),
                  CustomContainer(
                    color: Colors.purple,
                    title: AppStrings.printsizes.tr(),
                    titleImage: 'image/measurement.png',
                  ),
                  const SizedBox(width: 20,),
                  CustomContainer(
                      titleImage: 'image/cutting.png',
                      color: Colors.purple,
                      title: AppStrings.Cutconfirmation.tr()),
                  const SizedBox(width: 20,),
                  InkWell(
                    onTap: () {
                      AwesomeDialog(context: context,
                        dialogType: DialogType.question,
                        animType: AnimType.rightSlide,
                        width:MediaQuery.of(context).size.width/1.2,
                        // width:400,
                        body: OpenCashier(),

                      ).show();
                    },
                    child: CustomContainer(
                        titleImage: 'image/task.png',
                        color: Colors.purple,
                        title: AppStrings.Openthecashregister.tr()),
                  ),
                  const SizedBox(width: 20,),
                  InkWell(
                    onTap: () {

                      AwesomeDialog(context: context,
                        dialogType: DialogType.noHeader,
                        animType: AnimType.rightSlide,
                        width:MediaQuery.of(context).size.width,
                        // width:400,
                        body:  CashierScreen(),

                      ).show();
                    },
                    child: CustomContainer(
                        titleImage: 'image/clothes (1).png',
                        color: Colors.purple,
                        title: AppStrings.Closethecashier.tr()),
                  ),
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
