
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:omar/Controller/Cubit/Cubit.dart';
import 'package:omar/Controller/local/shared_pref.dart';
import 'package:omar/View/home/home.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = 'SplashWidget';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(Duration(seconds: 3), goNext);
  }

    goNext()async{
      var email=CacheHelper.getData(key: 'email');
      var password= CacheHelper.getData(key: 'password');
      bool isLogged=   await CacheHelper.isUserLoggedIn();
      if(isLogged){
        await LoginCubit.get(context).login(email: email, password: password);
        Navigator.push(context,MaterialPageRoute(builder: (context) => const HomeScreen()));
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