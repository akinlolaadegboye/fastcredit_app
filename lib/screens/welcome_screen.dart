import 'package:fast_credit/screens/login/login.dart';
import 'package:fast_credit/utils/colors.dart';
import 'package:fast_credit/utils/general_widgets.dart';
import 'package:fast_credit/utils/screensize.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: ScreenSize.height(context) * .1,
              ),
              Image.asset('assets/icons/welcome.png'),
              SizedBox(
                height: ScreenSize.height(context) * .08,
              ),
              const Text(
                'Welcome to GhostLamp',
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black),
              ),
              SizedBox(
                height: ScreenSize.height(context) * .02,
              ),
              const Text(
                  'A workspace to over 12 million influencer around the global of the world',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: AppColors.lightBlack)),
              SizedBox(
                height: ScreenSize.height(context) * .12,
              ),
              GeneralWidgets().generalButton(
                  width: ScreenSize.width(context) * .7,
                  borderRadius: BorderRadius.circular(15),
                  buttonText: 'Login Now',
                  backgroundColor: AppColors.primaryColor,
                  buttonTextColor: AppColors.white,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  }),
              const SizedBox(height: 20,),
              GeneralWidgets().generalButton(
                  width: ScreenSize.width(context) * .7,
                  borderRadius: BorderRadius.circular(15),
                  buttonText: 'Create Account',
                  backgroundColor: AppColors.white,
                  buttonTextColor: AppColors.black),
            ],
          ),
        ),
      ),
    );
  }
}
