import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Network/Remote%20Data/Dio%20Helper.dart';
import 'package:omar/View/mobile/mobil%20home.dart';
import 'package:omar/View/sewing%20invoice%20screen/print_screen.dart';
import 'package:omar/constant/constant.dart';
import 'package:omar/tast.dart';
import 'Controller/BlocObserver.dart';
import 'View/Data Table/custom table.dart';
import 'View/Data Table/data-table screen.dart';
import 'View/Tablet/tablet-home.dart';
import 'View/home/home.dart';
import 'View/login/login screen.dart';
import 'View/sewing invoice screen/Create.dart';
import 'View/sewing invoice screen/Size Screen.dart';
import 'View/sewing invoice screen/TabBar Screen.dart';
import 'View/sewing invoice screen/custom_table_sweing.dart';
import 'View/sewing invoice screen/sweing_screen.dart';
import 'View/sewing invoice screen/table_scroll.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  BlocOverrides.runZoned(
        () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LoginCubit()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,

          theme: ThemeData.light().copyWith(
            scrollbarTheme: ScrollbarThemeData(
              thumbColor: MaterialStateProperty.all(MyConstant().purpleColor),
              crossAxisMargin: -9,
              // mainAxisMargin: 10,
              // minThumbLength: 200,
              trackColor: MaterialStateProperty.all(MyConstant().purpleColor ,),
            ),
            unselectedWidgetColor: Colors.white,
            colorScheme: ThemeData.light().colorScheme.copyWith(
              onPrimary: Colors.white, // Color for checkmark in datatable
              primary: Colors.purple, // Color used for checkbox fill in datatable
            ),
            checkboxTheme: CheckboxThemeData(
              overlayColor: MaterialStateProperty.all(Colors.purple),
              side: MaterialStateBorderSide.resolveWith(
                      (_) => const BorderSide(width: 2, color: Colors.white)),
              fillColor: MaterialStateProperty.all(Colors.purple),
              checkColor: MaterialStateProperty.all(Colors.purple),
            ),
          ),

          home: const LoginScreen(),
          routes: {
            PrintScreen.routeName:(context) => const PrintScreen(),
          },
        ));
  }
}

