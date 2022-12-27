import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/Cubit/State.dart';
import 'package:omar/Controller/local/shared_pref.dart';
import 'package:omar/SharedPreferencesHelper.dart';
import 'package:omar/View/sewing%20invoice%20screen/start_screen.dart';
import 'package:omar/constant/LoadingPage.dart';
import 'package:omar/constant/appstrings.dart';
import 'package:omar/constant/constant.dart';
import 'package:omar/View/home/home.dart';
import 'package:omar/View/responsive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Controller/End Point.dart';
import '../../models/TrailorListsResponse.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "LoginScreen";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final  _key = GlobalKey<FormState>();
  var companyController = TextEditingController();
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  bool obscureText = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // goNext();
    // userNameController.text="$APIKEY1";
    // userNameController.text="wggko8so4gs0wks0g000s4kk00o0o0wgwco0sww4";
    // passwordController.text="w_1";
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit , LoginState>(
      listener: (context , state){

        if(state is LoginSuccess){

           // Navigator.push(context,MaterialPageRoute(builder: (context) => const HomeScreen()));
        }
      },
       builder : (context , state) =>  Scaffold(
        backgroundColor: const Color(0xffF0F2F7),
        body: SingleChildScrollView(
            child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height / 1,
            color:  const Color(0xffF0F2F7),
            child: Form(
              key: _key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: const EdgeInsets.only(left: 30 , bottom: 20),
                      height: 160,width:240,
                      child:Image.asset('image/cpe.PNG',fit: BoxFit.fill,height: 160,width:240,)),
                  Align(
                    // alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Text(AppStrings.loginToYourAccount.tr(),
                          textAlign: TextAlign.left,
                          style: GoogleFonts.notoKufiArabic(
                              color: MyConstant().purpleColor,
                              fontSize: 30,
                              fontWeight: FontWeight.normal)),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       boxShadow: [
                  //         BoxShadow(color: Colors.grey.withOpacity(0.2),offset: const Offset(1,4),blurRadius: 5),
                  //         BoxShadow(color: Colors.grey.withOpacity(0.2),offset: const Offset(-1,2),blurRadius: 5),
                  //       ]
                  //     ),
                  //     child: TextFormField(
                  //       controller: companyController,
                  //       validator: (val){
                  //         if(val!.isEmpty){
                  //           'اسم الشركة غير صحيح';
                  //         }
                  //       },
                  //       decoration: InputDecoration(
                  //         enabledBorder: OutlineInputBorder(
                  //           borderSide:  BorderSide.none,
                  //           borderRadius: BorderRadius.circular(5),
                  //         ),
                  //         focusedBorder: OutlineInputBorder(
                  //           borderSide: const BorderSide(color: Colors.transparent),
                  //           borderRadius: BorderRadius.circular(5),
                  //         ),
                  //         // prefixIcon:
                  //         //     const Icon(Icons.email, color: Colors.purple),
                  //         hintText: "الشركة",
                  //         hintStyle:   GoogleFonts.almarai(
                  //           color: Colors.grey,
                  //         fontSize: 20,
                  //         fontWeight: FontWeight.normal),
                  //         filled: true,
                  //         fillColor: Colors.white,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Colors.grey.withOpacity(0.2),offset: const Offset(1,4),blurRadius: 5),
                            BoxShadow(color: Colors.grey.withOpacity(0.2),offset: const Offset(-1,2),blurRadius: 5),
                          ]
                      ),
                      child: TextFormField(
                        controller: userNameController,
                        validator: (val){
                          if(val!.isEmpty){
                            'اسم المستخدم غير صحيح';
                          }
                        },
                        // obscureText: obscureText,
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
                          hintText: AppStrings.userName.tr(),
                          hintStyle: GoogleFonts.almarai(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.normal),
                          filled: true,
                          // fillColor: Colors.purple[50],
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height/ 14,
                      child: TextFormField(

                        controller: passwordController,
                        validator: (val){
                          if(val!.isEmpty){
                            'كلمة السر غير صحيحة';
                          }
                        },
                        obscureText: obscureText,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  obscureText = !obscureText;
                                });
                              },
                              icon: obscureText ?  const Icon(Icons.visibility_off,color: Color(0xff9BA1B3),) :
                              const Icon(Icons.visibility,color: Color(0xff9BA1B3),)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          // prefixIcon: const Icon(Icons.key, color: Colors.purple),
                          hintText: AppStrings.password.tr(),
                          hintStyle: GoogleFonts.almarai(
                              color: Colors.grey,
                              fontSize: 20,
                              fontWeight: FontWeight.normal),
                          filled: true,
                          // fillColor: Colors.purple[50],
                          fillColor: const Color(0xffE1E4ED),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Text('Forget Password ?',
                        //     style: GoogleFonts.poppins(
                        //         color: MyConstant().purpleColor,
                        //         fontSize: 16,
                        //         fontWeight: FontWeight.w600)),
                        // const Spacer(),

                        TextButton(onPressed: (){}, child:  Text(AppStrings.forgetPassword.tr(),
                            style: GoogleFonts.notoKufiArabic(
                                color: MyConstant().purpleColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),)
                      ],
                    ),
                  ),
                  const SizedBox(height: 60,),
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
                        TrailorListsResponse model = await LoginCubit.get(context).login(email: userNameController.text, password: passwordController.text);
                        bool isLogged=   await CacheHelper.isUserLoggedIn();

                        if(!isLogged){
                          CacheHelper.saveData(
                              key: 'email',
                              value: userNameController.text);
                          CacheHelper.saveData(
                              key: 'password',
                              value: passwordController.text);
                        }

                        CacheHelper.setIsUserLoggedIn();
                        // print("model>>"+model.toString());
                        String jsonUser = jsonEncode(model);
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setString('json', jsonUser).then((value) {
                          if(value){
                            SharedPreferencesHelper.setApiKey(passwordController.text).then((value) {
                              LoginCubit()..getPillsDetails().then((value){
                                LoadingPage(context).close();
                                // Navigator.push(context,MaterialPageRoute(builder: (context) => const HomeScreen()));
                                Navigator.push(context,MaterialPageRoute(builder: (context) => const StartScreen()));
                              });

                            });
                          }
                        });
                      },
                      child: Text(AppStrings.Login.tr(),
                          style: GoogleFonts.notoKufiArabic(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700)),
                    )
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
