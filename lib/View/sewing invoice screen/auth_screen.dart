import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Cubit/State.dart';
import 'package:omar/Controller/End%20Point.dart';
import 'package:omar/Controller/local/shared_pref.dart';
import 'package:omar/View/login/login%20screen.dart';
import 'package:omar/constant/LoadingPage.dart';
import 'package:omar/constant/appstrings.dart';

import '../../constant/constant.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = "AuthScreen";

  AuthScreen({Key? key}) : super(key: key);
TextEditingController authController=TextEditingController();
TextEditingController wareHouseController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var cubit=LoginCubit.get(context);
    return BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
  },
  builder: (context, state) {
    return Scaffold(
      body: SafeArea(

        child: Column(
          children: [


        SizedBox(height: 50,),
            Container(
                padding: const EdgeInsets.only(left: 30 , bottom: 20),
                height: 160,width:240,
                child:Image.asset('image/cpe.PNG',fit: BoxFit.fill,height: 160,width:240,)),
            Align(
              // alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text("api_key",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.notoKufiArabic(
                        color: MyConstant().purpleColor,
                        fontSize: 30,
                        fontWeight: FontWeight.normal)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height/ 14,
                child: TextFormField(

                  controller: authController,

                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    // prefixIcon: const Icon(Icons.key, color: Colors.purple),
                    // hintStyle: GoogleFonts.almarai(
                    //     color: Colors.grey,
                    //     fontSize: 20,
                    //     fontWeight: FontWeight.normal),
                    filled: true,
                    // fillColor: Colors.purple[50],
                    fillColor: const Color(0xffE1E4ED),
                  ),
                ),
              ),
            ),
            Align(
              // alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text("wareHouse_code",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.notoKufiArabic(
                        color: MyConstant().purpleColor,
                        fontSize: 30,
                        fontWeight: FontWeight.normal)),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height/ 14,
                child: TextFormField(

                  controller: wareHouseController,

                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    // prefixIcon: const Icon(Icons.key, color: Colors.purple),
                    // hintStyle: GoogleFonts.almarai(
                    //     color: Colors.grey,
                    //     fontSize: 20,
                    //     fontWeight: FontWeight.normal),
                    filled: true,
                    // fillColor: Colors.purple[50],
                    fillColor: const Color(0xffE1E4ED),
                  ),
                ),
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height/16,
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width/2,
                decoration:  BoxDecoration(
                  color: MyConstant().purpleColor,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: TextButton(
                  onPressed: () async {
                    LoadingPage(context).show();
                    warehouseCode=wareHouseController.text;
                    APIKEYLogin=authController.text;
                 await   cubit.login(email: wareHouseController.text, password: authController.text).then((value) {
                   CacheHelper.setIsUserAuthIn();
                   CacheHelper.saveData(key: "apiKey", value: authController.text);
                   CacheHelper.saveData(key: "wareHouse", value: wareHouseController.text);


                 });
                    LoadingPage(context).close();
                    Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);

                    // TrailorListsResponse model = await LoginCubit.get(context).login(email: userNameController.text, password: passwordController.text);
                    // bool isLogged=   await CacheHelper.isUserLoggedIn();

                    // if(!isLogged){
                    //   CacheHelper.saveData(
                    //       key: 'email',
                    //       value: userNameController.text);
                    //   CacheHelper.saveData(
                    //       key: 'password',
                    //       value: passwordController.text);
                    // }

                    // CacheHelper.setIsUserLoggedIn();
                    // print("model>>"+model.toString());
                    // String jsonUser = jsonEncode(model);
                    // final prefs = await SharedPreferences.getInstance();
                    // await prefs.setString('json', jsonUser).then((value) {
                    //   if(value){
                    //     SharedPreferencesHelper.setApiKey(passwordController.text).then((value) {
                    //       LoginCubit()..getPillsDetails().then((value){
                    //         LoadingPage(context).close();
                    //         Navigator.push(context,MaterialPageRoute(builder: (context) => const HomeScreen()));
                            // Navigator.push(context,MaterialPageRoute(builder: (context) => const StartScreen()));
                          // });

                        // });
                      // }
                    // });
                  },
                  child: Text(AppStrings.auth.tr(),
                      style: GoogleFonts.notoKufiArabic(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                )
            ),

          ],
        ),
      ),

    );
  },
);
  }
}
