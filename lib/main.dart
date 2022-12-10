import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Network/Remote%20Data/Dio%20Helper.dart';
import 'package:omar/Controller/local/shared_pref.dart';
import 'package:omar/View/BlutothPrinter.dart';
import 'package:omar/View/WifiThroughIpPrinter.dart';
import 'package:omar/View/choose_printer_screen.dart';
import 'package:omar/View/home/home.dart';
import 'package:omar/View/home/splash_screen.dart';
import 'package:omar/View/invoice_Screen.dart';
import 'package:omar/View/login/login%20screen.dart';
import 'package:omar/View/mobile/mobil%20home.dart';
import 'package:omar/View/sewing%20invoice%20screen/add_new_customer_screen.dart';
import 'package:omar/View/sewing%20invoice%20screen/cashier_report.dart';
import 'package:omar/View/sewing%20invoice%20screen/customers_details_screen.dart';
import 'package:omar/View/sewing%20invoice%20screen/daily_report_screen.dart';
import 'package:omar/View/sewing%20invoice%20screen/edit_customer_info.dart';
import 'package:omar/View/sewing%20invoice%20screen/edit_size_screen.dart';
import 'package:omar/View/sewing%20invoice%20screen/pills_item_data.dart';
import 'package:omar/View/sewing%20invoice%20screen/print_screen.dart';
import 'package:omar/View/sewing%20invoice%20screen/restart_screen.dart';
import 'package:omar/View/sewing%20invoice%20screen/return_item_screen.dart';
import 'package:omar/constant/constant.dart';
import 'package:omar/tast.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'Controller/BlocObserver.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();


  BlocOverrides.runZoned(
        () {
      runApp(EasyLocalization(


          supportedLocales: const [Locale('en', 'US'), Locale('ar', "EG")],
          startLocale:  Locale('ar', "EG"),
          path: "assets/translations",
          child: const MyApp()));
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
          BlocProvider(create: (context) => LoginCubit()..getPillsDetails()),
        ],
        child: RestartWidget(
          child: MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            // localeListResolutionCallback: (allLocales, supportedLocales) {
            //   final locale = allLocales?.first.languageCode;
            //   if (locale == 'en') {
            //     return const Locale('en', 'US');
            //   }
            //   // The default locale
            //   return const Locale('ar', 'EG');
            // },
            builder: (context, child) => ResponsiveWrapper.builder(
                child,
                maxWidth: 1400,
                minWidth: 480,
                defaultScale: true,
                breakpoints: [
                  ResponsiveBreakpoint.resize(480, name: MOBILE),
                  ResponsiveBreakpoint.autoScale(800, name: TABLET),
                  ResponsiveBreakpoint.resize(1000, name: DESKTOP),
                ],
                background: Container(color: Color(0xFFF5F5F5))),
            initialRoute: "/",
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

            home: const SplashScreen(),
            routes: {
              PrintScreen.routeName:(context) => const PrintScreen(),
              HomeScreen.routeName:(context) => const HomeScreen(),
              LoginScreen.routeName:(context) => const LoginScreen(),
              NewUserScreen.routeName:(context) =>  NewUserScreen(),
              CustomerDetailsScreen.routeName:(context) =>  CustomerDetailsScreen(),
              PillsItemData.routeName:(context) =>  PillsItemData(),
              PrintPillScreen.routeName:(context) =>  PrintPillScreen(),
              // WifiThroughrIpPrinter.routeName:(context) =>  WifiThroughrIpPrinter(),
              EditSizeScreen.routeName:(context) =>  EditSizeScreen(),
              DailyReportScreen.routeName:(context) =>  DailyReportScreen(),
              CashierPillScreen.routeName:(context) =>  CashierPillScreen(),
              ReturnItemScreen.routeName:(context) =>  ReturnItemScreen(),
              EditCustomerScreen.routeName:(context) =>  EditCustomerScreen(),
            },
          ),
        ));
  }
}

