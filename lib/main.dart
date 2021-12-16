import 'package:fast_credit/screens/splash_screen.dart';
import 'package:fast_credit/utils/colors.dart';
import 'package:fast_credit/utils/locator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Fast Credit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        primarySwatch:  AppColors.primaryColor,
      ),
      home: const SplashScreen(),
    );
  }
}

