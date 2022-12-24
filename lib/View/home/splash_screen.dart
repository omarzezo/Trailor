
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/End%20Point.dart';
import 'package:omar/Controller/local/shared_pref.dart';
import 'package:omar/View/home/home.dart';
import 'package:omar/View/login/login%20screen.dart';
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
      var email=CacheHelper.getData(key: 'email');
      var password= CacheHelper.getData(key: 'password');
      APIKEY1=CacheHelper.getData(key: 'email')??"k4csscc0gcosgs0s8ossows4kkkc4wsw8wgc8wko";
      bool isLogged=   await CacheHelper.isUserLoggedIn();
      if(isLogged){
        await LoginCubit.get(context).login(email: email, password: password);
        Navigator.pushReplacementNamed(context, StartScreen.routeName);
      }else{
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);

        // Navigator.push( LoginScreen()));
      }

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
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              // fit: BoxFit.cover,
              image: AssetImage(
                'image/splashScreen.png',
              ),
            ),
          ),
        ));
  }
}