import 'package:email_validator/email_validator.dart';
import 'package:fast_credit/core/models/error_model.dart';
import 'package:fast_credit/core/models/success_model.dart';
import 'package:fast_credit/screens/login/login_viewmodel.dart';
import 'package:fast_credit/utils/app_bars.dart';
import 'package:fast_credit/utils/colors.dart';
import 'package:fast_credit/utils/general_widgets.dart';
import 'package:fast_credit/utils/helpers.dart';
import 'package:fast_credit/utils/screensize.dart';
import 'package:flutter/cupertino.dart';
import 'package:ars_progress_dialog/ars_progress_dialog.dart';
import 'package:flutter/material.dart';

class LoginWidgets {
  content(
      BuildContext context,
      LoginViewModel model,
      TextEditingController emailController,
      TextEditingController passwordController,_formKey) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            AppBars().loginScreenAppBar(context),
            SizedBox(
              height: ScreenSize.height(context) * .06,
            ),
            const Text(
              'Keep Connected',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 28,
              ),
            ),
            SizedBox(height: ScreenSize.height(context) * .02),
            const Text(
              'Enter your email address and password to get assess to your account.',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: AppColors.lightBlack),
            ),
            SizedBox(
              height: ScreenSize.height(context) * .08,
            ),
            loginFormLayout(context, model, emailController, passwordController,_formKey)
          ],
        ),
      ),
    );
  }

  loginFormLayout(
      BuildContext context,
      LoginViewModel model,
      TextEditingController emailController,
      TextEditingController passwordController,_formKey) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                validator: (value) => EmailValidator.validate(value.trim())
                    ? null
                    : "Please enter a valid email",
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_outlined),
                    hintText: 'Your Email',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.5,
                    )),
              ),
              SizedBox(
                height: ScreenSize.height(context) * .02,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                validator: (value) =>
                    (value.trim().isEmpty) ? 'Password is required' : null,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.security),
                    hintText: 'Your password',
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.5,
                    )),
              ),
              SizedBox(
                height: ScreenSize.height(context) * .075,
              ),
              GeneralWidgets().generalButton(
                  width: ScreenSize.width(context) * .8,
                  borderRadius: BorderRadius.circular(15),
                  buttonText: 'Get Login',
                  backgroundColor: AppColors.primaryColor,
                  buttonTextColor: AppColors.white,
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      String emailAddress = emailController.text;
                      String password = passwordController.text;
                      if (emailAddress != '' && password != '') {
                        ArsProgressDialog progressDialog = ArsProgressDialog(context, blur: 1,dismissable: false);
                        progressDialog.show();
                        var result = await model.signIn(emailAddress, password);
                        if(result is ErrorModel)  progressDialog.dismiss();
                      } else {
                        showToast('One or more fields are empty');
                      }
                    }
                  }),
              const SizedBox(
                height: 30,
              ),
              GeneralWidgets().generalButton(
                width: ScreenSize.width(context) * .8,
                borderRadius: BorderRadius.circular(15),
                buttonText: 'Create Account',
                backgroundColor: AppColors.white,
                buttonTextColor: AppColors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
