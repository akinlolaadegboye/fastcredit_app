import 'dart:async';
import 'package:fast_credit/screens/landing_page/landingpage_view.dart';
import 'package:fast_credit/screens/welcome_screen.dart';
import 'package:fast_credit/utils/colors.dart';
import 'package:fast_credit/utils/screensize.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {

  startTimer() async {
    var _duration = const Duration(seconds: 5);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var profile = prefs.getString('profileEmail');
    profile == null
            ? Get.offAll(const WelcomeScreen())
            : Get.offAll(LandingPage());
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child:  Image.asset(
          'assets/gifs/fast_credit.gif',
          width: ScreenSize.width(context),
        ),
      )
    );
  }
}
