
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/End%20Point.dart';
import 'package:omar/Controller/local/shared_pref.dart';
import 'package:omar/View/home/home.dart';
import 'package:omar/View/login/login%20screen.dart';
import 'package:omar/View/sewing%20invoice%20screen/auth_screen.dart';
import 'package:omar/View/sewing%20invoice%20screen/start_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = 'SplashWidget';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), goNext);
  }

    goNext()async{
    bool isAuthed=await CacheHelper.isUserAuthIn();
    if(isAuthed){
      var apiKey=CacheHelper.getData(key: 'apiKey');
      var wareHouse= CacheHelper.getData(key: 'wareHouse');
      APIKEYLogin=CacheHelper.getData(key: 'apiKey');
      await LoginCubit.get(context).login(email: wareHouse, password: apiKey);
      bool isLogged=   await CacheHelper.isUserLoggedIn();

      if(isLogged){
        Navigator.pushReplacementNamed(context, StartScreen.routeName);


      }else{
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);

      }

    }else{
      Navigator.pushReplacementNamed(context, AuthScreen.routeName);

    }


      // bool isLogged=   await CacheHelper.isUserLoggedIn();
      // if(isLogged){
      //   var email=CacheHelper.getData(key: 'email');
      //   var password= CacheHelper.getData(key: 'password');
      //   APIKEYLogin=CacheHelper.getData(key: 'password');
      //   await LoginCubit.get(context).login(email: email, password: password);
      //   Navigator.pushReplacementNamed(context, StartScreen.routeName);
      // }else{
      //   Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      //
      //   // Navigator.push( LoginScreen()));
      // }

    }


  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF0F2F7),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Image.asset(
              'image/cpe.PNG',

              width: MediaQuery.of(context).size.width/3,
              height: MediaQuery.of(context).size.height/5,
              fit: BoxFit.fill,
            ),
          ),
        ));
  }
}