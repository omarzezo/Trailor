import 'package:flutter/material.dart';
import 'package:omar/View/sewing%20invoice%20screen/Size%20Screen.dart';
import 'package:omar/View/sewing%20invoice%20screen/sweing_screen.dart';
import 'package:omar/constant/constant.dart';
import 'View/Data Table/custom table.dart';

class TestingScreen extends StatefulWidget {
  const TestingScreen({Key? key}) : super(key: key);

  @override
  _TestingScreenState createState() => _TestingScreenState();
}

class _TestingScreenState extends State<TestingScreen> {
  final scrollControl = ScrollController();
  var ind = 15;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Container(color: Colors.amber,height: 100,width: double.infinity,),
              // Expanded(
              //   child: Scrollbar(
              //     thickness: 16,
              //     // controller: scrollControl,
              //     radius: const Radius.circular(0),
              //     trackVisibility: true,
              //     interactive: true,
              //     isAlwaysShown: true,
              //     showTrackOnHover: true,
              //     hoverThickness: 12,
              //     child: getList()
              //   ),
              // ),
              // Container(
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   height: MediaQuery.of(context).size.height/2,
              //   // color: Colors.amber,
              //   child:  const Scrollbar(
              //     // controller: ScrollController(
              //     //   initialScrollOffset: 0,
              //     //   keepScrollOffset: true
              //     // ),
              //
              //     thickness: 16,
              //     radius:  Radius.circular(0),
              //     trackVisibility: true,
              //     interactive: true,
              //     isAlwaysShown: true,
              //     showTrackOnHover: true,
              //     // hoverThickness: 12,
              //     child:  CustomTable(),
              //   ),),

              TabBar(
                tabs: [
                  Tab(
                    child: Column(
                      children: const [
                        Icon(Icons.animation, color: Colors.amber,),
                        Text('add',style: TextStyle(color: Colors.red),),
                      ],
                    ),
                  ),
                  Tab(
                    child: Column(
                      children: const [
                        Icon(Icons.animation, color: Colors.amber,),
                        Text('add',style: TextStyle(color: Colors.red),),
                      ],
                    ),
                  ),
                  Tab(
                    child: Column(
                      children:  [
                        Icon(Icons.animation, color: Colors.amber,),
                        Text('add',style: TextStyle(color: Colors.red),),

                      ],
                    ),
                  ),
                ],
              ),

              Expanded(
                child: TabBarView(
                    children: [
                      SizeScreen(),
                      SewingScreen(),
                      CustomTable()
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  dynamic getList() {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      // height: double.infinity,
      // color: Colors.amber,
      child: ListView.separated(
          // controller: scrollControl,
          itemBuilder: (context, index) => const ListTile(
                title: Text('Test'),
                leading: Icon(Icons.attach_money),
                trailing: Icon(Icons.code),
              ),
          separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
          itemCount: 50),
    );
  }
}
